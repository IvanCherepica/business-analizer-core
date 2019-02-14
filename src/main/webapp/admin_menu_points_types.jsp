<%--
  Created by IntelliJ IDEA.
  User: APerevoznikova
  Date: 13.02.2019
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<h2 align="left">
    <form>
        <c:forEach items="${biztypes}" var="biztype" >
            <button formmethod="get" formaction="/admin/point/${biztype.link}" class="btn btn-light">${biztype.name}</button>
        </c:forEach>
    </form>
</h2>
</html>
