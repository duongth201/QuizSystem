<%-- 
    Document   : QuestionList
    Created on : Jun 27, 2022, 8:23:12 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8" />
        <meta name="author" content="Themezhub" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Questions List</title>

        <!-- Custom CSS -->
        <link href="/SWP_QuizPracticeCodeJava/assets/css/styles.css" rel="stylesheet">

        <!--data table-->
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <!--<link href="css/datatable.css" rel="stylesheet" />-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

        <!--select input search -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.5.1/chosen.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.5.1/chosen.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.5.1/chosen.jquery.min.js"></script>
    </head>

    <body>

        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper">

            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->
            <!-- Start Navigation -->
            <%@include file="template/header_new.jsp" %>>
            <!-- End Navigation -->
            <div class="clearfix"></div>
            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->

            <!-- ============================ Dashboard: Dashboard Start ================================== -->
            <section class="gray pt-4">
                <div class="container-fluid">

                    <div class="row">

                        <%@include file="template/menu.jsp"%>
                        <div class="col-lg-9 col-md-9 col-sm-12">

                            <!-- Row -->
                            <div class="row justify-content-between">
                                <div class="col-lg-12 col-md-12 col-sm-12 pb-4">
                                    <div class="dashboard_wrap d-flex align-items-center justify-content-between">
                                        <div class="arion">
                                            <nav class="transparent">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                                    <li class="breadcrumb-item active" aria-current="page">Manage Questions</li>
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
                                        <form action="questionlist" method="get">
                                            <div class="row">
                                                <div class="col-xl-12 col-lg-12 col-md-12 mb-4">
                                                    <h6 class="m-0">All Questions List</h6>
                                                </div>
                                            </div>
                                            <!--                                            <div class="row justify-content-between">
                                                                                            <div class="col-xl-12 col-lg-6 col-md-6">
                                                                                                <div class="form-group smalls row align-items-center">
                                                                                                    <label class="col-xl-4 col-lg-4 col-sm-4 col-form-label">Search by content</label>
                                                                                                    <div class="col-xl-10 col-lg-10 col-sm-10">
                                                                                                        <input type="text" class="form-control" name="keyword" value="${keyword}">
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>-->

                                            <div class="row align-items-end mb-5" style="margin-bottom: 6px !important;">
                                                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                                                    <div class="form-group">
                                                        <label>Subject</label>
                                                        <div class="smalls">
                                                            <select class="form-control chosen" id="ins" name="subject">
                                                                <option value="0">All</option>
                                                                <c:forEach items="${listSubject}" var="listS">
                                                                    <option value="${listS.subjectId}" ${sub == listS.subjectId?"selected":""}>${listS.subjectName}</option>
                                                                </c:forEach>

                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                                                    <div class="form-group">
                                                        <label>Lesson</label>
                                                        <div class="smalls">
                                                            <select class="form-control chosen" id="cates" name="lesson">
                                                                <option value="0">All</option>
                                                                <c:forEach items="${listLesson}" var="listL">
                                                                    <option value="${listL.lessonId}" ${les == listL.lessonId?"selected":""}>${listL.lessonName}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-2 col-lg-4 col-md-6 col-sm-6">
                                                    <div class="form-group">
                                                        <label>Dimension</label>
                                                        <div class="smalls">
                                                            <select class="form-control chosen" id="prc"  name="dimension">
                                                                <option value="0">All</option>
                                                                <c:forEach items="${listDimension}" var="listD">
                                                                    <option value="${listD.dimensionId}" ${di == listD.dimensionId?"selected":""}>${listD.dimensionName}</option>
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
                                                                <option value="-1" ${sta == -1?"selected":""}>All</option>
                                                                <option value="1" ${sta == 1?"selected":""}>Active</option>
                                                                <option value="0" ${sta == 0?"selected":""}>Deactivate</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-2 col-lg-4 col-md-6 col-sm-6">
                                                    <div class="form-group">
                                                        <!--<button type="button" class="btn text-white full-width theme-bg">Filter</button>-->
                                                        <input type="submit" class="btn text-white full-width theme-bg" value="Filter">
                                                    </div>
                                                </div>
                                            </div>
                                        </form>

                                        <!--                                        <script type="text/javascript">
                                                                                    $(".chosen").chosen();
                                                                                </script>-->

                                        <!--add new question-->
                                        <%@include file="ImportQuestion.jsp"%>   

                                        <div class="card-body">
                                            <table id="datatablesSimple">
                                                <thead>
                                                    <tr>
                                                        <th class="text-center" scope="col">#</th>
                                                        <th class="text-center" scope="col">Question Content</th>
                                                        <th class="text-center" scope="col" style="width: 265px;">Subject</th>
                                                        <th class="text-center" scope="col" style="width: 216px;">Dimension</th>
                                                        <th class="text-center" scope="col">Lesson</th>
                                                        <th class="text-center" scope="col">Status</th>

                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:forEach items="${listQuestion}" var="list">
                                                        <tr>
                                                            <th class="text-center" scope="row">${list.questionId}</th>
                                                            <td><h6>${list.questionContent}</h6></td>
                                                            <td class="text-center"><span class="smalls">${list.subjectName}</span></td>
                                                            <td><div class=" dhs_tags">${list.dimensionName}</div></td>
                                                            <td class="text-center"><span class="smalls">${list.lessonName}</span></td>
                                                                <c:if test="${list.status == true}">
                                                                <td class="text-center"><span class="trip theme-cl theme-bg-light">Active</span></td>
                                                            </c:if>
                                                            <c:if test="${list.status == false}">
                                                                <td class="text-center"><span class="trip theme-bg-light" style="background: rgba(3, 185, 124,0.12) !important; color:#e51e0a !important;">Deactivate</span></td>
                                                            </c:if>


                                                            <td>
                                                                <div class="dropdown show">
                                                                    <a class="btn btn-action" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-h"></i>
                                                                    </a>
                                                                    <div class="drp-select dropdown-menu">
                                                                        
                                                                        <a class="dropdown-item" href="questiondetail?qid=${list.questionId}">Edit</a>
                                                                        
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>



                                    <!--pagination-->

                                    <!--End paging-->

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </section>
    <!-- ============================ Dashboard: Dashboard End ================================== -->


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

    <!--data table-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/SWP_QuizPracticeCodeJava/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
    <!-- ============================================================== -->
    <!-- This page plugins -->
    <!-- ============================================================== -->		

</body>
</html>