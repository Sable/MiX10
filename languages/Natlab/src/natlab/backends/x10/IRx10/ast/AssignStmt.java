package natlab.backends.x10.IRx10.ast;

import natlab.backends.x10.IRx10.ast.List;
import natlab.backends.x10.IRx10.ast.PPHelper;
import natlab.backends.x10.IRx10.ast.Stmt;
import java.util.*;

/**
 * @ast node
 * @declaredat irx10.ast:14
 */
public class AssignStmt extends Stmt implements Cloneable {
  /**
   * @apilevel low-level
   */
  public void flushCache() {
    super.flushCache();
  }
  /**
   * @apilevel internal
   */
  public void flushCollectionCache() {
    super.flushCollectionCache();
  }
  /**
   * @apilevel internal
   */
  @SuppressWarnings({"unchecked", "cast"})
  public AssignStmt clone() throws CloneNotSupportedException {
    AssignStmt node = (AssignStmt)super.clone();
    return node;
  }
  /**
   * @apilevel internal
   */
  @SuppressWarnings({"unchecked", "cast"})
  public AssignStmt copy() {
      try {
        AssignStmt node = (AssignStmt)clone();
        if(children != null) node.children = (ASTNode[])children.clone();
        return node;
      } catch (CloneNotSupportedException e) {
      }
      System.err.println("Error: Could not clone node of type " + getClass().getName() + "!");
      return null;
  }
  /**
   * @apilevel low-level
   */
  @SuppressWarnings({"unchecked", "cast"})
  public AssignStmt fullCopy() {
    AssignStmt res = (AssignStmt)copy();
    for(int i = 0; i < getNumChildNoTransform(); i++) {
      ASTNode node = getChildNoTransform(i);
      if(node != null) node = node.fullCopy();
      res.setChild(node, i);
    }
    return res;
    }
  /**
   * @ast method 
   * @aspect PrettyPrinter
   * @declaredat ./astgen/pretty.jadd:256
   */
  String pp(String indent) {
		StringBuffer x = new StringBuffer();
		if (null != getLHS()) {
			/**
			 * It is not a list assignment
			 */

			if (null == getLHS().getShape()) {
				/* Scalar variable */
				x.append(getLHS().getName());
				x.append(" = ");
				x.append(getRHS().pp("") + ";\n");

			}

			else if (null != getLHS().getShape()) {
				boolean tf = true;
				for (int i = 0; i < getLHS().getShape().size(); i++) {
					if (null != getLHS().getShape().get(i))
						tf &= ("1").equals(getLHS().getShape().get(i)
								.toString());
				}
				if (tf) {

					/* Scalar variable */
					x.append(getLHS().getName());
					x.append(" = ");
					x.append(getRHS().pp(""));
					if(null != getTypeCast() && true==getTypeCast())
						x.append("as "+getLHS().getType().getName());
					x.append(" ;\n");

				}

				else // array
				{
					/**
					 * TODO Make sure if arrays can be aSSIGNED DIRECTLY LIKE
					 * VARIABLES. wHAT ARE THE RESTRICTIONS ?
					 */
					x.append(getLHS().getName());
					x.append(" = ");
					x.append(getRHS().pp(""));
					if(null != getTypeCast() && true==getTypeCast())
						x.append("as Array["+getLHS().getType().getName()+"]");
					x.append(" ;\n");
					//
					// x.append("val "+getLHS().getName()+" = "+
					// "new Array["+getLHS().getType().getName()+"]"+
					// "("+PPHelper.makeRange(getLHS().getShape())+
					// ", "+getRHS().pp("")+");\n");
				}
			}
		} else {

			System.out.println("list assign:" + getRHS().pp(indent));
			/**
			 * TODO Case when assigned to a list
			 */
			if (!hasMultiAssignLHS()
					|| 0 == getMultiAssignLHS().getIDInfoList().getNumChild()) { // ||
																					// getMultiAssignLHS().getNumChild()
																					// ==0
				x.append(getRHS().pp(indent) + " ;\n");
			} else {
				x.append("val "
						+ "generate_a_name"
						+ " = "
						+ "new Array[Any]"
						+ "(0.."
						+ (getMultiAssignLHS().getIDInfoList().getNumChild() - 1)
						+ ", " + getRHS().pp("") + ");\n");
			}

		}
		return x.toString();
	}
  /**
   * @ast method 
   * @declaredat irx10.ast:1
   */
  public AssignStmt() {
    super();

    setChild(new Opt(), 0);

  }
  /**
   * @ast method 
   * @declaredat irx10.ast:8
   */
  public AssignStmt(Opt<MultiAssignLHS> p0, IDInfo p1, Exp p2, Boolean p3) {
    setChild(p0, 0);
    setChild(p1, 1);
    setChild(p2, 2);
    setTypeCast(p3);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:17
   */
  protected int numChildren() {
    return 3;
  }
  /**
   * Setter for MultiAssignLHSOpt
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:5
   */
  public void setMultiAssignLHSOpt(Opt<MultiAssignLHS> opt) {
    setChild(opt, 0);
  }
  /**
   * Does this node have a MultiAssignLHS child?
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:12
   */
  public boolean hasMultiAssignLHS() {
    return getMultiAssignLHSOpt().getNumChild() != 0;
  }
  /**
   * Getter for optional child MultiAssignLHS
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:19
   */
  @SuppressWarnings({"unchecked", "cast"})
  public MultiAssignLHS getMultiAssignLHS() {
    return (MultiAssignLHS)getMultiAssignLHSOpt().getChild(0);
  }
  /**
   * Setter for optional child MultiAssignLHS
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:27
   */
  public void setMultiAssignLHS(MultiAssignLHS node) {
    getMultiAssignLHSOpt().setChild(node, 0);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:37
   */
  @SuppressWarnings({"unchecked", "cast"})
  public Opt<MultiAssignLHS> getMultiAssignLHSOpt() {
    return (Opt<MultiAssignLHS>)getChild(0);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:44
   */
  @SuppressWarnings({"unchecked", "cast"})
  public Opt<MultiAssignLHS> getMultiAssignLHSOptNoTransform() {
    return (Opt<MultiAssignLHS>)getChildNoTransform(0);
  }
  /**
   * Setter for LHS
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:5
   */
  public void setLHS(IDInfo node) {
    setChild(node, 1);
  }
  /**
   * Getter for LHS
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:12
   */
  public IDInfo getLHS() {
    return (IDInfo)getChild(1);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:18
   */
  public IDInfo getLHSNoTransform() {
    return (IDInfo)getChildNoTransform(1);
  }
  /**
   * Setter for RHS
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:5
   */
  public void setRHS(Exp node) {
    setChild(node, 2);
  }
  /**
   * Getter for RHS
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:12
   */
  public Exp getRHS() {
    return (Exp)getChild(2);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:18
   */
  public Exp getRHSNoTransform() {
    return (Exp)getChildNoTransform(2);
  }
  /**
   * Setter for lexeme TypeCast
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:5
   */
  public void setTypeCast(Boolean value) {
    tokenBoolean_TypeCast = value;
  }
  /**   * @apilevel internal   * @ast method 
   * @declaredat irx10.ast:8
   */
  
  /**   * @apilevel internal   */  protected Boolean tokenBoolean_TypeCast;
  /**
   * Getter for lexeme TypeCast
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:13
   */
  public Boolean getTypeCast() {
    return tokenBoolean_TypeCast;
  }
}
