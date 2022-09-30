<%-- 
    Document   : lessonList
    Created on : Jun 23, 2022, 5:59:27 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8" />
        <meta name="author" content="Themezhub" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add new Quiz</title>

        <!-- Custom CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.4/dist/sweetalert2.min.css">
        <link href="/SWP_QuizPracticeCodeJava/assets/css/styles.css" rel="stylesheet">

    </head>

    <body>

        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper">

            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->
            <%@include file="template/header_new.jsp" %>
            <div class="clearfix"></div>
            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->

            <!-- ============================ Dashboard: Dashboard Start ================================== -->
            <section class="gray pt-4">
                <div class="container-fluid">

                    <div class="row">

                        <%@include file="template/menu.jsp" %>

                        <div class="col-lg-9 col-md-9 col-sm-12">

                            <!-- Row -->
                            <div class="row justify-content-between">
                                <div class="col-lg-12 col-md-12 col-sm-12 pb-4">
                                    <div class="dashboard_wrap d-flex align-items-center justify-content-between">
                                        <div class="arion">
                                            <nav class="transparent">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                                    <li class="breadcrumb-item active" aria-current="page">Add New Quiz</li>
                                                </ol>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Row -->

                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <div class="dashboard_wrap">

                                        <div class="form_blocs_wrap">
                                            <form id="formSubmit" action="quizdetail?action=update" method="post">
                                                <div class="row justify-content-between">
                                                    <div class="col-xl-9 col-lg-8 col-md-7 col-sm-12">

                                                        <div class="tab-content" id="v-pills-tabContent">
                                                            <!-- Basic -->
                                                            <div class="tab-pane fade show active" id="v-pills-basic" role="tabpanel" aria-labelledby="v-pills-basic-tab">

                                                                <div class="form-group smalls">
                                                                    <label>Quiz ID</label>
                                                                    <input type="text" readonly="readonly" class="form-control" name="quizId" value="${q.quizId}">
                                                                </div>

                                                                <div class="form-group smalls">
                                                                    <label>Quiz Name</label>
                                                                    <input id="qname" type="text" class="form-control" name="quizName" value="${q.quizName}"
                                                                           placeholder="Enter quiz name">
                                                                </div>

                                                                <div class="form-group smalls">
                                                                    <label>Quiz Type</label>
                                                                    <div class="simple-input">
                                                                        <select id="cates" class="form-control" name="quizType">
                                                                            <option value="">&nbsp;</option>
                                                                            <c:forEach items="${listAllType}" var="t">
                                                                                <option value="${t.quizTypeId}" ${q.type.quizTypeId == t.quizTypeId ? "selected" : ""}>${t.quizTypeName}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group smalls">
                                                                    <label>Level</label>
                                                                    <div class="simple-input">
                                                                        <select id="ins" class="form-control" name="level">
                                                                            <option value="">&nbsp;</option>
                                                                            <c:forEach items="${listAllLevel}" var="l">
                                                                                <option value="${l.levelId}" ${q.level.levelId == l.levelId ? "selected" : ""}>${l.levelName}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group smalls">
                                                                    <label>Subject Name</label>
                                                                    <div class="simple-input">
                                                                        <select id="yn" class="form-control" name="subjectName">
                                                                            <option value="">&nbsp;</option>
                                                                            <c:forEach items="${listSubject}" var="ls">
                                                                                <option value="${ls.subjectId}" ${q.subjectId.subjectId == ls.subjectId ? "selected" : ""}>${ls.subjectName}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group smalls">
                                                                    <label>Number of question</label>
                                                                    <input type="number" class="form-control" name="number" value="${q.numberOfQuestion}"
                                                                           placeholder="Enter number of question">
                                                                </div>

                                                                <div class="form-group smalls">
                                                                    <label>Duration</label>
                                                                    <input type="number" class="form-control" name="duration" value="${q.duration}"
                                                                           placeholder="Enter duration">
                                                                </div>
                                                                <div class="form-group smalls">
                                                                    <label>Pass rate</label>
                                                                    <input type="number" class="form-control" readonly="readonly" name="passrate" value="${q.passRate}"
                                                                           placeholder="Enter duration">
                                                                </div>
                                                                <div class="form-group smalls">
                                                                    <button type="submit" class="btn full-width theme-bg text-white" id="sweet2">Submit</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-start">
                                        <ul class="alios_slide_nav">
                                            <li><a href="quizlist?subject=0&type=0" class="btn btn_slide"><i class="fas fa-arrow-left"></i></a>        Back to list</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
            <!-- ============================ Dashboard: Dashboard End ================================== -->

            <!-- ============================ Call To Action ================================== -->
            <section class="theme-bg call_action_wrap-wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">

                            <div class="call_action_wrap">
                                <div class="call_action_wrap-head">
                                    <h3>Do You Have Questions ?</h3>
                                    <span>We'll help you to grow your career and growth.</span>
                                </div>
                                <a href="#" class="btn btn-call_action_wrap">Contact Us Today</a>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
            <!-- ============================ Call To Action End ================================== -->

            <!-- ============================ Footer Start ================================== -->
            <footer class="dark-footer skin-dark-footer style-2">
                <div class="footer-middle">
                    <div class="container">
                        <div class="row">

                            <div class="col-lg-5 col-md-5">
                                <div class="footer_widget">
                                    <img src="assets/img/logo-light.png" class="img-footer small mb-2" alt="" />
                                    <h4 class="extream mb-3">Do you need help with<br>anything?</h4>
                                    <p>Receive updates, hot deals, tutorials, discounts sent straignt in your inbox every month</p>
                                    <div class="foot-news-last">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Email Address">
                                            <div class="input-group-append">
                                                <button type="button" class="input-group-text theme-bg b-0 text-light">Subscribe</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6 col-md-7 ml-auto">
                                <div class="row">

                                    <div class="col-lg-4 col-md-4">
                                        <div class="footer_widget">
                                            <h4 class="widget_title">Layouts</h4>
                                            <ul class="footer-menu">
                                                <li><a href="#">Home Page</a></li>
                                                <li><a href="#">About Page</a></li>
                                                <li><a href="#">Service Page</a></li>
                                                <li><a href="#">Property Page</a></li>
                                                <li><a href="#">Contact Page</a></li>
                                                <li><a href="#">Single Blog</a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4">
                                        <div class="footer_widget">
                                            <h4 class="widget_title">All Sections</h4>
                                            <ul class="footer-menu">
                                                <li><a href="#">Headers<span class="new">New</span></a></li>
                                                <li><a href="#">Features</a></li>
                                                <li><a href="#">Attractive<span class="new">New</span></a></li>
                                                <li><a href="#">Testimonials</a></li>
                                                <li><a href="#">Videos</a></li>
                                                <li><a href="#">Footers</a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4">
                                        <div class="footer_widget">
                                            <h4 class="widget_title">Company</h4>
                                            <ul class="footer-menu">
                                                <li><a href="#">About</a></li>
                                                <li><a href="#">Blog</a></li>
                                                <li><a href="#">Pricing</a></li>
                                                <li><a href="#">Affiliate</a></li>
                                                <li><a href="#">Login</a></li>
                                                <li><a href="#">Changelog<span class="update">Update</span></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="footer-bottom">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-12 col-md-12 text-center">
                                <p class="mb-0">© 2021 SkillUp. Designd By <a href="https://themezhub.com">ThemezHub</a>.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- ============================ Footer End ================================== -->

            <a id="back2Top" class="top-scroll" title="Back to top" href="#"><i class="ti-arrow-up"></i></a>


        </div>
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->

        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.4/dist/sweetalert2.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/jquery.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/popper.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/bootstrap.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/select2.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/slick.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/moment.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/daterangepicker.js"></script> 
        <script src="/SWP_QuizPracticeCodeJava/assets/js/summernote.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/metisMenu.min.js"></script>	
        <script src="/SWP_QuizPracticeCodeJava/assets/js/custom.js"></script>

        <script>
            document.getElementById("sweet2").addEventListener('click', (event) => {
                event.preventDefault();
                var name = document.getElementById("qname").value;
                if (name === "") {
                    Swal.fire({
                        title: "Empty fields",
                        text: "Please check the missing field",
                        icon: "warning",
                        button: "Ok",
                    });
                } else {
                    Swal.fire({
                        icon: 'success',
                        title: 'Create Successfully',
//                            footer: '<a href="">Why do I have this issue?</a>'
                    }).then(function () {
                        document.getElementById("formSubmit").submit();
                    });
                }

            });
        </script>
        <!-- ============================================================== -->
        <!-- This page plugins -->
        <!-- ============================================================== -->		

    </body>
</html>
