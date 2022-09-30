<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8" />
        <meta name="author" content="Themezhub" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SkillUp - Online Learning Platform</title>

        <!-- Custom CSS -->
        <link href="/SWP_QuizPracticeCodeJava/assets/css/styles.css" rel="stylesheet">

    </head>

    <body>

        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper">
            <%@include file="template/header_new.jsp" %>
            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->
            <!-- Start Navigation -->
            <!--			<div class="header header-light head-shadow">
                                            <div class="container">
                                                    <nav id="navigation" class="navigation navigation-landscape">
                                                            <div class="nav-header">
                                                                    <a class="nav-brand" href="#">
                                                                            <img src="assets/img/logo.png" class="logo" alt="" />
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
                                                                    
                                                                            <li class="active"><a href="#">Home<span class="submenu-indicator"></span></a>
                                                                                    <ul class="nav-dropdown nav-submenu">
                                                                                            <li><a href="index.html">Home 1</a></li>
                                                                                            <li><a href="home-2.html">Home 2</a></li>
                                                                                            <li><a href="home-3.html">Home 3</a></li>
                                                                                            <li><a href="home-4.html">Home 4</a></li>
                                                                                            <li><a href="home-5.html">Home 5</a></li>
                                                                                            <li><a href="home-6.html">Home 6</a></li>
                                                                                            <li><a href="home-7.html">Home 7</a></li>
                                                                                    </ul>
                                                                            </li>
                                                                            
                                                                            <li><a href="#">Courses<span class="submenu-indicator"></span></a>
                                                                                    <ul class="nav-dropdown nav-submenu">
                                                                                            <li><a href="#">Search Courses in Grid<span class="submenu-indicator"></span></a>
                                                                                                    <ul class="nav-dropdown nav-submenu">
                                                                                                            <li><a href="grid-layout-with-sidebar.html">Grid Layout Style 1</a></li>
                                                                                                            <li><a href="grid-layout-with-sidebar-2.html">Grid Layout Style 2</a></li>
                                                                                                            <li><a href="grid-layout-with-sidebar-3.html">Grid Layout Style 3</a></li>
                                                                                                            <li><a href="grid-layout-with-sidebar-4.html">Grid Layout Style 4</a></li>
                                                                                                            <li><a href="grid-layout-with-sidebar-5.html">Grid Layout Style 5</a></li>
                                                                                                            <li><a href="grid-layout-full.html">Grid Full Width</a></li>
                                                                                                            <li><a href="grid-layout-full-2.html">Grid Full Width 2</a></li>
                                                                                                            <li><a href="grid-layout-full-3.html">Grid Full Width 3</a></li>
                                                                                                    </ul>
                                                                                            </li>
                                                                                            <li><a href="#">Search Courses in List<span class="submenu-indicator"></span></a>
                                                                                                    <ul class="nav-dropdown nav-submenu">
                                                                                                            <li><a href="list-layout-with-sidebar.html">List Layout Style 1</a></li>
                                                                                                            <li><a href="list-layout-with-full.html">List Full Width</a></li>
                                                                                                    </ul>
                                                                                            </li>
                                                                                            <li><a href="#">Courses Detail<span class="submenu-indicator"></span></a>
                                                                                                    <ul class="nav-dropdown nav-submenu">
                                                                                                            <li><a href="course-detail.html">Course Detail 01</a></li>
                                                                                                            <li><a href="course-detail-2.html">Course Detail 02</a></li>
                                                                                                            <li><a href="course-detail-3.html">Course Detail 03</a></li>
                                                                                                            <li><a href="course-detail-4.html">Course Detail 04</a></li>
                                                                                                    </ul>
                                                                                            </li>
                                                                                            
                                                                                            <li><a href="explore-category.html">Explore Category</a></li>
                                                                                            <li><a href="find-instructor.html">Find Instructor</a></li>
                                                                                            <li><a href="instructor-detail.html">Instructor Detail</a></li>
                                                                                    </ul>
                                                                            </li>
                                                                            
                                                                            <li><a href="#">Pages<span class="submenu-indicator"></span></a>
                                                                                    <ul class="nav-dropdown nav-submenu">
                                                                                            <li><a href="#">Shop Pages<span class="submenu-indicator"></span></a>
                                                                                                    <ul class="nav-dropdown nav-submenu">
                                                                                                            <li><a href="shop-with-sidebar.html">Shop Sidebar Left</a></li>
                                                                                                            <li><a href="shop-with-right-sidebar.html">Shop Sidebar Right</a></li>
                                                                                                            <li><a href="list-shop-with-sidebar.html">Shop List Style</a></li>
                                                                                                            <li><a href="wishlist.html">Wishlist</a></li>
                                                                                                            <li><a href="checkout.html">Checkout</a></li>
                                                                                                            <li><a href="product-detail.html">Product Detail</a></li>
                                                                                                    </ul>
                                                                                            </li>
                                                                                            <li><a href="about.html">About Us</a></li>
                                                                                            <li><a href="contact.html">Say Hello</a></li>
                                                                                            <li><a href="blogs.html">Blog Style</a></li>
                                                                                            <li><a href="pricing.html">Pricing</a></li>
                                                                                            <li><a href="404.html">404 Page</a></li>
                                                                                            <li><a href="component.html">Elements</a></li>
                                                                                            <li><a href="faq.html">FAQs</a></li>
                                                                                            <li><a href="login.html">Login</a></li>
                                                                                            <li><a href="signup.html">Signup</a></li>
                                                                                            <li><a href="forgot.html">Forgot</a></li>
                                                                                    </ul>
                                                                            </li>
                                                                            
                                                                            <li><a href="dashboard.html">Dashboard</a></li>
                                                                            
                                                                    </ul>
                                                                    
                                                                    <ul class="nav-menu nav-menu-social align-to-right">
                                                                            
                                                                            <li>
                                                                                    <a href="#" class="alio_green" data-toggle="modal" data-target="#login">
                                                                                            <i class="fas fa-sign-in-alt mr-1"></i><span class="dn-lg">Sign In</span>
                                                                                    </a>
                                                                            </li>
                                                                            <li class="add-listing theme-bg">
                                                                                    <a href="signup.html" class="text-white">Get Started</a>
                                                                            </li>
                                                                    </ul>
                                                            </div>
                                                    </nav>
                                            </div>
                                    </div-->
            <!-- End Navigation -->
            <div class="clearfix"></div>

            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->

            <!-- ============================ Page Title Start================================== -->
            <!--			<section class="page-title">
                                            <div class="container">
                                                    <div class="row">
                                                            <div class="col-lg-12 col-md-12">
                                                                    
                                                                    <div class="breadcrumbs-wrap">
                                                                            <h1 class="breadcrumb-title">Courses with Full Width</h1>
                                                                            <nav aria-label="breadcrumb">
                                                                                    <ol class="breadcrumb p-0 bg-white">
                                                                                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                                                                                            <li class="breadcrumb-item active theme-cl" aria-current="page">Find Courses</li>
                                                                                    </ol>
                                                                            </nav>
                                                                    </div>
                                                                    
                                                            </div>
                                                    </div>
                                            </div>
                                    </section>-->
            <!-- ============================ Page Title End ================================== -->

            <!-- ============================ Course Detail ================================== -->
            <section class="gray">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="short_wraping">
                                <div class="row m-0 align-items-center justify-content-between">
                                    <div style="padding-left: 20px" class="breadcrumbs-wrap">
                                        <h1 class="breadcrumb-title">Post List</h1>
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb p-0 bg-white">
                                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                                <li class="breadcrumb-item active theme-cl" aria-current="page">Post List</li>
                                            </ol>
                                        </nav>
                                    </div>
                                    <div class="elkios mr-4" >
                                        <a href="CreateSubject" class="add_new_btn"><i class="fas fa-plus-circle mr-1"></i>Add New Post</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row justify-content-center">
                        <c:forEach items="${listBlog}" var="blog">
                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
                                <div class="crs_grid_list">

                                    <div class="crs_grid_list_thumb">
                                        <a href="course-detail.html"><img src="/SWP_QuizPracticeCodeJava/img/blog/${blog.thumbnail}" class="img-fluid rounded" alt=""></a>
                                    </div>

                                    <div class="crs_grid_list_caption">
                                        <div class="crs_lt_101">
                                            <span class="est st_1">${blog.getCateName(blog.getBlogCategoryId())}</span>
                                        </div>
                                        <div class="crs_lt_102">
                                            <h4 class="crs_tit"><a href="postdetail?blogid=${blog.getBlogId()}">${blog.getBlogTitle()}</a></h4>
                                            <span class="crs_auth">${blog.getBriefInfo()}</span>
                                        </div>
                                        <div class="crs_lt_103">
                                            <div class="crs_info_detail">
                                                <ul>
                                                    <li><i class="fa fa-bookmark"></i><span>${blog.getLastUpdated()}</span></li>
                                                            <c:if test="${blog.blogStatus==true}">
                                                                <li><i class="fa fa-circle text-success"></i><span>Status: On</span></li>
                                                            </c:if>
                                                            <c:if test="${blog.blogStatus==false}">
                                                                <li><i class="fa fa-circle text-danger"></i><span>Status: Off</span></li>
                                                            </c:if>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="crs_flex" style="margin-top: 15px">
                                            <!--                                            <div class="crs_fl_first">
                                                                                            <div class="crs_price"><h2><span class="currency">$</span><span class="theme-cl">77.99</span></h2></div>
                                                                                        </div>-->
                                            <div class="crs_fl_last" style="margin-right: 10px">
                                                <div class="crs_linkview"><a href="${pageContext.request.contextPath}/marketing/postdetail?blogid=${blog.getBlogId()}" class="btn btn_view_detail theme-bg text-light">View</a></div>
                                            </div>
                                            <div class="crs_fl_last">
                                                <div class="crs_linkview"><a href="${pageContext.request.contextPath}/marketing/postedit?blogid=${blog.getBlogId()}" class="btn btn_view_detail theme-bg text-light">Edit</a></div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </c:forEach>





                    </div>

                    <!-- Pagination -->
                    <div class="row align-items-center justify-content-center" style="margin-left: 33px;">
                        <div class="col-xl-12 col-lg-12 col-md-12">
                            <nav class="course-pagination mb-30" aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <c:choose>
                                        <c:when test="${listBlog == null || listBlog.size()==0}">
                                            <h4>No subject found</h4>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${pageIndex>1}">
                                                    <li class="page-item">
                                                        <a class="page-link" href="postlist?page=${pageIndex-1}&keyword=${keyword}"><span class="ti-angle-left"></span></a>
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
                                                    <a class="page-link" href="postlist?page=${i}&keyword=${keyword}"> ${i}</a>
                                                </li>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${pageIndex>=totalPage}">
                                                    <li class="page-item disabled">
                                                        <a class="page-link" href="#" ><span class="ti-angle-right"></span></a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item">
                                                        <a class="page-link" href="postlist?page=${pageIndex+1}&keyword=${keyword}"><span class="ti-angle-right"></span></a>
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
            </section>
            <!-- ============================ Course Detail ================================== -->

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
                                <p class="mb-0">� 2021 SkillUp. Designd By <a href="https://themezhub.com">ThemezHub</a>.</p>
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
        <!-- ============================================================== -->		

    </body>
</html>