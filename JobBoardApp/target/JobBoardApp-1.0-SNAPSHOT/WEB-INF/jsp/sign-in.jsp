<%-- 
    Document   : SignIn
    Created on : Apr 14, 2021, 6:10:34 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html >
    <head>
        <title>Sign In</title>
        <meta name="description" content="Sign In">
        <link rel="icon" href="<c:url value="/resources/images/web-logo3.png"/>" type="image" sizes="30">
        <link href="<c:url value="/resources/css/sign-in.css"/>" rel="stylesheet"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
              crossorigin="anonymous">
    </head>
    <body style="background-color: #FFD21E"> 
        <div class="container body">
            <div class="row all">
                <div class="col-md-6 col-left"></div>
                <div class="col-md-6 col-right">
                    <h1 class="text-center title">Chào mừng bạn đến với</h1>
                    <h1 class="text-center title">Job Boards</h1>
                    <c:if test="${param.error != null}">
                        <div class="alert alert-danger" style="padding-bottom: 0 !important;margin-bottom: 0 !important;">
                            <p><spring:message code="user.login.error1" /></p>
                        </div>    
                    </c:if>
                    <c:if test="${param.accessDenied != null}">
                        <div class="alert alert-danger">
                            <p><spring:message code="user.login.error2" /></p>
                        </div>    
                    </c:if>
                    <spring:url value="/sign-in" var="action" />
                    <form action="${action}" method="post" class="frm">
                        <div class="form-group">
                            <label>Tên đăng nhập</label>
                            <input class="form-control border border-warning "
                                   type="text" maxlength="25" placeholder="abc"
                                   required="true"
                                   oninvalid="this.setCustomValidity('Vui lòng nhập tên đăng nhập!')"
                                   oninput="setCustomValidity('')"
                                   name="username" id="usernameId"
                                   />
                        </div>
                        <div class="form-group">
                            <label>Mật khẩu</label>
                            <input class="form-control border border-warning" 
                                   type="password" maxlength="20" placeholder="******"
                                   required="true"
                                   oninvalid="this.setCustomValidity('Vui lòng nhập mật khẩu!')"
                                   oninput="setCustomValidity('')"
                                   id="passwordId" name="password" />
                        </div>
                        <div class="text-center btn-dn">
                            <input type="submit" class="btn btn-danger" value="Đăng nhập" name="submit"/>
                        </div>
                        <div class="row" style="margin-left: 120px; margin-top: 20px">
                            <p>Bạn chưa có tài khoản?</p><a href="<c:url value="/sign-up/"/>" style="padding-left: 10px;"> ĐĂNG KÝ</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
