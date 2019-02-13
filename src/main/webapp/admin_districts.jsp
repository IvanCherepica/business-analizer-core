<%@ page language="java" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<%@ include file="admin_menu_header.jsp" %>
<body>

<div class="container">
     <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
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
</div>

<div class="container-fluid">
    <div class="left-sidebar">
        <div class = "bar-text">
            <form>
                <h1>Entity</h1>
                <button formmethod="get" formaction="/admin/business" class="new">Business</button>
                <button formmethod="get" formaction="/admin/districts" class="new">Districts</button>
                <button formmethod="get" formaction="/admin/cafe" class="new">Points</button>
            </form>
        </div>
    </div>
</div>

<div class="container-fluid" style="position: absolute;
    top: 0;
    left: 10%;
    width: 80%;
    height: 100%;
   ">
    <h1>Admin panel</h1>
        <div align="left">
            <table class = "table table-bordered">
                <caption ><h2>List of Districts</h2></caption>
                <div style="text-align: right">
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Add</button>
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
                    <td>${district.getName()}</td>
                    <td>${district.getCoordinates().substring(0,50).concat("...")}</td>
                    <td>${district.getArea()}</td>
                    <td>${district.getPopulation()}</td>
                    <td>
                        <a href="${pageContext.servletContext.contextPath}/admin/districts/edit?id=${district.getId()}"
                                class="btn btn-default" role="button">Edit</a>
                        <a href="${pageContext.servletContext.contextPath}/admin/districts/delete?id=${district.getId()}"
                                class="btn btn-default" role="button">Delete</a>
                    </td>
                </tr>
                </tbody>
            </c:forEach>
            </table>
        </div>
</div>
</body>
</html>