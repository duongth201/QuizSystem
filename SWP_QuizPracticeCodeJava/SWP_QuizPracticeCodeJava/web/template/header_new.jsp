<%-- 
    Document   : header_new
    Created on : Jun 18, 2022, 12:21:54 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--   <span style="    font-weight: bold;
                          color: #03b97c !important;">Quizzy</span>-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- ============================================================== -->
<!-- Top header  -->
<!-- ============================================================== -->
<!-- Start Navigation -->
<div class="header header-light head-shadow">
    <div class="container">
        <nav id="navigation" class="navigation navigation-landscape">
            <div class="nav-header">
                <a style="font-weight: bold;
                   color: #03b97c !important;" class="nav-brand" href="${pageContext.request.contextPath}/home">
                    Quizzy
                </a>
                <div class="nav-toggle"></div>
                <div class="mobile_nav">
                    <ul>
                        <li>
                            <a href="javascript:void(0);" data-toggle="modal" data-target="#login" class="crs_yuo12 w-auto text-white theme-bg">
                                <span class="embos_45"><i class="fas fa-sign-in-alt mr-1"></i>Sign In</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="nav-menus-wrapper">
                <ul class="nav-menu">

                    <li class="active"><a href="${pageContext.request.contextPath}/home">Home<span class="submenu-indicator"></span></a>
                        <!--                        <ul class="nav-dropdown nav-submenu">
                                                    <li><a href="home-6.html">Home 6</a></li>
                                                    <li><a href="home-7.html">Home 7</a></li>
                                                </ul>-->
                    </li>

                    <li><a href="${pageContext.request.contextPath}/PublicSubjectList?order=ASC&page=1&category=&search=&from=&to=">Courses<span class="submenu-indicator"></span></a>
                        <!--                        <ul class="nav-dropdown nav-submenu">
                                                    
                                                   <li><a href="explore-category.html">Explore Category</a></li>
                                                    <li><a href="find-instructor.html">Find Instructor</a></li>
                                                    <li><a href="instructor-detail.html">Instructor Detail</a></li>
                                                </ul>-->
                    </li>

                    <li><a href="${pageContext.request.contextPath}/blog">Blogs<span class="submenu-indicator"></span></a>
                        <!--                        <ul class="nav-dropdown nav-submenu">
                                                    <li><a href="forgot.html">Forgot</a></li>
                                                </ul>-->
                    </li>

                    <c:choose>
                        <c:when test="${sessionScope.user != null && sessionScope.user.getRoleId() == 1}">
                            <li class="active"><a href="${pageContext.request.contextPath}/admin/dashboard">Dash Board</a><span class="submenu-indicator"></span>
                            </li>
                        </c:when> 
                        <c:when test="${sessionScope.user != null && sessionScope.user.getRoleId() == 4}">
                            <li class="active"><a>List</a><span class="submenu-indicator"></span>
                                <ul class="nav-dropdown nav-submenu">
                                    <li><a href="${pageContext.request.contextPath}/adex/lesson?status=2">Lesson List</a></li>
                                    <li><a href="${pageContext.request.contextPath}/adex/AdminSubjectList">Subject List</a></li>
                                    <li><a href="${pageContext.request.contextPath}/adex/setting">Setting List</a></li>
                                    <li><a href="${pageContext.request.contextPath}/adex/questionlist">Question List</a></li>
                                    <li><a href="${pageContext.request.contextPath}/adex/quizlist?subject=0&type=0">Quiz List</a></li>
                                    <li><a href="${pageContext.request.contextPath}/adex/subjectdimension">Dimension List</a></li>
                                </ul>
                            </li>
                        </c:when>    
                        <c:when test="${sessionScope.user != null && sessionScope.user.getRoleId() == 2}">
                            <li class="active"><a>List</a><span class="submenu-indicator"></span>
                                <ul class="nav-dropdown nav-submenu">
                                    <li><a href="${pageContext.request.contextPath}/marketing/postlist">Post List</a></li>
                                    <li><a href="${pageContext.request.contextPath}/marketing/sliderlist?status=2">Slider List</a></li>
                                </ul>
                            </li>
                        </c:when>    
                        <c:when test="${sessionScope.user != null && sessionScope.user.getRoleId() == 3}">
                            <li class="active"><a href="${pageContext.request.contextPath}/sale/registration?subject=0&status=-1&from=&to=">Registration List</a><span class="submenu-indicator"></span>
                                
                            </li>
                        </c:when>    
                        <c:when test="${sessionScope.user != null && sessionScope.user.getRoleId() == 5}">
                            <li class="active"><a>List</a><span class="submenu-indicator"></span>
                                <ul class="nav-dropdown nav-submenu">
                                    <li><a href="practicelist?id=${sessionScope.user.userId}&subjectID=-1">Practice List</a></li>
                                </ul>
                            </li>
                            <li><a href="userregistration">My Registration</a></li>
                            </c:when>

                    </c:choose>
                </ul>

                <ul class="nav-menu nav-menu-social align-to-right">
                    <c:choose>
                        <c:when test="${sessionScope.user != null}">
                            ${sessionScope.user.fullName}
                            <%@include file="../userprofile.jsp" %>
                            <li class="add-listing theme-bg">
                                <a href="${pageContext.request.contextPath}/logout" class="text-white">Log out</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="#" class="alio_green" data-toggle="modal" data-target="#login">
                                    <i class="fas fa-sign-in-alt mr-1"></i><span class="dn-lg">Sign In</span>
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                </ul>
            </div>
        </nav>
    </div>
</div>
<!-- End Navigation -->
<div class="clearfix"></div>
<!-- ============================================================== -->
<!-- Top header  -->
<!-- ============================================================== -->
<!-- Log In Modal -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="loginmodal" aria-hidden="true">
    <div class="modal-dialog modal-xl login-pop-form" role="document">
        <div class="modal-content overli" id="loginmodal">
            <div class="modal-header">
                <h5 class="modal-title">Login Your Account</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fas fa-times-circle"></i></span>
                </button>
            </div>
            <div class="modal-body">
                <div class="login-form">
                    <form action="login" method="post">

                        <div class="form-group">
                            <label>User Name</label>
                            <div class="input-with-icon">
                                <input type="text" name="email" class="form-control" placeholder="User or email">
                                <i class="ti-user"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <div class="input-with-icon">
                                <input type="password" name="password" class="form-control" placeholder="*****">
                                <i class="ti-unlock"></i>
                            </div>
                        </div>
                        <input id="l4" class="checkbox-custom" name="remember" type="checkbox">
                        <label for="l4" class="checkbox-custom-label">Remember me</label>
                        <!--                        <div class="form-group row">
                                                    <div class="col-xl-4 col-lg-4 col-4">
                                                        <input id="admin" class="checkbox-custom" name="admin" type="checkbox">
                                                        <label for="admin" class="checkbox-custom-label">Admin</label>
                                                    </div>
                                                    <div class="col-xl-4 col-lg-4 col-4">
                                                        <input id="student" class="checkbox-custom" name="student" type="checkbox" checked>
                                                        <label for="student" class="checkbox-custom-label">Student</label>
                                                    </div>
                                                    <div class="col-xl-4 col-lg-4 col-4">
                                                        <input id="instructor" class="checkbox-custom" name="instructor" type="checkbox">
                                                        <label for="instructor" class="checkbox-custom-label">Tutors</label>
                                                    </div>
                                                </div>-->

                        <div class="form-group" style="margin-top: 30px">
                            <button type="submit" class="btn btn-md full-width theme-bg text-white">Login</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="crs_log__footer d-flex justify-content-between mt-0">
                <div class="fhg_45"><p class="musrt">Don't have account? <a href="signup.html" class="theme-cl">SignUp</a></p></div>
                <div class="fhg_45"><p class="musrt"><a href="${pageContext.request.contextPath}/forgetPassword" class="text-danger">Forgot Password?</a></p></div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->