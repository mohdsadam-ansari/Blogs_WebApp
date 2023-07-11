/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.technical.blog.dao;
import com.technical.blog.entities.Category;
import com.technical.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author sa608
 */
public class PostDao {
    
    Connection con;
    
    public PostDao(Connection con){
        this.con=con;
    }
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list=new ArrayList<>();
        try{
            String query="select * from categories";
            
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(query);
            while(rs.next()){
                int cid= rs.getInt("cid");
                String name=rs.getString("name");
                String description=rs.getString("description");
                Category cat=new Category(cid,name,description);
                list.add(cat);
            }
            
            
        }catch(Exception e){
        
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean savePost(Post p){
        boolean f=false;
        try{
            String query="insert into post(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,p.getpTitle());
            pstmt.setString(2,p.getpContent());
            pstmt.setString(3,p.getpCode());
            pstmt.setString(4,p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public List<Post> getAllPosts(){
        List<Post> list=new ArrayList<>();
        try{
            PreparedStatement p=con.prepareStatement("select * from post order by pId desc");
            ResultSet set=p.executeQuery();
            while(set.next()){
                int pId=set.getInt("pId");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                Post post=new Post(pId, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Post> getPostByCategory(int catId){
        List<Post> list=new ArrayList<>();
        try{
            PreparedStatement p=con.prepareStatement("select * from post where catId=?");
            p.setInt(1, catId);
            ResultSet set=p.executeQuery();
            while(set.next()){
                int pId=set.getInt("pId");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int userId=set.getInt("userId");
                Post post=new Post(pId, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    public Post getPostByPostId(int postId){
        Post post=null;
        String query="select * from post where pId=?";
        try{
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1, postId);
            ResultSet set=ps.executeQuery();
            while(set.next()){
                int pId=set.getInt("pId");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int userId=set.getInt("userId");
                int catId=set.getInt("catId");
                post=new Post(pId, pTitle, pContent, pCode, pPic, date, catId, userId);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return post;
    }
    
}
