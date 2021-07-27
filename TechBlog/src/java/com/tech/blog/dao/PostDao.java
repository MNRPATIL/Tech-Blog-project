
package com.tech.blog.dao;
import com.tech.blog.entities.Catagory;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Catagory> getAllCategories(){
        
        ArrayList<Catagory> list=new ArrayList<>();
        
        try {
            
            String q= " select * from categories";
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(q);
            while(set.next())
            {
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                Catagory c=new Catagory(cid,name,description);
                list.add(c);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
       return list;
    }
    
    public boolean savePost(Post p){
        boolean f=false;
        
        try {
            
            String q="insert into post(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(q);
            ps.setString(1, p.getpTitle());            
            ps.setString(2, p.getpContent());            
            ps.setString(3, p.getpCode());            
            ps.setString(4, p.getpPic());            
            ps.setInt(5, p.getCatId());            
            ps.setInt(6, p.getUserId());      
            
            ps.executeUpdate();
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    //Get all the posts
    public List<Post> getAllPosts()
    {
        List<Post> list = new ArrayList<>();
        //fetch all the post
        
        try {
            
            PreparedStatement pst=con.prepareStatement("select * from post order by pid desc");
            ResultSet rs=pst.executeQuery();
            
            while(rs.next())
            {
                int pid=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
                String pContent=rs.getString("pContent");
                String pCode=rs.getString("pCode");
                String pPic=rs.getString("pPic");
                Timestamp pdate=rs.getTimestamp("pDate");
                int catId=rs.getInt("catId");
                int userId=rs.getInt("userId");
                
                Post post= new Post(pid, pTitle, pContent, pCode, pPic, pdate, catId, userId);
                
                list.add(post);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public List<Post> getPostByCatId(int catId){
        
        List<Post> list = new ArrayList<>();
        //fetch all the posts by id
        
         try {
            
            PreparedStatement pst=con.prepareStatement("select * from post where catId=?");
            pst.setInt(1, catId);
            ResultSet rs=pst.executeQuery();
            
            while(rs.next())
            {
                int pid=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
                String pContent=rs.getString("pContent");
                String pCode=rs.getString("pCode");
                String pPic=rs.getString("pPic");
                Timestamp pdate=rs.getTimestamp("pDate");
                int userId=rs.getInt("userId");
                
                Post post= new Post(pid, pTitle, pContent, pCode, pPic, pdate, catId, userId);
                
                list.add(post);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
         
        return list;
    }
    
    public Post getPostByPostId(int postId){
        
        Post post=null;
         
            String q="select * from post where pid=?";
            
        try {
           
                PreparedStatement p=this.con.prepareStatement(q);
                p.setInt(1,postId);
                
                ResultSet rs=p.executeQuery();
                
                if(rs.next()){
                    
                    int pid=rs.getInt("pid");
                    String pTitle=rs.getString("pTitle");
                    String pContent=rs.getString("pContent");
                    String pCode=rs.getString("pCode");
                    String pPic=rs.getString("pPic");
                    Timestamp pdate=rs.getTimestamp("pDate");
                    int catId=rs.getInt("catId");
                    int userId=rs.getInt("userId");
                     post= new Post(pid, pTitle, pContent, pCode, pPic, pdate, catId, userId);

                }
                
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return post;
    }
}
