<%@ page language="java" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<%@ include file="admin_menu_header.jsp" %>
<body>
<%@ include file="admin_menu_entity.jsp" %>
<div class="container-fluid" style="position: absolute;
    top: 0;
    left: 20%;
    width: 80%;
    height: 100%;
   ">
    <h1>Admin panel</h1>
    <div align="left">
        <table class = "table table-bordered" style="width: 60%; box-shadow: 0 1px 9px rgba(0,0,0,.1);" >
            <caption><h2>List of Business types</h2></caption>

            <div style="text-align: right">
                <div class="container">
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Add</button>

                    <!-- Modal -->
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Add new business type</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="${pageContext.servletContext.contextPath}/admin/business" method="POST">
                                        <div class="field">
                                            <label for="name">Name:</label>
                                            <input type="text" class="form-control" id="name" name="name">
                                        </div>
                                        <div class="field">
                                            <label for="crd">SearchTags:</label>
                                            <input type="text" class="form-control" id="crd" name="searchTags">
                                        </div>
                                        <div class="form-group">
                                            <label for="population">Link:</label>
                                            <input type="text" class="form-control" id="population" name="link">
                                        </div>
                                        <button type="submit" class="btn btn-danger">Add</button>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

            <thead>
            <tr class="info">
                <th>Name</th>
                <th>Tags for searching</th>
                <th>Link</th>
                <th>Options</th>
            </tr>
            </thead>
            <c:forEach items="${bizTypes}" var="biztype" >
                <tbody >
                <tr>
                    <td>${biztype.name}</td>
                    <td>${biztype.searchTags}</td>
                    <td>${biztype.link}</td>
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