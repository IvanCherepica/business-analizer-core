<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    [<%@ page language="java" contentType="text/html;charset=UTF-8"%>]
    [<%@ page pageEncoding="UTF-8"%>]
    <title>Business analyzer</title>
    <link rel="shortcut icon" href="/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;subset=cyrillic" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU&coordorder=longlat&apikey=ef20360f-da6b-4ee7-be34-21ab7fabe266" type="text/javascript"></script>    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <%--<script src="/js/mapPlaceMarkt.js" type="text/javascript"></script>--%>


    <%--<script type="text/javascript">--%>
        <%--<%@include file="/js/mapPlaceMarkt.js" %>--%>
    <%--</script>--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript">
        <%@include file="/js/mapSupport.js" %>
    </script>
    <style >
    <%@include file= "/style4.css"%>
    </style>
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
            right: 0;
            width: 300px;
            height: 100%;
            background-color:#7386D5;
        }
        .bar-text{
            font-family:'Open Sans', sans-serif;
            font-weight: 600;
            font-style: normal
        }

    }

    .circle{
        width: 10px;
        height: 10px;
        -webkit-border-radius: 25px;
        -moz-border-radius: 25px;
        border-radius: 25px;
    }

    .circleactive{
        display: block;
        width: 10px;
        height: 10px;
        -webkit-border-radius: 25px;
        -moz-border-radius: 25px;
        border-radius: 25px;
        background: white;
    }
    .circledisable{
        display: none;
        width: 10px;
        height: 10px;
        -webkit-border-radius: 25px;
        -moz-border-radius: 25px;
        border-radius: 25px;
        background: white;
    }

    .boolets{
        width: 15px;
        height: 15px;
        -webkit-border-radius: 25px;
        -moz-border-radius: 25px;
        border-radius: 25px;
        display: inline-block

    }


    .checkbox {
        position:relative;
        padding-left:5px;
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        -khtml-border-radius: 2px;

    }
    .checkbox input[type=checkbox] {
        display:none;
        background: #ffffff;
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        -khtml-border-radius: 2px;
    }
    .checkbox label:after {
        content:'';
        display:block;
        height:14px;
        width:14px;
        outline:0px solid #ffffff;
        position:absolute;
        top:0;
        left:0;
        background: #ffffff;
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        -khtml-border-radius: 2px;
    }
    .checkbox input[type=checkbox]:checked + label:after {
        outline:0px solid #ffffff;
        border:2px solid #fff;
        width:14px;
        height:14px;
        background-color:#63849F;
    }

    /*Checkboxes styles*/
    input[type="checkbox"] { display: none; }

    input[type="checkbox"] + label {
        display: block;
        position: relative;
        padding-left: 35px;
        margin-bottom: 20px;
        font: 14px/20px 'Open Sans', Arial, sans-serif;
        color: #ffffff;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
    }

    input[type="checkbox"] + label:last-child { margin-bottom: 0; }

    input[type="checkbox"] + label:before {
        content: '';
        display: block;
        width: 20px;
        height: 20px;
        border: 3px solid #ffffff;
        position: absolute;
        left: 0;
        top: 0;
        opacity: .6;
        -webkit-transition: all .12s, border-color .08s;
        transition: all .12s, border-color .08s;
    }

    input[type="checkbox"]:checked + label:before {
        width: 10px;
        top: -5px;
        left: 5px;
        border-radius: 0;
        opacity: 1;
        border-top-color: transparent;
        border-left-color: transparent;
        -webkit-transform: rotate(45deg);
        transform: rotate(45deg);

    }


    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300&amp;subset=cyrillic" rel="stylesheet">
</style>
</head>

<body>
<%--<div id="myModal" class="modal fade" role="dialog">--%>
    <%--<div class="modal-dialog">--%>

        <%--<!-- Modal content-->--%>
        <%--<div class="modal-content">--%>
            <%--<div class="modal-header">--%>
                <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
                <%--<h4 class="modal-title">Введите тип бизнеса</h4>--%>
            <%--</div>--%>
            <%--<div class="modal-body">--%>
                <%--<form >--%>
                    <%--<div class="form-group">--%>
                        <%--<input type="text" class="form-control" id="formBT" >--%>
                    <%--</div>--%>
                    <%--<button type="button" class="btn btn-success" onclick="formFunct()" data-dismiss="modal">Показать</button>--%>
                <%--</form>--%>
            <%--</div>--%>
        <%--</div>--%>

    <%--</div>--%>
<%--</div>--%>
<div id="map"; style="position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
   "></div>

<div class="container-fluid" id = "sidebar"  >
    <div class="row">
        <div class="wrapper">
            <div class="right-sidebar" style = "box-shadow: 0 0 10px 5px rgba(0, 0, 0, 0.5);" ><div>
                <div style=" background: #6d7fcc; height: 100px">
                    <img src="/ba_logo.png" style="height: 54px; width: 190px; opacity: 0.9; margin-top: 15px; margin-left: 15px">
                </div>
                <div style="font-family:'Open Sans', sans-serif; font-size: 20px; font-weight:600; margin-left: 15px; margin-top: 15px">Выберите тип бизнеса</div>

                <!--                кнопки с типами бизнеса-->
                <ul style="list-style-type: none; margin-left: 0; padding-left: 0; margin-top: 15px; font-family: 'Open Sans', sans-serif; font-size: 17px; font-weight: 100;" id = "buttons">
                    <c:forEach items="${bizTypes}" var="biztype" >
                        <li><a class="new" onclick="bt(${biztype.id})"><img src="${biztype.link}" style="height: 20px; width: 20px">
                            <div style="display: inline-block">&#160;&#160;${biztype.name}&#160;&#160;</div><div id = bool style="display: inline-block">
                                <div class="mcircle"> <div id = ${biztype.id}  class="circledisable" style="background: white;"></div></div></div></a></li>
                    </c:forEach>
                    <!--                    <li><div><button class="anyNew" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"> Не знаете что выбрать?</button></div></li>-->
                    <!--    кнопки с бихнес тайпами закрылись                -->

                    <hr style ="opacity: 0.3; margin-top: -1px">

                    <div style="margin-left: 15px; margin-top: 10px">
                        <input type="checkbox" id="box1"  onclick="includePopulation()">
                        <label for="box1">на 1 человека</label>

                        <input type="checkbox" id="box2" onclick="includeArea()">
                        <label for="box2">на 1 км<sup>2</sup></label>

                        <input type="checkbox" id="box3" onclick="includePoints()">
                        <label for="box3"> Добавить метки </label>
                    </div>
                    <!--                    свой вариант-->
                    <%--<li class="active" style="margin-top: 15px; background:#6d7fcc;">--%>
                        <%--<a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">--%>
                            <%--<i><img src="/search_icon.png" style="width: 22px; height: 22px"></i>--%>
                            <%--Введите свой вариант--%>
                        <%--</a>--%>
                        <%--<ul class="collapse list-unstyled" id="homeSubmenu">--%>

                            <%--<li><div style = "margin-left: auto; margin-right: auto; width: 90%;">--%>
                                <%--<div style = "font-family:'Open Sans'; font-size: 13px; color: white; margin-top: 20px">Введите свой вариант</div>--%>
                                <%--<div class="form-group" style="width: 90%; margin-top: 5px">--%>
                                    <%--<form  >--%>
                                        <%--<input type="text" class="form-control" id="formBT"  >--%>
                                        <%--<div style="margin-top:5px; border-radius: 5px;">--%>
                                            <%--<button type="button" class="btn btn-large" onclick="formFunct()" style="width:100%; background: #6cdcb3; font-family:'Open Sans', sans-serif; color: #fffff;" >Показать</button>--%>
                                        <%--</div>--%>
                                    <%--</form>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</ul>--%>


                    <table style="width: 100%; margin-top: 5px">
                        <tr><td valign="top" style="padding: 5px"><button type="button"  onclick="formFunct()" style ="background-color: Transparent;
            background-repeat:no-repeat;
            border: none;
            cursor:pointer;
            overflow: hidden;" ><img src="/search_icon.png" style="width: 30px; height: 30px; display: inline-block"></button></td>
                            <td style="padding: 5px; margin-left: 5px"><form><input type="text" class="form-control" id="formBT" style = "display: inline-block" placeholder="Введите свой вариант"></form></td>
                    </table>
                </ul>



                    <%--<div style = "margin-left: auto; margin-right: auto; width: 90%;">--%>
                        <%--<div style = "font-family:'Open Sans'; font-size: 13px; color: white; margin-top: 20px">Введите свой вариант</div>--%>
                        <%--<div class="form-group" style="width: 90%; margin-top: 5px">--%>
                            <%--<form  >--%>
                                <%--<input type="text" class="form-control" id="formBT"  >--%>
                                <%--<div style="margin-top:5px; border-radius: 5px;">--%>
                                    <%--<button type="button" class="btn btn-large" onclick="formFunct()" style="width:100%; background: #6cdcb3; font-family:'Open Sans', sans-serif; color: #fffff;" >Показать</button>--%>
                                <%--</div>--%>
                            <%--</form>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <!--         свой вариант закрылся           -->

                    <!--                чекбоксы  -->
                </ul>

                <div style="margin-left: auto; margin-right: auto; width: 90%;">
                    <div style = "width: 100%; font-family: 'Open Sans', sans-serif; color:#f7f7f7;">Уровень конкуренции</div>
                    <table style = "width: 100%; font-family: 'Open Sans', sans-serif; color:#dbe2ff; margin-top: 5px">
                        <tr><td colspan="2"><img src="/gradient.png" style="width: 100%" ></td></tr>
                        <tr><td>min</td><td align="right">max</td></tr>
                    </table>
                </div>


                <!--
                                    <li><input type="checkbox" id="myCheck" onclick="includePopulation()">  С учетом плотности населения</li>
                                    <li><input type="checkbox" id="myCheck" onclick="includeArea()">  С учетом площади</li>
                -->

                <!--                чекбоксы закрылись-->

                <%--<div style=" position: absolute;bottom: 0; height: 150px;"><ul style="list-style-type: none; margin-left: 10px; padding-left: 15px;">--%>
                    <%--<p style="color: white; font-family: 'Open Sans', sans-serif; font-size: 13px">Условные обозначения</p>--%>
                    <%--<li><div class="circle" style="background: #da2421;"></div><div style="margin-left: 5px; display: inline-block; color: white; font-family: 'Open Sans', sans-serif; font-size: 10px">Максимальное значение</div></li>--%>
                    <%--<li><div class="circle" style="background: #e37751;"></div><div style="margin-left: 5px; display: inline-block; margin-left: 5px; display: inline-block; color: white; font-family: 'Open Sans', sans-serif; font-size: 10px">Больше среднего колличества</div></li>--%>
                    <%--<li><div class="circle" style="background:#e4bf64;"></div><div style="margin-left: 5px; display: inline-block; margin-left: 5px; display: inline-block; color: white; font-family: 'Open Sans', sans-serif; font-size: 10px">Среднее колличество</div></li>--%>
                    <%--<li><div class="circle" style="background:#bad45f;"></div><div style="margin-left: 5px; display: inline-block; margin-left: 5px; display: inline-block; color: white; font-family: 'Open Sans', sans-serif; font-size: 10px">Меньше среднего колличества</div></li>--%>
                    <%--<li><div class="circle" style="background:#53de51;"></div><div style="margin-left: 5px; display: inline-block; margin-left: 5px; display: inline-block; color: white; font-family: 'Open Sans', sans-serif; font-size: 10px">Минимальное колличество</div></li>--%>
                <%--</ul></div>--%>

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
    display: none"><div style="margin-top: 20%; text-align: center;"><img src="/ba.png" style=" height: 5%; width: 5%"></div><div style="margin-top: 5px; text-align: center;"><img src="/dwl-animation.gif" style="width: 5%; height: 5%"></div>
<script>

</script>
</body>
</html>