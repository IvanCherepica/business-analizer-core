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
            <caption><h2>List of Business types</h2></caption>
            <thead>
            <tr class="info">
                <th>Name</th>
                <th>Tags for searching</th>
                <th>Options</th>
            </tr>
            </thead>
            <c:forEach items="${bizTypes}" var="biztype" >
                <tbody >
                <tr>
                    <td>${biztype.name}</td>
                    <td>${biztype.searchTags}</td>
                    <td>
                        <a href="${pageContext.servletContext.contextPath}/admin/business/edit?id=${biztype.id}" class="btn btn-default" role="button">Edit</a>
                        <a href="${pageContext.servletContext.contextPath}/admin/business/delete?id=${biztype.id}" class="btn btn-default" role="button">Delete</a>
                    </td>
                </tr>
                </tbody>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>