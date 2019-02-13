<%@ page language="java" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Business analyzer</title>
    <link rel="shortcut icon" href="/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="bello-bootstrap-ui.min.css">
    <style>
        @media (min-width: 768px) {
            .wrapper {
                overflow: auto;
            }
            .left-sidebar {
                float: left
            }
            .left-sidebar{
                position: absolute;
                top: 0;
                left: 0%;
                width: 10%;
                height: 100%;
                background-color:#eaf4f9;
            }
            .bar-text{
                text-align: center;
                font-family: 'Open Sans', Arial, sans-serif;
                font-weight: 600;
                font-style: normal
            }
        }
        button.new {
            display: inline-block;
            font-family: 'Open Sans', arial,sans-serif;
            font-size: 13px;
            font-weight: bold;
            color: rgb(68,68,68);
            text-decoration: none;
            user-select: none;
            padding: .1em 1.2em;
            border: 1px solid rgba(0,0,0,.1);
            border-radius: 2px;
            background: rgb(210, 233, 244);
            width:100%;
            height: 4em;
        }
        button.new:hover {
            color: rgb(24,24,24);
            border: 1px solid rgb(198,198,198);
            background:#eaf4f9;
            box-shadow: 0 1px 2px rgba(0,0,0,.1);
            width:100%;
            height: 4em;
        }
        button.new:active {
            color: rgb(51,51,51);
            border: 1px solid rgb(204,204,204);
            background:#70c5ef;
            box-shadow: 0 1px 2px rgba(0,0,0,.1) inset;
            width:100%;
            height: 4em;
        }
    </style>
</head>
<body>

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
    <h2 align="left">
        <form>
            <button formmethod="get" formaction="/admin/cafe" class="btn btn-danger">Кафе</button>
            <button formmethod="get" formaction="/admin/pharmacy" class="btn btn-info" >Аптеки</button>
            <button formmethod="get" formaction="/admin/beauty" class="btn btn-warning">Салоны крассоты</button>
            <button formmethod="get" formaction="/admin/food" class="btn btn-success" >Продукты</button>
            <button formmethod="get" formaction="/admin/clothes" class="btn btn-primary" >Одежда</button>
        </form>
    </h2>

    <div align="left">
        <table class = "table table-bordered">
            <caption><h2>List of Points</h2></caption>
            <thead>
            <tr class="info">
                <th>Name</th>
                <th>Address</th>
                <th>Longitude</th>
                <th>Latitude</th>
                <th>Business type</th>
                <th>Options</th>
            </tr>
            </thead>

            <tbody >

            <form action="${pageContext.servletContext.contextPath}/admin/cafe/edit" method="POST">

                <input type="hidden" name="id" value="${point.id}">

                <tr>
                    <td>
                        <div class="field">
                            <label for="name"></label>
                            <input type="text" id="name" name="name" value="${point.name}" />
                        </div>
                    </td>
                    <td>
                        <div class="field">
                            <label for="addres"></label>
                            <input type="text" id="addres" name="addres" value="${point.addres}" />
                        </div>
                    </td>
                    <td>
                        <div class="field">
                            <label for="longitude"></label>
                            <input type="text" id="longitude" name="longitude" value="${point.longitude}" />
                        </div>

                    </td>

                    <td>
                        <div class="field">
                            <label for="latitude"></label>
                            <input type="text" id="latitude" name="latitude" value="${point.latitude}" />
                        </div>

                    </td>

                    <td>
                        <div class="field">
                            <label for="typeId"></label>
                            <input type="number" id="typeId" name="typeId" min="1" max="5" value="${point.bizType.id}" />
                        </div>
                    </td>

                    <td>
                        <div class="submit">
                            <input type="submit" align="center" class="btn btn-default" value="Submit"/>
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