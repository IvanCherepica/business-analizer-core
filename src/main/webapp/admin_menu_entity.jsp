<%--
  Created by IntelliJ IDEA.
  User: APerevoznikova
  Date: 14.02.2019
  Time: 0:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<div class="container-fluid" style="position: fixed;
    top: 0;
    left: 0%;
    width: 100%;
    height: 100%;
   ">
    <div class="left-sidebar">
        <div class = "bar-text">
            <form>
                <h1>Entity</h1>
                <button formmethod="get" formaction="/admin/business" class="new">Business</button>
                <button formmethod="get" formaction="/admin/districts" class="new">Districts</button>
                <button formmethod="get" formaction="/admin/point" name="typeId" value="0" class="new">Points</button>
            </form>
            <form>
                <button formmethod="get" formaction="/user/map" class="btn btn-default">GO TO MAP</button>
            </form>
        </div>
    </div>
</div>
</html>
