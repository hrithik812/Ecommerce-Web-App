
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <%@include file="components/css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container">
            <div class="row mt-4">
                <div class="col-md-5 offset-md-4 ">

                    <div class="card">
                        <div class="card-header text-center">
                            <h3>Login Here</h3>
                        </div>
                        <div class="card-body">
                            <%@include file="components/message.jsp"%>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
         
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <a href="register.jsp"><strong>If not register,please click here</strong></a> 
                                  <div class="container text-center">
                                <button type="submit" class="btn btn-primary ">Submit</button>
                                <button type="reset" class="btn btn-primary ">Reset</button>
                                  </div>
                            </form>

                        </div>
                        <div class="card-footer">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
