<%-- 
    Document   : index
    Created on : Aug 16, 2020, 9:15:37 PM
    Author     : DarkWorld
--%>

<%@page import="mycart.helper.Helper"%>
<%@page import="mycart.entities.Category"%>
<%@page import="mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="mycart.entities.Product"%>
<%@page import="mycart.dao.ProductDao"%>
<%@page import="mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to the ECart System Of Romoniyo</title>
        <%@include file="components/css_js.jsp"%>

    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <%
            ProductDao dao = new ProductDao(FactoryProvider.getFactory());
            List<Product> list = null;
            String cat = request.getParameter("category");

            if (cat == null || cat.trim().equals("all")) {
                list = dao.getAllProducts();
            } else {
                int cid = Integer.parseInt(cat.trim());
                list = dao.getProductByCategroyId(cid);
            }
            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> clist = cdao.getCategories();
        %>    
        <div class="row mt-4 mx-3">

            <div class="col-md-2">
                <div class="list-group">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All Product
                    </a>

                    <% for (Category c : clist) {

                    %>    
                    <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>

                    <%
                        }
                    %>
                </div>
            </div>
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card-columns">
                            <%
                                for (Product product : list) {
                            %> 
                            <!--product card-->
                            <div class="card">
                                <div class="container text-center">
                                    <img src="image/products/<%=product.getpPhoto()%>" style="max-height:200px;max-width:100%;width:auto; "class="card-img-top" alt="...">
                                </div>
                                <div class="card-body>
                                     <h4>
                                     <%=product.getpName()%>
                                     </h4>
                                     <p class="card-text"><%= Helper.getwords(product.getpDesc())%></p>

                                </div>   
                                <div class="card-footer">
                                    <button class="btn custom-bg text-white">Buy Here</button>  
                                    <button class="btn btn-outline-primary">&#2547;<%=product.getpPrice()%></button>  
                                </div>

                            </div>
                            <%}
                                if (list.size() == 0) {
                                    out.println("<h1>No item in this list</h1>");
                                }

                            %>
                        </div>     
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/common_modal.jsp"%>
    </body>
</html>
