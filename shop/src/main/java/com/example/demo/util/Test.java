package com.example.demo.util;

public class Test {
    public static void main(String[] args) {  
		String str="p010203";
		
		String[] ppp= {null,null,null};
	    for(int i=0;i<ppp.length;i++)
	    {
	    		try
	    		{
	    			ppp[i]=str.substring(i*2+1,i*2+3);
	    		}
	    		catch(Exception e)
	    		{
	    			break;
	    		}
	    
	    }
		
	    for(int i=0;i<ppp.length;i++)
	    {
	    	System.out.println(ppp[i]);
	    }
	}
}
