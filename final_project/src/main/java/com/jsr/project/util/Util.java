//<<<<<<< HEAD
//<<<<<<< HEAD
//package com.jsr.project.util;
//
//import java.io.PrintWriter;
//
//import org.apache.jasper.tagplugins.jstl.core.Out;
//
//public class Util {
//	
//	private String arrowNbsp;
//	
//	public Util() {
//		// TODO Auto-generated constructor stub
//	} 
//	
//	public String getArrowNbsp() {
//		return arrowNbsp;
//	}
//
//	public void setArrowNbsp(String depth) {
//		String nbsp="";
//		int depthInt=Integer.parseInt(depth);
//		for (int i = 0; i < depthInt; i++) {
//			nbsp+="&nbsp;&nbsp;&nbsp;&nbsp;";
//		}
//		this.arrowNbsp = (depthInt>0?nbsp+"<img src='img/arrow.png' alt='�떟湲�'/>":"");
//	}
//
//	public static String jsForward(String msg,String url){
//		String str="<script type='text/javascript'>"
//				 + "	alert('"+msg+"');"
//				 + "	location.href='"+url+"';"
//				 + "</script> ";
//		return str;
//	}
//}
//
//
//
//
//
//
//
//=======
//>>>>>>> refs/remotes/origin/master
//
//=======
//>>>>>>> refs/remotes/origin/master
//package com.jsr.project.util;
//
//import java.io.PrintWriter;
//
//
//public class Util {
//	
//	private String arrowNbsp;
//	
//	public Util() {
//		// TODO Auto-generated constructor stub
//	} 
//	
//	public String getArrowNbsp() {
//		return arrowNbsp;
//	}
//
//	public void setArrowNbsp(String depth) {
//		String nbsp="";
//		int depthInt=Integer.parseInt(depth);
//		for (int i = 0; i < depthInt; i++) {
//			nbsp+="&nbsp;&nbsp;&nbsp;&nbsp;";
//		}
//<<<<<<< HEAD
//		this.arrowNbsp = (depthInt>0?nbsp+"<img src='img/arrow.png' alt='�떟湲�'/>":"");
//=======
//		this.arrowNbsp = (depthInt>0?nbsp+"<img src='customer/img/arrow.png' alt='답글'/>":"");
//>>>>>>> refs/remotes/origin/master
//	}
//
//	public static String jsForward(String msg,String url){
//		String str="<script type='text/javascript'>"
//				 + "	alert('"+msg+"');"
//				 + "	location.href='"+url+"';"
//				 + "</script> ";
//		return str;
//	}
//}
