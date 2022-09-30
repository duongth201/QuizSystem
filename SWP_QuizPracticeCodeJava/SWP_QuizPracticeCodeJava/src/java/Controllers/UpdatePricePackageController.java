/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.PricePackageDAO;
import Models.PricePackage;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LinhVT
 */
public class UpdatePricePackageController extends HttpServlet {

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
            out.println("<title>Servlet UpdatePricePackageController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdatePricePackageController at " + request.getContextPath() + "</h1>");
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
        int subjectId = Integer.parseInt(request.getParameter("subjectID"));
        int packageId = Integer.parseInt(request.getParameter("packageID"));
        PricePackageDAO pDAO = new PricePackageDAO();
        PricePackage pricePackage = pDAO.getPricePackageByID(packageId);
        request.setAttribute("pricePackage", pricePackage);
        request.setAttribute("subjectId", subjectId);
        request.getRequestDispatcher("../PricePackageEdit.jsp").forward(request, response);
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
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));
        int packageId = Integer.parseInt(request.getParameter("packageId"));
        String packageName = request.getParameter("packageName");
        int duration = Integer.parseInt(request.getParameter("duration"));
        boolean status = false;
        if (request.getParameterValues("status") != null) {
            status = Boolean.parseBoolean(request.getParameter("status"));
        } else {
            PricePackageDAO db = new PricePackageDAO();
            PricePackage pricePackage = db.getPricePackageByID(subjectId);
            status = pricePackage.isStatus();
        }
        double listPrice = Double.parseDouble(request.getParameter("listPrice"));
        double salePrice = Double.parseDouble(request.getParameter("salePrice"));
        
        PricePackageDAO pDAO = new PricePackageDAO();
        pDAO.updatePricePackage(packageName, listPrice, salePrice, status, subjectId, duration, packageId);
        response.sendRedirect("UpdateSubjectDetail?subjectID="+subjectId);
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
