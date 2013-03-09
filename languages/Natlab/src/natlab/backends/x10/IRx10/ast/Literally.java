package natlab.backends.x10.IRx10.ast;

import natlab.backends.x10.IRx10.ast.List;
import natlab.backends.x10.IRx10.ast.PPHelper;
import natlab.backends.x10.IRx10.ast.Stmt;
import java.util.*;

/**
 * @ast node
 * @declaredat irx10.ast:7
 */
public class Literally extends Stmt implements Cloneable {
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
  public Literally clone() throws CloneNotSupportedException {
    Literally node = (Literally)super.clone();
    return node;
  }
  /**
   * @apilevel internal
   */
  @SuppressWarnings({"unchecked", "cast"})
  public Literally copy() {
      try {
        Literally node = (Literally)clone();
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
  public Literally fullCopy() {
    Literally res = (Literally)copy();
    for(int i = 0; i < getNumChildNoTransform(); i++) {
      ASTNode node = getChildNoTransform(i);
      if(node != null) node = node.fullCopy();
      res.setChild(node, i);
    }
    return res;
    }
  /**
   * @ast method 
   * @declaredat irx10.ast:1
   */
  public Literally() {
    super();


  }
  /**
   * @ast method 
   * @declaredat irx10.ast:7
   */
  public Literally(String p0) {
    setVerbatim(p0);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:13
   */
  protected int numChildren() {
    return 0;
  }
  /**
   * Setter for lexeme Verbatim
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:5
   */
  public void setVerbatim(String value) {
    tokenString_Verbatim = value;
  }
  /**   * @apilevel internal   * @ast method 
   * @declaredat irx10.ast:8
   */
  
  /**   * @apilevel internal   */  protected String tokenString_Verbatim;
  /**
   * Getter for lexeme Verbatim
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:13
   */
  public String getVerbatim() {
    return tokenString_Verbatim != null ? tokenString_Verbatim : "";
  }
  
  String pp(String indent){
		StringBuffer x = new StringBuffer();
		x.append(indent+getVerbatim());
		return x.toString();
  }
}
