package natlab.backends.x10.IRx10.ast;

import natlab.backends.x10.IRx10.ast.List;
import natlab.backends.x10.IRx10.ast.PPHelper;
import natlab.backends.x10.IRx10.ast.Stmt;
import java.util.*;

/**
 * @ast node
 * @declaredat irx10.ast:7
 */
public class PointLooper extends Stmt implements Cloneable {
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
  public PointLooper clone() throws CloneNotSupportedException {
    PointLooper node = (PointLooper)super.clone();
    return node;
  }
  /**
   * @apilevel internal
   */
  @SuppressWarnings({"unchecked", "cast"})
  public PointLooper copy() {
      try {
        PointLooper node = (PointLooper)clone();
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
  public PointLooper fullCopy() {
    PointLooper res = (PointLooper)copy();
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
  public PointLooper() {
    super();

    setChild(new Opt(), 2);
    setChild(new Opt(), 3);

  }
  /**
   * @ast method 
   * @declaredat irx10.ast:9
   */
  public PointLooper(IDUse p0, IDUse p1, int p2, Opt<Exp> p3, Opt<Exp> p4) {
    setChild(p0, 0);
    setChild(p1, 1);
    setDimNumber(p2);
    setChild(p3, 2);
    setChild(p4, 3);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:19
   */
  protected int numChildren() {
    return 4;
  }
  /**
   * Setter for PointID
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:5
   */
  public void setPointID(IDUse node) {
    setChild(node, 0);
  }
  /**
   * Getter for PointID
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:12
   */
  public IDUse getPointID() {
    return (IDUse)getChild(0);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:18
   */
  public IDUse getPointIDNoTransform() {
    return (IDUse)getChildNoTransform(0);
  }
  /**
   * Setter for ArrayID
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:5
   */
  public void setArrayID(IDUse node) {
    setChild(node, 1);
  }
  /**
   * Getter for ArrayID
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:12
   */
  public IDUse getArrayID() {
    return (IDUse)getChild(1);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:18
   */
  public IDUse getArrayIDNoTransform() {
    return (IDUse)getChildNoTransform(1);
  }
  /**
   * Setter for lexeme DimNumber
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:5
   */
  public void setDimNumber(int value) {
    tokenint_DimNumber = value;
  }
  /**   * @apilevel internal   * @ast method 
   * @declaredat irx10.ast:8
   */
  
  /**   * @apilevel internal   */  protected int tokenint_DimNumber;
  /**
   * Getter for lexeme DimNumber
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:13
   */
  public int getDimNumber() {
    return tokenint_DimNumber;
  }
  /**
   * Setter for MinOpt
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:5
   */
  public void setMinOpt(Opt<Exp> opt) {
    setChild(opt, 2);
  }
  /**
   * Does this node have a Min child?
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:12
   */
  public boolean hasMin() {
    return getMinOpt().getNumChild() != 0;
  }
  /**
   * Getter for optional child Min
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:19
   */
  @SuppressWarnings({"unchecked", "cast"})
  public Exp getMin() {
    return (Exp)getMinOpt().getChild(0);
  }
  /**
   * Setter for optional child Min
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:27
   */
  public void setMin(Exp node) {
    getMinOpt().setChild(node, 0);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:37
   */
  @SuppressWarnings({"unchecked", "cast"})
  public Opt<Exp> getMinOpt() {
    return (Opt<Exp>)getChild(2);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:44
   */
  @SuppressWarnings({"unchecked", "cast"})
  public Opt<Exp> getMinOptNoTransform() {
    return (Opt<Exp>)getChildNoTransform(2);
  }
  /**
   * Setter for MaxOpt
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:5
   */
  public void setMaxOpt(Opt<Exp> opt) {
    setChild(opt, 3);
  }
  /**
   * Does this node have a Max child?
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:12
   */
  public boolean hasMax() {
    return getMaxOpt().getNumChild() != 0;
  }
  /**
   * Getter for optional child Max
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:19
   */
  @SuppressWarnings({"unchecked", "cast"})
  public Exp getMax() {
    return (Exp)getMaxOpt().getChild(0);
  }
  /**
   * Setter for optional child Max
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:27
   */
  public void setMax(Exp node) {
    getMaxOpt().setChild(node, 0);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:37
   */
  @SuppressWarnings({"unchecked", "cast"})
  public Opt<Exp> getMaxOpt() {
    return (Opt<Exp>)getChild(3);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:44
   */
  @SuppressWarnings({"unchecked", "cast"})
  public Opt<Exp> getMaxOptNoTransform() {
    return (Opt<Exp>)getChildNoTransform(3);
  }
}
