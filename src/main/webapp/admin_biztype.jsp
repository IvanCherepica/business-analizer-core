<%@ page language="java" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Buseness analyzer</title>
    <link rel="shortcut icon" href="/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="bello-bootstrap-ui.min.css">
</head>
<body>
<h1>Admin panel</h1>
<div align="left">
    <table class = "table table-bordered">
        <caption><h2>List of Business Types</h2></caption>
        <thead>
        <tr class="info">
            <th>Name</th>
            <th>Options</th>
        </tr>
        </thead>
        <c:forEach items="${bizTypes}" var="bizType" >
            <tbody >
            <tr>
                <td>${bizType.getName()}</td>
                <td>
                    <a href="${pageContext.servletContext.contextPath}/admin/business/edit?id=${bizType.getId()}">Edit</a>
                    <a href="${pageContext.servletContext.contextPath}/admin/business/delete?id=${bizType.getId()}">Delete</a>
                </td>
            </tr>
            </tbody>
        </c:forEach>
    </table>
</div>
</body>
</html>