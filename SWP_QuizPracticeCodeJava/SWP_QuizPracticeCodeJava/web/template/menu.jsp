<%-- 
    Document   : AdminSidebar
    Created on : Jun 26, 2022, 11:24:42 PM
    Author     : Halinh
--%>
<div class="col-lg-3 col-md-3">
    <div class="dashboard-navbar">
        <div class="d-user-avater">
            <img src="https://via.placeholder.com/500x500" class="img-fluid avater" alt="">
            <h4>Admin</h4>
            <span>Senior Designer</span>
            <div class="elso_syu89">

            </div>
            <div class="elso_syu77">
            </div>
        </div>

        <div class="d-navigation">
            <ul id="side-menu">
                <li class="dropdown">
                    <a href="javascript:void(0);"><i class="fas fa-user"></i>Users<span class="ti-angle-left"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="${pageContext.request.contextPath}/admin/listUsers">List users</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/addUser">Add user</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="javascript:void(0);"><i class="fas fa-cog"></i>Settings<span class="ti-angle-left"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="setting">List Settings</a></li>
                        <li><a href="addSetting">Add Settings</a></li>
                    </ul>
                </li>
                <!--<li><a href="practicelist?id=${sessionScope.user.userId}&subjectID=-1"><i class="fas fa-layer-group"></i> Pratice List</a></li>-->
                <li><a href="${pageContext.request.contextPath}/sale/registration?subject=0&status=-1&from=&to="><i class="fas fa-layer-group"></i> Registration List</a></li>
                <li><a href="${pageContext.request.contextPath}/marketing/postlist"><i class="fas fa-layer-group"></i>Post List</a></li>
                <li><a href="${pageContext.request.contextPath}/marketing/sliderlist?status=2"><i class="fas fa-layer-group"></i> Slider List</a></li>
                <li><a href="${pageContext.request.contextPath}/adex/lesson?status=2"><i class="fas fa-layer-group"></i> Lesson List</a></li>
                <li><a href="${pageContext.request.contextPath}/adex/quizlist?subject=0&type=0"><i class="fas fa-layer-group"></i> Quiz List</a></li>
                <li><a href="${pageContext.request.contextPath}/adex/AdminSubjectList"><i class="fas fa-layer-group"></i> Subject List</a></li>
                <li><a href="${pageContext.request.contextPath}/adex/questionlist?subject=0&lesson=0&dimension=0&status=-1"><i class="fas fa-layer-group"></i> Question List</a></li>
                <li class="dropdown">
                    <a href="javascript:void(0);"><i class="fas fa-gem"></i>Dimension<span class="ti-angle-left"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="${pageContext.request.contextPath}/adex/subjectdimension">Dimension Manage</a></li>
                        <li><a href="${pageContext.request.contextPath}/adex/dimensionadd">Add New Dimension</a></li>
                    </ul>
                </li>
            </ul>
        </div>

    </div>
</div>