/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.technical.blog.dao;

/**
 *
 * @author sa608
 */
import java.sql.*;
public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    public boolean insertLike(int pid,int uid){
        boolean f=false;
        try{
            String query="insert into liked(pid,uid)values(?,?)";
            PreparedStatement p=con.prepareStatement(query);
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public int countLike(int pid){
        int count=0;
        try{
            String query="select count(*) from liked where pid=?";
            PreparedStatement p=con.prepareStatement(query);
            p.setInt(1, pid);
            ResultSet set=p.executeQuery();
            if(set.next()){
                count=set.getInt("count(*)");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return count;
    }
    
   public boolean isLikedByUser(int pid,int uid){
       boolean f=false;
       try{
           PreparedStatement p=con.prepareStatement("select * from liked where pid=? and uid=?");
           p.setInt(1, pid);
           p.setInt(2, uid);
           ResultSet set=p.executeQuery();
           if(set.next()){
               f=true;
           }
       }catch(Exception e){
           e.printStackTrace();
       }
   
       return f;
   } 
   
   public boolean deleteLike(int pid,int uid){
       boolean f=false;
       try{
           PreparedStatement p=con.prepareStatement("delete from liked where pid=? and uid=?");
           p.setInt(1, pid);
           p.setInt(2, uid);
           p.executeUpdate();
           f=true;
       }catch(Exception e){
           e.printStackTrace();
       }
       
       return f;
   }
    
}
