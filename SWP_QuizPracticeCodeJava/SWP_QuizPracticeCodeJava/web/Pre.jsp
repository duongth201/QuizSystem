<%-- 
    Document   : PreivewQuestionImport
    Created on : Jul 18, 2022, 10:28:28 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach items="${ques}" var="q">
            ${q.questionContent} <br>
        </c:forEach>


        <table border="1" id="datatablesSimple">
            <thead>
                <tr>
                    <th>Question Content</th>
                    <th>Answer</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${ques}" var="q">
                    <tr>
                        <td>${q.questionContent}</td>
                        <td>
                            <c:forEach items="${q.answer}" var="a">
                                <p   <c:choose>
                                        <c:when test="${a.isCorrect}">
                                            style="color: green; font-weight: bold"
                                        </c:when>
                                        <c:otherwise>
                                            style="color: red; font-weight: bold"
                                        </c:otherwise>
                                    </c:choose>>${a.answerContent}<p>
                                </c:forEach>
                        </td>
                    </tr>
                </c:forEach>


            </tbody>
        </table>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/slick.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/daterangepicker.js"></script> 
        <script src="assets/js/summernote.min.js"></script>
        <script src="assets/js/metisMenu.min.js"></script>	
        <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet"/>


        <script>
            $('#datatablesSimple').DataTable({
                "columnDefs": [
                    {"orderable": false, "targets": 3}
                ]
            }
            );
            $('.dataTables_filter label').contents().filter((_, el) => el.nodeType === 3).remove();
            $('.dataTables_filter label').css('form-control');
            $('.dataTables_filter input').addClass('form-control');
            $('label select').addClass('form-control');
            $('.dataTables_filter input').attr("placeholder", "Search");
        </script>

    </body>
</html>
