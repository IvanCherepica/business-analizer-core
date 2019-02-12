<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    [<%@ page language="java" contentType="text/html;charset=UTF-8"%>]
    [<%@ page pageEncoding="UTF-8"%>]
    <title>Byseness analizer</title>
    <!--<link rel="shortcut icon" href="/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>-->
    <link rel="stylesheet" href="bello-bootstrap-ui.min.css">
    <!--<script src="http://api-maps.yandex.ru/2.1/?load=package.full&lang=ru-RU" type="text/javascript"></script>-->
    <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU&coordorder=longlat&apikey=ef20360f-da6b-4ee7-be34-21ab7fabe266" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <%--<script src="/js/mapPlaceMarkt.js" type="text/javascript"></script>--%>


    <%--<script type="text/javascript">--%>
        <%--<%@include file="/js/mapPlaceMarkt.js" %>--%>
    <%--</script>--%>

    <script type="text/javascript">
        <%@include file="/js/mapSupport.js" %>
    </script>
    <style>
        @media (min-width: 768px) {
            .wrapper {
                overflow: auto;
            }
            .right-sidebar {
                float: left
            }
            .right-sidebar{
                position: absolute;
                top: 0;
                left: 80%;
                width: 20%;
                height: 100%;
                background-color:#e6e6e6;
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
            font-family: arial,sans-serif;
            font-size: 11px;
            font-weight: bold;
            color: rgb(68,68,68);
            text-decoration: none;
            user-select: none;
            padding: .1em 1.2em;

            border: 1px solid rgba(0,0,0,.1);
            border-radius: 2px;
            /*  background: rgb(245,245,245) linear-gradient(#f4f4f4, #f1f1f1);*/
            width:100%;
            height: 4em;
        }
        button.new:hover {
            color: rgb(24,24,24);
            border: 1px solid rgb(198,198,198);
            background: #f7f7f7 linear-gradient(#f7f7f7, #f1f1f1);
            box-shadow: 0 1px 2px rgba(0,0,0,.1);
            width:100%;
            height: 4em;
        }
        button.new:active {
            color: rgb(51,51,51);
            border: 1px solid rgb(204,204,204);
            background: rgb(238,238,238) linear-gradient(rgb(238,238,238), rgb(224,224,224));
            box-shadow: 0 1px 2px rgba(0,0,0,.1) inset;
            width:100%;
            height: 4em;
        }

        button.empty {
            margin-top: 5px;
            display: inline-block;
            font-family: arial,sans-serif;
            font-size: 11px;
            font-weight: bold;
            color: rgb(51,51,51);
            text-decoration: none;
            user-select: none;
            padding: .1em 1.2em;

            border: 1px solid rgba(0,0,0,.1);
            border-radius: 2px;
            background: #f4f4f4 linear-gradient(#f4f4f4, #f1f1f1);
            width:100%;
            height: 10em;
        }
        button.color1 {
            display: inline-block;
            font-family: arial,sans-serif;
            font-size: 11px;
            font-weight: bold;
            color: rgb(51,51,51);
            text-decoration: none;
            user-select: none;
            padding: .1em 1.2em;

            border: 1px solid #ff0000;
            border-radius: 2px;
            background: #ff0000;  /*linear-gradient(#f4f4f4, #f1f1f1);*/
            width:100%;
            height: 4em;
        }
        button.color2 {
            display: inline-block;
            font-family: arial,sans-serif;
            font-size: 11px;
            font-weight: bold;
            color: rgb(51,51,51);
            text-decoration: none;
            user-select: none;
            padding: .1em 1.2em;

            border: 1px solid #ff7f2e;
            border-radius: 2px;
            background: #ff7f2e;  /*linear-gradient(#f4f4f4, #f1f1f1);*/
            width:100%;
            height: 4em;
        }

        button.color3 {
            display: inline-block;
            font-family: arial,sans-serif;
            font-size: 11px;
            font-weight: bold;
            color: rgb(51,51,51);
            text-decoration: none;
            user-select: none;
            padding: .1em 1.2em;

            border: 1px solid #ffd31b;
            border-radius: 2px;
            background: #ffd31b;  /*linear-gradient(#f4f4f4, #f1f1f1);*/
            width:100%;
            height: 4em;
        }

        button.color4 {
            display: inline-block;
            font-family: arial,sans-serif;
            font-size: 11px;
            font-weight: bold;
            color: rgb(51,51,51);
            text-decoration: none;
            user-select: none;
            padding: .1em 1.2em;

            border: 1px solid #b3ff3a;
            border-radius: 2px;
            background: #b3ff3a;  /*linear-gradient(#f4f4f4, #f1f1f1);*/
            width:100%;
            height: 4em;
        }

        button.color5 {
            display: inline-block;
            font-family: arial,sans-serif;
            font-size: 11px;
            font-weight: bold;
            color: rgb(51,51,51);
            text-decoration: none;
            user-select: none;
            padding: .1em 1.2em;

            border: 1px solid #00ff00;
            border-radius: 2px;
            background: #00ff00;  /*linear-gradient(#f4f4f4, #f1f1f1);*/
            width:100%;
            height: 4em;
        }
    </style>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300&amp;subset=cyrillic" rel="stylesheet">
</head>

<body>
<div id="map"; style="position: absolute;
    top: 0;
    left: 0;
    width: 80%;
    height: 100%;
   "></div>

<div class="container-fluid" id = "sidebar" >
    <div class="row">
        <div class="wrapper">
            <div class="right-sidebar"><div class = "bar-text"> <h2>Выберите тип бизнесса</h2>

                <ul style="list-style-type: none; margin-left: 0; padding-left: 0;" id = "buttons">

                    <li><button class="new" onclick="bt(1)">Кафе</button></li>
                    <li><button class="new"  onclick="bt(2)">Аптека</button> </li>
                    <li><button class="new"  onclick="bt(3)" >Салон красоты</button></li>
                    <li><button class="new"  onclick="bt(4)" >Продукты</button></li>
                    <li><button class="new" onclick="bt(5)"> Одежда</button></li>

                    <li><button class="empty" > </button></li>

                    <li><button class="new" > Условные обозначения</button></li>
                    <li><button class="color1" > Максимальное количество</button></li>
                    <li><button class="color2" > Больше среднего</button></li>
                    <li><button class="color3" > Среднее количество</button></li>
                    <li><button class="color4" > Меньше среднего</button></li>
                    <li><button class="color5" > Минимальное количество</button></li>
                </ul>
                <div><ul><></div>
            </div>
            </div>
        </div>
    </div>
</div>
<div id = "noActive" style="position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: #FFFFFF;
    opacity: 0.7;
    pointer-events: none;
    display: none"><div style=""><img src="/712%20(1).gif"></div></div>
<script>

</script>
</body>
</html>