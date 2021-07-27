
<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        
        <%--css --%>    
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
             clip-path: polygon(50% 0%, 80% 0, 100% 0, 100% 100%, 79% 92%, 50% 100%, 24% 94%, 0 100%, 0 0, 22% 0);
            }
        </style>
        
    </head>
    <body>
        
    <!-- navbar -->
    <%@include file="normal_navbar.jsp" %>
        
        <main class="d-flex align-items-center primary-background text-dark banner-background" style="height: 75vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header primary-background text-center">
                                <span class="fa fa-user-plus fa-3x text-white"></span>
                                <br>
                                <p>Login Here</p>
                            </div>
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
                            
                            <div class="card-body">
                                <form action="LoginServlet" method="POST">
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">Email address</label>
                                      <input name="email" required type="email"  class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                      <label for="exampleInputPassword1">Password</label>
                                      <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                  
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary ">Login</button>
                                    </div>
                                    
                                </form>                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        <%-- JavaScript --%>   
       <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"  crossorigin="anonymous"></script>  
       <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
