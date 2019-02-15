<%--
  Created by IntelliJ IDEA.
  User: APerevoznikova
  Date: 13.02.2019
  Time: 23:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<div class="container-fluid" style="position: absolute;
    top: 0;
    left: 10%;
    width: 80%;
    height: 100%;
   ">
    <h1>Admin panel</h1>
    <%@ include file="admin_menu_points_types.jsp" %>

    <div align="left">
        <table class = "table table-bordered">
            <caption><h2>List of Points</h2></caption>
            <thead>
            <tr class="info">
                <th>Name</th>
                <th>Address</th>
                <th>Coordinate</th>
                <th>Type</th>
                <th>Options</th>
            </tr>
            </thead>
            <c:forEach items="${points}" var="point" >
                <tbody >
                <tr>
                    <td>${point.name}</td>
                    <td>${point.addres}</td>
                    <td>${point.longitude}/${point.latitude}</td>
                    <td>${point.bizType.name}</td>
                    <td width="10%"
                        style="white-space: nowrap;
                                overflow: hidden;
                                text-overflow: ellipsis;
                                max-width: 25vw;">
                        <a href="${pageContext.servletContext.contextPath}/admin/point/edit?id=${point.id}" name="link" value="${point.bizType.link}" class="btn btn-default" role="button">Edit</a>
                        <a href="${pageContext.servletContext.contextPath}/admin/point/delete?id=${point.id}&typeId=${point.bizType.id}" class="btn btn-default" role="button">Delete</a>
                    </td>
                </tr>
                </tbody>
            </c:forEach>
        </table>
    </div>
</div>
</html>
