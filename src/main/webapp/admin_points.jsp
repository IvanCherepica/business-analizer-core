<%@ page language="java" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Business analyzer</title>
    <link rel="shortcut icon" href="/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="bello-bootstrap-ui.min.css">
</head>
<body>
<h1>Admin panel</h1>
<h2 align="left">
    <form>
        <button formmethod="get" formaction="/admin/cafe" class="btn btn-danger">Кафе</button>
        <button formmethod="get" formaction="/admin/points" class="btn btn-info" >Аптеки</button>
        <button formmethod="get" formaction="/admin/beauty" class="btn btn-warning">Салоны крассоты</button>
        <button formmethod="get" formaction="/admin/food" class="btn btn-success" >Продукты</button>
        <button formmethod="get" formaction="/admin/clothes" class="btn btn-primary" >Одежда</button>
    </form>
</h2>

<div align="left">
    <table class = "table table-bordered">
        <caption><h2>List of Points</h2></caption>
        <thead>
        <tr class="info">
            <th>Name</th>
            <th>Address</th>
            <th>Сoordinate</th>
            <th>Business type</th>
            <th>Options</th>
        </tr>
        </thead>
        <c:forEach items="${points}" var="point" >
            <tbody >
            <tr>
                <td>${point.getName()}</td>
                <td>${point.getAddres()}</td>
                <td>${point.getLongitude()}/${point.getLatitude()}</td>
                <td>${point.getTypeId()}</td>
                <td>
                    <a href="${pageContext.servletContext.contextPath}/admin/points/edit?id=${point.getId()}">Edit</a>
                    <a href="${pageContext.servletContext.contextPath}/admin/points/delete?id=${point.getId()}">Delete</a>
                        <%--<button type="button" class="btn btn-defaul" href="${pageContext.servletContext.contextPath}/admin/points/edit?id=${point.getId()}">Edit</button>--%>
                        <%--<button type="button" class="btn btn-defaul" href="${pageContext.servletContext.contextPath}/admin/points/delete?id=${point.getId()}">Delete</button>--%>
                </td>
            </tr>
            </tbody>
        </c:forEach>
    </table>
</div>
</body>
</html>