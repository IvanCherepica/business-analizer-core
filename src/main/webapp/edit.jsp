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
    <h2 align="left">
        <form>
            <button formmethod="get" formaction="/admin/cafe" class="btn btn-danger">Кафе</button>
            <button formmethod="get" formaction="/admin" class="btn btn-info" >Аптеки</button>
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
            <th>Longitude</th>
            <th>Latitude</th>
            <th>Business type</th>
            <th>Options</th>
        </tr>
        </thead>

        <tbody >
        <tr>
            <td>
                <div class="field">
                    <label for="name"></label>
                    <input type="text" id="name" name="name" value="${point.name}" />
                </div>
            </td>
            <td>
                <div class="field">
                    <label for="addres"></label>
                    <input type="text" id="addres" name="addres" value="${point.addres}" />
                </div>
            </td>
            <td>
                <div class="field">
                    <label for="longitude"></label>
                    <input type="text" id="longitude" name="longitude" value="${point.longitude}" />
                </div>

            </td>

            <td>
                <div class="field">
                    <label for="latitude"></label>
                    <input type="text" id="latitude" name="latitude" value="${point.latitude}" />
                </div>

            </td>

            <td>
                <div class="field">
                    <label for="typeId"></label>
                    <input type="text" id="typeId" name="name" value="${point.typeId}" />
                </div>
            </td>

            <td>
                <div class="submit">
                    <input type="submit" align="center" value="Submit"/>
                </div>
            </td>
        </tr>

        <%--<form action="${pageContext.servletContext.contextPath}/admin/edit" method="POST">--%>
            <%--<input type="hidden" name="id" value="${user.id}">--%>

            <%--&lt;%&ndash;<div class="field">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<label for="uName">Username:</label>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<input type="text" id="uName" name="name" value="${user.name}" />&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--<div class="field">--%>
                <%--<label for="uPass">Password:</label>--%>
                <%--<input type="text" id="uPass" name="password" value="${user.password}" />--%>
            <%--</div>--%>
            <%--<div class="field">--%>
                <%--<label for="uRole">Role:</label>--%>
                <%--<input type="text" id="uRole" name="role" value="${user.role}" />--%>
            <%--</div>--%>
            <%--<div class="submit">--%>
                <%--<input type="submit" align="center" value="Submit"/>--%>
            <%--</div>--%>

        <%--</form>--%>

        </tbody>

    </table>
</div>
</body>
</html>