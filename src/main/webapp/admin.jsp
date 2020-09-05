<%@page import="java.util.List"%>
<%@page import="mycart.entities.Category"%>
<%@page import="mycart.helper.FactoryProvider"%>
<%@page import="mycart.dao.CategoryDao"%>
<%@page import="mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not logged in as an admin");
            response.sendRedirect("login.jsp");
            return;
            //return kore dibo karon jodi normal user kinba loggedin nah hoy er porer code cholbe nah
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panal</title>
        <%@include file="components/css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp"%>
            </div>
            <!--first row-->
            <div class="row mt-3">
                <!--first col-->
                <div class ="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img class="img-fluid " style="max-width:80px;"src="image/users.png" alt="user-icon">
                            </div>
                            <h1>2322</h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <!--second col-->
                <div class ="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img class="img-fluid " style="max-width:80px;"src="image/categories.png" alt="user-icon">
                            </div>
                            <h1>2322</h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>
                <!--third col-->
                <div class ="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img class="img-fluid " style="max-width:80px;"src="image/product.png" alt="user-icon">
                            </div>
                            <h1>2322</h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>

            <!--second row-->
            <div class="row mt-3">
                <!--first column-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img class="img-fluid " style="max-width:80px;"src="image/addcategory.png" alt="user-icon">
                            </div>
                            <p class="mt-2">Click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>
                <!--second column-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img class="img-fluid " style="max-width:80px;"src="image/addproduct.png" alt="user-icon">
                            </div>
                            <p class="mt-2">Click here to add new product</p>
                            <h1 class="text-uppercase text-muted">Add Products</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Add Category Modal-->
        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" modalrole="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Detail</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory"/>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter Category Title" name="catTitle" required/>  
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" style="height:300px;"placeholder="Enter Category Description" name="catDescription" required></textarea>
                            </div>

                            <div class="container text-center">  
                                <button type="submit" class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--End Category Modal-->
        <!--Add Product Modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct"/>
                            
                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter title of the product" required/>
                            </div>
                             <div class="form-group">
                                 <textarea class="form-control" style="height:250px;" name="pDesc" placeholder="Enter product description" required></textarea>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter price of the product" required/>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter product discount" required/>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter product qunatity" required/>
                            </div>
                            <div class="form-group">
                                <label  for="catid">Select product categories</label>
                                <br>
                                <%
                                   CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                                 List<Category> list=cdao.getCategories();
                                     
                                %>
                                
                                <select name="catid" class="form-control" id="">
                                    <% for(Category c:list){
                                        %>
                                        <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                                      <%
                                        }  
                                      %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="pPic">Select picture of the product</label>
                                <br>
                                <input type="file" class="form-control" name="pPic" required/>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--End Product Modal-->
    </body>
</html>
