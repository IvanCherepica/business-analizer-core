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
    <h1>Панель администратора</h1>
    <div class="container">
        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Добавить</button>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Добавить новое направление бизнеса</h4>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.servletContext.contextPath}/admin/business" method="POST">
                            <div class="field">
                                <label for="name">Название:</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="field">
                                <label for="crd">Теги для поиска:</label>
                                <input type="text" class="form-control" id="crd" name="searchTags" required>
                            </div>
                            <div class="form-group">
                                <label for="population">Иконка:</label>
                                <input type="text" class="form-control" id="population" name="link">
                            </div>
                            <button type="submit" class="btn btn-danger">Добавить</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Отменить</button>
                        </form>
                    </div>
                </div>

            </div>
        </div>

        <div align="left">
            <table class = "table table-bordered" style="width: 60%; box-shadow: 0 1px 9px rgba(0,0,0,.1);" >
                <div style="text-align: left">
                    <caption><h2>Направления бизнеса</h2></caption>
                </div>

                <thead>
                <tr class="info">
                    <th>Название</th>
                    <th>Теги для поиска</th>
                    <th>Иконка</th>
                    <th>Опции</th>
                </tr>
                </thead>
                <c:forEach items="${bizTypes}" var="biztype" >
                    <tbody >
                    <tr>
                        <td>${biztype.name}</td>
                        <td>${biztype.searchTags}</td>
                        <td>${biztype.link}</td>
                        <td>

                            <a href="${pageContext.servletContext.contextPath}/admin/business/edit?id=${biztype.id}" class="btn btn-default" role="button">Изменить</a>
                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal${biztype.id}">Удалить</button>

                            <!-- Modal -->
                            <div class="modal fade" id="myModal${biztype.id}" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Удалить все связанные точки?</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form action="${pageContext.servletContext.contextPath}/admin/business/delete" method="GET">
                                                <input type="hidden" name="id" value="${biztype.id}">
                                                <button type="submit" class="btn btn-danger">Да</button>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Нет</button>
                                            </form>
                                        </div>
                                    </div>

                                </div>
                            </div>



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