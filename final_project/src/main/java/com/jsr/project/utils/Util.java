package com.jsr.project.utils;

public class Util {

	public static String jsForward(String msg){
		String str="<script type='text/javascript'> "+
				"		 alert('"+msg+"'); "+
				"   </script> ";
		
	return str;
	}
	
}
