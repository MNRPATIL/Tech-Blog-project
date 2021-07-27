<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Catagory"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%
   User user=(User)session.getAttribute("currentUser");
   if(user==null){
       response.sendRedirect("login_page.jsp");
   }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        
        <%--css --%>    
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
              clip-path: polygon(50% 0%, 80% 0, 100% 0, 100% 100%, 79% 92%, 50% 100%, 24% 94%, 0 100%, 0 0, 22% 0);
            }
            body{
                background: url(blog_pics/back7.jpeg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
        
    </head>
    <body>
        
       <!--navbar-->
       
               <nav class="navbar navbar-expand-lg navbar-light primary-background">
               <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> TechBlog</a>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                 <span class="navbar-toggler-icon"></span>
               </button>

               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                 <ul class="navbar-nav mr-auto">
                   <li class="nav-item active">
                     <a class="nav-link" href="#"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
                   </li>

                   <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         <span class="fa fa-cubes"></span> Catagories
                     </a>
                     <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                       <a class="dropdown-item" href="#">Programming Language</a>
                       <a class="dropdown-item" href="#">Project Implementation</a>
                       <div class="dropdown-divider"></div>
                       <a class="dropdown-item" href="#">Data Structure</a>
                     </div>
                   </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-drivers-license-o"></span> Contact us</a>
                    </li>
                    
                     <li class="nav-item">
                         <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><h5><span class="fa fa-cloud-upload"></span> DoPost</h5></a>
                    </li>
                    
                 </ul>
                   
                   <ul class="navbar-nav mr-right">
                        <li class="nav-item">
                            <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle "></span> <%= user.getName()%></a>
                       </li>
                       
                       <li class="nav-item">
                          <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus "></span> Logout</a>
                       </li>
                   </ul>
               </div>
             </nav>
       
       <!--end of navbar-->
       
       
        <%--error message displaying on login page for incorrect datails --%>    
                            <% 
                               Message m=(Message)session.getAttribute("msg");
                               if(m != null){
                                   
                            %>
                             <div class="alert <%= m.getCssClass()%>" role="alert">
                                 <%= m.getContent() %>
                            </div>
                             
                            <% 
                                session.removeAttribute("msg");
                                }
                             %>
                             
             <!-- START OF MAIN BODY OF THE BODY -->
             
             <main>
                 
                 <div class="container">
                     <div class="row mt-4">
                         <!--first column -->
                         <div class="col-md-4">
                             <!-- catageories -->
                             
                             <div class="list-group">
                                    <a href="#" onclick="getPosts(0,this)" class=" c-link list-group-item list-group-item-action active">
                                      All Posts
                                    </a>
                                    <%
                                        PostDao d=new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Catagory> list1=d.getAllCategories();
                                        for(Catagory cc:list1)
                                        {
                                    %>
                                    <a href="#" onclick="getPosts(<%= cc.getCid()%>,this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName()%></a>
                                    
                                    <%
                                        }
                                    %>
                              </div>
                             
                         </div>
                         
                         <!--Second column -->
                         <div class="col-md-8" >
                             <!-- Posts-->                             
                             <div class="container text-center" id="loader">
                                 <i class="fa fa-refresh fa-4x fa-spin"></i>
                                 <h3 class="mt-2">Loading...</h3>
                             </div>
                             <div class="container-fluid" id="post-container">
                                 
                             </div>
                             
                         </div>
                         
                     </div>
                     
                 </div>
                 
             </main>
             
             <!-- END OF MAIN BODY OF THE BODY -->
           
       
       <!-- Start of Profile model-->
       
                    <!-- Modal -->
                    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header primary-background">
                            <h5 class="modal-title" id="exampleModalLabel"> TechBlog </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                              <div class="container text-center">
                                  <img src="pics/<%= user.getProfile() %>" class="img-fluid" style="border-radius: 50%; max-width:150px;" />
                                  <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName() %> </h5>
                                  
                                        <!-- Details in table-->
                                       <div id="profile-details">

                                        <table class="table">

                                              <tbody>
                                                <tr>
                                                  <th scope="row">ID</th>
                                                  <td> <%= user.getId() %></td>
                                                </tr>
                                                <tr>
                                                  <th scope="row"> Email :</th>
                                                  <td> <%= user.getEmail() %></td>

                                                </tr>
                                                <tr>
                                                  <th scope="row"> Gender </th>
                                                  <td> <%= user.getGender() %></td>                                          
                                                </tr>
                                                <tr>
                                                  <th scope="row"> Status: </th>
                                                  <td> <%= user.getAbout() %></td>                                          
                                                </tr>
                                                <tr>
                                                  <th scope="row"> Registered on: </th>
                                                  <td> <%= user.getDateTime().toString() %></td>                                          
                                                </tr>
                                              </tbody>
                                            </table>

                                         </div>
                                          <!-- Profile Edit -->
                                          
                                          <div id="profile-edit" style="display: none;">
                                              <h3 class="mt-2">Please Edit Carefully</h3>
                                              
                                              <form action="EditServlet" method="post" enctype="multipart/form-data" >
                                                  
                                                  <table class="table">
                                                      <tr>
                                                          <td> ID :</td>
                                                          <td><%= user.getId() %></td>
                                                      </tr>
                                                      <tr>
                                                          <td> Email :</td>
                                                          <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>
                                                      </tr>
                                                      <tr>
                                                          <td> Name :</td>
                                                          <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"></td>
                                                      </tr>
                                                      <tr>
                                                          <td> Password :</td>
                                                          <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"></td>
                                                      </tr>
                                                      <tr>
                                                          <td> Gender :</td>
                                                          <td> <%= user.getGender().toUpperCase() %></td>
                                                      </tr>
                                                      <tr>
                                                          <td> About :</td>
                                                          <td> 
                                                              <textarea rows="2" class="form-control" name="user_about">
                                                                  <%= user.getAbout() %>
                                                              </textarea>
                                                          </td>
                                                      </tr>
                                                      <tr>
                                                          <td> Update Profile:</td>
                                                          <td>
                                                              <input type="file" name="image" class="form-control" >
                                                          </td>
                                                      </tr>
                                                      
                                                  </table>
                                                              <div class="container">
                                                                  <button type="submit" class="btn btn-outline-primary">Save</button>
                                                              </div>
                                                              
                                              </form>
                                          </div>
                                          
                                <!-- end of details-->  
                                  
                              </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button id="edit-profile-button" type="button" class="btn btn-primary"> Edit</button>
                          </div>
                        </div>
                      </div>
                    </div>
       
        <!-- End of Profile modal-->
       
       <!-- Start of Post Modal -->
          
                <!-- Modal -->
                <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                                                 
                          <form id="add-post-form" action="AddPostServlet" method="post">
                              
                             <div class="form-group">
                                 <select class="form-control" name="cid">
                                  <option>---Select Category---</option>
                                  
                                  <%
                                      PostDao postd=new PostDao(ConnectionProvider.getConnection());
                                      ArrayList<Catagory> list=postd.getAllCategories();
                                      for(Catagory c:list)
                                      {
                                   %>                                  
                                  <option value="<%= c.getCid()%>"><%= c.getName() %></option>
                                  
                                  <%
                                      }
                                      %>
                              </select>
                            </div>
                              
                              <div class="form-group">
                                  <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control" />
                              </div>
                              
                              <div class="form-group">
                                  <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                              </div>
                              
                              <div class="form-group">
                                  <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your code(if any)"></textarea>
                              </div>
                              
                              <div class="form-group">
                                  <label> <h5> Select Your Photo..</h5></label><br>
                                  <input type="file" name="pic" />
                              </div>
                               
                              <div class="container text-center">
                                  <button type="submit" class="btn btn-outline-primary"> Post </button>
                              </div>
                              
                          </form>
                       
                      </div>
                    </div>
                  </div>
                </div>
       
       
       <!-- End of Post Modal -->
       
       
       
        <%-- JavaScript --%>   
       <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"  crossorigin="anonymous"></script>  
      <!-- sweat-alert -->
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
       
       <script src="js/myjs.js" type="text/javascript"></script>
       
       <!-- toggleing edit button in profile p-->
    <script>
        
        $(document).ready(function (){
            let editStatus= false;
            
            $('#edit-profile-button').click(function (){
                
                if(editStatus == false)
                {
                    $("#profile-details").hide();
                    $("#profile-edit").show();
                    
                    editStatus = true;
                    $(this).text("Back")
                }
                else{
                    $("#profile-details").show();
                    $("#profile-edit").hide();
                    
                    editStatus = false;
                    $(this).text("Edit")
                }
            })
        })
        
    </script>
    
    <!-- add-post-js -->
    <script>
        
        $(document).ready(function (e){
            
            $("#add-post-form").on("submit",function(event){
                //this code gets called when form submitted...
                event.preventDefault();
                console.log("you have clicked on submit...");
                let form= new FormData(this);
                
                //now requsting to server
                $.ajax({
                    url: "AddPostServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        if(data.trim()=='done'){
                            swal("Good job!", "saved successfully", "success");
                        }
                        else{
                            swal("Error!!", "Something Went wrong try agian", "error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        swal("Error!!", "Something Went wrong try agian", "error");
                    },
                    processData: false,
                    contentType: false
                })
            })
        })
        
    </script>
    
    <!-- loading posts from ajax -->
    <script>
        
           function getPosts(catId,temp){
               $("#loader").show();
               $("#post-container").hide()
               
               $(".c-link").removeClass('active')
               
                $.ajax({
                url: "load_posts.jsp",
                data:{cid:catId},
                success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data)
                        $(temp).addClass('active')
                    }
            })
           }
            
            $(document).ready(function (e){
                let allPostsRef = $('.c-link')[0];
                getPosts(0,allPostsRef);
            })
        
    </script>
        
        
    </body>
</html>
