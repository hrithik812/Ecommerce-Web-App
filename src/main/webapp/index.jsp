<%-- 
    Document   : index
    Created on : Aug 16, 2020, 9:15:37 PM
    Author     : DarkWorld
--%>

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
        <h1>Hello World</h1>
        <h1>Creating Session Factory Object</h1>
        <%
        out.println(FactoryProvider.getFactory());
         %>    
         <%@include file="components/common_modal.jsp"%>
    </body>
</html>
