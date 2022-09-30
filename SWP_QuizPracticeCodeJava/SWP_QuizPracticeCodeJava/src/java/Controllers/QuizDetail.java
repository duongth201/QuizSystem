/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.QuizDAO;
import DAL.SubjectDAO;
import Models.Quiz;
import Models.QuizLevel;
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
@WebServlet(name = "QuizDetail", urlPatterns = {"/adex/quizdetail"})
public class QuizDetail extends HttpServlet {

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
            out.println("<title>Servlet QuizDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizDetail at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        int qid = Integer.parseInt(request.getParameter("qid"));
        QuizDAO dao = new QuizDAO();

        switch (action) {
            case "Add":
                ArrayList<Subject> listSubject = new SubjectDAO().getSubjectNameAndSubjectID();
                ArrayList<QuizType> listAllType = dao.getAllQuizType();
                ArrayList<QuizLevel> listAllLevel = dao.getAllLevel();

                request.setAttribute("listSubject", listSubject);
                request.setAttribute("listAllLevel", listAllLevel);
                request.setAttribute("listAllType", listAllType);
                request.getRequestDispatcher("../NewQuiz.jsp").forward(request, response);
                break;

            case "Edit":
                ArrayList<Subject> listSubject1 = new SubjectDAO().getSubjectNameAndSubjectID();
                ArrayList<QuizType> listAllType1 = dao.getAllQuizType();
                ArrayList<QuizLevel> listAllLevel1 = dao.getAllLevel();
                Quiz q = dao.getQuizById2(qid);
                request.setAttribute("q", q);
                request.setAttribute("listSubject", listSubject1);
                request.setAttribute("listAllLevel", listAllLevel1);
                request.setAttribute("listAllType", listAllType1);
                request.getRequestDispatcher("../EditQuiz.jsp").forward(request, response);
                break;
                
            case "Delete":
                dao.DeleteQuiz(qid);
                response.sendRedirect("quizlist?subject=0&type=0");
                break;
        }
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
        String action = request.getParameter("action");
        String quizName = request.getParameter("quizName");
        int quizType = Integer.parseInt(request.getParameter("quizType"));
        int level = Integer.parseInt(request.getParameter("level"));
        int subjectName = Integer.parseInt(request.getParameter("subjectName"));
        int number = Integer.parseInt(request.getParameter("number"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        
        
        QuizDAO dao = new QuizDAO();
        switch (action) {
            case "create":
                dao.insertNewQuiz(quizName, quizType, level, number, duration, subjectName);
                response.sendRedirect("quizlist?subject=0&type=0");
                break;

            case "update":
                int quizId = Integer.parseInt(request.getParameter("quizId"));
                dao.UpdateQuiz(quizName, quizType, level, number, duration, subjectName, quizId);
                response.sendRedirect("quizlist?subject=0&type=0");
                break;
        }
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
