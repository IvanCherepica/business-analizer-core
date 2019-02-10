<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    [<%@ page language="java" contentType="text/html;charset=UTF-8"%>]
    [<%@ page pageEncoding="UTF-8"%>]
    <title>Byseness analizer</title>
    <link rel="shortcut icon" href="/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="bello-bootstrap-ui.min.css">
    <script src="http://api-maps.yandex.ru/2.1/?load=package.full&lang=ru-RU" type="text/javascript"></script>
    <script type="text/javascript">
        // Как только будет загружен API и готов DOM, выполняем инициализацию
        ymaps.ready(init);

        function init () {
            var myMap = new ymaps.Map('map', {
                center: [59.934472, 30.314262], // СПБ
                zoom: 10,
                controls: ['zoomControl']
            });
        }
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
                <ul style="list-style-type: none; margin-left: 0; padding-left: 0;">
                    <li><button class="new">Кафе</button></li>
                    <li><button class="new">Аптеки</button> </li>
                    <li><button class="new">Салоны красоты</button></li>
                    <li><button class="new">Продукты</button></li>
                    <li><button class="new">Одежда</button></li>
                </ul>
            </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>