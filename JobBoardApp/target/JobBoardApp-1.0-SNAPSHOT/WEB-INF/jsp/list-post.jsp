<%-- 
    Document   : list-post
    Created on : Apr 28, 2021, 12:31:48 AM
    Author     : Dy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<link href="<c:url value="/resources/css/employee-update-info.css"/>" rel="stylesheet"/>

<div class="container-infomation" style="padding-top: 70px;">
    <div class="site-main-content">
        <div class="row content-info" style="margin-left: 0;margin-right: 0;">
            <div class="col-xs-12 col-md-2">
                <div class="sitebar-left">
                    <div class="widget-infomation">
                        <div class="navbar-collapse no-padding">
                            <ul class="menu_short_profile">
                                <li class="aligned-left">
                                    <a href="<spring:url value="/employer-info/${pageContext.request.userPrincipal.name}"/>">
                                        <i class="fa fa-user"></i>
                                        Profile
                                    </a>
                                </li>
                                <li class="aligned-left">
                                    <c:choose>
                                        <c:when test="${not empty employers}">
                                            <c:forEach items="${employers}" var="e">
                                                <a href="<spring:url value="/EmployerUpdateInfo/${e[0]}" />">
                                                    <i class="fas fa-edit"></i>
                                                    Cập nhật thông tin
                                                </a>
                                            </c:forEach>
                                        </c:when>                                        
                                        <c:when test="${empty employers}">
                                            <a href="<spring:url value="/add-info-employer/${pageContext.request.userPrincipal.name}" />">
                                                <i class="fas fa-edit"></i>
                                                Cập nhật thông tin
                                            </a>
                                        </c:when>
                                    </c:choose>
                                </li>
                                <li class="active aligned-left">
                                    <a href="<spring:url value="/ListPost/${pageContext.request.userPrincipal.name}"/>">
                                        <i class="fas fa-file-alt"></i>
                                        Danh sách bài post
                                    </a>
                                </li>
                                <li class="aligned-left">
                                    <a href="<spring:url value="/search-applyer" />">
                                        <i class="fas fa-search"></i>
                                        Tìm kiếm ứng viên
                                    </a>
                                </li>
                                <li class="aligned-left">
                                    <a href="<c:url value="/logout"/>">
                                        <i class="fa fa-sign-out"></i>
                                        Đăng xuất
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-10 aligned-right">
                <div class="show-info">
                    <div class="widget-ifo-titles">
                        <h2>Danh sách bài post</h2>
                    </div>
                    <div class="widget-content" style="padding-top: 10px;">
                        <div class="row">
                            <c:choose>
                                <c:when test="${not empty listpost}">
                                    <c:forEach items="${listpost}" var="post"> 
                                        <div class="col-12 list-item">
                                            <article class="apllyer-item">
                                                <div class="applyers">
                                                    <div class="left-applyer">
                                                        <div class="flex-middle">
                                                            <div class="employers-icon">
                                                                <img src="<spring:url value="${post[1]}" />" alt="alt" class="card-img"/>
                                                            </div>
                                                            <h2 class="employers-name">${post[5]}</h2>
                                                        </div>
                                                    </div>
                                                    <div class="employer-position">
                                                        <h2>${post[2]}</h2>
                                                    </div>
                                                    <div class="employer-salary">
                                                        <i class="fas fa-dollar-sign" aria-hidden="true"></i>
                                                        <h2><fmt:formatNumber type="number" value="${post[3]}" /> VNĐ</h2>
                                                    </div>
                                                    <div class="employer-kv">
                                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                        <h2>${post[4]}</h2>                              
                                                    </div>
                                                    <div class="applyer-see">                                                    
                                                        <span class="btn-group">
                                                            <button type="button" class="btn-update btn btn-default dropdown-toggle btn-sm" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="fa fa-pencil-square-o"></i>
                                                                <span class="caret"></span>
                                                            </button>
                                                            <ul class="dropdown-menu btn_drop" style="z-index: 9999;">
                                                                <li class="btn-choose">
                                                                    <a href="<spring:url value="/listApplyers/${post[6]}" />" class="edit_action">
                                                                        <i class="fa fa-pencil-square-o"></i>
                                                                        Xem chi tiết
                                                                    </a>
                                                                </li>
                                                                <li class="btn-choose">
                                                                    <a href="<spring:url value="/delete/${post[6]}" />" onclick="return confirm('Bạn có chắc muốn xóa bài post này?')" class="edit_action">
                                                                        <i class="fa fa-trash" style="padding-right: 5px;"></i>
                                                                        Xóa dữ liệu
                                                                    </a> 
                                                                </li>
                                                            </ul>
                                                        </span>
                                                    </div>
                                                </div>
                                            </article>
                                        </div> 
                                    </c:forEach>
                                </c:when>
                                <c:when test="${empty listpost}">
                                    <div class="col-12">
                                        <h6 style="color: black; font-weight: bold;"><i>Chưa có bài post.</i></h6>
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


