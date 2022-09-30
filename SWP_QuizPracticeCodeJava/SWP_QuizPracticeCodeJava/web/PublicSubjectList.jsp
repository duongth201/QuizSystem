<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8" />
        <meta name="author" content="Themezhub" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SkillUp - Online Learning Platform</title>

        <!-- Custom CSS -->
        <link href="assets/css/styles.css" rel="stylesheet">

    </head>
    <style>
        ol.breadcrumb {
            background-color: #f0f8ff !important;
        }
    </style>
    <body>

        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper">

            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->
            <!-- Start Navigation -->
            <%@include file="template/header_new.jsp" %>
            <!-- End Navigation -->
            <div class="clearfix"></div>
            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->

            <!-- ============================ Page Title Start================================== -->
            <section class="page-title">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">

                            <div class="breadcrumbs-wrap">
                                <h1 class="breadcrumb-title">Course list</h1>
                                <nav aria-label="breadcrumb" >
                                    <ol class="breadcrumb p-0 bg-white" >
                                        <li class="breadcrumb-item"><a href="home">Home</a></li>
                                        <li class="breadcrumb-item active theme-cl" aria-current="page">Course list</li>
                                    </ol>
                                </nav>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
            <!-- ============================ Page Title End ================================== -->

            <!-- ============================ All Cources ================================== -->
            <section class="gray">
                <div class="container">
                    <div class="row">
                        <!-- Content -->
                        <div class="col-xl-8 col-lg-8 col-md-12 col-sm-12">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="short_wraping">
                                        <div class="row m-0 align-items-center justify-content-between">

                                            <div class="col-lg-4 col-md-5 col-sm-12  col-sm-6">
                                                <div class="shorting_pagination_laft">
                                                    <h6 class="m-0">Course List</h6>
                                                </div>
                                            </div>

                                            
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row justify-content-center">
                                <!-- Single Grid -->
                                <c:forEach items="${listSubject}" var="subject">
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                        <div class="crs_grid shadow_none brd">
                                            <div class="crs_grid_thumb">
                                                <a href="subjectdetail?sid=${subject.subjectId}" class="crs_detail_link">
                                                    <img src="${subject.thumbnailURL}" class="img-fluid rounded" alt="" />
                                                </a>
                                                <div class="crs_video_ico">
                                                    <i class="fa fa-play"></i>
                                                </div>
                                                <div class="crs_locked_ico">
                                                    <i class="fa fa-lock"></i>
                                                </div>
                                            </div>
                                            <div class="crs_grid_caption">
                                                <div class="crs_tutor_thumb overl_top"><a href="instructor-detail.html"><img src="https://via.placeholder.com/500x500" class="img-fluid circle" alt="" /></a></div>
                                                <div class="crs_cates cl_1" style="float:left; margin-right: 80px"><span>${subject.cat.catName} - 3 months</span></div>
                                                <c:choose>
                                                    <c:when test="${subject.pricePack.salePrice != 0}">
                                                        <div class="crs_price"><h2><span class="currency">$</span><span class="theme-cl"><s>${subject.pricePack.listPrice}</s></span></h2></div>
                                                                </c:when>
                                                                <c:otherwise>
                                                        <div class="crs_price"><h2><span class="currency" >Unsale</span><span class="theme-cl"></span></h2></div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                <div class="crs_title"><h4><a href="subjectdetail?sid=${subject.subjectId}" class="crs_title_link">${subject.subjectName}</a></h4></div>
                                                <div class="crs_info_detail">
                                                    ${subject.description}
                                                </div>
                                            </div>
                                            <div class="crs_grid_foot">
                                                <div class="crs_flex">
                                                    <c:choose>
                                                        <c:when test="${subject.pricePack.salePrice != 0}">
                                                            <div class="crs_fl_first">
                                                                <div class="crs_price"><h2><span class="currency">$</span><span class="theme-cl">${subject.pricePack.salePrice}</span></h2></div>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="crs_fl_first">
                                                                <div class="crs_price"><h2><span class="currency">$</span><span class="theme-cl">${subject.pricePack.listPrice}</span></h2></div>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <div class="crs_fl_last">
                                                        <div class="crs_linkview"><a href="subjectdetail?sid=${subject.subjectId}" class="btn btn_view_detail theme-bg text-light">View Course</a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                                <!-- Single Grid -->


                                <!-- Single Grid -->


                                <!-- Single Grid -->


                                <!-- Single Grid -->


                                <!-- Single Grid -->


                            </div>

                            <!-- Pagination -->
                            <div class="row align-items-center justify-content-center" style="margin-left: 33px;">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <nav class="course-pagination mb-30" aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center">
                                            <c:choose>
                                                <c:when test="${listSubject == null || listSubject.size()==0}">
                                                    <h4>No subject found</h4>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${page>1}">
                                                            <li class="page-item">
                                                                <a class="page-link" href="PublicSubjectList?order=${order}&page=${page-1}&category=&search=${search}&from=${from}&to=${to}"><span class="ti-angle-left"></span></a>
                                                            </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li class="page-item disabled">
                                                                <a class="page-link" href="#"><span class="ti-angle-left"></span></a>
                                                            </li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <c:forEach begin="1" end="${totalPage}" var="i">
                                                        <li class="page-item ${i == page?"active" : ""}">
                                                            <a class="page-link" href="PublicSubjectList?order=${order}&page=${i}&category=&search=${search}&from=${from}&to=${to}"> ${i}</a>
                                                        </li>
                                                    </c:forEach>
                                                    <c:choose>
                                                        <c:when test="${page>=totalPage}">
                                                            <li class="page-item disabled">
                                                                <a class="page-link" href="#" ><span class="ti-angle-right"></span></a>
                                                            </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li class="page-item">
                                                                <a class="page-link" href="PublicSubjectList?order=${order}&page=${page+1}&category=&search=${search}&from=${from}&to=${to}"><span class="ti-angle-right"></span></a>
                                                            </li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12">
                            <%@include file="template/SubjectSideBar.jsp" %>
                        </div>

                    </div>
                </div>
            </section>
            <!-- ============================ All Cources ================================== -->

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
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/slick.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/daterangepicker.js"></script> 
        <script src="assets/js/summernote.min.js"></script>
        <script src="assets/js/metisMenu.min.js"></script>	
        <script src="assets/js/custom.js"></script>
        <!-- ============================================================== -->
        <!-- This page plugins -->
        <!-- ============================================================== -->		

    </body>
</html>