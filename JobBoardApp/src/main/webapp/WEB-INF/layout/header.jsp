<%-- 
    Document   : header
    Created on : Apr 14, 2021, 6:01:05 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="main-header" style="height: 70px;">
    <div class="elm-container">
        <div class="elm-row row">
            <div class="elm-col-25 elm-column col-md-4">
                <div class="elm-title">
                    <a href="<c:url value="/"/>">
                        <h1><strong style="color: gold;">Job</strong> <strong>Boards</strong></h1>
                    </a>
                </div>
            </div>
            <div class="elm-nav col-md-5">
                <nav class="navbar navbar-expand-sm" style="padding-left: 10px">
                    <ul class="navbar-nav nav-container text-center">
                        <li id="elm-home" class="nav-item">
                            <a class="nav-link" href="<c:url value="/"/>">HOME</a>
                        </li>
                        <li id="elm-comp" class="nav-item">
                            <a class="nav-link" href="<c:url value="/list-company/"/>">COMPANIES</a>
                        </li>
                        <li id="elm-nf" class="nav-item">
                            <a class="nav-link" href="<c:url value="/news-feed/"/>">NEWS FEED</a>
                        </li>
                        
                        <sec:authorize access="isAuthenticated()">   
                            <sec:authorize access="hasRole('ROLE_EMPLOYER')">
                                <li id="elm-post" class="nav-item">
                                    <a class="nav-link" href="<spring:url value="/post/${pageContext.request.userPrincipal.name}" />">POST</a>
                                </li> 

                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                                <li id="elm-nf" class="nav-item">
                                    <a class="nav-link" href="<c:url value="/news-feed/${pageContext.request.userPrincipal.name}"/>">NEWS FEED</a>
                                </li>
                                <li id="elm-post" class="nav-item" style="display: none;">
                                    <a class="nav-link" href="<c:url value="/post/"/>">POST</a>
                                </li> 
                                <script>
                                    document.getElementById("elm-nf").style.display = "none";
                                </script>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <li id="elm-post" class="nav-item" style="padding-left: 130px">
                                    <a class="nav-link" href="<spring:url value="/statis/" />">
                                        THỐNG KÊ
                                    </a>
                                </li>   
                                <script>
                                    document.getElementById("elm-home").style.display = "none";
                                    document.getElementById("elm-nf").style.display = "none";
                                    document.getElementById("elm-comp").style.display = "none";
                                </script>
                            </sec:authorize>
                        </sec:authorize>

                    </ul>
                </nav>
            </div>

            <div class="elm-sign-container col-md-3">
                <sec:authorize access="!isAuthenticated()">
                    <div class="elm-sign" style="padding-left: 30px">
                        <div class="elm-sign-in">
                            <a href="<c:url value="/sign-in/"/>">
                                <i class="fa fa-user"></i>
                                <h5>LOGIN</h5>
                            </a>                           
                        </div>
                        <div class="elm-sign-up">
                            <a href="<c:url value="/sign-up/"/>">
                                <i class="fa fa-briefcase"></i>
                                <h5>REGISTER</h5>
                            </a>                           
                        </div>
                    </div>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">   
                    <sec:authorize access="hasRole('ROLE_EMPLOYER')">
                        <div class="elm-sign" style="padding-left: 30px; float: right;">
                            <div class="elm-sign-in">
                                <a href="<spring:url value="/employer-info/${pageContext.request.userPrincipal.name}" />" style="color: black;font-weight: 400;">
                                    <i class="fa fa-user" style="margin-right: 10px;"></i>
                                    <spring:message code="message.welcome" />, 
                                    <sec:authentication property="principal.username" />                                     
                                </a>                            
                            </div>
                        </div>           
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                        <div class="elm-sign" style="padding-left: 30px; float: right;">
                            <div class="elm-sign-in">
                                <a href="<spring:url value="/EmployeeInfo/${pageContext.request.userPrincipal.name}" />" style="color: black;font-weight: 400;">
                                    <i class="fa fa-user" style="margin-right: 10px;"></i>
                                    <spring:message code="message.welcome" />, 
                                    <sec:authentication property="principal.username" /> 
                                </a>                            
                            </div>
                        </div>           
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li id="elm-post" class="nav-item" style="list-style: none; padding-left: 30px; float: right; padding-top: 10px; ">
                            <a class="nav-link" href="<spring:url value="/logout" />" style="color: #ffc107">
                                <i class="fa fa-sign-out"></i> LOG OUT
                            </a>
                        </li>

                    </sec:authorize>
                </sec:authorize>
            </div>
        </div>
    </div>
</div>

<link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet"/>
