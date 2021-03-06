<%-- 
    Document   : post
    Created on : Apr 27, 2021, 5:17:31 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<link href="<c:url value="/resources/css/post.css"/>" rel="stylesheet"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
      crossorigin="anonymous">

<div class="container-fluid" style="padding-top: 70px;">
    <div class="post-area" style="margin-left: 0; padding-left: 30px">
        <h2 class="text-center text-warning" style="position: relative">Post Information</h2><hr/>

        <spring:url value="/post/${pageContext.request.userPrincipal.name}" var="action" />
        <form:form action="${action}" modelAttribute="addPost" method="post" class="post-form" enctype="multipart/form-data">
            <form:errors path="*" cssClass="alert alert-danger" element="div" />
            <div class="row">
                <div class="col-md-3 text-center" style="border-right: 1px solid rgba(0,0,0,.125);">
                    <c:forEach items="${employers}" var="e">
                        <img src="<spring:url value="${e[2]}" />"  width="200" height="200" alt="Logo"/>
                        </br><br/>
                        <a class="text-center text-warning" href="#"><h4>${e[1]}</h4></a>
                        <div style="display: none;">
                            <form:input path="employer.id" type="number" min="0" step="1" value="${e[0]}"/> 
                        </div>

                    </c:forEach>

                </div>
                <div class="col-md-9 right-post-area">
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label>L??nh v???c</label>

                            <form:select path="major.id" class="form-control border border-warning " required="true">
                                <form:options items="${majors}"  
                                              itemLabel="name"
                                              itemValue="id" />

                            </form:select>
                        </div>
                        <div class="form-group col-md-6">
                            <label>V??? tr?? tuy???n</label>
                            <form:select path="position.id" class="form-control border border-warning " required="true">
                                <form:options items="${positions}"  
                                              itemLabel="name"
                                              itemValue="id" />

                            </form:select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label>Ng??y b???t ?????u tuy???n</label>
                            <form:input class="form-control border border-warning " 
                                        type="date" required="true"                                                       
                                        oninvalid="this.setCustomValidity('Vui l??ng ch???n n??m sinh!')"
                                        oninput="setCustomValidity('')"
                                        path="createPost"/>

                        </div>
                        <div class="form-group col-md-6">
                            <label>H???n ch??t ???ng tuy???n</label>
                            <form:input class="form-control border border-warning " 
                                        type="date" required="true"                                                       
                                        oninvalid="this.setCustomValidity('Vui l??ng ch???n n??m sinh!')"
                                        oninput="setCustomValidity('')"
                                        path="finishPost"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label>H??nh th???c</label>
                            <form:select path="jobTypes.id" class="form-control border border-warning " required="true">
                                <form:options items="${jobtypes}"  
                                              itemLabel="name"
                                              itemValue="id" />

                            </form:select>
                        </div>
                        <div class="form-group col-md-6">
                            <label>S??? l?????ng tuy???n</label>
                            <form:input class="form-control border border-warning " 
                                        type="number" maxlength="25" placeholder="3" min="0"
                                        required="true"
                                        oninvalid="this.setCustomValidity('Vui l??ng nh???p s??? l?????ng!')"
                                        oninput="setCustomValidity('')"
                                        path="quantity"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label>Khu v???c</label>
                            <form:select path="area.id" class="form-control border border-warning " required="true">
                                <form:options items="${areas}"  
                                              itemLabel="name"
                                              itemValue="id" />

                            </form:select>
                        </div>                      
                        <div class=" col-md-6">
                            <div class="row">
                                <div class="col-md-9">
                                    <div class="form-group">
                                        <label>L????ng</label>
                                        <form:input class="form-control border border-warning " 
                                                    type="number"  placeholder="10000000" min="0"
                                                    required="true"
                                                    oninvalid="this.setCustomValidity('Vui l??ng nh???p m???c l????ng!')"
                                                    oninput="setCustomValidity('')"
                                                    path="salary"/>
                                    </div>     
                                </div>
                                <div class="col-md-3"> 
                                    <div class="form-group">
                                        <label>????n v???</label>
                                        <input class="form-control border border-warning " 
                                               type="text"  value="VN??" readonly="true"/>
                                    </div>
                                </div>
                            </div>   
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Th??ng tin kh??i qu??t v??? v??? tr?? c???n tuy???n</label>
                        <form:textarea id="id" name="name" rows="5" cols="10"
                                       class="form-control border border-warning"
                                       required="true"
                                       oninvalid="this.setCustomValidity('Vui l??ng nh???p th??ng tin!')"
                                       oninput="setCustomValidity('')" path="description"></form:textarea>
                        </div>
                        <div class="form-group">
                            <label>Y??u c???u c??ng vi???c</label>
                        <form:textarea id="id" name="name" rows="5" cols="10"
                                       class="form-control border border-warning"
                                       required="true"
                                       oninvalid="this.setCustomValidity('Vui l??ng nh???p th??ng tin!')"
                                       oninput="setCustomValidity('')" path="requirements"></form:textarea>
                        </div>
                        <div class="text-right">
                            <input type="submit" class="btn btn-warning"  value="Post" />
                        </div>   
                    </div>
                </div>
            </div>
    </form:form>
</div>




