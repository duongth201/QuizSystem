/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.CategoryDAO;
import DAL.SubjectDAO;
import Models.Category;
import Models.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LinhVT
 */
public class PublicSubjectListController extends HttpServlet {

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
        String order = request.getParameter("order");

        String[] category = request.getParameterValues("category");

        String search = request.getParameter("search");
        String from = request.getParameter("from");
        String to = request.getParameter("to");

        final int PAGE_SIZE = 4;

        SubjectDAO subjectDAO = new SubjectDAO();
        int page = 1;
        List<Category> listCategory = new CategoryDAO().getAllCategory();
        List<Subject> listFeature = subjectDAO.getFeaturedSubjectWithAuthor();

        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }
        int totalSubject = subjectDAO.getTotalSubject();
        int totalPage = totalSubject / PAGE_SIZE;
        if (totalSubject % PAGE_SIZE != 0) {
            totalPage += 1;
        }

        List<Subject> listAllSubject = subjectDAO.getAllSubjectsWithPrice();
        List<Subject> listSubject = new ArrayList<>();

        listSubject = subjectDAO.FilterSubject(category, search, from, to, order, page, PAGE_SIZE);

        ArrayList<Subject> featuredSubjectList = subjectDAO.getFeaturedSubject();

        request.setAttribute("category", category);
        request.setAttribute("search", search);
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("cate", category);
        request.setAttribute("features", featuredSubjectList);
        request.setAttribute("listAllSubject", listAllSubject);
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listSubject", listSubject);
        request.setAttribute("listFeature", listFeature);
        request.setAttribute("order", order);
        request.getRequestDispatcher("PublicSubjectList.jsp").forward(request, response);
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
