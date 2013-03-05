package natlab.backends.x10.IRx10.ast;

import natlab.backends.x10.IRx10.ast.List;
import natlab.backends.x10.IRx10.ast.PPHelper;
import natlab.backends.x10.IRx10.ast.Stmt;
import java.util.*;

/**
 * @ast node
 * @declaredat irx10.ast:28
 */
public class RegionBuilder extends Exp implements Cloneable {
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
  public RegionBuilder clone() throws CloneNotSupportedException {
    RegionBuilder node = (RegionBuilder)super.clone();
    return node;
  }
  /**
   * @apilevel internal
   */
  @SuppressWarnings({"unchecked", "cast"})
  public RegionBuilder copy() {
      try {
        RegionBuilder node = (RegionBuilder)clone();
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
  public RegionBuilder fullCopy() {
    RegionBuilder res = (RegionBuilder)copy();
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
  public RegionBuilder() {
    super();

    setChild(new List(), 0);
    setChild(new List(), 1);

  }
  /**
   * @ast method 
   * @declaredat irx10.ast:9
   */
  public RegionBuilder(List<IDUse> p0, List<IDUse> p1, IDUse p2) {
    setChild(p0, 0);
    setChild(p1, 1);
    setChild(p2, 2);
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
   * Setter for LowerList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:5
   */
  public void setLowerList(List<IDUse> list) {
    setChild(list, 0);
  }
  /**
   * @return number of children in LowerList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:12
   */
  public int getNumLower() {
    return getLowerList().getNumChild();
  }
  /**
   * Getter for child in list LowerList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:19
   */
  @SuppressWarnings({"unchecked", "cast"})
  public IDUse getLower(int i) {
    return (IDUse)getLowerList().getChild(i);
  }
  /**
   * Add element to list LowerList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:27
   */
  public void addLower(IDUse node) {
    List<IDUse> list = (parent == null || state == null) ? getLowerListNoTransform() : getLowerList();
    list.addChild(node);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:34
   */
  public void addLowerNoTransform(IDUse node) {
    List<IDUse> list = getLowerListNoTransform();
    list.addChild(node);
  }
  /**
   * Setter for child in list LowerList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:42
   */
  public void setLower(IDUse node, int i) {
    List<IDUse> list = getLowerList();
    list.setChild(node, i);
  }
  /**
   * Getter for Lower list.
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:50
   */
  public List<IDUse> getLowers() {
    return getLowerList();
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:56
   */
  public List<IDUse> getLowersNoTransform() {
    return getLowerListNoTransform();
  }
  /**
   * Getter for list LowerList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:63
   */
  @SuppressWarnings({"unchecked", "cast"})
  public List<IDUse> getLowerList() {
    List<IDUse> list = (List<IDUse>)getChild(0);
    list.getNumChild();
    return list;
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:72
   */
  @SuppressWarnings({"unchecked", "cast"})
  public List<IDUse> getLowerListNoTransform() {
    return (List<IDUse>)getChildNoTransform(0);
  }
  /**
   * Setter for UpperList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:5
   */
  public void setUpperList(List<IDUse> list) {
    setChild(list, 1);
  }
  /**
   * @return number of children in UpperList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:12
   */
  public int getNumUpper() {
    return getUpperList().getNumChild();
  }
  /**
   * Getter for child in list UpperList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:19
   */
  @SuppressWarnings({"unchecked", "cast"})
  public IDUse getUpper(int i) {
    return (IDUse)getUpperList().getChild(i);
  }
  /**
   * Add element to list UpperList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:27
   */
  public void addUpper(IDUse node) {
    List<IDUse> list = (parent == null || state == null) ? getUpperListNoTransform() : getUpperList();
    list.addChild(node);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:34
   */
  public void addUpperNoTransform(IDUse node) {
    List<IDUse> list = getUpperListNoTransform();
    list.addChild(node);
  }
  /**
   * Setter for child in list UpperList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:42
   */
  public void setUpper(IDUse node, int i) {
    List<IDUse> list = getUpperList();
    list.setChild(node, i);
  }
  /**
   * Getter for Upper list.
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:50
   */
  public List<IDUse> getUppers() {
    return getUpperList();
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:56
   */
  public List<IDUse> getUppersNoTransform() {
    return getUpperListNoTransform();
  }
  /**
   * Getter for list UpperList
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:63
   */
  @SuppressWarnings({"unchecked", "cast"})
  public List<IDUse> getUpperList() {
    List<IDUse> list = (List<IDUse>)getChild(1);
    list.getNumChild();
    return list;
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:72
   */
  @SuppressWarnings({"unchecked", "cast"})
  public List<IDUse> getUpperListNoTransform() {
    return (List<IDUse>)getChildNoTransform(1);
  }
  /**
   * Setter for ArrayID
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:5
   */
  public void setArrayID(IDUse node) {
    setChild(node, 2);
  }
  /**
   * Getter for ArrayID
   * @apilevel high-level
   * @ast method 
   * @declaredat irx10.ast:12
   */
  public IDUse getArrayID() {
    return (IDUse)getChild(2);
  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:18
   */
  public IDUse getArrayIDNoTransform() {
    return (IDUse)getChildNoTransform(2);
  }
  
  
  String pp(String indent){
		StringBuffer x = new StringBuffer();
		
		String type = ((AssignStmt)getParent()).getLHS().getType().getName();
		x.append(indent+"new Array["+type+"](");
		if(getLowers().getChild(0).getID().equals("__"))
			x.append(
			"(("+getArrayID().getID()+".region.min("+Integer.toString(0)+")).."	);
		else
			x.append("("+getLowers().getChild(0).getID()+" as Int..");
		if(getUppers().getChild(0).getID().equals("__"))
			x.append(
			""+getArrayID().getID()+".region.max("+Integer.toString(0)+")))"	);
		else
			x.append(""+getLowers().getChild(0).getID()+" as Int)");
		int i;
		for(i=1 ; i< getLowers().getNumChild();i++){
			x.append("*");
			if(getLowers().getChild(i).getID().equals("__"))
				x.append(
				"(("+getArrayID().getID()+".region.min("+Integer.toString(i)+")).."	);
			else
				x.append("("+getLowers().getChild(i).getID()+" as Int..");
			if(getUppers().getChild(i).getID().equals("__"))
				x.append(
				""+getArrayID().getID()+".region.max("+Integer.toString(i)+")))"	);
			else
				x.append(""+getLowers().getChild(i).getID()+" as Int)");
			
		}
		x.append(", p:point("+Integer.toString(i)+")=>"+getArrayID().getID()+"(p));\n");
		return x.toString();
	}
}
