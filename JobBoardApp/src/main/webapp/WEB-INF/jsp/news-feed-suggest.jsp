<%-- 
    Document   : news-feed
    Created on : Apr 17, 2021, 2:31:13 AM
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

<div class="container-fluid" style="padding-top: 70px;">
    <script src="<c:url value="/js/news-feed.js" />"></script>
    <br/>

    <div class="row body" >
        <!-- LEFT -->
        <div class="col-md-8 body-left">

            <!-- LEFT-NAV-BAR -->                  
            <ul class="nav justify-content-center ">
                <li class="nav-item">
                    <a id="nav-recent" class="nav-link text-warning" 
                       href="<spring:url value="/news-feed/${pageContext.request.userPrincipal.name}/" />">
                        <h5 class="text-warning text-center" >ALL POSTS</h5>
                    </a>
                </li>

                <c:forEach items="${jobtypes}" var="jobtypes">
                    <li class="nav-item">
                        <a id="nav-recent" class="nav-link text-warning "
                           style="text-transform: uppercase"
                           href="<spring:url value="/news-feed/${pageContext.request.userPrincipal.name}/?jobtype_id=${jobtypes.id}" />">
                            <h5 class="text-warning text-center" >${jobtypes.name}</h5></a>
                    </li>
                </c:forEach>


            </ul>
            <br/>
            <!-- LEFT-LIST-CARDS-BY-JOB-TYPES -->  
            <!-- RECENT -->
            <div id="recentArea">
                <c:choose>
                    <c:when test="${not empty posts}">
                        <c:forEach items="${posts}" var="post">
                            <div class="card mb-4">
                                <div class="row no-gutters ">
                                    <div class="col-md-3">
                                        <a href="<spring:url value="/posts/${post[0]}" />">
                                            <img src="<spring:url value="${post[3]}" />"
                                                 class="card-img" alt="..."
                                                 style="padding: 10px;"/>
                                        </a>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="card-body">
                                            <a href="<spring:url value="/posts/${post[0]}"/>" class="card-body-name">
                                                ${post[2]}
                                            </a>                 
                                            <div class="card-text" style="padding-top: 10px;">
                                                <img class="card-sub-item subcard-img" src="<c:url value="/resources/images/iconPosition01.png"/>" alt="alt"/>
                                                <a href="<spring:url value="/posts/${post[0]}"/>" class="card-sub-item">${post[7]} - ${post[6]}</a>
                                            </div>
                                            <div class="card-text">
                                                <img class="card-sub-item subcard-img" src="<c:url value="/resources/images/iconAddress03.png"/>" alt="alt"/>
                                                <p class="card-sub-item ">${post[4]}, ${post[5]}</p>
                                            </div>

                                            <div class="card-text">
                                                <img class="card-sub-item subcard-img" src="<c:url value="/resources/images/iconSalary02.png"/>" alt="alt"/>
                                                <p class="card-sub-item"><fmt:formatNumber type="number" value="${post[1]}" /> VN??</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>     
                    </c:when>
                    <c:when test="${empty posts}">
                        <div class="text-center">
                            <h6 style="font-weight: bold;"><i>Kh??ng t??m th???y b??i post ph?? h???p!</i></h6>
                        </div>
                    </c:when>      
                </c:choose>
            </div>              
        </div>  

        <!-- FINISH LEFT -->                                           
        <!-- RIGHT -->
        <div class="col-md-4 body-right" >
            <h5 class="text-warning text-center body-right-title" >FILTER</h5>
            <!-- Add search bar for employee-->               
            <form:form method="post" 
                       class="form-group text-center border border-jobs-search"
                       >
                <div class="row form-group">
                    <label class="col-md-3">Khu v???c</label>
                    <select 
                        name="areaId"
                        class="col-md-9 form-control border border-warning " >
                        <c:forEach items="${areas}" var="area">
                            <option selected value="${area.id}">${area.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="row form-group">
                    <label class="col-md-3">L??nh v???c</label>
                    <select name="majorId" class="col-md-9 form-control border border-warning " >
                        <c:forEach items="${majors}" var="major">
                            <option selected value="${major.id}">${major.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="row form-group">
                    <label class="col-md-3">T??n c??ng ty</label>
                    <input name="companyName" value="${companyName}" class="col-md-9 form-control border border-warning" placeholder="..."/>
                </div>
                <div class="row form-group">
                    <label class="col-md-3">H??nh th???c</label>
                    <select name="jobtypeId" class="col-md-9 form-control border border-warning " >
                        <c:forEach items="${jobtypes}" var="jt">
                            <option selected value="${jt.id}">${jt.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="row form-group">
                    <label class="col-md-3">Salary From</label>
                    <input name="fromSalary" value="${fromSalary}" class="col-md-9 form-control border border-warning" placeholder="from ..."/>
                </div>
                <div class="row form-group">
                    <label class="col-md-3">To</label>
                    <input name="toSalary" value="${toSalary}" min="0" type="number" class="col-md-9 form-control border border-warning" placeholder="to ..."/>
                </div>
                <div class="text-center">
                    <input type="submit" class="btn btn-warning " value="T??m ki???m"/>
                </div>
            </form:form>


            <h5 class="text-warning text-center" style="padding-top: 15px">SUGGEST FOR YOU</h5>
            <div class="border border-jobs-search">
                <div class="sugInsideDiv">
                    <form:form method="post">
                        <div class="row form-group" style="display: none">
                            <c:forEach items="${employees}" var="e">
                                <input name="majorSuggestId" value="${e[15]}"  type="text"/>
                            </c:forEach>
                        </div>
                        <div class="form-group sugMajor">
                            <input type="submit" class="btn btn-warning sugChoices " value="THEO NG??NH NGH???"/>
                        </div>
                    </form:form>

                    <form:form method="post">
                        <div class="row form-group" style="display: none">
                            <c:forEach items="${employees}" var="e">
                                <input name="areaSuggestId" value="${e[16]}"  type="text"/>
                                <input name="majorSuggestId" value="${e[15]}"  type="text"/>
                            </c:forEach>
                        </div>
                        <div class=" form-group sugMajor">
                            <input type="submit" class="btn btn-warning sugChoices" value="THEO KHU V???C"/>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
    <script src="<c:url value="/js/news-feed.js" />"></script>
</div>
