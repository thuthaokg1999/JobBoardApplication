<%-- 
    Document   : statis
    Created on : May 14, 2021, 1:23:23 AM
    Author     : Dy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
      crossorigin="anonymous">
<div class="container statis" style="padding-top: 70px;">
    <h4 class="text-center" style="margin-top: 40px;margin-bottom: 15px">THỐNG KÊ BÁO CÁO</h4>
    <form:form method="post">
        <div class="row">
            <div class="col-md-5 form-group">
                <label>Từ ngày</label>
                <input type="date" name="fromDate" class="form-control  border border-warning" />
            </div>
            <div class="col-md-5 form-group">
                <label>Đến ngày</label>
                <input type="date" name="toDate" class="form-control  border border-warning" />
            </div>
            <div class="col-md-2" style="padding-top: 32px;">
                <input type="submit" value="Thống kê" class="form-control btn btn-warning" />
            </div>
        </div>
    </form:form>
</div>
<br>
<div class="container">
    <table class="table"> 
        <!--<h6>Thống kê số lượng ứng viên ứng tuyển vào bài post</h6>-->
        <tr>
            <th>Mã post</th>
            <th>Tên nhà ứng tuyển</th>
            <th>Vị trí tuyển</th>
            <th>Ngày đăng bài</th>
            <th class="text-center">Số lượng người apply </th>
        </tr>
        <tbody id="statsId">
            <c:forEach items="${statis}" var="v">
                <tr>
                    <td>${v[0]}</td>
                    <td>${v[3]}</td>     
                    <td>${v[4]}</td>
                    <td><fmt:parseDate value="${v[1]}" pattern="yyyy-MM-dd"/></td>
                    <td style="padding-left: 70px;">${v[2]}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<div class="container">
    <canvas id="myChart" width="200" height="100"></canvas>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.1.0/dist/chart.min.js">

</script>

<script>
    let d = [];
    let l = [];
    <c:forEach items="${statis}" var="c">
    l.push("Mã post: " + ${c[0]});
    d.push(${c[2]});
    </c:forEach>


    console.info(d);
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: l,
            datasets: [{
                    label: 'Số lượng ứng viên ứng tuyển vào bài post',
                    data: d,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
