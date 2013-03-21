package natlab.backends.x10.IRx10.ast;

import natlab.backends.x10.IRx10.ast.List;
import natlab.backends.x10.IRx10.ast.PPHelper;
import natlab.backends.x10.IRx10.ast.Stmt;
import java.util.*;

/**
 * @ast node
 * @declaredat irx10.ast:2
 */
public class PPHelper extends ASTNode<ASTNode> implements Cloneable {
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
  public PPHelper clone() throws CloneNotSupportedException {
    PPHelper node = (PPHelper)super.clone();
    return node;
  }
  /**
   * @apilevel internal
   */
  @SuppressWarnings({"unchecked", "cast"})
  public PPHelper copy() {
      try {
        PPHelper node = (PPHelper)clone();
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
  public PPHelper fullCopy() {
    PPHelper res = (PPHelper)copy();
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
   * @declaredat ./astgen/pretty.jadd:165
   */
  static String makeRange(ArrayList Shape){
	StringBuffer s = new StringBuffer();
	s.append("(1.."+Shape.get(0)+")");
	for(int i=1; i<Shape.size();i++)
			{
				s.append("*(1.."+Shape.get(i)+")");
			}
	return s.toString();
}
  /**
   * @ast method 
   * @aspect PrettyPrinter
   * @declaredat ./astgen/pretty.jadd:192
   */
  static String makeArgs(List<IDInfo> argsList) 
{
	StringBuffer s = new StringBuffer();
	if (argsList.getNumChild()>0){
		if (!isScalar(argsList.getChild(0))){
			s.append(argsList.getChild(0).getName()+": Array["+argsList.getChild(0).getType().getName()+"]");
		}
		else
	s.append(argsList.getChild(0).getName()+": "+argsList.getChild(0).getType().getName());
	for (int i=1; i<argsList.numChildren ; i++)
	{	
		if (!isScalar(argsList.getChild(i))){
			s.append(", "+argsList.getChild(i).getName()+": Array["+argsList.getChild(i).getType().getName()+"]");
		}
		else		
		s.append(", "+argsList.getChild(i).getName()+": "+argsList.getChild(i).getType().getName());
	}
	}
	return s.toString();
}
  /**
   * @ast method 
   * @aspect PrettyPrinter
   * @declaredat ./astgen/pretty.jadd:213
   */
  static boolean isScalar(IDInfo id) {
	  if (null == id.getShape())
		  return false;
	  for (int i =0 ; i<id.getShape().size();i++){
		  if (null == id.getShape().get(i))
			  return false;
		  if (!("1").equals(id.getShape().get(i).toString())){
			  return false;
			  
		  }
	  }
	return true;
}
  /**
   * @ast method 
   * @declaredat irx10.ast:1
   */
  public PPHelper() {
    super();


  }
  /**
   * @apilevel low-level
   * @ast method 
   * @declaredat irx10.ast:10
   */
  protected int numChildren() {
    return 0;
  }
}
