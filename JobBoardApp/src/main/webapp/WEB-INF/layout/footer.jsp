<%-- 
    Document   : footer
    Created on : Apr 14, 2021, 6:01:14 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="<c:url value="/resources/css/footer.css"/>" rel="stylesheet"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
      crossorigin="anonymous">

<!-- Site footer -->
<footer class="site-footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12 col-md-6">
                <h6>Something about us</h6>
                <p class="text-justify">Job Boards <i>FINDING A JOB EASILY THAN EVER </i>
                    is an initiative  to help you can find a job that you think it's the most suitable for you.
                    Job Boards focuses on providing a lot of post of job from a lot of great company. </p>
                <p class="text-justify">   Let's explore our website!</p>
            </div>

           
            <div class="col-xs-6 col-md-3">
                <h6>Quick Information</h6>
                <ul class="footer-links">
                    <li><a href="#">Email: jobboards@gmail.com</a></li>
                    <li><a href="#">Phone: (+84) 123 123 123</a></li>
                    <li><a href="#">Office Address: 123 Nguyen Kiem St, Go Vap District, Ho Chi Minh City</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                </ul>
            </div>
            
             <div class="col-xs-6 col-md-3">
                <h6>BAR</h6>
                <ul class="footer-links">
                    <li><a href="<spring:url value="/" />">Home</a></li>
                    <li><a href="<spring:url value="/news-feed/" />">News feed</a></li>
                    <li><a href="<spring:url value="/sign-in/" />">Log In</a></li>
                    <li><a href="<spring:url value="/sign-up/" />">Register</a></li>
                </ul>
            </div>

        </div>
        <hr>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-sm-6 col-xs-12 ">
                <p class="copyright-text" style="">Copyright &copy; 2021 All Rights Reserved by 
                    <a href="<spring:url value="/" />">JobBoards</a>.
                </p>
            </div>

            <div class="col-md-4 col-sm-6 col-xs-12">
                <ul class="social-icons">
                    <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
                    <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>   
                </ul>
            </div>
        </div>
    </div>
</footer>