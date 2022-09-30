/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.RegistrationDAO;
import DAL.SubjectDAO;
import Models.Registration;
import Models.Subject;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class RegistrationController extends HttpServlet {

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
        try {

            
            String subName = request.getParameter("subject");
            String status = request.getParameter("status");
            String from = request.getParameter("from");
            String to = request.getParameter("to");
            
            RegistrationDAO regDao = new RegistrationDAO();
            ArrayList<Subject> listAllSub = new SubjectDAO().getAllSubjects();
            ArrayList<Registration> listAll = new ArrayList<>();
            if(subName.equals("0") && status.equals("-1") && from.equals("") && to.equals("")){
                listAll = regDao.getAllRegistration();
            }else{
                listAll = regDao.getAllRegistrationWithFilter(subName, status, from, to);
            }
            request.setAttribute("listAllSub", listAllSub);
            request.setAttribute("subject", subName);
            request.setAttribute("status", status);
            request.setAttribute("from", from);
            request.setAttribute("to", to);

            request.setAttribute("listAll", listAll);
            request.getRequestDispatcher("../registrationList.jsp").forward(request, response);

            HttpSession session = request.getSession();
//            session.setAttribute("search", search);
//            session.setAttribute("page", page);
//            session.setAttribute("sortName", sortName);
//            session.setAttribute("sortType", sortType);
//            session.setAttribute("subName", subName);
//            session.setAttribute("status", status);
//            session.setAttribute("from", from);
//            session.setAttribute("to", to);
//            session.setAttribute("totalPage", totalPage);
            session.setAttribute("listAll", listAll);

        } catch (Exception e) {

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
