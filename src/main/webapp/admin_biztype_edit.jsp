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


<div class="container-fluid" style=":position absolute;
    top: 0;
    margin-left: 20%;
    width: 80%;
    height: 100%;
   ">
    <h1>Admin panel</h1>

    <div align="left">
        <table class = "table table-bordered" style="width: 50%; box-shadow: 0 1px 9px rgba(0,0,0,.1);">
            <caption><h2>List of Business Types</h2></caption>
            <thead>
            <tr class="info">
                <th>Name</th>
                <th style="width: 10%">Options</th>
            </tr>
            </thead>
            <tbody >
            <form action="${pageContext.servletContext.contextPath}/admin/business/edit" method="POST">
                <input type="hidden" name="id" value="${bizType.id}">
                <tr>
                    <td>
                        <div class="field">
                            <label for="name"></label>
                            <input type="text" id="name" name="name" value="${bizType.name}" style="width: 90%"/>
                        </div>
                    </td>
                    <td>
                        <div class="submit">
                            <input type="submit" align="center" class="btn btn-default" role="button" value="Submit"/>
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