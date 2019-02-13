<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    [<%@ page language="java" contentType="text/html;charset=UTF-8"%>]
    [<%@ page pageEncoding="UTF-8"%>]
    <title>Byseness analizer</title>
    <link rel="shortcut icon" href="/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU&coordorder=longlat&apikey=ef20360f-da6b-4ee7-be34-21ab7fabe266" type="text/javascript"></script>    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
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

            .uslText{

                text-align: left;
                font-family: arial,sans-serif;
                font-size: 15px;
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
            -moz-transition: background-color 0.3s 0.1s ease, box-shadow 0.3s 0.1s ease;
            -o-transition: background-color 0.3s 0.1s ease, box-shadow 0.3s 0.1s ease;
            -webkit-transition: background-color 0.3s 0.1s ease, box-shadow 0.3s 0.1s ease;
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
        button.anyNew{
            margin-top: 3px;
            display: inline-block;
            font-family: arial,sans-serif;
            font-size: 11px;
            font-weight: bold;
            color: rgb(68,68,68);
            text-decoration: none;
            user-select: none;
            padding: .1em 1.2em;
            border: 2px solid #5cb85c;
            border-radius: 6px;
            width:100%;
            height: 4em;
            -moz-transition: background-color 0.2s 0.1s ease, color 0.2s 0.1s ease, box-shadow 0.2s 0.1s ease;
            -o-transition: background-color 0.2s 0.1s ease, color 0.2s 0.1s ease, box-shadow 0.2s 0.1s ease;
            -webkit-transition: background-color 0.2s 0.1s ease, color 0.2s 0.1s ease, box-shadow 0.2s 0.1s ease;

        }
        button.anyNew:hover {
            color: #ffffff;
            border: 2px solid #5cb85c;
            /*background: #5cb85c linear-gradient(#f7f7f7, #f1f1f1);*/
            background: #5cb85c;
            box-shadow: 5px 6px 10px rgba(0,0,0,.1);
            width:100%;
            height: 4em;
        }
        button.anyNew:active {
            color: rgb(51,51,51);
            border: 2px solid rgb(204,204,204);
            background: rgb(238,238,238) linear-gradient(rgb(238,238,238), rgb(224,224,224));
            box-shadow: 0 1px 2px rgba(0,0,0,.1) inset;
            width:100%;
            height: 4em;
        }

        .circle{
            width: 10px;
            height: 10px;
            -webkit-border-radius: 25px;
            -moz-border-radius: 25px;
            border-radius: 25px;
            display: inline-block

        }




    </style>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300&amp;subset=cyrillic" rel="stylesheet">
</head>

<body>
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Введите тип бизнеса</h4>
            </div>
            <div class="modal-body">
                <form >
                    <div class="form-group">
                        <input type="text" class="form-control" id="formBT" >
                    </div>
                    <button type="button" class="btn btn-success" onclick="formFunct()" data-dismiss="modal">Показать</button>
                </form>
            </div>
        </div>

    </div>
</div>
<div id="map"; style="position: absolute;
    top: 0;
    left: 0;
    width: 80%;
    height: 100%;
   "></div>

<div class="container-fluid" id = "sidebar" >
    <div class="row">
        <div class="wrapper">
            <div class="right-sidebar"><div> <h2 class = "bar-text">Выберите тип бизнесса</h2>

                <ul style="list-style-type: none; margin-left: 0; padding-left: 0;" id = "buttons">
                    <c:forEach items="${bizTypes}" var="biztype" >
                        <li><button class="new" onclick="bt(${biztype.id})">${biztype.name}</button></li>
                    </c:forEach>
                    <li><div><button class="anyNew" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"> Незнаете что выбрать?</button></div></li>
                </ul>

                <div style=" position: absolute;bottom: 0; height: 150px;"><ul style="list-style-type: none; margin-left: 0; padding-left: 15px; font-family: arial,sans-serif; font-size: 13px">
                    <p class="uslText">Условные обозначеня</p>
                    <li><div class="circle" style="background: red;"></div><div style="margin-left: 5px; display: inline-block">Максимальное значение</div></li>
                    <li><div class="circle" style="background: #ff7f2e;"></div><div style="margin-left: 5px; display: inline-block">Больше среднего колличества</div></li>
                    <li><div class="circle" style="background:#ffd31b;"></div><div style="margin-left: 5px; display: inline-block">Среднее колличество</div></li>
                    <li><div class="circle" style="background:#b3ff3a;"></div><div style="margin-left: 5px; display: inline-block">Меньше среднего колличества</div></li>
                    <li><div class="circle" style="background:#00ff00;"></div><div style="margin-left: 5px; display: inline-block">Минимальное колличество</div></li>
                </ul></div>
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
    display: none"><div style="margin-top: 20%; text-align: center;"><img src="/ba.png" style=" height: 5%; width: 5%"></div><div style="margin-top: 5px; text-align: center;"><img src="/294.gif" style="width: 5%; height: 5%"></div>
</div>
</body>
</html>