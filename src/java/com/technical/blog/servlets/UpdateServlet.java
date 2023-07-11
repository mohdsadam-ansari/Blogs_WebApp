/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.technical.blog.servlets;

import com.technical.blog.dao.UserDao;
import com.technical.blog.entities.Message;
import com.technical.blog.entities.User;
import com.technical.blog.helper.ConnectionProvider;
import com.technical.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author sa608
 */
@MultipartConfig
public class UpdateServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            String email=request.getParameter("email");
            String name=request.getParameter("name");
            String password=request.getParameter("password");
            Part part=request.getPart("image");
            String imageName=part.getSubmittedFileName();
            
            HttpSession s=request.getSession();
            User user=(User)s.getAttribute("currentUser");
            user.setEmail(email);
            user.setName(name);
            user.setPassword(password);
            String oldFile=user.getProfile();
            if(imageName.length()==0){
                imageName=oldFile;
            }
            
            user.setProfile(imageName);
            
            UserDao userdao=new UserDao(ConnectionProvider.getConnecton());
            boolean ans=userdao.updateUser(user);
            if(ans){
                
                String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
                out.print("<h1>"+path+"</h1>");
                /*String oldFilePath=request.getRealPath("/")+"pics"+File.separator+oldFile;
                    if(!oldFile.equals("default.png")){
                        Helper.deleteFile(oldFilePath);

                    }*/
                    if(!oldFile.equals(user.getProfile())){
                        if(Helper.saveFile(part.getInputStream(), path)){
                            Message msg=new Message("Profile details updated", "success", "alert-success");
                            s.setAttribute("msg", msg);
                    }else{
                        Message msg=new Message("Opps something went wrong !", "error", "alert-danger");
                        s.setAttribute("msg", msg);
                    }
                }else{
                        Message msg=new Message("Profile details updated", "success", "alert-success");
                            s.setAttribute("msg", msg);
                    }
                    
                }else{
                    Message msg=new Message("Opps something went wrong !", "error", "alert-danger");
                    s.setAttribute("msg", msg);
            }
            
            response.sendRedirect("profile.jsp");
            out.println("</body>");
            out.println("</html>");
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
