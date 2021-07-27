/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;
import java.sql.*;

/**
 *
 * @author admin
 */
public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    
    public boolean insertLike(int pid,int uid)
    {
        boolean f=false;
        try {
            String q="insert into liked(pid,uid) values(?,?)";
            PreparedStatement ps=this.con.prepareStatement(q);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
            
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public int countLikeOnPost(int pid)
    {
        int count=0;
        
        try {
             String q="select count(*) from liked where pid=?";
             PreparedStatement p=this.con.prepareStatement(q);
             p.setInt(1,pid);
             ResultSet set=p.executeQuery();
             if(set.next()){
                 count=set.getInt(1);  //set.getInt("count(*)");
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return count;
    }
    
    public boolean isLikedByUser(int pid,int uid)
    {
        boolean f=false;
        
         try {
            String q="select * from liked where pid=? and uid=?";
            PreparedStatement ps=this.con.prepareStatement(q);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ResultSet rs=ps.executeQuery();
            
            if(rs.next()){
               f=true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public boolean deleteLike(int pid,int uid)
    {
        boolean f=false;
        
        try {
            String q="delete from liked where pid=? and uid=?";
            PreparedStatement ps=this.con.prepareStatement(q);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeQuery();
                       
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
}
