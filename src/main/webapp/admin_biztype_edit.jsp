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

    <div align="left">
        <table class = "table table-bordered">
            <caption><h2>Направления бизнеса</h2></caption>
            <thead>
            <tr class="info">
                <th>Названия</th>
                <th>Теги для поиска</th>
                <th>Иконка</th>
                <th>Опции</th>
            </tr>
            </thead>
            <tbody >
            <form action="${pageContext.servletContext.contextPath}/admin/business/edit" method="POST">
                <input type="hidden" name="id" value="${bizType.id}">
                <tr>
                    <td>
                        <div class="field">
                            <label for="name"></label>
                            <input type="text" id="name" name="name" value="${bizType.name}" />
                        </div>
                    </td>
                    <td>
                        <div class="field">
                            <label for="name"></label>
                            <input type="text" id="searchTags" name="searchTags" value="${bizType.searchTags}" />
                        </div>
                    </td>
                    <td>
                        <div class="field">
                            <label for="name"></label>
                            <input type="text" id="link" name="link" value="${bizType.link}" />
                        </div>
                    </td>
                    <td>
                        <div class="submit">
                            <input type="submit" align="center" class="btn btn-default" role="button" value="Ввести и обновить базу"/>
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