/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UserDAO;
import model.UserDTO;

/**
 *
 * @author hoadoan
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String LOGIN_PAGE="login.jsp";
    private static final String AD="AD";
    private static final String ADMIN_PAGE="admin.jsp";
    private static final String US="US";
    private static final String USER_PAGE="user.jsp";
    private static final String INCORRECT_MESSAGE="Incorrect UserID or Password";
    private static final String NOT_SUPPORT_MESSAGE="Your role is not support yet";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url= LOGIN_PAGE;
        try {
            String userID= request.getParameter("userID");
            String password= request.getParameter("password");
            UserDAO dao= new UserDAO();
            UserDTO loginUser= dao.checkLogin(userID, password);
//            Xác thực ở đây nè
            if(loginUser!= null){
                HttpSession session= request.getSession();
                session.setAttribute("LOGIN_USER", loginUser);
//                phân quyền ở đây nè
                String roleID= loginUser.getRoleID();
                if(AD.equals(roleID)){
                    url= ADMIN_PAGE;
                }else if(US.equals(roleID)){
                    url= USER_PAGE;
                }else {
                    request.setAttribute("MESSAGE", NOT_SUPPORT_MESSAGE);
                }
            }else{
                request.setAttribute("ERROR", INCORRECT_MESSAGE);
            }
        } catch (Exception e) {
            log("Error at LoginController: "+ e.toString());
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
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
