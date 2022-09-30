<%-- 
    Document   : Sidebar
    Created on : Jun 17, 2022, 9:35:32 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="page-sidebar p-0">
    <a class="filter_links" data-toggle="collapse" href="#fltbox" role="button" aria-expanded="false" aria-controls="fltbox">Open Advance Filter<i class="fa fa-sliders-h ml-2"></i></a>							
    <div class="collapse" id="fltbox">
        <!-- Find New Property -->
        <form action="PublicSubjectList?order=${order}&page=1" method="POST">
            <div class="sidebar-widgets p-4">

                <div class="form-group">
                    <div class="input-with-icon">
                        <input type="text" name="search" class="form-control" placeholder="Search Your Cources">
                        <i class="ti-search"></i>
                    </div>
                </div>
                <div class="form-group">
                    <h6>Category</h6>
                    <ul class="no-ul-list mb-3">
                        <c:forEach items="${listCategory}" var="c">
                            <li>
                                <input name="category" type="checkbox" value="${c.catId}"> ${c.catName}
                                <!--<label for="aa-41" class="checkbox-custom-label">${c.catName}</label>-->
                            </li>
                        </c:forEach>

                    </ul>
                </div>
                <div class="form-group">
                    <div>
                        <label>
                            Subject Date From:
                        </label>
                        <input class="form-control" type="date" name="from">
                    </div>

                    <div>
                        <label>
                            Subject Date To:
                        </label>
                        <input class="form-control" type="date" name="to">
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 pt-4">
                        <button class="btn theme-bg rounded full-width">Apply Filter</button>
                    </div>
                </div>

            </div>
        </form>
        <div class="sidebar-widgets p-4">
            <div class="form-group">
                <h6>Featured subject</h6>
                <ul class="no-ul-list mb-3">
                    <c:forEach items="${features}" var="f">
                        <li>
                            <label for="l4" class="checkbox-custom-label">${f.subjectName}</label>
                        </li>
                    </c:forEach>

                </ul>
            </div>
        </div>
    </div>
</div>
