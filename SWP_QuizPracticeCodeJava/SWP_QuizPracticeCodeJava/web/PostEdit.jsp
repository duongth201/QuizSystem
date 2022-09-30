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
        <link rel="stylesheet" href="/SWP_QuizPracticeCodeJava/css/postdetail.css">

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
                        <form action="postedit" method="post" enctype="multipart/form-data">
                            <div class="blog-wrapper blog-list blog-details blue-blog mb-50">
                                <div class="blog-thumb">
                                    <div class="pt-100 pl-30 row" id="img-section">
                                        <div >
                                            <label><strong>IMAGE</strong></label>
                                            <input type="file" name="file" accept="image/*" id="image-upload" style="margin-left: 20px;"/> <br>
                                            <img id="image" src="${pageContext.request.contextPath}/img/blog/${blog.getThumbnail()}"/>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="pl-30">Preview here</label>
                                            <div id="image-preview">
                                                <label for="image-upload" id="image-label"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <!--                                    <div class="blog-thumb row">
                                                                            <img class="pl-30 mr-3 img-fluid post-thumb d-none d-md-flex" src="img/blog/${blog.getThumbnail()}" alt="image" style="width: 386px; height: 272px;">
                                                                        </div>-->

                                    <p class="pt-25 pl-30">Status: 
                                        <label class="switch">
                                            <input type="checkbox" name="status" value="tick" ${requestScope.blog.blogStatus == true? "checked":""} style="width: 1000px !important;">
                                            <span class="slider round"></span>
                                        </label>
                                    </p>
                                    <div class="blog-text-offer text-center blog-cate" style="padding-right: 40px !important">
                                        Category
                                        <select name="LCate" id="" class="option" style="font-size: 18px;">
                                            <c:forEach var="listCate" items="${requestScope.listCate}">
                                                <option value="${listCate.blogCateId}">${listCate.cateName}</option>
                                            </c:forEach>            
                                        </select>
                                    </div>
                                    <input name="blogid" value="${requestScope.blog.getBlogId()}" type="hidden" >
                                            <!--<span class="blog-text-offer">${blog.getCateName(blog.getBlogCategoryId())}</span>-->
                                </div>
                                <div class="blog-content news-content pb-0">
                                    <div class="blog-meta news-meta d-flex">
                                        <p>Date: </p>
                                        <span style="margin-top: 6px; margin-left: 10px;">${requestScope.blog.getLastUpdated()}</span>
                                    </div>
                                    <p>Blog Title</p>
                                    <input class="input-title mb-20" type="text" name="title" value="${requestScope.blog.getBlogTitle()}" required>
                                    <!--<h5>${requestScope.blog.getBlogTitle()}</h5>-->
                                    <p>Blog Details</p>
                                    <textarea class="input-p" type="text" name="detail" rows="15" cols="122" required>${requestScope.blog.getBlogDetail()}</textarea>
                                    <!--<p>${requestScope.blog.getBlogDetail()}</p>-->
                                    <div class="blog-wrapper-footer" style="margin-top: 44px;"></div>
                                    <p>Blog Brief</p>
                                    <textarea class="input-blogdetail" type="text" name="brief" rows="5" cols="122" required>${requestScope.blog.getBriefInfo()}</textarea>
                                </div>
                                <div class="author-comments-text">
                                    <div class="author-comments-title">
                                        <b>Author</b>
                                        <select name="LUser" id="" class="option" style="font-size: 18px; width: 1000px;">
                                            <c:forEach var="listU" items="${requestScope.listUser}">
                                                <option value="${listU.userId}" ${requestScope.author.userId==listU.userId?"selected":""}>${listU.fullName}</option>
                                            </c:forEach>            
                                        </select>
                                    </div>
                                </div>
                                <input type="submit" class="btn btn-warning btn-save" value="Save">
                            </div>
                        </form>
                    </div>
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