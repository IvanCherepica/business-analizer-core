<%--
  Created by IntelliJ IDEA.
  User: APerevoznikova
  Date: 13.02.2019
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Business analyzer</title>
    <link rel="shortcut icon" href="/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="bello-bootstrap-ui.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
</html>
