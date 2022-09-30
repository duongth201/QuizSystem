/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.DashBoardDAO;
import DAL.SubjectDAO;
import Models.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "DashBoardController", urlPatterns = {"/admin/dashboard"})
public class DashBoardController extends HttpServlet {

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
        SubjectDAO sdao = new SubjectDAO();
        DashBoardDAO dashDAO = new DashBoardDAO();
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String start = null, end;
        if(from == null){
            start = (LocalDate.now().minusDays(7)).toString();//yyyy-mm-dd -> mm/dd/yyyy    
                                                              //0123456789
            from = start.substring(5, 7) + "/" + start.substring(8, 10) + "/" + start.substring(0, 4);
        }
        if(to == null){
            end = LocalDate.now().toString();
            to = end.substring(5, 7) + "/" + end.substring(8, 10) + "/" + end.substring(0, 4);
        }
        else {
            start = from.substring(6, 10) + "-" + from.substring(0, 2) + "-" + from.substring(3, 5);
            end = to.substring(6, 10) + "-" + to.substring(0, 2) + "-" + to.substring(3, 5);
        }
        
        String toDe = end;
        String nformat;
        ArrayList<String> time = new ArrayList<>();
        ArrayList<Integer> orde = new ArrayList<>();
        ArrayList<Integer> orderStatus = new ArrayList<>();
        while (toDe.compareTo(start) != 0) {
            nformat = toDe.substring(8, 10) + "/" + toDe.substring(5, 7) + "/"  + toDe.substring(0, 4);
            time.add(nformat);
            orde.add(dashDAO.getTrendOrderRegistration(toDe));
            orderStatus.add(dashDAO.getTrendOrderRegistrationStatus(toDe));

            LocalDate toDate = LocalDate.parse(toDe);
            toDe = (toDate.minusDays(1)).toString();
        }
        
        Date F = Date.valueOf(start);
        Date T = Date.valueOf(end);
        int countTrue = dashDAO.getCountRegistration(1, F, T);
        int countFalse = dashDAO.getCountRegistration(0, F, T);
        int countTF = countTrue + countFalse;
        
        ArrayList<String> listSubject = dashDAO.getSubjectName();
        ArrayList<Subject> idsubject = sdao.getSubjectNameAndSubjectID();
        ArrayList<Integer> countS = new ArrayList<>();
        ArrayList<Integer> countBuy = new ArrayList<>();
        for (Subject s : idsubject) {
            int countSub = dashDAO.getCountRegistrationUserCustomer(F, T, s.getSubjectId());
            int countbuy = dashDAO.getCountRegistrationUserCustomerAndStatus(F, T, s.getSubjectId());
            countS.add(countSub);
            countBuy.add(countbuy);
        }
        
        int countSubject = dashDAO.countSubject(F, T);
        int countUser = dashDAO.countUser(F, T);
        int countRevenues = dashDAO.countCostRegistration(F, T);
        
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("countTrue", countTrue);
        request.setAttribute("countFalse", countFalse);
        request.setAttribute("countTF", countTF);
        request.setAttribute("listSubject", listSubject);
        request.setAttribute("idsubject", idsubject);//subjectName chart
        request.setAttribute("countS", countS);
        request.setAttribute("countBuy", countBuy);
        request.setAttribute("countSubject", countSubject);
        request.setAttribute("countUser", countUser);
        request.setAttribute("countRevenues", countRevenues);
        request.setAttribute("time", time);
        request.setAttribute("orde", orde);
        request.setAttribute("orderStatus", orderStatus);

        request.getRequestDispatcher("../DashBoard.jsp").forward(request, response);
        
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
