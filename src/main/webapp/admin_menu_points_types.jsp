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
        <button formmethod="get" formaction="/admin/cafe" class="btn btn-danger">Кафе</button>
        <button formmethod="get" formaction="/admin/pharmacy" class="btn btn-info" >Аптеки</button>
        <button formmethod="get" formaction="/admin/beauty" class="btn btn-warning">Салоны красоты</button>
        <button formmethod="get" formaction="/admin/food" class="btn btn-success" >Продукты</button>
        <button formmethod="get" formaction="/admin/clothes" class="btn btn-primary" >Одежда</button>
    </form>
</h2>
</html>
