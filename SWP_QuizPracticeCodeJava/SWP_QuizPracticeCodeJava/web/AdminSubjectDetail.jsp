<%-- 
    Document   : subjectdetails
    Created on : May 24, 2022, 2:57:31 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Quizzz</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.webmanifest">

        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link href="/SWP_QuizPracticeCodeJava/assets/css/styles.css" rel="stylesheet">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/bootstrap.min.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/owl.carousel.min.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/animate.min.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/magnific-popup.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/themify-icons.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/meanmenu.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/slick.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/default.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/style.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/responsive.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/subjectStyle.css">
    </head>

    <body>

        <header id="home">
            <%@include file="template/header_new.jsp" %>
        </header>
        <!-- header-end -->

        <div class="course-details-area gray-bg pt-100">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-12 col-md-12 col-sm-12 pb-4">
                        <div class="dashboard_wrap d-flex align-items-center justify-content-between">
                            <div class="arion">
                                <nav class="transparent">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="home">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Subject Detail</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-12 col-lg-12">

                        <div class="single-course-details-area mb-30">
                            <div class="single-course-details white-bg">
                                <div class="course-details-title mb-20">
                                    <h1>Subject Detail</h1>
                                </div>
                                <div class="course-details-tabs">
                                    <ul class="nav nav-pills" id="pills-tab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="pills-overview-tab" data-toggle="pill"
                                               href="#pills-overview" role="tab" aria-controls="pills-overview"
                                               aria-selected="true">Overview</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="pills-dimension-tab" data-toggle="pill"
                                               href="#pills-dimension" role="tab" aria-controls="pills-dimension"
                                               aria-selected="false">Dimension</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="pills-package-tab" data-toggle="pill"
                                               href="#pills-package" role="tab" aria-controls="pills-package"
                                               aria-selected="false">Price Package</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="pills-tabContent">
                                        <div class="tab-pane fade show active" id="pills-overview" role="tabpanel"
                                             aria-labelledby="pills-home-tab">
                                            <div class="container">
                                                <div id="subject_form" class="checkout__form">
                                                    <form id="sub_form" name="subject_form" action="UpdateSubjectDetail" method="post">
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-6">
                                                                <div class="checkout__input">
                                                                    <div class="row">
                                                                        <div class="col-lg-4">
                                                                            <p>SubjectID</p>
                                                                            <input type="text" id="subjectId"
                                                                                   name="subjectId" value="${subject.subjectId}"
                                                                                   readonly="readonly">
                                                                        </div>
                                                                        <div class="col-lg-8">
                                                                            <p>Subject Name</p>
                                                                            <input type="text" id="subjectName" name="subjectName"
                                                                                   value="${subject.subjectName}">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-8">
                                                                        <div class="checkout__input dropdown-menu-right">
                                                                            <div class="form-group">
                                                                                <label for="catId">Category</label>
                                                                                <select id="catId" name="catId" class="form-control">
                                                                                    <c:forEach items="${categoryList}" var="cat">
                                                                                        <option value="${cat.catId}" ${cat.catId == subject.cat.catId ? "selected":""}>${cat.catName} 
                                                                                        </option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4" style="visibility: ${sessionScope.user.roleId != 1 ? "hidden":""}">
                                                                        <div class="checkout__input dropdown-menu-right">
                                                                            <div class="form-group">
                                                                                <label for="expertId">Owner</label>
                                                                                <select id="expertId" name="expertId" class="form-control">
                                                                                    <c:forEach items="${expertList}" var="ex">
                                                                                        <option value="${ex.userId}" ${ex.userId == subject.expertId ? "selected":""}>${ex.fullName} 
                                                                                        </option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">

                                                                    <div class="col-lg-6">
                                                                        <div class="form-check">
                                                                            <input value="featured" name="featured" class="form-check-input" type="checkbox"
                                                                                   ${subject.featured == true ? "checked":""}>
                                                                            <label class="form-check-label" for="featured">
                                                                                Featured Subject
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="checkout__input dropdown-menu-right">
                                                                            <div class="flex-container form-group">
                                                                                <label for="status">Status</label>
                                                                                <select id="status" name="status" class="form-control" ${sessionScope.user.roleId != 1 ? "disabled":""}>
                                                                                    <option value="true" ${subject.status == true ? "selected":""}>Published</option>
                                                                                    <option value="false" ${subject.status == false ? "selected":""}>Unpublished
                                                                                    </option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="col-lg-4">
                                                                <div class="checkout__input">
                                                                    <img id="blah" src="${pageContext.request.contextPath}/${subject.thumbnailURL}"
                                                                         alt="your image" />
                                                                    <input id="file-upload" type='file' onchange="readURL(this);" />
                                                                    <input style="visibility: hidden; height: 0px" name="thumbnail" id="file-upload-filename">
                                                                </div>
                                                            </div>  
                                                        </div>
                                                        <div class="checkout__input">
                                                            <p>Description</p>
                                                            <textarea id="description" name="description">${subject.description}</textarea>
                                                        </div>
                                                        <div class="courses-submit-btn">
                                                            <button type="submit" class="btn submit-gray-border-btn">Submit</button>
                                                            <button class="btn submit-gray-border-btn">Back</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="pills-dimension" role="tabpanel"
                                             aria-labelledby="pills-dimension-tab">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="dimension__table">
                                                        <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/adex/dimensionadd" role="button">CREATE NEW DIMENSION</a>
                                                        <table>
                                                            <thead>
                                                                <tr>
                                                                    <th>ID</th>
                                                                    <th>Type</th>
                                                                    <th>Dimension Name</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${dimensionList}" var="d">
                                                                    <tr>
                                                                        <td class="dimension__id">${d.dimensionId}</td>
                                                                        <td class="dimension__type">
                                                                            ${d.typeName}
                                                                        </td>
                                                                        <td class="dimension__name">${d.dimensionName}</td>
                                                                        <td class="dimension__action">
                                                                            <a href="${pageContext.request.contextPath}/adex/dimensionupdate?id=${d.dimensionId}">Edit</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="pills-package" role="tabpanel"
                                             aria-labelledby="pills-package-tab">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="package__table">
                                                        <a style="visibility: ${sessionScope.user.roleId != 1 ? "hidden":""}" class="btn btn-outline-success" href="CreatePricePackage?subjectID=${subject.subjectId}"
                                                           role="button">New Price Package</a>
                                                        <table>
                                                            <thead>
                                                                <tr class="package__table">
                                                                    <th>ID</th>
                                                                    <th>Package</th>
                                                                    <th>Duration</th>
                                                                    <th>List Price</th>
                                                                    <th>Sale Price</th>
                                                                    <th>Status</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${packageList}" var="p">
                                                                    <tr>
                                                                        <td class="package__id">${p.packageId}</td>
                                                                        <td class="package__name">${p.packageName}</td>
                                                                        <td class="package__duration">
                                                                            <c:choose>
                                                                                <c:when test="${p.duration == 0}">
                                                                                    Life time
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    ${p.duration}
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </td>
                                                                        <td class="package__price">$${p.listPrice}</td>
                                                                        <td class="package__price">$${p.salePrice}</td>
                                                                        <td class="package__status">
                                                                            <c:choose>
                                                                                <c:when test="${p.status == true}">
                                                                                    Active
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    Inactive
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </td>
                                                                        <td style="visibility: ${sessionScope.user.roleId != 1 ? "hidden":""}" class="package__action">
                                                                            <a href="UpdatePricePackage?packageID=${p.packageId}&subjectID=${subject.subjectId}">Edit</a>
                                                                            <c:choose>
                                                                                <c:when test="${p.status == true}">
                                                                                    <a href="PricePackageStatus?packageId=${p.packageId}&status=true&subID=${p.subjectId}">Deactivate</a>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <a href="PricePackageStatus?packageId=${p.packageId}&status=false&subID=${p.subjectId}">Activate</a>
                                                                                </c:otherwise>
                                                                            </c:choose>
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
                        </div>
                    </div>


                </div>

            </div>
        </div>


        <footer id="Contact">
            <div class="footer-area primary-bg pt-150">
                <div class="container">
                    <div class="footer-top pb-35">
                        <div class="row">
                            <div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="footer-widget mb-30">
                                    <div class="footer-logo">
                                        <img src="img/logo/logo_2.png" alt="">
                                    </div>
                                    <div class="footer-para">
                                        <p>Sorem ipsum dolor sit amet conse ctetur adipiscing elit, sed do eiusmod incididunt ut labore et dolore magna aliqua. Utenim ad minim veniam, quis nostrud exercition ullamco laboris nisi </p>
                                    </div>
                                    <div class="footer-socila-icon">
                                        <span>Follow Us</span>
                                        <div class="footer-social-icon-list">
                                            <ul>
                                                <li><a href="#"><span class="ti-facebook"></span></a></li>
                                                <li><a href="#"><span class="ti-twitter-alt"></span></a></li>
                                                <li><a href="#"><span class="ti-dribbble"></span></a></li>
                                                <li><a href="#"><span class="ti-google"></span></a></li>
                                                <li><a href="#"><span class="ti-pinterest"></span></a></li>
                                                <li><a href="#"><span class="ti-instagram"></span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="footer-widget mb-30">
                                    <div class="footer-heading">
                                        <h1>Quick Links</h1>
                                    </div>
                                    <div class="footer-menu clearfix">
                                        <ul>
                                            <li><a href="#">Privacy Policy</a></li>
                                            <li><a href="#">Condition</a></li>
                                            <li><a href="#">Support</a></li>
                                            <li><a href="#">Consultation</a></li>
                                            <li><a href="#">Team Member</a></li>
                                            <li><a href="#">Our Services</a></li>
                                            <li><a href="#">About Us</a></li>
                                            <li><a href="#">Contact Us</a></li>
                                            <li><a href="#">Who we are</a></li>
                                            <li><a href="#">Get a Quote</a></li>
                                            <li><a href="#">Recent Post</a></li>
                                            <li><a href="#">Who we are</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </footer>
        <!-- footer end -->


        <!-- JS here -->
        <script src="/SWP_QuizPracticeCodeJava/js/vendor/modernizr-3.5.0.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/popper.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/bootstrap.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/owl.carousel.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/isotope.pkgd.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/one-page-nav-min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/slick.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/ajax-form.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/wow.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/jquery.scrollUp.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/imagesloaded.pkgd.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/jquery.counterup.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/jquery.barfiller.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/jquery.meanmenu.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/waypoints.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/jquery.magnific-popup.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/plugins.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/main.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/jquery.autocomplete.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/subjectDetail.js"></script>
        <script>
                                                                                $(document).ready(function () {

                                                                                    $(function () {
                                                                                        $("#sub_form").submit(function (event) {
                                                                                            event.preventDefault();
                                                                                            $.ajax({
                                                                                                method: 'POST',
                                                                                                url: 'UpdateSubjectDetail',
                                                                                                data: $('#sub_form').serialize(),
                                                                                                success: function (data) {
                                                                                                    alert("Update Successfully");
                                                                                                },
                                                                                                error: function (xhr, desc, err) {
                                                                                                    console.log(err);
                                                                                                }
                                                                                            });
                                                                                        });
                                                                                    });
                                                                                });
        </script>

    </body>

</html>

