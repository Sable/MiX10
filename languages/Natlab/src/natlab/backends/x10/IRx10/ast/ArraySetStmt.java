package natlab.backends.x10.IRx10.ast;

import natlab.backends.x10.IRx10.ast.List;
import natlab.backends.x10.IRx10.ast.PPHelper;
import natlab.backends.x10.IRx10.ast.Stmt;
import java.util.*;


/**
 * @ast node
 * @declaredat irx10.ast:31
 */
public class ArraySetStmt extends Stmt implements Cloneable {
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
  public ArraySetStmt clone() throws CloneNotSupportedException {
    ArraySetStmt node = (ArraySetStmt)super.clone();
    return node;
  }
  /**
   * @apilevel internal
   */
  @SuppressWarnings({"unchecked", "cast"})
  public ArraySetStmt copy() {
      try {
        ArraySetStmt node = (ArraySetStmt)clone();
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
  public ArraySetStmt fullCopy() {
    ArraySetStmt res = (ArraySetStmt)copy();
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
   * @declaredat ./astgen/pretty.jadd:92
   */
  String pp(String indent){
		StringBuffer x = new StringBuffer();
		
						
			x.append(getLHS().getName()+"(");
			x.append(getIndicesList().getChild(0).pp("")+" as Int");
		  	  for(int i=1; i<getIndicesList().getNumChild() ; i++)
		  	  {
		  		  x.append(", "+getIndicesList().getChild(i).pp("")+" as Int");
		  	  }
		  	  x.append(")");
			x.append(" = ");
			x.append(getRHS().pp("")+" ;\n");
		return x.toString();
	}
  /**
   * @ast method 
   * @declaredat irx10.ast:1
   */
  public ArraySetStmt() {
    super();

    setChild(new List(), 1);

  }
  /**
   * @ast method 
   * @declaredat irx10.ast:8
   */
  public ArraySetStmt(IDInfo p0, List<Exp> p1, Exp p2) {
    setChild(p0, 0);
    setChild(p1, 1);
    setChild(p2, 2);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:16
   */
  protected int numChildren() {
    return 3;
  }
  /**
   * Setter for LHS
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:5
   */
  public void setLHS(IDInfo node) {
    setChild(node, 0);
  }
  /**
   * Getter for LHS
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:12
   */
  public IDInfo getLHS() {
    return (IDInfo)getChild(0);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:18
   */
  public IDInfo getLHSNoTransform() {
    return (IDInfo)getChildNoTransform(0);
  }
  /**
   * Setter for IndicesList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:5
   */
  public void setIndicesList(List<Exp> list) {
    setChild(list, 1);
  }
  /**
   * @return number of children in IndicesList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:12
   */
  public int getNumIndices() {
    return getIndicesList().getNumChild();
  }
  /**
   * Getter for child in list IndicesList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:19
   */
  @SuppressWarnings({"unchecked", "cast"})
  public Exp getIndices(int i) {
    return (Exp)getIndicesList().getChild(i);
  }
  /**
   * Add element to list IndicesList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:27
   */
  public void addIndices(Exp node) {
    List<Exp> list = (parent == null || state == null) ? getIndicesListNoTransform() : getIndicesList();
    list.addChild(node);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:34
   */
  public void addIndicesNoTransform(Exp node) {
    List<Exp> list = getIndicesListNoTransform();
    list.addChild(node);
  }
  /**
   * Setter for child in list IndicesList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:42
   */
  public void setIndices(Exp node, int i) {
    List<Exp> list = getIndicesList();
    list.setChild(node, i);
  }
  /**
   * Getter for Indices list.
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:50
   */
  public List<Exp> getIndicess() {
    return getIndicesList();
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:56
   */
  public List<Exp> getIndicessNoTransform() {
    return getIndicesListNoTransform();
  }
  /**
   * Getter for list IndicesList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:63
   */
  @SuppressWarnings({"unchecked", "cast"})
  public List<Exp> getIndicesList() {
    List<Exp> list = (List<Exp>)getChild(1);
    list.getNumChild();
    return list;
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:72
   */
  @SuppressWarnings({"unchecked", "cast"})
  public List<Exp> getIndicesListNoTransform() {
    return (List<Exp>)getChildNoTransform(1);
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
}
