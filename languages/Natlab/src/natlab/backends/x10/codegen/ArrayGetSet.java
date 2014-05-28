package natlab.backends.x10.codegen;

import java.util.ArrayList;

import natlab.backends.x10.IRx10.ast.ArrayAccess;
import natlab.backends.x10.IRx10.ast.ArraySetStmt;
import natlab.backends.x10.IRx10.ast.AssignStmt;
import natlab.backends.x10.IRx10.ast.DeclStmt;
import natlab.backends.x10.IRx10.ast.EmptyExp;
import natlab.backends.x10.IRx10.ast.Exp;
import natlab.backends.x10.IRx10.ast.IDInfo;
import natlab.backends.x10.IRx10.ast.IDUse;
import natlab.backends.x10.IRx10.ast.List;
import natlab.backends.x10.IRx10.ast.LiterallyExp;
import natlab.backends.x10.IRx10.ast.MultiAssignLHS;
import natlab.backends.x10.IRx10.ast.Stmt;
import natlab.backends.x10.IRx10.ast.StmtBlock;
import natlab.backends.x10.IRx10.ast.SubArrayGetExp;
import natlab.backends.x10.IRx10.ast.SubArraySetStmt;
import natlab.tame.tir.TIRAbstractAssignStmt;
import natlab.tame.tir.TIRAbstractAssignToListStmt;
import natlab.tame.tir.TIRArrayGetStmt;
import natlab.tame.tir.TIRArraySetStmt;
import natlab.tame.valueanalysis.components.shape.DimValue;

public class ArrayGetSet {

  private static boolean Debug = true;

  public static void handleTIRAbstractArraySetStmt(TIRArraySetStmt node,
      IRx10ASTGenerator target, StmtBlock block) {
    if (Debug) {
      System.out.println(node.getIndizes().getChild(0));
      System.out.println(node.getLHS().getPrettyPrinted()
          + "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    }

    String LHS;
    target.symbolMapKey = node.getArrayName().getID();
    LHS = target.symbolMapKey;

    if (true != target.symbolMap.containsKey(target.symbolMapKey)) {
      DeclStmt arrayDecl = new DeclStmt();
      new IDInfo();
      arrayDecl.setLHS(Helper.generateIDInfo(target.analysis, target.index,
          node, LHS));
      arrayDecl.getLHS().setName(LHS);
      arrayDecl.setRHS(new EmptyExp());
      target.symbolMap.put(target.symbolMapKey, arrayDecl.getLHS());
      block.addStmt(arrayDecl);

    }
    /*
     * The array has been declared before. This is just an assignment to its
     * index. If not declared before first declare the array and then set the
     * index
     */

    boolean hasColon = false;
    for (int i = 0; i < node.getIndizes().getNumChild(); i++) {
      // array_set.setIndices(Expressions.makeIRx10Exp(node.getIndizes()
      // .getChild(i), false, target), i);
      if (((IDUse) (Expressions.makeIRx10Exp(node.getIndizes().getChild(i),
          false, target))).getID().equals("__")) {
        hasColon = true;
      }
    }

    boolean tf = true;
    IDInfo LhsInfo = new IDInfo();
    LhsInfo = Helper.generateIDInfo(target.analysis, target.index, node, LHS);

    if (null != LhsInfo.getShape())
      for (int i = 0; i < LhsInfo.getShape().size(); i++) {
        if (null != LhsInfo.getShape().get(i))
          tf &= ("1").equals(LhsInfo.getShape().get(i).toString());
      }
    /*
     * If all indices are scalar
     */
    if (!hasColon && tf) {
      ArraySetStmt array_set = new ArraySetStmt();
      array_set.setLHS(Helper.generateIDInfo(target.analysis, target.index,
          node, LHS));
      array_set.getLHS().setName(LHS.toString());

      for (int i = 0; i < node.getIndizes().getNumChild(); i++) {
        array_set.setIndices(Expressions.makeIRx10Exp(node.getIndizes()
            .getChild(i), false, target), i);
      }
      target.symbolMap.put(target.symbolMapKey, array_set.getLHS());
      array_set.setRHS(Expressions.makeIRx10Exp(node.getRHS(), tf, target));
      block.addStmt(array_set);
    }
    /*
     * if there is colon operator in LHS
     */
    else {
      SubArraySetStmt subArraySet = new SubArraySetStmt();
      subArraySet.setLHS(Helper.generateIDInfo(target.analysis, target.index,
          node, LHS));
      subArraySet.getLHS().setName(LHS.toString());
      subArraySet.setLowerList(new List<Exp>());
      subArraySet.setUpperList(new List<Exp>());
      if (null != subArraySet.getLHS().getShape())
        for (int i = 0; i < node.getIndizes().getNumChild(); i++) {
          if (((IDUse) (Expressions.makeIRx10Exp(
              node.getIndizes().getChild(i), false, target))).getID().equals(
                  "__")) {
            /*
             * Case when index is a ':' Note that this fails if number of
             * indices is < number of dimensions.
             */
            LiterallyExp low = new LiterallyExp("1");
            LiterallyExp high = new LiterallyExp();
            if (1 < node.getIndizes().getNumChild())
              high.setVerbatim(LHS.toString() + ".numElems_"
                  + Integer.toString(i + 1));
            else
              high.setVerbatim(LHS.toString() + ".size"
                  + Integer.toString(i + 1));
            subArraySet.getLowerList().add(low);
            subArraySet.getUpperList().add(high);

          }

          else {
            /*
             * case when index is an ID It can be a scalar or a vector If it is
             * a sclar : low = high else low = 1st value of vector & upper =
             * last value
             */
            String indexId = ((IDUse) (Expressions.makeIRx10Exp(node
                .getIndizes().getChild(i), false, target))).getID();
            System.err.println(target.symbolMap.get(indexId));

            if (Helper.isScalar(target.symbolMap.get(indexId).getShape())) {
              IDUse low = new IDUse(indexId);
              IDUse high = new IDUse(indexId);
              subArraySet.getLowerList().add(low);
              subArraySet.getUpperList().add(high);
            } else {
              LiterallyExp low = new LiterallyExp(indexId + "(0)");
              LiterallyExp high = new LiterallyExp(indexId + "(" + indexId
                  + ".size -1)");
              subArraySet.getLowerList().add(low);
              subArraySet.getUpperList().add(high);
            }

          }

        }
      target.symbolMap.put(target.symbolMapKey, subArraySet.getLHS());
      subArraySet.setRHS(Expressions.makeIRx10Exp(node.getRHS(), tf, target));
      block.addStmt(subArraySet);
    }

  }

  public static void handleTIRAbstractArrayGetStmt(TIRArrayGetStmt node,
      IRx10ASTGenerator target, StmtBlock block) {
    if (1 == (node).getTargets().asNameList().size()) {
      String LHS;
      boolean isDecl;
      target.symbolMapKey = (node).getTargetName().getID();
      LHS = target.symbolMapKey;

      if (true == target.symbolMap.containsKey(target.symbolMapKey)) {

        isDecl = false;
        AssignStmt list_single_assign_stmt = new AssignStmt();
        list_single_assign_stmt.setLHS(Helper.generateIDInfo(target.analysis,
            target.index, node, LHS));
        list_single_assign_stmt.getLHS().setName(
            ((TIRAbstractAssignToListStmt) node).getTargets().getChild(0)
            .getVarName());

        setRHSValue(false, list_single_assign_stmt, node, false, target, block);
        target.symbolMap.put(target.symbolMapKey,
            list_single_assign_stmt.getLHS());

        System.out.println("#####!@@@" + target.symbolMapKey);

        block.addStmt(list_single_assign_stmt);

      } else {
        isDecl = true;
        DeclStmt decl_stmt = new DeclStmt();
        new IDInfo();
        decl_stmt.setLHS(Helper.generateIDInfo(target.analysis, target.index,
            node, LHS));

        decl_stmt.getLHS().setName(
            (node).getTargets().getChild(0).getVarName());
        /*
         * if it has a colon operator, add a null to the shape - this is a hack
         * to tell the compiler that it is an array
         */

        for (Exp i : Expressions.getArgs(node.getRHS(), target)) {
          if (i instanceof IDUse && ((IDUse) i).getID().equals("__")) {
            System.out.println("its a colon...............................");
            decl_stmt.getLHS().getShape().add(null);
          }
        }

        System.out.println("#####!!!!!" + target.symbolMapKey);

        // block.addStmt(decl_stmt);

        DeclStmt pseudoDecl = new DeclStmt();
        pseudoDecl.setLHS(decl_stmt.getLHS());
        //
        AssignStmt pseudoAssign = new AssignStmt();
        pseudoAssign.setLHS(decl_stmt.getLHS());

        // if (target.currentBlock.size() > 1) {
        target.currentBlock.get(0).addStmt(pseudoDecl);
        setRHSValue(isDecl, decl_stmt, node, false, target, block);
        pseudoAssign.setRHS(decl_stmt.getRHS());
        block.addStmt(pseudoAssign);
        target.symbolMap.put(target.symbolMapKey, decl_stmt.getLHS());
        System.out.println(block.getParent().toString()
            + "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
      }
    }
    else {
      AssignStmt list_assign_stmt = new AssignStmt();
      MultiAssignLHS LHSinfo = new MultiAssignLHS();
      list_assign_stmt.setMultiAssignLHS(LHSinfo);
      for (ast.Name name : ((TIRAbstractAssignToListStmt) node).getTargets()
          .asNameList()) {
        System.out.println("^^" + name.getID());
        list_assign_stmt.getMultiAssignLHS().addIDInfo(
            Helper.generateIDInfo(target.analysis, target.index, node,
                name.getID()));
        target.symbolMap.put(
            name.getID(),
            Helper.generateIDInfo(target.analysis, target.index, node,
                name.getID()));
      }
      System.out
      .println("^*^"
          + list_assign_stmt.getMultiAssignLHS().getIDInfoList()
          .getNumChild());
      list_assign_stmt.setLHS(null);
      setRHSValue(false, list_assign_stmt, node, false, target, block);
      block.addStmt(list_assign_stmt);
    }

  }

  public static void setRHSValue(boolean isDecl, Stmt decl_or_assgn,
      TIRArrayGetStmt node, boolean isScalar, IRx10ASTGenerator target,
      StmtBlock block) {

    String arrayName = node.getRHS().getVarName();
    List<Exp> indices = Expressions.getArgs(node.getRHS(), target);

    boolean hascolon = false;
    boolean allScalar = true;

    for (Exp e : indices) {
      if (e instanceof IDUse && ((IDUse) e).getID().equals("__")) {
        /*
         * it has colon expression
         */
        hascolon = true;
      }
      if (e instanceof IDUse && !hascolon
          && null != target.symbolMap.get(((IDUse) (e)).getID()).getShape()) {

        if (target.symbolMap
            .get(((IDUse) (e)).getID())
            .getShape()
            .get(0)
            .getClass()
            .toString()
            .equals(
                "class natlab.tame.valueanalysis.components.shape.DimValue")) {
          System.err.println(node.getNodeString()
              + target.symbolMap.get(((IDUse) (e)).getID()).getShape()
              .toString());
          for (DimValue s : (ArrayList<DimValue>) (target.symbolMap
              .get(((IDUse) (e)).getID()).getShape())) {
            if (null != s)
              allScalar &= "1".equals(s.toString());
          }
        } else
          for (Integer s : (ArrayList<Integer>) (target.symbolMap
              .get(((IDUse) (e)).getID()).getShape())) {
            allScalar &= "1".equals(s.toString());
          }
      }
    }

    if (!hascolon && allScalar) {
      /*
       * all indices are scalar values
       */
      ArrayAccess arrayAccess = new ArrayAccess();
      arrayAccess.setArrayID(new IDUse(arrayName));
      arrayAccess.setIsColVector(false);
      /*
       * assumes that shape is correct.
       */
      int sz = target.symbolMap.get(arrayName).getShape().size();
      while (target.symbolMap.get(arrayName).getShape().get(sz - 1) == null) {
        sz--;
      }
      if (sz == 2
          && "1".equals(target.symbolMap.get(arrayName).getShape().get(1)
              .toString())) {
        arrayAccess.setIsColVector(true);
      }
      arrayAccess.setIndicesList(Expressions.getArgs(node.getRHS(), target));
      if (isDecl) {
        ((DeclStmt) decl_or_assgn).setRHS(arrayAccess);
      } else {
        ((AssignStmt) decl_or_assgn).setRHS(arrayAccess);
      }
    }

    else {
      /*
       * one or more indices is colon or a vector
       */
      SubArrayGetExp subArray = new SubArrayGetExp();
      subArray.setArrayID(new IDUse(arrayName));
      subArray.setLowerList(new List<Exp>());
      subArray.setUpperList(new List<Exp>());
      int i = 0;
      for (Exp e : indices) {
        i++;
        if (e instanceof IDUse && ((IDUse) e).getID().equals("__")) {
          /*
           * colon operator
           */
          LiterallyExp low = new LiterallyExp("1");
          LiterallyExp high = new LiterallyExp();
          if (1 < indices.getNumChild())
            high.setVerbatim(arrayName + ".numElems_" + Integer.toString(i));
          else
            high.setVerbatim(arrayName + ".size" + Integer.toString(i));
          subArray.getLowerList().add(low);
          subArray.getUpperList().add(high);
        } else if (!Helper.isScalar(target.symbolMap
            .get(((IDUse) (e)).getID()).getShape())) {
          /*
           * vector shape
           */
          String indexId = ((IDUse) (e)).getID();
          LiterallyExp low = new LiterallyExp(indexId + "(0)");
          LiterallyExp high = new LiterallyExp(indexId + "(" + indexId
              + ".size -1)");
          subArray.getLowerList().add(low);
          subArray.getUpperList().add(high);
        } else {
          /*
           * scalar index
           */
          String indexId = ((IDUse) (e)).getID();
          IDUse low = new IDUse(indexId);
          IDUse high = new IDUse(indexId);
          subArray.getLowerList().add(low);
          subArray.getUpperList().add(high);
        }
      }
      if (isDecl) {
        ((DeclStmt) decl_or_assgn).setRHS(subArray);
      } else {
        ((AssignStmt) decl_or_assgn).setRHS(subArray);
      }
    }
  }

  // This version handles assignment to multiple variables
  public static void handleTIRAbstractAssignToListVarStmt(
      TIRAbstractAssignStmt node, ast.Name name, IRx10ASTGenerator target,
      AssignStmt assign_stmt) {
    String LHS;
    target.symbolMapKey = name.getID();
    LHS = target.symbolMapKey;

    if (true == target.symbolMap.containsKey(LHS)) // variable already //
      // defined and analyzed
    {

      MultiAssignLHS LHSinfo = new MultiAssignLHS();
      assign_stmt.setMultiAssignLHS(LHSinfo);

      assign_stmt.getMultiAssignLHS().addIDInfo(
          Helper.generateIDInfo(target.analysis, target.index, node, LHS));
      target.symbolMap.put(
          LHS,
          Helper.generateIDInfo(target.analysis, target.index, node,
              name.getID()));
      assign_stmt
      .getMultiAssignLHS()
      .getIDInfo(assign_stmt.getMultiAssignLHS().getNumIDInfo() - 1)
      .setName(
          ((TIRAbstractAssignToListStmt) node).getTargetName().toString());

    }

  }

}
