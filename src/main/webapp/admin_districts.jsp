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
    <div class="container">
        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Add</button>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add new district</h4>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.servletContext.contextPath}/admin/districts" method="POST">
                            <div class="field">
                                <label for="name">Name:</label>
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                            <div class="field">
                                <label for="crd">Coordinates:</label>
                                <input type="text" class="form-control" id="crd" name="crd">
                            </div>
                            <div class="form-group">
                                <label for="population">Population:</label>
                                <input type="text" class="form-control" id="population" name="population">
                            </div>
                            <div class="form-group">
                                <label for="area">Area:</label>
                                <input type="text" class="form-control" id="area" name="area">
                            </div>
                            <button type="submit" class="btn btn-danger">Add</button>
                        </form>
                    </div>
                </div>

            </div>
        </div>

        <div align="left">
            <table class = "table table-bordered">
                <div style="text-align: left">
                    <caption ><h2>List of Districts</h2></caption>
                </div>

                <thead>
                    <tr class="info">
                        <th>Name</th>
                        <th>Coordinates</th>
                        <th>Area</th>
                        <th>Population</th>
                        <th>Options</th>
                    </tr>
                </thead>
                <c:forEach items="${districts}" var="district" >
                    <tbody >
                    <tr>
                        <td>${district.name}</td>
                        <td width="25%"
                            style="white-space: nowrap;
                                        overflow: hidden;
                                        text-overflow: ellipsis;
                                        max-width: 25vw;">${district.coordinates}</td>
                        <td>${district.area}</td>
                        <td>${district.population}</td>
                        <td width="10%"
                            style="white-space: nowrap;
                                        overflow: hidden;
                                        text-overflow: ellipsis;
                                        max-width: 25vw;">
                            <a href="${pageContext.servletContext.contextPath}/admin/districts/edit?id=${district.id}"
                                    class="btn btn-default" role="button">Edit</a>
                            <a href="${pageContext.servletContext.contextPath}/admin/districts/delete?id=${district.id}"
                                    class="btn btn-default" role="button">Delete</a>
                        </td>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
</div>

</body>
</html>