
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        
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
        
        <%@include file="normal_navbar.jsp"%>
        
        <main class="primary-background p-5 banner-background">
            
            <div class="container ">
                
                <div class="col-md-6 offset-md-3">
                    
                    <div class="card">
                        <div class="card-header text-center primary-background">
                            <span class="fa fa-3x fa-user-circle text-white"></span>
                            <br>
                            <h3>Regester Here</h3>
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet"  method="POST">           
                                <div class="form-group">
                                  <label for="user_name">User Name</label>
                                  <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>
                                
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                
                                <div class="form-group">
                                  <label for="gender">Select Gender</label>
                                  <br>
                                  <input type="radio" id="gender" name="gender" value="Male">Male
                                  <input type="radio" id="gender" name="gender" value="Female">Female
                                </div>
                                
                                <div class="form-group">
                                    <textarea name="about" class="form-control"  rows="5" placeholder="Enter Something about your self"></textarea>
                                </div>
                                
                                <div class="form-check">
                                  <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">Agree terms and Conditions</label>
                                </div>
                                
                                <br>
                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please Wait...</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">SignUp</button>
                            </form>
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
       <%--sweetalert--%>
       <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
       
       
       <script>
           $(document).ready(function(){
               console.log("loaded......")
               
               $('#reg-form').on('submit',function(event){
                   event.preventDefault();
                   
                   let form=new FormData(this);
                  
                  $('#submit-btn').hide();
                  $('#loader').show();
                  
                  //send to register servlet:
                  $.ajax({
                      url: "RegisterServlet",
                      type: 'POST',
                      data: form,
                     success: function(data, textStatus,jqXHR){
                         console.log(data)
                         
                         $('#submit-btn').show();
                         $('#loader').hide();
                         
                         if(data.trim()==='done')
                         {
                                  swal("Regestered Successfully...We are Going to redirect to the login page")
                                            .then((value) => {
                                              window.location ="login_page.jsp"
                                            });
                          }else
                          {
                              swal(data);
                          }
                                                
                     },
                     error: function(jqXHR, textStatus,errorThrown){
                         
                          $('#submit-btn').show();
                         $('#loader').hide();
                         swal("Something Went Wrong..try Again");
                                    
                     },
                     processData: false,
                     contentType: false
                     
                  });
               });
           });
       </script>
           
    </body>
</html>
