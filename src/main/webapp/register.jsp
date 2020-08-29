
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <%@include file="components/css_js.jsp"%>

    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container-fluid">
              <div class="row mt-4">
            <div class="col-md-5 offset-md-4"><!--Eta daan baam shorache offset-md-4 ta-->
                <div class="card">
                    <%@include file="components/message.jsp" %>
                    <div class="card-body ">
                         <h3 class="text-center my-3">Sign Up Here!!</h3>
                         <form action="RegisterServlet" method="post">
                            <div class="form-group">
                                <label for="name">User Name</label>
                                <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter here" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="email">User Email</label>
                                <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter here" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="password">User Password</label>
                                <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter here" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="phoneno">User Phone</label>
                                <input name="user_number" type="number" class="form-control" id="phoneno" placeholder="Enter here" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="address">User Address</label>
                                <textarea name="user_address"style="height:100px;" class="form-control" id="address" placeholder="Enter here" aria-describedby="emailHelp"></textarea>
                            </div>
                            <div class="container text-center"> 
                                <button type="submit" class="btn btn-outline-success">Register</button>
                                <button type="reset" class="btn btn-outline-warning">Reset</button>
                            </div>   
                        </form>  
                 </div>
                </div>
            </div> 
        </div>
        </div>
    </body>
</html>
