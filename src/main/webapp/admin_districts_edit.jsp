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
            <caption><h2>List of Districts</h2></caption>
        <thead>
        <tr class="info">
            <th>Name</th>
            <th>Longitude</th>
            <th>Latitude</th>
            <th>Options</th>
        </tr>
        </thead>

        <tbody >

        <form action="${pageContext.servletContext.contextPath}/admin/districts/edit" method="POST">
            <input type="hidden" name="id" value="${district.id}">
            <tr>
                <td>
                    <div class="field">
                        <label for="name"></label>
                        <input type="text" id="name" name="name" value="${district.name}" />
                    </div>
                </td>
                <td>
                    <div class="field">
                        <label for="longitude"></label>
                        <input type="text" id="longitude" name="longitude" value="${district.longitude}" />
                    </div>

                </td>

                <td>
                    <div class="field">
                        <label for="latitude"></label>
                        <input type="text" id="latitude" name="latitude" value="${district.latitude}" />
                    </div>

                </td>

                <td>
                    <div class="submit">
                        <input type="submit" align="center" value="Submit"/>
                    </div>
                </td>
            </tr>

        </form>
        </tbody>
    </table>
</div>
</body>
</html>