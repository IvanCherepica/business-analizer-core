<%--
  Created by IntelliJ IDEA.
  User: APerevoznikova
  Date: 13.02.2019
  Time: 23:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<div class="container-fluid" style="position: absolute;
    top: 0;
    left: 10%;
    width: 80%;
    height: 100%;
   ">
    <h1>Панель администратора</h1>
    <div class="container">
        <%@ include file="admin_menu_points_types.jsp" %>

        <div align="left">
            <table class = "table table-bordered">
                <caption><h2>Представители бизнес направления</h2></caption>
                <thead>
                <tr class="info">
                    <th>Название</th>
                    <th>Адрес</th>
                    <th>Координаты</th>
                    <th>Направление бизнеса</th>
                    <th>Опции</th>
                </tr>
                </thead>
                <c:forEach items="${points}" var="point" >
                    <tbody >
                    <tr>
                        <td>${point.name}</td>
                        <td>${point.addres}</td>
                        <td>${point.longitude}/${point.latitude}</td>
                        <td>${point.bizType.name}</td>
                        <td width="10%"
                            style="white-space: nowrap;
                                    overflow: hidden;
                                    text-overflow: ellipsis;
                                    max-width: 25vw;">
                            <a href="${pageContext.servletContext.contextPath}/admin/point/edit?id=${point.id}" name="link" value="${point.bizType.link}" class="btn btn-default" role="button">Изменить</a>
                            <a href="${pageContext.servletContext.contextPath}/admin/point/delete?id=${point.id}&typeId=${point.bizType.id}" class="btn btn-default" role="button">Удалить</a>
                        </td>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</html>
