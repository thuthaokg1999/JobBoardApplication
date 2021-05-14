<%-- 
    Document   : list-applyer
    Created on : Apr 26, 2021, 6:25:51 PM
    Author     : Dy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<div class="container-list-applyers" style="padding-top: 70px;font-weight: 400;">
    <div class="content-area container">
        <div class="site-main content">
            <div class="row content-job-detail">
                <div class="col-xs-12 col-md-8">
                    <div class="job-detail-header clearfix">
                        <div class="widget-logo">
                            <div class="widget-img">
                                <img src="<spring:url value="${post.employer.logo}" />" alt="alt" class="logo-img"/>
                            </div>
                        </div>
                        <div class="widget-titles">
                            <h6>${post.position.name}</h6>
                        </div>                                   
                        <div class="job-information clearfix">
                            <ul class="list-detail-candidate">
                                <li>
                                    <div class="job-position">
                                        <i class="fa fa-map-marker"></i>
                                        <p> ${post.employer.address}, ${post.area.name} </p>
                                    </div>
                                </li>
                                <li>
                                    <div class="job-phone">
                                        <i class="fa fa-phone"></i>
                                        <p> ${post.employer.phone} </p>
                                    </div>
                                </li>
                                <li>
                                    <div class="job-email">
                                        <i class="fas fa-envelope"></i>
                                        <p> ${post.employer.email} </p>
                                    </div>                       
                                </li>
                                <li>
                                    <div class="job-date">
                                        <i class="fa fa-credit-card"></i>
                                        <p>  ${post.createPost} </p>
                                    </div>                       
                                </li>

                            </ul>
                        </div>
                    </div>
                    <div class="job-detail-description">
                        <div class="detail-wrapper">
                            <div class="detail-wrapper-header">
                                <h4>Khái quát</h4>
                            </div>
                            <div class="detail-wrapper-body">
                                <c:set var="s1" value="${post.description}"/>  
                                <p>${fn:replace(s1, ".", "<br>")}</p>
                            </div>
                        </div>
                        <div class="detail-wrapper">
                            <div class="detail-wrapper-header">
                                <h4>Yêu cầu</h4>
                            </div>
                            <div class="detail-wrapper-body">
                                <ul class="detail-list">                                   
                                    <c:set var="s2" value="${post.requirements}"/>  
                                    <p>${fn:replace(s2, ".", "<br>")}</p>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-xs-12 sidebar sidebar-job">
                    <div class="widget widget_job_info">
                        <h2 class="widget-title">
                            <span>Thông tin</span>
                        </h2>
                        <div class="job-detail in-sidebar">
                            <ul class="list">
                                <li>
                                    <div class="li-icon">
                                        <i class="fa fa-money"></i>
                                    </div>
                                    <div class="details">
                                        <div class="text">Mức lương</div>
                                        <div class="value"><fmt:formatNumber type="number" value="${post.salary}" /> VNĐ</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="li-icon">
                                        <i class="fa fa-line-chart"></i>
                                    </div>
                                    <div class="details">
                                        <div class="text">Ngành nghiệp</div>
                                        <div class="value">${post.major.name}</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="li-icon">
                                        <i class="fa fa-calendar "></i>
                                    </div>
                                    <div class="details">
                                        <div class="text">Hình thức</div>
                                        <div class="value">${post.jobTypes.name}</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="li-icon">
                                        <i class="fas fa-stream"></i>
                                    </div>
                                    <div class="details">
                                        <div class="text">Số lượng tuyển</div>
                                        <div class="value">${post.quantity}</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="li-icon">
                                        <i class="fa fa-credit-card"></i>
                                    </div>
                                    <div class="details">
                                        <div class="text">Hạn chót ứng tuyển</div>
                                        <div class="value">${post.finishPost}</div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>              
    </div>

    <div class="widget-spaces" style="padding-top: 50px;background-color: #f6f7f9;"></div>

    <div class="container widget-applyers">
        <div class="elm-applyer-title">
            <h3>Danh sách ứng viên</h3>        
        </div>
        <div class="widget-content ">
            <div class="row">
                <c:choose>
                    <c:when test="${not empty applyers}">
                        <c:forEach items="${applyers}" var="app">
                            <div class="col-12 list-item">
                                <article class="apllyer-item">
                                    <div class="applyers">
                                        <div class="left-applyer">
                                            <div class="flex-middle">
                                                <div class="employers-icon">
                                                    <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                                                </div>
                                                <h2 class="employers-name">${app[2]} ${app[1]}</h2>
                                            </div>
                                        </div>
                                        <div class="applyer-cv">
                                            <i class="fas fa-file" aria-hidden="true"></i>
                                            <a href="<spring:url value="${app[4]}" />" download>
                                                ${app[4]}
                                            </a>                                
                                        </div>
                                        <div class="applyer-email">
                                            <!--<i class="fas fa-envelope" aria-hidden="true"></i>-->
                                            <h2><fmt:formatDate value="${app[5]}" pattern = "dd/MM/yyyy"/></h2>
                                        </div>                               
                                        <div class="applyer-see">
                                            <a href="<spring:url value="/info-applyers/${app[6]}" />" class="btn btn-see">Xem Chi tiết</a>                                
                                        </div>
                                    </div>
                                </article>
                            </div>  
                        </c:forEach>   
                    </c:when>
                    <c:when test="${empty applyers}">
                        <div class="text-center">
                            <h6 style="font-weight: bold;"><i>Chưa có ứng viên nào apply!</i></h6>
                        </div>
                    </c:when>                   
                </c:choose>                            
            </div>
        </div>
    </div>
</div>

<link href="<c:url value="/resources/css/post-detail.css" />" rel="stylesheet"/>