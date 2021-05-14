<%-- 
    Document   : employer-info
    Created on : Apr 27, 2021, 5:42:14 PM
    Author     : Dy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link href="<c:url value="/resources/css/employee-update-info.css"/>" rel="stylesheet"/>

<div class="container-infomation" style="padding-top: 70px;">
    <div class="site-main-content" style="min-height: 80vh;">
        <div class="row content-info" style="margin-left: 0;margin-right: 0;">
            <div class="col-xs-12 col-md-2">
                <div class="sitebar-left">
                    <div class="widget-infomation">
                        <div class="navbar-collapse no-padding">
                            <ul class="menu_short_profile">
                                <li class="active aligned-left">
                                    <a href="<spring:url value="/employer-info/${pageContext.request.userPrincipal.name}" />">
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
                                <li class="aligned-left">
                                    <a href="<spring:url value="/ListPost/${pageContext.request.userPrincipal.name}" />">
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
            <div class="col-xs-12 col-md-9 aligned-right">
                <div class="show-info">
                    <div class="widget-ifo-titles">
                        <h2>Profile</h2>
                    </div>
                    <div class="widget-infomation-contents">
                        <form method="POST">
                            <c:choose>
                                <c:when test="${not empty employers}">
                                    <c:forEach items="${employers}" var="e"> 
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">

                                                    <label>Logo công ty/doanh nghiệp</label>
                                                </div>
                                                <div class="cmb-td image-logo">
                                                    <img src="<spring:url value="${e[2]}" />" alt="">
                                                    <!--<input type="text" class="form-control" value="Redesign Co" readonly="true">-->
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>Tên công ty/doanh nghiệp</label>
                                                </div>
                                                <div class="cmb-td">
                                                    <input type="text" class="form-control" value="${e[1]}" readonly="true">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>Email</label>
                                                </div>
                                                <div class="cmb-td">
                                                    <input type="email" class="form-control" value="${e[6]}" readonly="true">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>Số điện thoại</label>
                                                </div>
                                                <div class="cmb-td">
                                                    <input type="text" class="form-control" value="${e[5]}" readonly="true">
                                                </div>
                                            </div> 
                                            <div class="col-md-6 col-sm-6 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>Quy mô</label>
                                                </div>
                                                <div class="cmb-td">
                                                    <input type="text" class="form-control" value="${e[4]} nhân viên" readonly="true">
                                                </div>
                                            </div>  
                                            <div class="col-md-12 col-sm-12 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>Địa chỉ</label>
                                                </div>
                                                <div class="cmb-td">
                                                    <input type="text" class="form-control" value="${e[7]}, ${e[8]}" readonly="true">
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>Mô tả công ty/ doanh nghiệp</label>
                                                </div>
                                                <div class="cmb-td">
                                                    <textarea class="form-control" rows="10" readonly="true"> ${e[3]} </textarea> 
                                                </div>
                                            </div>                           
                                        </div>                                                                                                                          
                                    </c:forEach>
                                </c:when>
                                <c:when test="${empty employers}">
                                    <p style="color: red;font-weight: 400;"><strong>*</strong> Công ty / Doanh ngiệp chưa có thông tin. Hãy <a href="<spring:url value="/add-info-employer/${pageContext.request.userPrincipal.name}" />">thêm thông tin</a>!</p>
                                </c:when>                               
                            </c:choose>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

