/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mycart.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import mycart.dao.CategoryDao;
import mycart.dao.ProductDao;
import mycart.entities.Category;
import mycart.entities.Product;
import mycart.helper.FactoryProvider;

/**
 *
 * @author DarkWorld
 */
@MultipartConfig  
public class ProductOperationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String op = request.getParameter("operation");
            if (op.trim().equals("addcategory")) {
                //add category details to db
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);

                CategoryDao categorydao = new CategoryDao(FactoryProvider.getFactory());
                int catid = categorydao.saveCategory(category);
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category Added Successfully" + catid);
                response.sendRedirect("admin.jsp");
                return;
            } else if (op.trim().equals("addproduct")) {
                //add product deatils to db
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int cid=Integer.parseInt(request.getParameter("catid"));
                    Part part=request.getPart("pPic");
                    Product p=new Product();
                    p.setpName(pName);
                    p.setpDesc(pDesc);
                    p.setpPrice(pPrice);
                    p.setpDiscount(pDiscount);
                    p.setpPhoto(part.getSubmittedFileName());
                    p.setpQuantity(pQuantity);
                    //get Category by cid
                    CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                    Category category=cdao.getCategory(cid);
                    p.setCategory(category);
                    
                    //save the product
                    ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
                     pdao.saveProduct(p);
                     
                     String path=request.getRealPath("image")+File.separator+"products"+File.separator+part.getSubmittedFileName();
                     try{
                         FileOutputStream fos=new FileOutputStream(path);
                            InputStream  is=part.getInputStream();
                             
                               byte []data =new byte[is.available()];
                               is.read(data);                      
                               fos.write(data);
                               fos.close();
                     }catch(Exception e)
                     {
                       e.printStackTrace();
                     }
                    
                     
                     
                     out.println("Product Saved Successfully");
                     HttpSession httpSession=request.getSession();
                     httpSession.setAttribute("message","Product is added successfully");
                     response.sendRedirect("admin.jsp");
                     return;
                   
                     
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
