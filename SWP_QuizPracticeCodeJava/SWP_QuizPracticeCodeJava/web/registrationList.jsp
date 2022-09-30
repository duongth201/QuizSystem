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
        <title>Registration List</title>
        <link href="/SWP_QuizPracticeCodeJava/css/style.css" rel="stylesheet">
        <!--<link href="css/stylesData.css" rel="stylesheet" />-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Custom CSS -->
        <link href="/SWP_QuizPracticeCodeJava/assets/css/styles.css" rel="stylesheet">

    </head>
    <style>
        .table{
            display: block !important;
            overflow-x: auto !important;
            width: 100% !important;
        }
        table th{
            padding: 0px 5px;
            white-space: no-wrap;
            font-size: 11px;
        }
        section.page-title{
            background-color: white;
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
                                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                                                    <li class="breadcrumb-item active" aria-current="page">Registration List</li>
                                                </ol>
                                            </nav>
                                        </div>
                                        <div class="elkios">
                                            <a href="#" class="add_new_btn"><i class="fas fa-plus-circle mr-1"></i>Add Registration</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Row -->

                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <div class="dashboard_wrap">
                                        <div class="card shadow mb-4">
                                            <form action="registration" method="post" style="height:170px">
                                                <h6>Filter by</h6>
                                                <div class="row align-items-end mb-5">
                                                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                                                        <div class="form-group">
                                                            <label>Subject</label>
                                                            <div class="smalls">
                                                                <select class="form-control chosen" id="ins" name="subject">
                                                                    <option value="0">All</option>
                                                                    <c:forEach items="${listAllSub}" var="listS">
                                                                        <option ${listS.subjectName eq requestScope.subject ? "selected":""}>${listS.subjectName}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-2 col-lg-4 col-md-6 col-sm-6">
                                                        <div class="form-group">
                                                            <label>Status</label>
                                                            <div class="smalls">
                                                                <select class="form-control chosen" id="sts"  name="status">
                                                                    <option value="-1" ${status == -1?"selected":""}>All</option>
                                                                    <option value="1" ${status == 1?"selected":""}>Active</option>
                                                                    <option value="0" ${status == 0?"selected":""}>Deactivate</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                                                        <div class="form-group">
                                                            <label>From</label>
                                                            <div class="smalls">
                                                                <input value="${from}" type="date" class="form-control" name="from"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                                                        <div class="form-group">
                                                            <label>To</label>
                                                            <div class="smalls">
                                                                <input value="${to}" type="date" class="form-control" name="to"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--Status-->        

                                                    <!--Filter button-->
                                                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                                                        <div class="form-group">
                                                            <button class="btn theme-bg rounded full-width">Apply</button>
                                                        </div>
                                                    </div>            
                                                </div>
                                            </form>
                                        </div>
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12 mb-2">
                                                <div class="card shadow mb-4">
                                                    <div class="card-body col-xl-12 col-lg-12 col-md-12 mb-2">
                                                        <div class="table-responsive">
                                                            <table class="table-striped table" id="datatablesSimple" width="100%" cellspacing="0">
                                                                <thead>
                                                                    <tr>
                                                                        <th>#</th>
                                                                        <th>Email</th>
                                                                        <th>Registration Time</th>
                                                                        <th>Subject</th>
                                                                        <th>Package</th>
                                                                        <th>Total Cost</th>
                                                                        <th>Valid from</th>
                                                                        <th>Valid to</th>
                                                                        <th>Updated</th>
                                                                        <th>Status</th>
                                                                        <th>Action</th>

                                                                    </tr>
                                                                </thead>

                                                                <tbody>
                                                                    <c:forEach items="${listAll}" var="l">
                                                                        <tr>
                                                                            <th scope="row">${l.regId}</th>
                                                                            <td>${l.email}</td>
                                                                            <td>${l.regTime}</td>
                                                                            <td>${l.subject}</td>
                                                                            <td>${l.pack}</td>
                                                                            <td>${l.totalCost}</td>
                                                                            <td>${l.validFrom}</td>
                                                                            <td>${l.validTo}</td>
                                                                            <td>${l.lastUpdateBy}</td>
                                                                            <c:choose>
                                                                                <c:when test="${l.status == true}">
                                                                                    <td><span class="trip theme-cl theme-bg-light">Active</span></td>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <td><span class="trip theme-cl theme-bg-light">Inactive</span></td>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                            <td>
                                                                                <div class="dropdown show">
                                                                                    <a class="btn btn-action" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                        <i class="fas fa-ellipsis-h"></i>
                                                                                    </a>
                                                                                    <div class="drp-select dropdown-menu">
                                                                                        <a class="dropdown-item" href="editLesson?lid=${les.lessonId}">Edit</a>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--                                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3">
                                                                    <div class="page-sidebar p-0">
                                                                        <a class="filter_links" data-toggle="collapse" href="#fltbox" role="button" aria-expanded="false" aria-controls="fltbox">Open Advance Filter<i class="fa fa-sliders-h ml-2"></i></a>							
                                                                        <div class="collapse" id="fltbox">
                                                                             Find New Property 
                                                                            <div class="sidebar-widgets p-4">
                                
                                                                                <div class="form-group">
                                                                                    <div class="input-with-icon">
                                                                                        <input type="text" class="form-control" placeholder="Search Your Cources">
                                                                                        <i class="ti-search"></i>
                                                                                    </div>
                                                                                </div>
                                
                                                                                <div class="form-group">
                                                                                    <div class="simple-input">
                                                                                        <select id="cates" class="form-control">
                                                                                            <option value="">&nbsp;</option>
                                                                                            <option value="1">IT & Software</option>
                                                                                            <option value="2">Banking</option>
                                                                                            <option value="3">Medical</option>
                                                                                            <option value="4">Insurence</option>
                                                                                            <option value="5">Finance & Accounting</option>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>
                                
                                                                                <div class="form-group">
                                                                                    <h6>Top Instructor</h6>
                                                                                    <ul class="no-ul-list mb-3">
                                                                                        <li>
                                                                                            <input id="aa-41" class="checkbox-custom" name="aa-41" type="checkbox">
                                                                                            <label for="aa-41" class="checkbox-custom-label">Keny White<i class="count">12</i></label>
                                                                                        </li>
                                                                                        <li>
                                                                                            <input id="aa-2" class="checkbox-custom" name="aa-2" type="checkbox">
                                                                                            <label for="aa-2" class="checkbox-custom-label">Hinata Hyuga<i class="count">10</i></label>
                                                                                        </li>
                                                                                        <li>
                                                                                            <input id="aa-3" class="checkbox-custom" name="aa-3" type="checkbox">
                                                                                            <label for="aa-3" class="checkbox-custom-label">Mike hussy<i class="count">56</i></label>
                                                                                        </li>
                                                                                        <li>
                                                                                            <input id="aa-71" class="checkbox-custom" name="aa-71" type="checkbox">
                                                                                            <label for="aa-71" class="checkbox-custom-label">Adam Riky <i class="count">42</i></label>
                                                                                        </li>
                                                                                        <li>
                                                                                            <input id="aa-81" class="checkbox-custom" name="aa-81" type="checkbox">
                                                                                            <label for="aa-81" class="checkbox-custom-label">Dev Patel<i class="count">12</i></label>
                                                                                        </li>
                                                                                        <li>
                                                                                            <input id="aa-91" class="checkbox-custom" name="aa-91" type="checkbox">
                                                                                            <label for="aa-91" class="checkbox-custom-label">Mike Hussy<i class="count">36</i></label>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                
                                                                                <div class="form-group">
                                                                                    <h6>Skill Level</h6>
                                                                                    <ul class="no-ul-list mb-3">
                                                                                        <li>
                                                                                            <input id="l1" class="checkbox-custom" name="l1" type="checkbox">
                                                                                            <label for="l1" class="checkbox-custom-label">Beginning</label>
                                                                                        </li>
                                                                                        <li>
                                                                                            <input id="l2" class="checkbox-custom" name="l2" type="checkbox">
                                                                                            <label for="l2" class="checkbox-custom-label">Basic Level</label>
                                                                                        </li>
                                                                                        <li>
                                                                                            <input id="l3" class="checkbox-custom" name="l3" type="checkbox">
                                                                                            <label for="l3" class="checkbox-custom-label">Iner Level</label>
                                                                                        </li>
                                                                                        <li>
                                                                                            <input id="l4" class="checkbox-custom" name="l4" type="checkbox">
                                                                                            <label for="l4" class="checkbox-custom-label">Advance</label>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                
                                                                                <div class="form-group">
                                                                                    <h6>Price</h6>
                                                                                    <ul class="no-ul-list mb-3">
                                                                                        <li>
                                                                                            <input id="p1" class="checkbox-custom" name="p1" type="checkbox">
                                                                                            <label for="p1" class="checkbox-custom-label">All<i class="count">89</i></label>
                                                                                        </li>
                                                                                        <li>
                                                                                            <input id="p2" class="checkbox-custom" name="p2" type="checkbox">
                                                                                            <label for="p2" class="checkbox-custom-label">Free<i class="count">56</i></label>
                                                                                        </li>
                                                                                        <li>
                                                                                            <input id="p3" class="checkbox-custom" name="p3" type="checkbox">
                                                                                            <label for="p3" class="checkbox-custom-label">Paid<i class="count">42</i></label>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                
                                                                                <div class="row">
                                                                                    <div class="col-lg-12 col-md-12 col-sm-12 pt-4">
                                                                                        <button class="btn theme-bg rounded full-width">Apply Filter</button>
                                                                                    </div>
                                                                                </div>
                                
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                     Sidebar End 
                                
                                                                </div>-->
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/scripts.js"></script>

        <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet"/>

        <!-- ============================================================== -->
        <!-- This page plugins -->
        <!-- ============================================================== -->		
        <script>

//                                    window.addEventListener('DOMContentLoaded', event => {
//                                        // Simple-DataTables
//                                        // https://github.com/fiduswriter/Simple-DataTables/wiki
//
//                                        const datatablesSimple = document.getElementById('datatablesSimple');
//                                        if (datatablesSimple) {
//                                            new simpleDatatables.DataTable(datatablesSimple)
//
//                                            $('.dataTable-input').addClass('form-control'); // <-- add this line
// 
//                                        }
//                                    });


            $('#datatablesSimple').DataTable({
                "columnDefs": [
                    {"orderable": false, "targets": 10}
                ]
            }
            );
            $('.dataTables_filter label').contents().filter((_, el) => el.nodeType === 3).remove();
            $('.dataTables_filter label').css('form-control');
            $('.dataTables_filter input').addClass('form-control');
            $('.dataTables_filter input').attr("placeholder", "Search");


            window.addEventListener('DOMContentLoaded', event => {

                // Toggle the side navigation
                const sidebarToggle = document.body.querySelector('#sidebarToggle');
                if (sidebarToggle) {
                    // Uncomment Below to persist sidebar toggle between refreshes
                    // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
                    //     document.body.classList.toggle('sb-sidenav-toggled');
                    // }
                    sidebarToggle.addEventListener('click', event => {
                        event.preventDefault();
                        document.body.classList.toggle('sb-sidenav-toggled');
                        localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
                    });
                }

            });


        </script>
    </body>
</html>
