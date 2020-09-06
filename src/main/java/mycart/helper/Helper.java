/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mycart.helper;

/**
 *
 * @author DarkWorld
 */
public class Helper {
    
    
    public static String getwords(String desc){
      String[] strs=desc.split(" ");
      String res="";
         if(strs.length>10)
         {
             for(int i=0;i<8;i++)
             res=res+strs[i]+" ";
             return res;
         }
         else 
         {
           return desc;
         }
    }
}
