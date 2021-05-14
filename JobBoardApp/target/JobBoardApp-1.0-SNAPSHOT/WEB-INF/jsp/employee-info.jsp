<%-- 
    Document   : employee-info
    Created on : Apr 28, 2021, 11:31:44 AM
    Author     : Dy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="<c:url value="/resources/css/employee-update-info.css"/>" rel="stylesheet"/>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="container-infomation" style="padding-top: 70px;">
    <div class="site-main-content" style="min-height: 80vh;">
        <div class="row content-info" style="margin-left:  0;">
            <div class="col-xs-12 col-md-2">
                <div class="sitebar-left">
                    <div class="widget-infomation">
                        <div class="navbar-collapse no-padding">
                            <ul class="menu_short_profile">
                                <li class="active aligned-left">
                                    <a href="<spring:url value="/EmployeeInfo/${pageContext.request.userPrincipal.name}" />">
                                        <i class="fa fa-user"></i>
                                        Profile
                                    </a>
                                </li>
                                <li class="aligned-left">
                                    <c:choose>
                                        <c:when test="${not empty employees}">
                                            <c:forEach items="${employees}" var="e"> 
                                                <a href="<spring:url value="/EmployeeUpdateInfo/${e[0]}" />">
                                                    <i class="fas fa-edit"></i>
                                                    Cập nhật thông tin
                                                </a>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${empty employees}">
                                            <a href="<spring:url value="/add-info-employee/${pageContext.request.userPrincipal.name}" />">
                                                <i class="fas fa-edit"></i>
                                                Cập nhật thông tin
                                            </a>
                                        </c:when>
                                    </c:choose>

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
                                <c:when test="${not empty employees}">
                                    <c:forEach items="${employees}" var="e"> 
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-td image-icon">
                                                    <i class="fa fa-user-circle-o" aria-hidden="true"></i>                                       
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>Họ</label>
                                                </div>
                                                <div class="cmb-td">
                                                    <input type="text" class="form-control" value="${e[2]}" readonly="true">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>Tên</label>
                                                </div>
                                                <div class="cmb-td">
                                                    <input type="text" class="form-control" value="${e[1]}" readonly="true">
                                                </div>
                                            </div> 
                                            <div class="col-md-6 col-sm-6 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>Năm sinh</label>
                                                </div>
                                                <div class="cmb-td">
                                                    <!--<input type="text" class="form-control" value="${e[3]}" name="date" readonly="true">-->
                                                    <input type="text" class="form-control" value="<fmt:formatDate value="${e[3]}" pattern = "dd-MM-yyyy"/>" readonly="true">
                                                </div>
                                            </div> 
                                            <div class="col-md-6 col-sm-6 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>Giới tính</label>
                                                </div>
                                                <div class="cmb-td">
                                                    <input type="text" class="form-control" value="${e[4]}" readonly="true">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>Email</label>
                                                </div>
                                                <div class="cmb-td">
                                                    <input type="email" class="form-control" value="${e[7]}" readonly="true">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>Số điện thoại</label>
                                                </div>
                                                <div class="cmb-td">
                                                    <input type="number" class="form-control" value="${e[6]}" readonly="true">
                                                </div>
                                            </div> 
                                            <div class="col-md-6 col-sm-6 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>File CV</label>
                                                </div>
                                                <div class="cmb-td-cv">
                                                    <div class="widget-cv">
                                                        <a href="<c:url value="${e[5]}" />" download>${e[5]}</a>
                                                    </div>                                       
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>Ngành học</label>
                                                </div>
                                                <div class="cmb-td">
                                                    <input type="text" class="form-control" value="${e[14]}" readonly="true">
                                                </div>
                                            </div> 

                                            <div class="col-md-6 col-sm-6 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>Lương</label>
                                                </div>
                                                <div class="cmb-td">
                                                    <input type="text" class="form-control" value="<fmt:formatNumber type="number" value="${e[10]}" /> VNĐ" readonly="true">
                                                </div>
                                            </div> 
                                            <div class="col-md-6 col-sm-6 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>Kinh nghiệm</label>
                                                </div>
                                                <div class="cmb-td">
                                                    <input type="text" class="form-control" value="${e[9]}" readonly="true">
                                                </div>
                                            </div> 
                                            <div class="col-md-12 col-sm-12 col-xs-12 md-clearfix sm-clearfix fullname">
                                                <div class="cmb-th">
                                                    <label>Địa chỉ</label>
                                                </div>
                                                <div class="cmb-td">
                                                    <input type="text" class="form-control" value="${e[8]}, ${e[11]}" readonly="true">
                                                </div>
                                            </div>                                                   
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:when test="${empty employees}">
                                    <p style="color: red;font-weight: 400;"><strong>*</strong> Bạn chưa có thông tin. Hãy <a href="<spring:url value="/add-info-employee/${pageContext.request.userPrincipal.name}" />">thêm thông tin</a>.</p>
                                </c:when>                               
                            </c:choose>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

