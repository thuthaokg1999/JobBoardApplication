<%-- 
    Document   : index
    Created on : Apr 14, 2021, 6:05:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="slide-header" style="padding-top: 70px;">
    <section class="element-slide height-lg-full">
        <div class="elementor-widget-container container">
            <h2>We offer <strong style="color: gold;">500+</strong> job vacancies right now!</h2>
            <h4>Find your desire one in a minute</h4>           
            <div class="find-container" style="padding-top: 130px;">
                <form class="form-search layout1" method="POST">
                    <div class="flex-middle-sm search">
                        <!--                        <div class="form-group form-group-title">
                                                    <div class="form-group-inner inner">
                                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                                        <input name="kw" value="${kw}" type="text" class="form-control form-search" placeholder="Skill or Keywords">
                                                    </div>
                                                </div>-->
                        <div class="form-group form-group-location">
                            <div class="form-group-inner inner">
                                <i class="fa fa-line-chart" aria-hidden="true"></i>
                                <select class="form-control form-search" name="majorId">
                                    <c:forEach items="${majors}" var="m">
                                        <option selected value="${m.id}" class="text-dark">${m.name}</option>  
                                    </c:forEach>                                      
                                </select>
                            </div>      
                        </div>     
                        <div class="form-group form-group-location">
                            <div class="form-group-inner inner">
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <select class="form-control form-search" name="areaId">
                                    <c:forEach items="${areas}" var="area">
                                        <option selected value="${area.id}" class="text-dark">${area.name}</option>  
                                    </c:forEach>                                      
                                </select>
                            </div>      
                        </div>                   
                        <div class="form-group form-group-salary-from">
                            <div class="form-group-inner inner">
                                <i class="fas fa-dollar-sign"></i>
                                <input name="fromSalary" value="${fromSalary}" type="number" min="0" class="form-control form-search" placeholder="Salary From">
                            </div>
                        </div>
                        <div class="form-group form-group-salary-to">
                            <div class="form-group-inner inner">
                                <input type="text" class="form-control form-search" placeholder="-" disabled="disabled" style="background-color: white;">
                            </div>
                        </div>
                        <div class="form-group form-group-sal-to">
                            <div class="form-group-inner inner">
                                <input name="toSalary" value="${toSalary}" min="0" type="number" class="form-control form-search" placeholder="To">
                            </div>
                        </div>
                        <div class="form-group form-group-search">
                            <div class="form-group-inner inner">
                                <button class="btn-search">
                                    <i class="fas fa-search" aria-hidden="true"></i>
                                    <h6 style="padding-left: 20px;">SEARCH</h6>
                                </button>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>                  
</div>
</section>
</div>
<div class="el-header container-fluid" style="padding-top: 50px;padding-bottom: 30px;">
    <div class="elm-card">
        <h2>Featured Jobs</h2>
        <h6>Post A Job To Tell Us About Your Project. We’ll Quickly Match You With The Right Freelancers.</h6>
    </div>
    <div id="parttimeArea">
        <div class="mb-4">
            <div class="row no-gutters">
                <c:forEach items="${posts}" var="post">
                    <div class="col-md-6 col-sm-6 col-xs-12 md-clearfix sm-clearfix elmemts-card">     
                        <article class="elm-card-body" style="min-height: 255px;">
                            <div class="elm-card-titles flex-middle">
                                <div class="elm-logo">
                                    <div class="elememts-logo">
                                        <a href="<spring:url value="/posts/${post[0]}" />">
                                            <img src="<spring:url value="${post[3]}" />" alt="alt" class="card-img"/>
                                        </a>
                                    </div>                                       
                                </div>
                                <div class="elm-logo-title">
                                    <h5>
                                        <a href="<spring:url value="/posts/${post[0]}" />">${post[2]}</a>
                                    </h5>
                                    <h6>
                                        <a href="<spring:url value="/posts/${post[0]}" />">${post[7]}</a>                                            
                                    </h6>
                                </div>
                            </div>
                            <div class="elm-jobs-middle">
                                <div class="elm-jobs-location">
                                    <i class="fa fa-map-marker"></i>
                                    <p>${post[4]}, ${post[5]}</p>
                                </div>
                                <div class="elm-jobs-salary">
                                    <i class="fas fa-dollar-sign"></i>
                                    <p><fmt:formatNumber type="number" value="${post[1]}" /> VNĐ</p>
                                </div>
                            </div>
                            <div class="elm-job-type">
                                <div class="job-types">
                                    <div>
                                        <a class="types-jobs">${post[6]}</a>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div> 
                </c:forEach>
            </div>                     
        </div>
    </div>  
</div>

<div class="elm-see-all container-fluid">
    <div class="elm-see">
        <div class="elementor-widget-container">
            <a href="<c:url value="/news-feed/"/>" role="button" class="elementor-button-content-wrapper"> 
                <span>Browse All Category</span>
            </a>
        </div>
    </div>
</div>

<link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet"/>
<!--<script>
function myFunction() {
  var x = document.getElementById("mySelect").value;
  document.getElementById("demo").value = x;
}
</script>-->