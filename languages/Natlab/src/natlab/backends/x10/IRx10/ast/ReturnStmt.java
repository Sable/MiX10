package natlab.backends.x10.IRx10.ast;

import natlab.backends.x10.IRx10.ast.List;
import natlab.backends.x10.IRx10.ast.PPHelper;
import natlab.backends.x10.IRx10.ast.Stmt;
import java.util.*;

/**
 * @ast node
 * @declaredat irx10.ast:9
 */
public class ReturnStmt extends Stmt implements Cloneable {
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
  public ReturnStmt clone() throws CloneNotSupportedException {
    ReturnStmt node = (ReturnStmt)super.clone();
    return node;
  }
  /**
   * @apilevel internal
   */
  @SuppressWarnings({"unchecked", "cast"})
  public ReturnStmt copy() {
      try {
        ReturnStmt node = (ReturnStmt)clone();
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
  public ReturnStmt fullCopy() {
    ReturnStmt res = (ReturnStmt)copy();
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
   * @declaredat ./astgen/pretty.jadd:444
   */
  String pp(String indent) {
	  if (1 == getNumReturnVal()){
		  return (indent+"return "+getReturnVal(0).pp("")+";\n");
		  		  
	  }
	  String listOfVals;
	  if (1< getNumReturnVal()){
		  listOfVals = getReturnVal(0).pp("");
		  for (int i=1;i<getNumReturnVal();i++){
			  listOfVals = listOfVals + ","+getReturnVal(i).pp("");
		  }
		  
		  return (indent+"return new Array[Any](["+listOfVals+"]);\n");
		  
	  }
	  
	  else 
		  return ""; 
  }
  /**
   * @ast method 
   * @declaredat irx10.ast:1
   */
  public ReturnStmt() {
    super();

    setChild(new List(), 0);

  }
  /**
   * @ast method 
   * @declaredat irx10.ast:8
   */
  public ReturnStmt(List<Exp> p0) {
    setChild(p0, 0);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:14
   */
  protected int numChildren() {
    return 1;
  }
  /**
   * Setter for ReturnValList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:5
   */
  public void setReturnValList(List<Exp> list) {
    setChild(list, 0);
  }
  /**
   * @return number of children in ReturnValList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:12
   */
  public int getNumReturnVal() {
    return getReturnValList().getNumChild();
  }
  /**
   * Getter for child in list ReturnValList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:19
   */
  @SuppressWarnings({"unchecked", "cast"})
  public Exp getReturnVal(int i) {
    return (Exp)getReturnValList().getChild(i);
  }
  /**
   * Add element to list ReturnValList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:27
   */
  public void addReturnVal(Exp node) {
    List<Exp> list = (parent == null || state == null) ? getReturnValListNoTransform() : getReturnValList();
    list.addChild(node);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:34
   */
  public void addReturnValNoTransform(Exp node) {
    List<Exp> list = getReturnValListNoTransform();
    list.addChild(node);
  }
  /**
   * Setter for child in list ReturnValList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:42
   */
  public void setReturnVal(Exp node, int i) {
    List<Exp> list = getReturnValList();
    list.setChild(node, i);
  }
  /**
   * Getter for ReturnVal list.
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:50
   */
  public List<Exp> getReturnVals() {
    return getReturnValList();
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:56
   */
  public List<Exp> getReturnValsNoTransform() {
    return getReturnValListNoTransform();
  }
  /**
   * Getter for list ReturnValList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:63
   */
  @SuppressWarnings({"unchecked", "cast"})
  public List<Exp> getReturnValList() {
    List<Exp> list = (List<Exp>)getChild(0);
    list.getNumChild();
    return list;
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:72
   */
  @SuppressWarnings({"unchecked", "cast"})
  public List<Exp> getReturnValListNoTransform() {
    return (List<Exp>)getChildNoTransform(0);
  }
}
