<%@ page language="java" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<%@ include file="admin_menu_header.jsp" %>
<body>
<%@ include file="admin_menu_entity.jsp" %>
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
                <th>Longitude</th>
                <th>Latitude</th>
                <th>Business type</th>
                <th>Options</th>
            </tr>
            </thead>
            <tbody >
            <form action="${pageContext.servletContext.contextPath}/admin/point/edit" method="POST">
                <input type="hidden" name="id" value="${point.id}">
                <input type="hidden" name="link" value="${point.bizType.link}">
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
                            <input type="number" id="typeId" name="typeId" min="1" max="5" value="${point.bizType.id}" />
                        </div>
                    </td>
                    <td>
                        <div class="submit">
                            <input type="submit" align="center" class="btn btn-default" value="Submit"/>
                        </div>
                    </td>
                </tr>

            </form>

            </tbody>

        </table>
    </div>
</div>
</body>
</html>