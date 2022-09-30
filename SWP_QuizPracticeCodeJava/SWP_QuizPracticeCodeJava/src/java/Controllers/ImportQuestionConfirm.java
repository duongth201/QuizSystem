/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.QuestionDAO;
import Models.Answer;
import Models.Question;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Admin
 */
public class ImportQuestionConfirm extends HttpServlet {

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
            out.println("<title>Servlet ImportQuestion</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImportQuestion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public void Import(String filename) {
        try {
            QuestionDAO qd = new QuestionDAO();

            File file = new File(filename);   //creating a new file instance  
            FileInputStream fis = new FileInputStream(file);   //obtaining bytes from the file  
//creating Workbook instance that refers to .xlsx file  
            XSSFWorkbook wb = new XSSFWorkbook(fis);
            XSSFSheet sheet = wb.getSheetAt(0);     //creating a Sheet object to retrieve object  
            Iterator<Row> itr = sheet.iterator();    //iterating over excel file  
//            ArrayList<Row> a = sheet.getRow(0);
            while (itr.hasNext()) {
                Question q = new Question();
                String questionContent = "";
                ArrayList<Answer> answers = new ArrayList<Answer>();
                Row row = itr.next();
                Iterator<Cell> cellIterator = row.cellIterator();   //iterating over each column        
                while (cellIterator.hasNext()) {
                    Cell cell = cellIterator.next();
                    if (cell.getRowIndex() == 0) {
                        continue;
                    }
                    int columnIndex = cell.getColumnIndex();
                    if (columnIndex == 0) {
                        questionContent = cell.getStringCellValue().toString();

                    } else if (columnIndex == 1) {
                        q.setSubjectId((int) cell.getNumericCellValue());
                    } else if (columnIndex > 1) {
                        Answer a = new Answer();

                        if (cell.getStringCellValue().startsWith("#")) {
                            a.setAnswerContent(cell.getStringCellValue().toString().substring(1));
                            a.setIsCorrect(true);
                        } else {
                            a.setAnswerContent(cell.getStringCellValue());
                            a.setIsCorrect(false);
                        }
                        answers.add(a);
                    } else {

                    }

                }
//                System.out.println(questionContent);
//                for (String answer : answers) {
//                    System.out.println(answer);
//                }
//                System.out.println("");
                if (!questionContent.isEmpty()) {
                    q.setQuestionContent(questionContent);
                    q.setAnswer(answers);
                    q.setStatus(true);
                    qd.insertImportedQuestion(q);
                    System.out.println(questionContent);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
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
        String path = request.getParameter("path");
        Import(path);
        response.sendRedirect("adex/questionlist?subject=0&lesson=0&dimension=0&status=-1");
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
