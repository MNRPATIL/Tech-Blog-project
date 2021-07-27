
package com.tech.blog.dao;
import com.tech.blog.entities.User;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class UserDao {
    
    private Connection con;
    
    public UserDao(Connection con){
        this.con =con;
    }
    
    public boolean saveUser(User user)
    {
        boolean f=false;
        try
        {
            //user --> dataBase
            String Query="insert into user(Name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement ps=this.con.prepareStatement(Query);
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPassword());
            ps.setString(4,user.getGender());
            ps.setString(5,user.getAbout());
            
            ps.executeUpdate();
            f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    //get user by userEamil and userPassword
    
    public User getUserByEmailAndPassword(String email,String password){
        
        User user=null;
        
        try {
            
            String query="select * from user where email=? and password=?";
            PreparedStatement pst=con.prepareStatement(query);
            pst.setString(1,email);
            pst.setString(2,password);
            
            ResultSet set=pst.executeQuery();
            
            if(set.next()){
                user = new User();
                String name=set.getString("name");
                user.setName(name);
                //or
                user.setId(set.getInt("Id"));
                user.setEmail(set.getString("email"));
                user.setPassword("password");
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    // upating user details
    
    public boolean updateUser(User user){
        
        boolean f=false;
        
        try {
            
            String query="update user set name=? ,email=? , password=? , gender=? , about=? , profile=? where id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());
            ps.setString(6, user.getProfile());
            ps.setInt(7, user.getId());
            
            ps.executeUpdate();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
       return f;
    }
    
    public User getUserByUserId(int userId)
    {
         User user=null;
        try {          
            String q="select * from user where Id=?";
            PreparedStatement ps=this.con.prepareStatement(q);
            ps.setInt(1,userId);
            ResultSet set=ps.executeQuery();
            if(set.next())
            {
                user = new User();
                String name=set.getString("name");
                user.setName(name);
                //or
                user.setId(set.getInt("Id"));
                user.setEmail(set.getString("email"));
                user.setPassword("password");
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));                
                
            }                     
           
        }catch(Exception ex) {
            ex.printStackTrace();
        }
         
        return user;
    }
    
}
