<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech Blog</title>
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
        <!--navBar -->
        <%@include file="normal_navbar.jsp" %>
        <!-- Banner -->
        <div class="container-fluid p-0 m-0">
            
            <div class="jumbotron primary-background banner-background">
                <div class="container">
                <h3 class="display-4">Welcome to TechBlog</h3>
                <p>Welcome to technical blog, world of technologies</p>
                <p>
                    A programming language is a formal language comprising a set of instructions that produce various 
                    kinds of output. Programming languages are used in computer programming to implement algorithms.
                </p>
                <p>
                    Most programming languages consist of instructions for computers. There are programmable machines 
                    that use a set of specific instructions, rather than general programming languages.
                </p>
                <button class="btn btn-outline-dark btn-lg"><span class="fa fa-hourglass-start"></span>Start ! its free</button>
                <a href="login_page.jsp" class="btn btn-outline-dark btn-lg"><span class="fa fa-user-circle-o fa-spin"></span>Login</a>
               </div>
            </div>
        </div>
        
        <!-- Cards -->
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card">
                       <div class="card-body">
                            <h5 class="card-title">Java Programming Language</h5>
                            <p class="card-text">Java is a High Level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible.</p>
                            <a href="https://en.wikipedia.org/wiki/Java_(programming_language)" class="btn primary-background text-dark">Read More</a>
                        </div>
                     </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                       <div class="card-body">
                            <h5 class="card-title">Python Programming Language</h5>
                            <p class="card-text">Python is an interpreted high-level general-purpose programming language. Python's design philosophy emphasizes code readability with its notable use of significant indentation.</p>
                            <a href="https://en.wikipedia.org/wiki/Python_(programming_language)" class="btn primary-background text-dark">Read More</a>
                        </div>
                     </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                       <div class="card-body">
                            <h5 class="card-title">JavaScript Programming Language</h5>
                            <p class="card-text">JavaScript (/ˈdʒɑːvəˌskrɪpt/),often abbreviated as JS, is a programming language that conforms to the ECMAScript specification.JavaScript is high-level, often just-in-time compiled, and multi-paradigm.</p>
                            <a href="https://en.wikipedia.org/wiki/JavaScript" class="btn primary-background text-dark">Read More</a>
                        </div>
                     </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                       <div class="card-body">
                            <h5 class="card-title">C Programming Language</h5>
                            <p class="card-text">C (/siː/, as in the letter c) is a general-purpose, procedural computer programming language supporting structured programming, lexical variable scope, and recursion, with a static type system. By design, C provides constructs that map efficiently to typical machine instructions.</p>
                            <a href="https://en.wikipedia.org/wiki/C_(programming_language)" class="btn primary-background text-dark">Read More</a>
                        </div>
                     </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                       <div class="card-body">
                            <h5 class="card-title">C++ Programming Language</h5>
                            <p class="card-text">C++ (/ˌsiːˌplʌsˈplʌs/) is a general-purpose programming language created by Bjarne Stroustrup as an extension of the C programming language, or "C with Classes". The language has expanded significantly over time, and modern C++ now has object-oriented, generic, and functional features in addition to facilities for low-level memory manipulation</p>
                            <a href="https://en.wikipedia.org/wiki/C%2B%2B" class="btn primary-background text-dark">Read More</a>
                        </div>
                     </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                       <div class="card-body">
                            <h5 class="card-title">.NET Programming Language</h5>
                            <p class="card-text">The .NET Framework (pronounced as "dot net") is a software framework developed by Microsoft that runs primarily on Microsoft Windows. It includes a large class library called Framework Class Library (FCL) and provides language interoperability (each language can use code written in other languages) across several programming languages.</p>
                            <a href="https://en.wikipedia.org/wiki/.NET_Framework" class="btn primary-background text-dark">Read More</a>
                        </div>
                     </div>
                </div>
            </div>
        </div>
        
       
       <%-- JavaScript --%>   
       <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"  crossorigin="anonymous"></script>  
       <script src="js/myjs.js" type="text/javascript"></script>
    </body>
    
</html>
