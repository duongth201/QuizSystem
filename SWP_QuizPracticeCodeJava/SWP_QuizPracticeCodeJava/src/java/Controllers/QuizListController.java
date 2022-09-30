/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.CustomerQuizDAO;
import DAL.QuizDAO;
import DAL.SubjectDAO;
import Models.CustomerQuiz;
import Models.Quiz;
import Models.QuizType;
import Models.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "QuizListController", urlPatterns = {"/adex/quizlist"})
public class QuizListController extends HttpServlet {

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

            String subName = request.getParameter("subject");
            String type = request.getParameter("type");

            QuizDAO dao = new QuizDAO();
            CustomerQuizDAO cdao = new CustomerQuizDAO();
            ArrayList<Subject> listAllSub = new SubjectDAO().getAllSubjects();
            ArrayList<QuizType> listAllType = dao.getAllQuizType();
            ArrayList<CustomerQuiz> listCusQuizId = cdao.getAllQuiz();
            ArrayList<Quiz> listAll = new ArrayList<Quiz>();
            if (subName.equals("0") && type.equals("0")) {
                listAll = dao.getAllQuizList();
            } else {
                listAll = dao.getAllQuizWithFilter(type, subName);
            }

            request.setAttribute("subject", subName);
            request.setAttribute("type", type);
            request.setAttribute("listAll", listAll);
            request.setAttribute("listAllType", listAllType);
            request.setAttribute("listAllSub", listAllSub);
            request.setAttribute("listCusQuizId", listCusQuizId);
            request.getRequestDispatcher("../QuizList.jsp").forward(request, response);
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
