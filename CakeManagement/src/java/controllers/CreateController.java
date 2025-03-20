/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserDAO;
import model.UserDTO;
import model.UserError;

/**
 *
 * @author hoadoan
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static final String ERROR = "createUser.jsp";
    private static final String SUCCESS = "login.html";
    private static final String DUPLICATE_MESSAGE = "The userID has already existed";
    private static final String UNKNOW_MESSAGE = "Duplicate User ID!!";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userErorr = new UserError();
        boolean checkValidation = true;
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            if(!password.equals(confirm)){  
                checkValidation = false;
                userErorr.setConfirm("The password and confirm are not the same!");
            }
            UserDAO dao = new UserDAO();
//            boolean checkDuplicate = dao.checkDuplicate(userID);
//            if (checkDuplicate) {
//                userErorr.setUserIDError(DUPLICATE_MESSAGE);
//            }
            if(checkValidation){
                UserDTO user = new UserDTO(userID, fullName, phone, roleID, password);
                boolean check = dao.createV2(user);
                if (check) {
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", UNKNOW_MESSAGE);
                }
            }
        } catch (SQLException e) {
            log("Error at DeleteController: " + e.toString());
            if(e.toString().contains("Duplicate")){
                userErorr.setUserIDError(DUPLICATE_MESSAGE);
                
            }
        } finally {
            request.setAttribute("USER_ERROR", userErorr);
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
