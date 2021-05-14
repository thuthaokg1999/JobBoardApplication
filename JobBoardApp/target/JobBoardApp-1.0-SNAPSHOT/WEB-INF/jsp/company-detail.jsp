<%-- 
    Document   : company-detail
    Created on : May 14, 2021, 2:59:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="<c:url value="/resources/css/post-detail.css"/>" rel="stylesheet"/>
<link href="<c:url value="/resources/css/employee-update-info.css"/>" rel="stylesheet"/>

<div class="container" style="padding-top: 90px;font-weight: 400;">
    <h2 class="text-center text-warning" style="position: relative">Company Information</h2>
    <div class="detail-version">
        <div class="content-area container">
            <div class="site-main content">
                <div class="row content-job-detail">
                    <div class="col-xs-12 col-md-12">
                        <div class="job-detail-header clearfix">
                            <div class="widget-logo">
                                <div class="widget-img">
                                    <img src="<spring:url value="${employers.logo}" />" alt="alt" class="logo-img" style="max-width: 30% !important;"/>
                                </div>
                            </div>
                            <div class="widget-titles">
                                <h6>${employers.companyName}</h6>
                            </div>                                   
                            <div class="job-information clearfix">
                                <ul class="list-detail-candidate">
                                    <li>
                                        <div class="job-position">
                                            <i class="fa fa-map-marker"></i>
                                            <p>${employers.address}, ${employers.area.name}</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="job-phone">
                                            <i class="fa fa-phone"></i>
                                            <p>${employers.phone}</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="job-email">
                                            <i class="fas fa-envelope"></i>
                                            <p>${employers.email}</p>
                                        </div>                       
                                    </li>
                                    <li>
                                        <div class="job-date">
                                            <i class="fa fa-users"></i>
                                            <p>${employers.scale} nhân viên</p>
                                        </div>                       
                                    </li>
                                </ul>
                            </div>
                            <div class="widget-descript" >
                                <i class="fas fa-city"></i>
                                <h6 style="font-weight: normal;">${employers.description}</h6>
                            </div> 
                        </div>                                                                      
                    </div>

                    <div class="col-xs-12 col-md-12">
                        <div class="show-info">
                            <div class="widget-ifo-titles">
                                <h5>Danh sách bài post</h5>
                            </div>
                            <div class="widget-content" style="padding-top: 10px;">
                                <div class="row">
                                    <c:choose>
                                        <c:when test="${not empty employer}">
                                            <c:forEach items="${employer}" var="e">
                                                <div class="col-12 list-item">
                                                    <article class="apllyer-item">
                                                        <div class="applyers">
                                                            <div class="left-applyer" style="width: 35% !important;">
                                                                <div class="flex-middle">
                                                                    <div class="employers-icon">
                                                                        <img src="<spring:url value="${e[3]}" />" alt="alt" class="card-img"/>
                                                                    </div>
                                                                    <a href="<spring:url value="/posts/${e[0]}" />">
                                                                        <h2 class="employers-name">${e[10]}</h2>
                                                                    </a>
                                                                    
                                                                </div>
                                                            </div>
                                                            <div class="employer-position">
                                                                <h2>${e[9]}</h2>
                                                            </div>
                                                            <div class="employer-salary">
                                                                <i class="fas fa-dollar-sign" aria-hidden="true"></i>
                                                                <h2><fmt:formatNumber type="number" value="${e[1]}" /> VNĐ</h2>
                                                            </div>
                                                            <div class="employer-kv">
                                                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                                <h2>${e[8]}</h2>                              
                                                            </div>
<!--                                                            <div class="applyer-see">                                                    
                                                                <span class="btn-group">
                                                                    <button type="button" class="btn-update btn btn-default dropdown-toggle btn-sm" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fa fa-pencil-square-o"></i>
                                                                        <span class="caret"></span>
                                                                    </button>
                                                                    <ul class="dropdown-menu btn_drop" style="z-index: 9999;">
                                                                        <li class="btn-choose">
                                                                            <a href="<spring:url value="/posts/${e[0]}" />" class="edit_action">
                                                                                <i class="fa fa-pencil-square-o"></i>
                                                                                Xem chi tiết
                                                                            </a>
                                                                        </li>
                                                                    </ul>
                                                                </span>
                                                            </div>-->
                                                        </div>
                                                    </article>
                                                </div> 
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${empty employer}">
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
    </div>
</div>


