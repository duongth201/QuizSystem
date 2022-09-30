<%-- 
    Document   : DashBoard
    Created on : Jul 8, 2022, 9:56:11 PM
    Author     : ADMIN
--%>

<%@page import="Models.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div id="main-wrapper">
            <!-- Start Navigation -->
            <%@include file="template/header_new.jsp" %>
            <!-- End Navigation -->
            <div class="clearfix"></div>
            <!-- ============================ Dashboard: Dashboard Start ================================== -->
            <section class="gray pt-4">
                <div class="container-fluid">

                    <div class="row">
                        <%@include file="template/menu.jsp" %>
                        <div class="col-lg-9 col-md-9 col-sm-12">

                            <!-- Row -->
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 pb-4">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <!-- Row -->
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 pb-4">
                                    <form action="dashboard" method="GET">
                                        <div class="des-date breadcrumb">
                                            Date From:<input class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm ml-2" 
                                                             type="text" name="from" id="txtFrom" value="${from}">
                                            Date To:<input class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm ml-2"
                                                           type="text" name="to" id="txtTo" value="${to}">
                                            <input class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm ml-2" style="background-color: #005cbf; color: white;" type="submit" value="Filter" />
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="row">

                                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12">
                                    <div class="dashboard_stats_wrap">
                                        <div class="rounded-circle p-4 p-sm-4 d-inline-flex align-items-center justify-content-center theme-bg mb-2"><div class="position-absolute text-white h5 mb-0"><i class="fas fa-book"></i></div></div>
                                        <div class="dashboard_stats_wrap_content"><h4>${countSubject}</h4> <span>Number of Subjects </span></div>
                                    </div>	
                                </div>

                                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12">
                                    <div class="dashboard_stats_wrap">
                                        <div class="rounded-circle p-4 p-sm-4 d-inline-flex align-items-center justify-content-center bg-primary mb-2"><div class="position-absolute text-white h5 mb-0"><i class="fas fa-address-card"></i></div></div>
                                        <div class="dashboard_stats_wrap_content"><h4>${countTrue}</h4> <span>Number of Registration success</span></div>
                                    </div>	
                                </div>

                                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12">
                                    <div class="dashboard_stats_wrap">
                                        <div class="rounded-circle p-4 p-sm-4 d-inline-flex align-items-center justify-content-center bg-warning mb-2"><div class="position-absolute text-white h5 mb-0"><i class="fas fa-users"></i></div></div>
                                        <div class="dashboard_stats_wrap_content"><h4>${countUser}</h4> <span>Number of Account customer</span></div>
                                    </div>	
                                </div>

                                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12">
                                    <div class="dashboard_stats_wrap">
                                        <div class="rounded-circle p-4 p-sm-4 d-inline-flex align-items-center justify-content-center bg-purple mb-2"><div class="position-absolute text-white h5 mb-0"><i class="fas fa-gem"></i></div></div>
                                        <div class="dashboard_stats_wrap_content"><h4>${countRevenues}$</h4> <span>Total Revenues</span></div>
                                    </div>	
                                </div>

                            </div>
                            <!-- /Row -->

                            <!-- /Row -->

                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <div class="dashboard_stats_wrap">
                                        <div class="wc-title">
                                            <h4> The Trend Of Courses </h4>
                                        </div>
                                        <div class="widget-inner">
                                            <canvas id="linechart" width="100" height="45"></canvas>
                                        </div>
                                    </div>
                                </div>


                            </div>



                            <!-- Row -->
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="dashboard_stats_wrap">
                                        <div class="wc-title">
                                            <h4>Customers </h4>
                                        </div>
                                        <div class="widget-inner">
                                            <canvas id="myBarChart" width="100" height="45"></canvas>
                                        </div>
                                    </div>

                                </div>

                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="dashboard_stats_wrap">
                                        <div class="wc-title">
                                            <h4>Registrations </h4>
                                        </div>
                                        <div class="widget-inner">
                                            <canvas class="chart" id="myPieChart" width="100" height="45"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Row -->

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
                                <form>

                                    <div class="form-group">
                                        <label>User Name</label>
                                        <div class="input-with-icon">
                                            <input type="text" class="form-control" placeholder="User or email">
                                            <i class="ti-user"></i>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Password</label>
                                        <div class="input-with-icon">
                                            <input type="password" class="form-control" placeholder="*******">
                                            <i class="ti-unlock"></i>
                                        </div>
                                    </div>

                                    <div class="form-group row">
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
                                    </div>

                                    <div class="form-group">
                                        <button type="submit" class="btn btn-md full-width theme-bg text-white">Login</button>
                                    </div>

                                    <div class="rcs_log_125 pt-2 pb-3">
                                        <span>Or Login with Social Info</span>
                                    </div>
                                    <div class="rcs_log_126 full">
                                        <ul class="social_log_45 row">
                                            <li class="col-xl-4 col-lg-4 col-md-4 col-4"><a href="javascript:void(0);" class="sl_btn"><i class="ti-facebook text-info"></i>Facebook</a></li>
                                            <li class="col-xl-4 col-lg-4 col-md-4 col-4"><a href="javascript:void(0);" class="sl_btn"><i class="ti-google text-danger"></i>Google</a></li>
                                            <li class="col-xl-4 col-lg-4 col-md-4 col-4"><a href="javascript:void(0);" class="sl_btn"><i class="ti-twitter theme-cl"></i>Twitter</a></li>
                                        </ul>
                                    </div>

                                </form>
                            </div>
                        </div>
                        <div class="crs_log__footer d-flex justify-content-between mt-0">
                            <div class="fhg_45"><p class="musrt">Don't have account? <a href="signup.html" class="theme-cl">SignUp</a></p></div>
                            <div class="fhg_45"><p class="musrt"><a href="forgot.html" class="text-danger">Forgot Password?</a></p></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Modal -->

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

        <!-- Morris.js charts -->
        <script src="/SWP_QuizPracticeCodeJava/assets/js/raphael.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/morris.min.js"></script>

        <!-- Custom Morrisjs JavaScript -->
        <!--<script src="/SWP_QuizPracticeCodeJava/assets/js/morris.js"></script>-->
        <!-- ============================================================== -->
        <!-- This page plugins -->
        <!-- ============================================================== -->	
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
        type="text/javascript"></script>
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
              rel="Stylesheet"type="text/css"/>

        <script>
            $(document).ready(function () {
                $("#txtFrom").datepicker({
                    numberOfMonths: 1,
                    onSelect: function (selected) {
                        var dt = new Date(selected);
                        dt.setDate(dt.getDate() + 1);
                        $("#txtTo").datepicker("option", "minDate", dt);
                    }
                });
                $("#txtTo").datepicker({
                    numberOfMonths: 1,
                    onSelect: function (selected) {
                        var dt = new Date(selected);
                        dt.setDate(dt.getDate() - 1);
                        $("#txtFrom").datepicker("option", "maxDate", dt);
                    }
                });

                $('#txtFrom').on("click", function () {
                    alert($(this).getDate());
                });
            });


        </script>

        <!--load data line chart-->
        <!--trend-->
        <script>
            var data = [];
            var trend = [];
            var time = [];
            <% ArrayList<Subject> timelist = (ArrayList<Subject>) request.getAttribute("time"); %>
            <% for (int idx = timelist.size() - 1; idx >= 0; idx--) {
                    String ele = "'" + timelist.get(idx) + "'";
            %>
            time.push(String(<%=ele%>));
            <%   }
            %>

            var countUser = [];
            <% ArrayList<Integer> U = (ArrayList<Integer>) request.getAttribute("orde"); %>
            <% for (int idx = U.size() - 1; idx >= 0; idx--) {
                    int el = U.get(idx);
            %>
            countUser.push((<%=el%>));
            <%   }
            %>

            var countUserStatus = [];
            <% ArrayList<Integer> US = (ArrayList<Integer>) request.getAttribute("orderStatus"); %>
            <% for (int idx = US.size() - 1; idx >= 0; idx--) {
                    int s = US.get(idx);
            %>
            countUserStatus.push((<%=s%>));
            <%   }
            %>
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';
            // Line Chart
            var jsl = document.getElementById('linechart');
            var lineChart = new Chart(jsl, {
                type: 'line',
                data: {
                    labels: time,
                    datasets: [{
                            data: countUser,
                            label: "All order",
                            borderColor: "#3e95cd",
                            fill: false
                        },
                        {
                            data: countUserStatus,
                            label: "Order success ",
                            borderColor: "#cd853f",
                            fill: false
                        }
                    ]
                }
            });
        </script>
        <!--revenues-->
        <script>
            var data = [];
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';
            // Line Chart
            var jsn = document.getElementById('revenuesChart');
            var lineChart = new Chart(jsn, {
                type: 'line',
                data: {
                    labels: time,
                    datasets: [{
                            data: [20, 42, 5, 45, 10, 50],
                            label: "Revenues",
                            borderColor: "#8e5ea2",
                            fill: false
                        }
                    ]
                }
            });
        </script>

        <!--load data pie, column chart-->
        <script>
            var data = [];
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';
            // Pie Chart
            var ctx = document.getElementById("myPieChart");
            var myPieChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: ["Success", "Cancelled"],
                    datasets: [{
                            data: [${requestScope.countTrue}, ${requestScope.countFalse}],
                            backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745']
                        }]
                }
            });
            //Column Chart;
            var c = [];
            var times = [];
            <% ArrayList<Subject> idSub = (ArrayList<Subject>) request.getAttribute("idsubject"); %>
            <% for (int idx = idSub.size() - 1; idx >= 0; idx--) {
                    int elem = idSub.get(idx).getSubjectId();
                    String ele = "'" + idSub.get(idx).getSubjectName() + "'";
            %>

            c.push((<%=elem%>));
            times.push(String(<%=ele%>));
            <%   }
            %>

            var countS = [];
            <% ArrayList<Integer> CS = (ArrayList<Integer>) request.getAttribute("countS"); %>
            <% for (int idx = CS.size() - 1; idx >= 0; idx--) {
                    int el = CS.get(idx);
            %>
            countS.push((<%=el%>));
            <%   }
            %>
            var countBuy = [];
            <% ArrayList<Integer> CB = (ArrayList<Integer>) request.getAttribute("countBuy"); %>
            <% for (int idx = CB.size() - 1; idx >= 0; idx--) {
                    int el = CB.get(idx);
            %>
            countBuy.push((<%=el%>));
            <%   }
            %>
            var cty = document.getElementById("myBarChart");
            var myLineChart = new Chart(document.getElementById("myBarChart"), {
                type: 'bar',
                data: {
                    labels: times,
                    datasets: [
                        {
                            label: "Registered",
                            backgroundColor: "#3e95cd",
                            data: countS
                        }, {
                            label: "Bought",
                            backgroundColor: "#8e5ea2",
                            data: countBuy
                        }
                    ]
                },
                options: {
                    title: {
                        display: true,
                        text: 'Registration '
                    }
                }
            });

        </script>


    </body>
</html>
