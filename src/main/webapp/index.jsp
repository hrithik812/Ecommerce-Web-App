<%-- 
    Document   : index
    Created on : Aug 16, 2020, 9:15:37 PM
    Author     : DarkWorld
--%>

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
        <title>JSP Page</title>
       <%@include file="components/css_js.jsp"%>
       
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
    
        <%
           ProductDao  dao=new ProductDao(FactoryProvider.getFactory());          
            List<Product> list=dao.getAllProducts();
            CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());          
            List<Category> clist=cdao.getCategories();        
         %>    
          <div class="row mt-4 mx-3">
         
              <div class="col-md-2">
                   <% for(Category category:clist)
                  {
                     out.println(category.getCategoryTitle()+"<br>");
                  }
                  %>
                  
                  
                
              </div>
              <div class="col-md-10">
                  <% for(Product product:list)
                  {
                     out.println(product.getpName()+"<br>");
                  }
                  %>
                  
              </div>
         </div>
         <%@include file="components/common_modal.jsp"%>
    </body>
</html>
