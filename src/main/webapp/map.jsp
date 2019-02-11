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
    <script src="http://api-maps.yandex.ru/2.1/?load=package.full&lang=ru-RU" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <%--<script src="/js/mapPlaceMarkt.js" type="text/javascript"></script>--%>


    <%--<script type="text/javascript">--%>
        <%--<%@include file="/js/mapPlaceMarkt.js" %>--%>
    <%--</script>--%>
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
    </style>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300&amp;subset=cyrillic" rel="stylesheet">
</head>

<body>
<div id="map"; style="position: absolute;
    top: 0;
    left: 0;
    width: 80%;
    height: 100%;"></div>

<div class="container-fluid">
    <div class="row">
        <div class="wrapper">
            <div class="right-sidebar"><div class = "bar-text"> <h2>Выберите тип бизнесса</h2>

                <ul style="list-style-type: none; margin-left: 0; padding-left: 0;" id = "buttons">

                    <li><button class="new" onclick="bt(1)">Кафе</button></li>
                    <li><button class="new"  onclick="bt(2)">Аптека</button> </li>
                    <li><button class="new"  onclick="bt(3)" >Салон красоты</button></li>
                    <li><button class="new"  onclick="bt(4)" >Продукты</button></li>
                    <li><button class="new" onclick="bt(5)"> Одежда</button></li>
                </ul>
            </div>
            </div>
        </div>
    </div>
</div>

<script>

    ymaps.ready(init);

    var myMap;

    var json = [{
        "type": "Feature",
        "properties": {
            "Name": "Фрунзенский район",
            "population": 390980,
            "area": 37.469},
        "geometry": {
            "type": "Polygon",
            "coordinates": [[
                [59.909367, 30.33617], [59.906354, 30.338917], [59.901706, 30.34132], [59.892149, 30.346298], [59.886293, 30.345783], [59.880522, 30.349045], [59.874922, 30.354366], [59.854153, 30.364494], [59.81922, 30.382004], [59.832076, 30.456161], [59.834319, 30.475216], [59.845936, 30.45908], [59.845332, 30.456676], [59.848954, 30.454788], [59.860075, 30.437794], [59.866969, 30.425949], [59.877309, 30.41153], [59.88997, 30.396252], [59.90323, 30.378742], [59.910374, 30.366039], [59.913558, 30.363464], [59.913842, 30.357971], [59.915649, 30.34647], [59.915821, 30.342178], [59.91367, 30.335484], [59.909367, 30.33617]
            ] ] }
    },
        {
            "type": "Feature",
            "properties": {
                "Name": "Центральный район",
                "population": 213806,
                "area": 17.12},
            "geometry": {
                "type": "Polygon",
                "coordinates": [[
                    [59.93786, 30.31362],[59.93655, 30.31039],[59.92545, 30.32704],[59.92623, 30.3303], [59.92373, 30.33631], [59.92339, 30.33528], [59.91745, 30.343], [59.91584, 30.3404], [59.91619, 30.34521], [59.91412, 30.36203], [59.91498, 30.37439], [59.921, 30.40185], [59.93098, 30.3943], [59.94251, 30.40151], [59.95145, 30.40357], [59.9542, 30.40082], [59.95729, 30.39327], [59.95712, 30.38366], [59.95403, 30.37611],[59.95128, 30.36306],[59.95282, 30.34383],[59.94388, 30.31259], [59.94117, 30.308876],[59.93786, 30.31362]
                ]] }

        }
    ]


    function init() {
        myMap = new ymaps.Map("map", {
            center: [59.90024, 30.25385],
            zoom: 10
        }, {
            searchControlProvider: 'yandex#search'
        });

        function showDistrictByNumver(ind) {
            // Создаем многоугольник, используя вспомогательный класс Polygon.
            var myPolygon = new ymaps.Polygon(
                // [ [
                //     [59.93786, 30.31362],[59.93655, 30.31039],[59.92545, 30.32704],[59.92623, 30.3303], [59.92373, 30.33631], [59.92339, 30.33528], [59.91745, 30.343], [59.91584, 30.3404], [59.91619, 30.34521], [59.91412, 30.36203], [59.91498, 30.37439], [59.921, 30.40185], [59.93098, 30.3943], [59.94251, 30.40151], [59.95145, 30.40357], [59.9542, 30.40082], [59.95729, 30.39327], [59.95712, 30.38366], [59.95403, 30.37611],[59.95128, 30.36306],[59.95282, 30.34383],[59.94388, 30.31259], [59.94117, 30.308876],[59.93786, 30.31362]
                // ] ]
                json[ind].geometry.coordinates
                ,
                //{ hintContent: "Центральный район"},
                { hintContent : json[ind].properties.Name}
                ,
                { fillColor: '#00FF00',
                    opacity: 0.5,
                    strokeColor: '#808080',
                    strokeWidth: 3}
            );
            myMap.geoObjects.add(myPolygon);
        }

        showDistrictByNumver(0);
        showDistrictByNumver(1);
    }


   var url;
   var val;
   function bt(val){
   // url = "/search?type="+val;

  //когда пользователь кликнет на кнопку с ид send_date

       var message = val;

       console.log(message);
       var url = "/search?type="+message;

       $.ajax({
           url: url,//прописать ссылку на ямап апи
           method: "get",
           error: function(message) {
               console.log(message);
           },
           success: function(data) {

               console.log(data);
               var myMap2 = myMap;
               for(var key in data){
                   var point = data[key];
                   myMap.geoObjects.add(
                       new ymaps.Placemark(
                           [point.latitude,point.longitude]));

               }

           }



       });


       function showDistrictByNumberByColor(ind, color) {
           // Создаем многоугольник, используя вспомогательный класс Polygon.
           var myPolygon = new ymaps.Polygon(
               // [ [
               //     [59.93786, 30.31362],[59.93655, 30.31039],[59.92545, 30.32704],[59.92623, 30.3303], [59.92373, 30.33631], [59.92339, 30.33528], [59.91745, 30.343], [59.91584, 30.3404], [59.91619, 30.34521], [59.91412, 30.36203], [59.91498, 30.37439], [59.921, 30.40185], [59.93098, 30.3943], [59.94251, 30.40151], [59.95145, 30.40357], [59.9542, 30.40082], [59.95729, 30.39327], [59.95712, 30.38366], [59.95403, 30.37611],[59.95128, 30.36306],[59.95282, 30.34383],[59.94388, 30.31259], [59.94117, 30.308876],[59.93786, 30.31362]
               // ] ]
               json[ind].geometry.coordinates
               ,
               //{ hintContent: "Центральный район"},
               { hintContent : json[ind].properties.Name}
               ,
               { fillColor: color,
                   opacity: 0.5,
                   strokeColor: '#808080',
                   strokeWidth: 3}
           );
           myMap.geoObjects.add(myPolygon);
       }

       showDistrictByNumberByColor(0, '#99FF00');
       showDistrictByNumberByColor(0, '#009900')



   }
  </script>
</body>
</html>