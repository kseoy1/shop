package com.example.demo.util;

public class Test2 {
    public static void main(String[] args) {  
		String str="p0102";
		
		String[] ppp= {null,null,null};
		
		if(str.length()==3)
		{
			ppp[0]=str.substring(1,3);
		}
		else if(str.length()==5)
		     {
			     ppp[0]=str.substring(1,3);
			     ppp[1]=str.substring(3,5);
		     }
		     else if(str.length()==7)
		          {
		      	      ppp[0]=str.substring(1,3);
			          ppp[1]=str.substring(3,5);
			          ppp[2]=str.substring(5,7);
		          }
		
		 for(int i=0;i<ppp.length;i++)
		 {
		   	System.out.println(ppp[i]);
		 }
	}
}
