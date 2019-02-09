<%@ page language="java" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Buseness analyzer</title>
    <link rel="shortcut icon" href="/favicon.png" type="image/x-icon">
</head>
<body>
<center>
    <h1>Admin panel</h1>
    <h2>
        <a href="${pageContext.request.contextPath}/admin">Apteki</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Points</h2></caption>
        <tr>
            <th>Name</th>
            <th>Adress</th>
            <th>Сoordinate</th>
            <th>Buseness tipe</th>
        </tr>
        <c:forEach items="${points}" var="user" varStatus="status">
            <tr>
                <td>${points.getName}</td>
                <td>${points.getAddres}</td>
                <td>${points.getLongitude}/${points.getLatitude}</td>
                <td>${points.getTypeId}</td>
                <td>
                    <a href="${pageContext.servletContext.contextPath}/admin/edit?id=${points.getTypeId}">Edit</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="${pageContext.servletContext.contextPath}/admin/delete?id=${points.getTypeId}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>