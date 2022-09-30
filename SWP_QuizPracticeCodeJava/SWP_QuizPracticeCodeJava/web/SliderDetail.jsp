<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="js sizes customelements history pointerevents postmessage webgl websockets cssanimations csscolumns csscolumns-width csscolumns-span csscolumns-fill csscolumns-gap csscolumns-rule csscolumns-rulecolor csscolumns-rulestyle csscolumns-rulewidth csscolumns-breakbefore csscolumns-breakafter csscolumns-breakinside flexbox picture srcset webworkers" lang="zxx"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>${requestScope.blog.getBlogTitle()}</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="https://themepure.net/template/sikkha-prv/sikkha/site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="https://themepure.net/template/sikkha-prv/sikkha/img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.4/dist/sweetalert2.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/bootstrap.min.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/owl.carousel.min.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/animate.min.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/magnific-popup.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/themify-icons.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/slick.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/meanmenu.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/default.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/style.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/responsive.css">
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/sliderdetail.css">
        <link href="/SWP_QuizPracticeCodeJava/assets/css/styles.css" rel="stylesheet">
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
    </head>

    <body>

        <%@include file="template/header_new.jsp"%>
        <!-- slider-start -->
        <!-- slider-end -->
        <div class="course-details-area gray-bg pt-100 pb-70">
            <div class="container">
                <div class="row">
                    <div class="col-xl-11 col-lg-11">
                        <form action="sliderdetail" method="post" enctype="multipart/form-data">
                            <div class="blog-wrapper blog-list blog-details blue-blog mb-50">
                                <div class="blog-thumb">
                                    <!--                                <div class="pt-30 pl-30" id="img-section">
                                                                        <b>Photo</b>
                                                                        <p>Accepted file type .png. Less than 1MB</p>
                                                                                                            <button class="btn button border"><b>Upload</b></button>
                                                                        <label for="upload">Upload Photo</label>
                                                                        <input class="form-control upload_img" type="file" name="file" id="upload" style="width: 1000px !important;"/><br/>
                                                                    </div>-->
                                    <div class="pt-100 pl-30 row" id="img-section">
                                        <div >
                                            <label><strong>IMAGE</strong></label>
                                            <input type="file" name="file" accept="image/*" id="image-upload" style="margin-left: 20px;"/> <br>
                                            <img id="image" src="${pageContext.request.contextPath}/img/slider/${s.image}"/>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="pl-30">Preview here</label>
                                            <div id="image-preview">
                                                <label for="image-upload" id="image-label"></label>
                                            </div>
                                        </div>
                                    </div>

                                    <p class="pt-25 pl-30">Status: 
                                        <label class="switch">
                                            <input type="checkbox" name="status" value="checked" ${s.status == true? "checked":""}>
                                            <span class="slider round"></span>
                                        </label>
                                    </p>
                                    <input style="width: 80px;height: 30px; font-size: 20px" class="blog-text-offer text-center" name="id" value="${s.sliderId}" readonly="">
                                </div>
                                <div class="blog-content news-content pb-0">
                                    <b>Slider title</b>
                                    <input class="input-title" type="text" name="title" value="${s.sliderTitle}" style="width: 1000px !important;" required="">
<!--                                    <div class="input-p" style="background-image: url(img/slider/${s.image});">
                                    </div>-->
                                    <div class="blog-wrapper-footer" style="margin-top: 44px;"></div>

                                </div>
                                <div class="author-comments-text mb-10">
                                    <div class="author-comments-title">
                                        <b>Backlink</b>
                                        <select name="backlink" id="" class="option" style="font-size: 18px; width: 1000px;">
                                            <c:forEach var="listSubjetcName" items="${requestScope.listSubjetcName}">
                                                <option value="${listSubjetcName.subjectId}" ${requestScope.s.backlink==listSubjetcName.subjectId?"selected":""}>${listSubjetcName.subjectId} - ${listSubjetcName.subjectName}</option>
                                            </c:forEach>            
                                        </select>
                                        <!--<input class="input-author" type="text" name="backlink" value="${s.backlink} - ${s.subjectName}">-->
                                    </div>
                                </div>
                                <div class="author-comments-text">
                                    <div class="author-comments-title">
                                        <b>Notes</b>
                                        <textarea class="input-author" type="text" name="note" rows="3" col="10" value="${s.note}">${s.note}</textarea>
                                    </div>
                                </div>
                            </div>
                            <input type="submit" class="btn btn-warning btn-save">
                        </form>
                    </div>
                    <!--                    <div class="col-xl-4 col-lg-4">
                                            <div class="courses-details-sidebar-area">
                                                <div class="widget mb-40 white-bg">
                                                    <div class="sidebar-form">
                                                        <form action="https://themepure.net/template/sikkha-prv/sikkha/news_details.html#">
                                                            <input placeholder="Search blog" type="text">
                                                            <button type="submit">
                                                                <i class="ti-search"></i>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="widget mb-40 widget-padding white-bg" style="padding-bottom: 10px">
                                                    <div data-toggle="collapse" data-target="#category" ><h4 class="widget-title">Category</h4></div>
                                                    <div class="widget-link collapse" id="category">
                                                        <ul class="sidebar-link">
                    <c:forEach items="${requestScope.cate}" var="cate">
                        <li>
                            <a href="postCate?cateid=${cate.getBlogCateId()}">${cate.getCateName()}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="widget mb-40 widget-padding white-bg">
            <h4 class="widget-title">Recent Blog</h4>
            <div class="sidebar-rc-post">
                <ul>
                    <c:forEach items="${requestScope.listBlog}" var="blogList">
                        <li>
                            <div class="sidebar-rc-post-main-area d-flex mb-20">
                                <div class="rc-post-thumb">
                                    <a href="https://themepure.net/template/sikkha-prv/sikkha/course_details.html">
                                        <img src="./BlogDetail_files/rcourses_thumb01.png" alt="">
                                    </a>
                                </div>
                                <div class="rc-post-content">
                                    <h4>
                                        <a href="blogDetail?blogid=${blogList.getBlogId()}">
                        ${blogList.getBlogTitle()}
                    </a>
                </h4>
                <div class="widget-advisors-name">
                    <span>Author : <span class="f-500">${blogList.getAuthorName()}</span></span>
                </div>
            </div>
        </div>
    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>-->
                </div>
            </div>
        </div>
        <!-- end news-details-->

        <!-- footer start -->
        <%@include file="template/footer_new.jsp"%>
        <!-- footer end -->


        <!-- JS here -->
        <script src="/SWP_QuizPracticeCodeJava/js/modernizr-3.5.0.min.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/jquery-1.12.4.min.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/popper.min.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/bootstrap.min.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/owl.carousel.min.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/isotope.pkgd.min.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/one-page-nav-min.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/slick.min.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/ajax-form.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/wow.min.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/jquery.scrollUp.min.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/imagesloaded.pkgd.min.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/jquery.counterup.min.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/jquery.barfiller.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/jquery.meanmenu.min.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/waypoints.min.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/jquery.magnific-popup.min.js.download"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/plugins.js.download"></script>
        <!--<script src="js/main.js.download"></script><a id="scrollUp" href="https://themepure.net/template/sikkha-prv/sikkha/standard_blog.html#top" style="position: fixed; z-index: 2147483647; display: block;"><span class="ti-arrow-up"></span></a>-->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.4/dist/sweetalert2.min.js"></script>
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
        <script src="/SWP_QuizPracticeCodeJava/js/jquery.meanmenu.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/jquery.scrollUp.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/jquery.barfiller.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/imagesloaded.pkgd.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/jquery.counterup.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/waypoints.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/jquery.magnific-popup.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/plugins.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/js/main.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/jquery.uploadPreview.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $.uploadPreview({
                    input_field: "#image-upload",
                    preview_box: "#image-preview",
                    label_field: "#image-label"
                });
            });
        </script>

    </body></html>