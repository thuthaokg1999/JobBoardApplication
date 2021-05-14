<%-- 
    Document   : SignIn
    Created on : Apr 14, 2021, 6:10:34 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
    <!-- ctrl+shift+R to turn off rectangular select of mouse-->
    <head>
        <title>Register</title>
        <link href="<c:url value="/resources/css/sign-up.css"/>" rel="stylesheet"/>
        <link rel="icon" href="<c:url value="/resources/images/web-logo3.png"/>" type="image" sizes="30">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
              crossorigin="anonymous">
    </head>
    <body style="background-color: #FFD21E"> 

        <script src="<c:url value="/js/sign-up.js" />"></script>

        <div class="container body">
            <div class="row all">
                <div class="col-md-6 col-left"></div>
                <div class="col-md-6 col-right">
                    <h1 class="text-center title">Chào mừng bạn đến với</h1>
                    <h1 class="text-center title">Job Boards</h1>
                    <hr>
                    <form:form action="${action}" modelAttribute="user" method="post" cssClass="frm">
                        <div class="form-group">
                            <label>Tên đăng nhập</label>
                            <form:input class="form-control border border-warning "
                                        type="text" maxlength="25" placeholder="abc"
                                        required="true"
                                        oninvalid="this.setCustomValidity('Vui lòng nhập tên đăng nhập!')"
                                        oninput="setCustomValidity('')"
                                        path="username"
                                        name="username"/>
                        </div>
                        <div class="form-group">
                            <label>Mật khẩu</label>
                            <form:input class="form-control border border-warning" 
                                        type="password" maxlength="20" placeholder="******"
                                        required="true"
                                        oninvalid="this.setCustomValidity('Vui lòng nhập mật khẩu!')"
                                        oninput="setCustomValidity('')"
                                        path="password" name="password"/>
                        </div>
                        <div class="form-group">
                            <label>Confirm mật khẩu</label>
                            <form:input class="form-control border border-warning" 
                                        type="password" maxlength="20" placeholder="******"
                                        required="true"
                                        oninvalid="this.setCustomValidity('Vui lòng nhập mật khẩu!')"
                                        oninput="setCustomValidity('')"
                                        path="confirmPassword" />
                        </div>
                        <div class="form-group">
                            <label>Vị trí</label>
                            <form:select class="form-control border border-warning " required="true" name="role" path="role">
                                <option value="ROLE_EMPLOYER">Nhà ứng tuyển</option>
                                <option value="ROLE_EMPLOYEE">Ứng viên</option>
                            </form:select>
                        </div>
                        <div class="text-center btn-dn">
                            <input type="submit" class="btn btn-danger" value="Đăng ký"/>
                        </div>

                    </form:form>
                    <div class="text-right btn-b-home" >
                        <a href="<c:url value="/"/>"  >
                            <img src="<c:url value="/resources/images/icon01.png"/>"
                                 style="width: 30px; height: 30px; " alt="home"/>
                            <span style="color: gold; margin-top: 10px;">Trang chủ</span>
                        </a>

                    </div>
                    <!--                    <h5 class="text-center">Hãy chọn vị trí của bạn</h5>
                                        <div class="group-btn">
                                            <div class="text-center btn-nut">
                                                <button type="button" class="btn btn-warning text-center" 
                                                        style="width: 400px; height: 60px"
                                                        onclick="openEmployerForm();">
                                                    <span class="btn-btn">Nhà ứng tuyển</span>
                                                </button>
                                            </div>    
                                            <br/>
                                            <div class="text-center btn-uv">
                                                <button type="button" class="btn btn-warning"
                                                        style="width: 400px; height: 60px"
                                                        onclick="openEmployeeForm();">
                                                    <span class="btn-btn">Ứng viên</span>
                                                </button>
                                            </div>
                                        </div>-->
                    <!--                    <div class="text-right btn-b-home" style="margin-top: 80px">
                                            <a href="<c:url value="/sign-in/"/>"  >
                                                <img src="<c:url value=""/>"
                                                     style="width: 30px; height: 30px; " alt="home"/>
                                                <span style="color: gold; margin-top: 10px;">Trở về</span>
                                            </a>
                    
                                        </div>-->

                </div>
            </div>
        </div>
    </body>
</html>
