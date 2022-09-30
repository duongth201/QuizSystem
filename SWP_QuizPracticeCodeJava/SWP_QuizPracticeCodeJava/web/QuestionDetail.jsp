<%-- 
    Document   : QuestionDetail
    Created on : Jul 7, 2022, 12:15:21 PM
    Author     : Halinh
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8" />
        <meta name="author" content="Themezhub" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Question details</title>
        <!-- Custom CSS -->
        <link href="/SWP_QuizPracticeCodeJava/assets/css/styles.css" rel="stylesheet">
    </head>

    <style type="text/css">
        select{
            margin-left: 17px;
            border-radius: 4px;
            border-color: #03b97c;
            border-width: 2px;
        }
        #image-preview, #image {
            width: 340px;
            height: 260px;
            position: relative;
            overflow: hidden;
            background-color: #ffffff;
            color: #ecf0f1;
            input {
                line-height: 200px;
                font-size: 200px;
                position: absolute;
                opacity: 0;
                z-index: 10;
            }
        }
    </style>
    <body>
        <div id="main-wrapper">
            <!-- Start Navigation -->
            <%@include file="template/header_new.jsp" %>
            <!-- End Navigation -->
            <div class="clearfix"></div>
            <!-- ============================ Dashboard: Dashboard Start ================================== -->
            <section class="gray pt-4">
                <div class="container-fluid">
                    <div class="row">
                        <!--admin navbar-->
                        <%@include file="template/menu.jsp"%>
                        <div class="col-lg-9 col-md-9 col-sm-12">

                            <!-- Row -->
                            <div class="row justify-content-between">
                                <div class="col-lg-12 col-md-12 col-sm-12 pb-4">
                                    <div class="dashboard_wrap d-flex align-items-center justify-content-between">
                                        <div class="arion">
                                            <nav class="transparent">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item" aria-current="page">Edit setting</li>
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
                                        <form action="questiondetail" method="post" enctype="multipart/form-data">
                                            <div class="row justify-content-between">
                                                <div class="col-xl-9 col-lg-8 col-md-7 col-sm-12">
                                                    <div class="tab-content" id="v-pills-tabContent">
                                                        <div class="form-group smalls">
                                                            <label><strong>QUESTION ID</strong></label>
                                                            <input type="text" class="form-control" name="questid" value="${question.questionId}" readonly>
                                                        </div>
                                                        <div class="form-group smalls">
                                                            <label><strong>QUESTION SUBJECT</strong></label>
                                                            <select name="qsubject" class="form-control">
                                                                <c:forEach items="${listSub}" var="sub">
                                                                    <option value="${sub.subjectId}"  ${qsub==sub.subjectId ? "selected":""}>${sub.subjectName}</option>
                                                                </c:forEach>  
                                                            </select>
                                                        </div>
                                                        <div class="form-group smalls">
                                                            <label><strong>DIMENSION</strong></label>
                                                            <select name="qdimension" class="form-control">
                                                                <c:forEach items="${listDimen}" var="dimen">
                                                                    <option value="${dimen.dimensionId}" ${qdimen==dimen.dimensionId ? "selected":""}>${dimen.dimensionName}</option>
                                                                </c:forEach>  
                                                            </select>
                                                        </div>
                                                        <div class="form-group smalls">
                                                            <label><strong>LESSON</strong></label>
                                                            <select name="qlesson" class="form-control">
                                                                <c:forEach items="${listLesson}" var="lesson">
                                                                    <option value="${lesson.lessonId}" ${qlesson==lesson.lessonId ? "selected":""}>${lesson.getLessonName()}</option>
                                                                </c:forEach>  
                                                            </select>
                                                        </div>

                                                        <div class="form-group smalls">
                                                            <label><strong>CONTENT</strong></label>
                                                            <input name="qcontent" type="text" class="form-control" value="${question.questionContent}" required>
                                                        </div>
                                                        <div class="form-group smalls">
                                                            <label><strong>EXPLANATION</strong></label>
                                                            <input name="qexplain" type="text" class="form-control" value="${question.explanation}" required>
                                                        </div>
                                                        <div class="form-group smalls">
                                                            <label><strong>QUESTION STATUS</strong></label>
                                                            <select name="qstatus" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                                                <option value="1" ${status==1 ? "selected":""}>Active</option>
                                                                <option value="0" ${status==0 ? "selected":""}>Deactive</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group smalls">
                                                            <label><strong>IMAGE</strong></label> <br>
                                                            <img id="image" src="${pageContext.request.contextPath}/upload/${question.image}"/> <br> <br>
                                                            <input type="file" name="file" accept="image/*" id="image-upload" />
                                                            <br>
                                                            <label>Preview here</label>
                                                            <div id="image-preview">
                                                                <label for="image-upload" id="image-label"></label>
                                                            </div>
                                                        </div>
                                                        <div class="form-group smalls">
                                                            <label><strong>AUDIO</strong></label> <br>
                                                            <audio controls>
                                                                <source src="${pageContext.request.contextPath}/upload/${question.audio}">
                                                            </audio>
                                                            <br>
                                                            <input type="file" name="file2" id="audio-upload" accept="audio/*"/><br>
                                                            Preview here<br>
                                                            <div id="audio-preview"></div>
                                                        </div>

                                                        <div class="form-group smalls">
                                                            <label><strong>VIDEO</strong></label>
                                                            <input type='file' id='videoUpload' name="file3"/>
                                                            <video width="320" height="240" controls>
                                                                <source src="${pageContext.request.contextPath}/upload/${question.video}">
                                                            </video>
                                                        </div>
                                                        <br>
                                                        <div class="form-group smalls">
                                                            <label><strong>QUESTION ANSWERS</strong></label>
                                                            <button class="btn text-white theme-bg" onclick="location.href = 'answerDetail?questid=${question.questionId}'" type="button">Go</button>
                                                        </div>

                                                        <div class="justify-content-between">
                                                            <input type="submit" class="btn text-white full-width theme-bg" value="Save changes">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </section>
            <!-- ============================ Dashboard: Dashboard End ================================== -->

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

        <!-- ============================================================== -->
        <!-- This page plugins -->
        <!--<script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>-->
        <script type="text/javascript" src="/SWP_QuizPracticeCodeJava/assets/js/jquery.uploadPreview.min.js"></script>
        <!-- ============================================================== -->		

    </body>
</html>

<script type="text/javascript">
                                                                $(document).ready(function () {
                                                                    $.uploadPreview({
                                                                        input_field: "#image-upload",
                                                                        preview_box: "#image-preview",
                                                                        label_field: "#image-label"
                                                                    });
                                                                });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $.uploadPreview({
            input_field: "#audio-upload",
            preview_box: "#audio-preview",
            no_label: true
        });
    });
</script>
<script>
    document.getElementById("videoUpload")
            .onchange = function (event) {
                let file = event.target.files[0];
                let blobURL = URL.createObjectURL(file);
                document.querySelector("video").src = blobURL;
            }
</script>



