<%-- 
    Document   : employer-info
    Created on : Apr 25, 2021, 11:32:01 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="container-infomation" style="padding-top: 70px;">
    <div class="site-main-content" style="min-height: 80vh;">
        <div class="row content-info" style="margin: 0;">
            <div class="col-xs-12 col-md-2">
                <div class="sitebar-left">
                    <div class="widget-infomation">
                        <div class="navbar-collapse no-padding">
                            <ul class="menu_short_profile">
                                <li class="aligned-left">
                                    <a href="<spring:url value="/employer-info/${pageContext.request.userPrincipal.name}" />">
                                        <i class="fa fa-user"></i>
                                        Profile
                                    </a>
                                </li>
                                <li class="active aligned-left">
                                    <a href="<spring:url value="#" />">
                                        <i class="fas fa-edit"></i>
                                        Cập nhật thông tin
                                    </a>
                                </li>
                                <li class="aligned-left">
                                    <a href="<spring:url value="/ListPost/${pageContext.request.userPrincipal.name}" />">
                                        <i class="fas fa-file-alt"></i>
                                        Danh sách bài post
                                    </a>
                                </li>
                                <li class="aligned-left">
                                    <a href="<spring:url value="/search-applyer" /> ">
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
                        <h2>Cập nhật thông tin </h2>                      
                    </div>
                    <div class="widget-infomation-contents">
                        <%--<c:choose>--%>
                        <%--<c:when test="${not empty employers}">--%>
                        <spring:url value="/EmployerUpdateInfo/${employers.id}" var="action" />
                        <form:form action="${action}" modelAttribute="employers" method="post" enctype="multipart/form-data">
                            <form:errors path="*" element="div" 
                                         cssClass="alert alert-danger" />
                            <%--<c:forEach items="${employer}" var="e">--%> 
                            <%--<c:if test="${e.user.id == employerss.id}">--%>
                            <div class="row" style="display: flex;">
                                <div class="col-md-6">
                                    <div class=form-group">
                                        <label>Tên công ty/doanh nghiệp của bạn</label>
                                        <form:input class="form-control border border-warning " 
                                                    type="text" 
                                                    required="true"
                                                    oninvalid="this.setCustomValidity('Vui lòng nhập tên công ty của bạn!')"
                                                    oninput="setCustomValidity('')"
                                                    path="companyName"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class=form-group">
                                        <label>Logo</label>
                                        <form:input class="form-control border border-warning " 
                                                    type="file" required="true"
                                                    style="padding: 3px"
                                                    accept=".png, .jpg, .gif"
                                                    oninvalid="this.setCustomValidity('Vui lòng chọn logo cho công ty của bạn!')"
                                                    oninput="setCustomValidity('')" path="logoFile"/>
                                    </div>
                                </div>    
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <form:input class="form-control border border-warning " 
                                                    type="email" required="true" 
                                                    oninvalid="this.setCustomValidity('Vui lòng nhập địa chỉ email!')"
                                                    oninput="setCustomValidity('')"
                                                    path="email"/>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Số điện thoại</label>
                                        <form:input class="form-control border border-warning " 
                                                    maxlength="10" required="true"
                                                    oninvalid="this.setCustomValidity('Vui lòng nhập số điện thoại!')"
                                                    oninput="setCustomValidity('')"
                                                    path="phone"/>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Quy mô (nhân viên)</label>
                                        <form:input class="form-control border border-warning " 
                                                    maxlength="10" type="text" required="true" 
                                                    oninvalid="this.setCustomValidity('Vui lòng nhập số quy mô công ty!')"
                                                    oninput="setCustomValidity('')"
                                                    path="scale"/>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="form-group">
                                        <label>Địa chỉ</label>
                                        <form:input class="form-control border border-warning "
                                                    type="text" maxlength="200" required="true"
                                                    oninvalid="this.setCustomValidity('Vui lòng nhập địa chỉ!')"
                                                    oninput="setCustomValidity('')"
                                                    path="address"/>
                                    </div>
                                </div>
                                <div class="col-md-3 ">
                                    <div class="form-group">
                                        <label>Thành phố</label>
                                        <form:select path="area.id" class="form-control border border-warning">
                                            <c:forEach items="${areas}" var="a">
                                                <c:if test="${a.id == employers.area.id}">
                                                    <option selected value="${a.id}">${a.name}</option>
                                                </c:if>
                                                <c:if test="${a.id != employers.area.id}">
                                                    <option value="${a.id}">${a.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </form:select>
                                    </div> 
                                </div> 
                                <div class="col-md-12">
                                    <div class=form-group">
                                        <label>Mô tả vắn tắt</label>
                                        <form:textarea class="form-control border border-warning " required="true"
                                                       oninvalid="this.setCustomValidity('Bạn cần nhập một vài mô tả cơ bản về CTY!')"
                                                       oninput="setCustomValidity('')" rows="10" path="description"></form:textarea>
                                        </div>
                                    </div>
                                    <div style="display: none;">
                                    <form:hidden path="id" />
                                    <form:hidden path="user.id" />
                                    <!--<input type="number" value="${employerss.id}" name="">-->                                     
                                </div>
                            </div>
                            <div class="text-right" style="margin-top: 20px;">
                                <input type="submit" class="btn btn-warning btn-add-info "  value="Cập nhật" />
                            </div>
                            <%--</c:if>--%>
                            <%--</c:forEach>--%>
                        </form:form>
                        <%--</c:when>--%>

                        <%--<c:when test="${empty employers}">--%>
                        <%--<spring:url value="/EmployerUpdateInfo/${pageContext.request.userPrincipal.name}" var="action" />--%>
                        <%--<form:form action="${action}" modelAttribute="addEmployer" method="post" enctype="multipart/form-data">--%>
                        <!--                                    <div class="row" style="display: flex;">
                                                                <div class="col-md-6">
                                                                    <div class=form-group">
                                                                        <label>Tên công ty/doanh nghiệp của bạn</label>-->
                        <%--<form:input class="form-control border border-warning "--%> 
                        <!--                                                            type="text" maxlength="25"
                                                                                    required="true"
                                                                                    oninvalid="this.setCustomValidity('Vui lòng nhập tên công ty của bạn!')"
                                                                                    oninput="setCustomValidity('')"
                                                                                    path="companyName"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class=form-group">
                                                                        <label>Logo</label>-->
                        <%--<form:input class="form-control border border-warning "--%> 
                        <!--                                                            type="file" required="true"
                                                                                    style="padding: 3px"
                                                                                    oninvalid="this.setCustomValidity('Vui lòng chọn logo cho công ty của bạn!')"
                                                                                    oninput="setCustomValidity('')" 
                                                                                    path="logoFile"/>
                                                                    </div>
                                                                </div>    
                        
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label>Email</label>-->
                        <%--<form:input class="form-control border border-warning "--%> 
                        <!--                                                            type="email" required="true"
                                                                                    oninvalid="this.setCustomValidity('Vui lòng nhập địa chỉ email!')"
                                                                                    oninput="setCustomValidity('')"
                                                                                    path="email"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div class="form-group">
                                                                        <label>Số điện thoại</label>-->
                        <%--<form:input class="form-control border border-warning "--%> 
                        <!--                                                            maxlength="10" required="true"
                                                                                    oninvalid="this.setCustomValidity('Vui lòng nhập số điện thoại!')"
                                                                                    oninput="setCustomValidity('')"
                                                                                    path="phone"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div class="form-group">
                                                                        <label>Quy mô (nhân viên)</label>-->
                        <%--<form:input class="form-control border border-warning "--%> 
                        <!--                                                            maxlength="10" type="text" required="true"
                                                                                    oninvalid="this.setCustomValidity('Vui lòng nhập số quy mô công ty!')"
                                                                                    oninput="setCustomValidity('')"
                                                                                    path="scale"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-9">
                                                                    <div class="form-group">
                                                                        <label>Địa chỉ</label>-->
                        <%--<form:input class="form-control border border-warning"--%>
                        <!--                                                            type="text" maxlength="200" required="true"
                                                                                    oninvalid="this.setCustomValidity('Vui lòng nhập địa chỉ!')"
                                                                                    oninput="setCustomValidity('')"
                                                                                    path="address"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3 ">
                                                                    <div class="form-group">
                                                                        <label>Thành phố</label>-->
                        <%--<form:select path="area.id" class="form-control border border-warning">--%>
                        <%--<form:options items="${areas}"--%>  
                        <!--                                                                  itemLabel="name"
                                                                                          itemValue="id" />-->
                        <%--</form:select>--%>
                        <!--                                            </div> 
                                                                </div> 
                                                                <div class="col-md-12">
                                                                    <div class=form-group">
                                                                        <label>Mô tả vắn tắt</label>
                        <%--<form:textarea class="form-control border border-warning " required="true"--%>
                                  oninvalid="this.setCustomValidity('Bạn cần nhập một vài mô tả cơ bản về CTY!')"
                                  oninput="setCustomValidity('')" rows="10" path="description" >
                        <%--</form:textarea>--%>
                                            </div>
                                        </div>
                                        <div style="display: none;">
                        <%--<form:input path="user.id" type="number" min="0" step="1" value="${employerss.id}"/>--%>                                     
                    </div>
                </div>
                <div class="text-right" style="margin-top: 20px;">
                    <input type="submit" class="btn btn-warning btn-add-info "  value="Thêm thông tin" />
                </div>-->
                        <%--</form:form>--%>
                        <%--</c:when>--%>                               
                        <%--</c:choose>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<link href="<c:url value="/resources/css/employee-update-info.css"/>" rel="stylesheet"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
      crossorigin="anonymous">
