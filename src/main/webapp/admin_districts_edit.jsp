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

    <div align="left">
        <table class = "table table-bordered">
            <caption><h2>List of Districts</h2></caption>
        <thead>
        <tr class="info">
            <th>Name</th>
            <th>Coordinates</th>
            <th>Area</th>
            <th>Population</th>
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
                        <label for="crd"></label>
                        <input type="text" id="crd" name="crd" value="${district.coordinates}" />
                    </div>

                </td>

                <td>
                    <div class="field">
                        <label for="area"></label>
                        <input type="text" id="area" name="area" value="${district.area}" />
                    </div>

                </td>

                <td>
                    <div class="field">
                        <label for="population"></label>
                        <input type="text" id="population" name="population" value="${district.population}" />
                    </div>

                </td>

                <td>
                    <div class="submit">
                        <input type="submit" align="center" class="btn btn-default" role="button" value="Submit"/>
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