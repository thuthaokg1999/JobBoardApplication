<%-- 
    Document   : post-detail
    Created on : Apr 26, 2021, 8:37:07 AM
    Author     : Dy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<!DOCTYPE html>
<html>
    <head>
        <link href="<c:url value="/resources/css/post-detail.css"/>" rel="stylesheet"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body style="padding-top: 70px;font-weight: 400;">
        <div class="detail-version">
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
                            <!--                            <div class="widget widget_job_info">
                                                            <div class="widget-logo">
                                                                <div class="widget-img">
                                                                    <img src="<c:url value="/resources/images/e1.jpg"/>" alt="alt" class="logo-img"/>
                                                                </div>
                                                            </div>
                                                            <div class="widget-titles">
                                                                <h6>Product Design</h6>
                                                            </div>                                   
                                                            <div class="job-information clearfix">
                                                                <ul class="list-detail-candidate">
                                                                    <li>
                                                                        <div class="job-position">
                                                                            <i class="fa fa-map-marker"></i>
                                                                            <p> 803 46th St Brooklyn, NY </p>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="job-phone">
                                                                            <i class="fa fa-phone"></i>
                                                                            <p> 0987654321 </p>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="job-email">
                                                                            <i class="fas fa-envelope"></i>
                                                                            <p> abc@gmail.com </p>
                                                                        </div>                       
                                                                    </li>
                                                                    <li>
                                                                        <div class="job-date">
                                                                            <i class="fa fa-credit-card"></i>
                                                                            <p>  July 18, 2019 </p>
                                                                        </div>                       
                                                                    </li>
                                                                    
                                                                </ul>
                                                            </div>
                                                        </div>-->
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
                                        <!--                                        <li>
                                                                                    <div class="li-icon">
                                                                                        <i class="fa fa-graduation-cap"></i>
                                                                                    </div>
                                                                                    <div class="details">
                                                                                        <div class="text">Kinh nghiệm</div>
                                                                                        <div class="value">${post.requirements}</div>
                                                                                    </div>
                                                                                </li>-->
                                        <li>
                                            <div class="li-icon">
                                                <i class="fa fa-line-chart"></i>
                                            </div>
                                            <div class="details">
                                                <div class="text">Ngành nghề</div>
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
                            <sec:authorize access="isAuthenticated()">   
                                <sec:authorize access="hasRole('ROLE_EMPLOYER')">
                                    <div class="widget-apply" style="display: none;">
                                        <div class="widget-container-apply">
                                            <a href="<c:url value="/post-detail/apply/"/>" role="button" class="widget-container-apply-button">                                     
                                                <span>Ứng tuyển</span>
                                            </a>
                                        </div>           
                                    </div>   
                                </sec:authorize>
                                <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                                    <div class="widget-apply">
                                        <div class="widget-container-apply">
                                            <a href="<spring:url value="/posts/${post.id}/${pageContext.request.userPrincipal.name}" />" role="button" class="widget-container-apply-button">                                     
                                                <span>Ứng tuyển</span>
                                            </a>
                                        </div>           
                                    </div>     
                                </sec:authorize>
                            </sec:authorize>  
                            <sec:authorize access="!isAuthenticated()">
                                <div class="widget-apply" style="margin-bottom: 10px;">
                                    <div class="widget-container-apply">
                                        <a role="button" class="widget-container-apply-button" style="color: white;">                                     
                                            <span>Ứng tuyển</span>
                                        </a>
                                    </div>           
                                </div>
                                <span style="color: red"><strong>*</strong> Please login to apply !</span>                                                     
                            </sec:authorize>
                            <!--                            <div class="widget-apply">
                                                            <div class="widget-container-apply">
                                                                <a href="<c:url value="/post-detail/apply/"/>" role="button" class="widget-container-apply-button">                                     
                                                                    <span>Ứng tuyển</span>
                                                                </a>
                                                            </div>           
                                                        </div>-->
                        </div>
                    </div>
                </div>              
            </div>
        </div>
    </body>
</html>
