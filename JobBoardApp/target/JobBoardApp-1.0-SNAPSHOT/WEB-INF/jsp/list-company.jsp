<%-- 
    Document   : list-company
    Created on : May 14, 2021, 4:00:54 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<link href="<c:url value="/resources/css/news-feed.css"/>" rel="stylesheet"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
      crossorigin="anonymous">

<div class="container" style="padding-top: 70px;">
    <div class="el-header" style="padding-top: 50px;padding-bottom: 30px;">
        <div id="company">
            <div class="mb-4">
                <div style="flex-direction: column;width: 55%;margin: 0 auto;margin-bottom: 60px;">
                    <form method="post" class="search-company my-2 my-lg-0" style="display: flex;">
                        <input name="company" value="${company}" type="search" class="form-control search-ccom" placeholder="Tìm tên công ty/doanh nghiệp" required="true" style=" width: 95%;font-size: 0.9em;font-weight: 500;">
                        <button class="search-employer">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
                <div class="row no-gutters" style="">
                    <c:forEach items="${companies}" var="c">
                        <div class="col-md-4 col-sm-4 col-xs-12 md-clearfix sm-clearfix elmemts-card">     
                            <article class="elm-company-body" style="min-height: 350px;">
                                <div class="companyLogo">
                                    <div class="elm-company-image flex-middle">
                                        <a href="<spring:url value="/company/${c.id}" />">
                                            <img src="<spring:url value="${c.logo}" />" class="imgLogo">
                                        </a>                                   
                                    </div>
                                </div>
                                <div class="elm-company-name">
                                    <h5 class="text-center">
                                        <a href="<spring:url value="/company/${c.id}" />">${c.companyName}</a>
                                    </h5>
                                </div>                               
                            </article>
                        </div> 
                    </c:forEach>                   
                </div>                     
            </div>
        </div>  
    </div>
</div>