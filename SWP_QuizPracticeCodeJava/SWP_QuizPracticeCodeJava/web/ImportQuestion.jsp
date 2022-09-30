<%-- 
    Document   : ImportQuestion
    Created on : Jul 16, 2022, 2:18:50 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/ImportQuestion" method="post" enctype="multipart/form-data">
            <input type="file" name="file">
            <button type="submit" class="btn btn-success" data-dismiss="modal">Save</button>
        </form>
    </body>
</html>
