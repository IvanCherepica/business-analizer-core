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
                </ul>
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
<script>

    ymaps.ready(init);

    var myMap;

    var json = [{"properties": { "Name": "Адмиралтейский район", "population": 158414, "area":13.82},
        "geometry": { "type": "Polygon", "coordinates": [
                [[59.90024, 30.25385], [59.90056, 30.25531], [59.90007, 30.25948], [59.90007, 30.26239], [59.90056, 30.26445], [59.90198, 30.26583], [59.90205, 30.2678], [59.902433, 30.269394], [59.901831, 30.272269], [59.90209, 30.273428], [59.90168, 30.274415], [59.901357, 30.274115], [59.900948, 30.274458], [59.900561, 30.275702], [59.903724, 30.284414], [59.903165, 30.286131], [59.90298, 30.29068], [59.90289, 30.29617], [59.90238, 30.29814], [59.89618, 30.29686], [59.89609, 30.3002], [59.89652, 30.319], [59.90866, 30.3184], [59.90888, 30.32115], [59.91585, 30.34029], [59.91632, 30.3408], [59.91722, 30.34269], [59.92325, 30.33514], [59.92355, 30.33574], [59.92627, 30.3299], [59.92517, 30.32707], [59.93653, 30.30999], [59.93778, 30.31308], [59.94036, 30.30939], [59.94139, 30.30853], [59.93414, 30.28707], [59.93225, 30.27814], [59.93001, 30.27351], [59.91952, 30.2663], [59.91582, 30.26218], [59.91263, 30.26235], [59.90953, 30.26012], [59.90661, 30.25737], [59.90136, 30.25136], [59.90024, 30.25385]]
            ] } },
        {"properties": { "Name": "Василеостровский район", "population": 203181, "area":14.64},
            "geometry": { "type": "Polygon", "coordinates": [
                    [[59.96326, 30.21308], [59.960167, 30.182877], [59.942632, 30.17189], [59.927152, 30.19249], [59.9182, 30.24845], [59.91768, 30.25806], [59.91923, 30.26561], [59.93042, 30.27282], [59.93265, 30.27763], [59.93454, 30.2869], [59.93919, 30.30201], [59.94246, 30.31059], [59.94503, 30.31059], [59.94693, 30.30681], [59.94727, 30.29274], [59.94933, 30.28587], [59.95707, 30.2639], [59.96411, 30.22819], [59.96326, 30.21308]]
                ] } },
        {"properties": { "Name": "Выборгский район", "population": 443827, "area":115.38},
            "geometry": { "type": "Polygon", "coordinates": [
                    [[59.97909, 30.32295], [59.97634, 30.32861], [59.96801, 30.33582], [59.96002, 30.33668], [59.95323, 30.34355], [59.95237, 30.34956], [59.95383, 30.3499], [59.95984, 30.35385], [59.96328, 30.35144], [59.9723, 30.34818], [59.97749, 30.3438], [59.97933, 30.36088], [59.97779, 30.36586], [59.9777, 30.36741], [59.98066, 30.36578], [59.98401, 30.36243], [59.98955, 30.35196], [59.9911, 30.35239], [59.99449, 30.36097], [59.99638, 30.36397], [60.00148, 30.36586], [60.00723, 30.36981], [60.01873, 30.36715], [60.03224, 30.36466], [60.03442, 30.365], [60.03627, 30.36638], [60.05884, 30.38818], [60.0794, 30.37719], [60.08059, 30.37307], [60.09224, 30.36724], [60.09018, 30.33325], [60.09617, 30.30715], [60.09121, 30.30304], [60.09343, 30.29171], [60.09669, 30.29136], [60.09634, 30.2869], [60.10302, 30.27488], [60.10884, 30.27557], [60.1114, 30.27008], [60.11671, 30.27111], [60.12013, 30.26561], [60.12355, 30.26561], [60.12577, 30.25772], [60.1191, 30.23643], [60.1179, 30.22613], [60.11602, 30.21926], [60.11722, 30.20725], [60.117737, 30.185966], [60.114316, 30.186996], [60.114145, 30.184937], [60.11243, 30.16983], [60.1179, 30.07507], [60.08231, 30.06889], [60.0453, 30.12348], [60.04873, 30.13343], [60.06415, 30.19077], [60.0609, 30.19592], [60.06278, 30.20072], [60.06055, 30.20931], [60.06158, 30.21377], [60.0525, 30.2227], [60.05627, 30.23574], [60.06878, 30.27385], [60.05787, 30.28681], [60.05504, 30.29025], [60.05251, 30.29342], [60.05058, 30.2951], [60.04288, 30.29909], [60.0353, 30.30338], [60.02756, 30.30746], [60.02353, 30.30964], [60.00718, 30.31861], [60.0018, 30.32162], [59.99804, 30.32363], [59.99439, 30.32853], [59.99377, 30.32634], [59.99259, 30.3278], [59.98806, 30.32973], [59.98508, 30.33054], [59.98401, 30.32977], [59.9828, 30.3311], [59.97909, 30.32295]]
                ] } },
        {"properties": { "Name": "Калининский район", "population": 504641, "area":40.12},
            "geometry": { "type": "Polygon", "coordinates": [
                    [[60.058329, 30.38681], [60.03424, 30.36535], [60.03193, 30.36518], [60.00725, 30.37047], [60.0015, 30.36652], [59.99643, 30.36446], [59.99454, 30.36137], [59.99091, 30.3523], [59.98954, 30.352], [59.98398, 30.36257], [59.98072, 30.36618], [59.97771, 30.36772], [59.97763, 30.36583], [59.97926, 30.36086], [59.97754, 30.34438], [59.97271, 30.34767], [59.96869, 30.35021], [59.96036, 30.35399], [59.95374, 30.35004], [59.95245, 30.3497], [59.95185, 30.36274], [59.95417, 30.37562], [59.95787, 30.38386], [59.95778, 30.39399], [59.95606, 30.39931], [59.95916, 30.40703], [59.9717, 30.41218], [59.99154, 30.43313], [60.00021, 30.4424], [60.01514, 30.43587], [60.0196, 30.43759], [60.02175, 30.43673], [60.041704, 30.437965], [60.044789, 30.423889], [60.047704, 30.414619], [60.050446, 30.417366], [60.058329, 30.38681]]
                ] } },
        {"properties": { "Name": "Кировский район", "population": 333668, "area":48 },
            "geometry": { "type": "Polygon", "coordinates": [
                    [[59.91744, 30.2577], [59.91701, 30.21367], [59.90879, 30.2062], [59.89437, 30.19453], [59.89139, 30.18442], [59.88821, 30.17462], [59.88907, 30.1693], [59.88636, 30.16801], [59.87835, 30.17908], [59.86866, 30.19814], [59.86978, 30.20037], [59.86797, 30.20414], [59.86469, 30.21565], [59.86439, 30.23942], [59.83301, 30.19453], [59.82376, 30.18356], [59.8234, 30.18424], [59.82276, 30.19857], [59.82362, 30.21055], [59.82502, 30.22514], [59.82798, 30.2387], [59.83423, 30.26526], [59.83583, 30.26947], [59.83856, 30.27363], [59.84426, 30.28187], [59.85021, 30.28775], [59.85486, 30.28921], [59.85943, 30.29015], [59.8774, 30.2929], [59.87914, 30.29414], [59.88056, 30.29663], [59.88162, 30.29985], [59.88257, 30.30011], [59.88263, 30.29402], [59.89264, 30.296], [59.89611, 30.29631], [59.90222, 30.29803], [59.90273, 30.29597], [59.90265, 30.29202], [59.90308, 30.28636], [59.90368, 30.28447], [59.9005, 30.27571], [59.90097, 30.274501], [59.9014, 30.274029], [59.90168, 30.274158], [59.90196, 30.273299], [59.901766, 30.272269], [59.9023, 30.26936], [59.90196, 30.26764], [59.901895, 30.265789], [59.90058, 30.2649], [59.89989, 30.26198], [59.89998, 30.25923], [59.9005, 30.25546], [59.90007, 30.25374], [59.90136, 30.25082], [59.90885, 30.25906], [59.91255, 30.26181], [59.91573, 30.26146], [59.91874, 30.26473], [59.91744, 30.2577]]
                ] } },
        {"properties": { "Name": "Колпинский район", "population": 175098, "area":105.8},
            "geometry": { "type": "Polygon", "coordinates": [
                    [[59.817899, 30.452728], [59.795626, 30.49427], [59.780596, 30.516243], [59.765559, 30.508003], [59.75892, 30.50986], [59.74751, 30.50437], [59.75002, 30.55638], [59.73635, 30.55895], [59.73133, 30.56788], [59.73047, 30.57784], [59.73047, 30.58882], [59.72908, 30.59105], [59.729, 30.59861], [59.73081, 30.60582], [59.73116, 30.61698], [59.73592, 30.61612], [59.73635, 30.63002], [59.7219, 30.6489], [59.72502, 30.68358], [59.73177, 30.67877], [59.73289, 30.68186], [59.74492, 30.69508], [59.74708, 30.70366], [59.74725, 30.71259], [59.74422, 30.75516], [59.74993, 30.74933], [59.7514, 30.74881], [59.75218, 30.75018], [59.7527, 30.75551], [59.7533, 30.75928], [59.75503, 30.75963], [59.75624, 30.75671], [59.75555, 30.74915], [59.75616, 30.74383], [59.75979, 30.73662], [59.76506, 30.74023], [59.7693, 30.73491], [59.77077, 30.72632], [59.77345, 30.72804], [59.77699, 30.7337], [59.77915, 30.738], [59.782, 30.72564], [59.782, 30.71568], [59.78105, 30.70469], [59.78148, 30.69748], [59.78442, 30.68718], [59.78554, 30.67328], [59.78934, 30.66058], [59.79072, 30.65457], [59.79142, 30.64204], [59.7947, 30.62813], [59.80135, 30.6168], [59.80696, 30.6065], [59.8086, 30.60187], [59.81188, 30.59655], [59.81619, 30.59123], [59.81947, 30.58196], [59.82189, 30.57629], [59.82388, 30.56719], [59.82077, 30.56359], [59.81939, 30.55947], [59.81999, 30.55672], [59.81913, 30.55535], [59.81818, 30.55724], [59.81671, 30.55415], [59.81309, 30.54934], [59.82293, 30.5217], [59.81887, 30.52033], [59.81421, 30.51243], [59.8111, 30.50934], [59.80938, 30.50969], [59.83414, 30.47484], [59.832222, 30.457535], [59.82974, 30.44394], [59.817899, 30.452728]]
                ] } },

        {"properties": { "Name": "Красногвардейский район", "population": 336402, "area":56.83}, "geometry": { "type": "Polygon", "coordinates": [
                    [[60.02155, 30.43693], [60.01983, 30.43813], [60.01494, 30.43642], [60.00018, 30.44242], [59.97159, 30.41256], [59.95913, 30.40792], [59.95621, 30.39985], [59.952, 30.40449], [59.94254, 30.4026], [59.93145, 30.39522], [59.9268, 30.39831], [59.92156, 30.40277], [59.91588, 30.40912], [59.92044, 30.42594], [59.92827, 30.43762], [59.93196, 30.44294], [59.93635, 30.4474], [59.93712, 30.45118], [59.93523, 30.4632], [59.931968, 30.517273], [59.960854, 30.524483], [59.968931, 30.534096], [59.973741, 30.547314], [59.969274, 30.552464], [59.97026, 30.56164], [59.97073, 30.56585], [59.97344, 30.55898], [59.97296, 30.55709], [59.97344, 30.55624], [59.97402, 30.55792], [59.97454, 30.55638], [59.97746, 30.55398], [59.97926, 30.55363], [59.97926, 30.55123], [59.97823, 30.55123], [59.97866, 30.5478], [59.98038, 30.54831], [59.98149, 30.54093], [59.9827, 30.53698], [59.98287, 30.53355], [59.98184, 30.53149], [59.98252, 30.52805], [59.98321, 30.53046], [59.9845, 30.53063], [59.98415, 30.53217], [59.98527, 30.53217], [59.98707, 30.53303], [59.98633, 30.53506], [59.98822, 30.53781], [59.99045, 30.53678], [59.99251, 30.53403], [59.98564, 30.50657], [59.98753, 30.50828], [59.98993, 30.5076], [59.99285, 30.50657], [59.99405, 30.50382], [59.99663, 30.50348], [59.99955, 30.50211], [60.00075, 30.49833], [60.00298, 30.50313], [60.00676, 30.50348],[60.0071, 30.49799], [60.0095, 30.49387], [60.00899, 30.48975], [60.01431, 30.48666], [60.01825, 30.4894], [60.02271, 30.48803], [60.02048, 30.48254], [60.02237, 30.48013], [60.02306, 30.47636], [60.0258, 30.4743], [60.02323, 30.46777], [60.02563, 30.46468], [60.02786, 30.46812], [60.02838, 30.46297], [60.03095, 30.46503], [60.03232, 30.46812], [60.03403, 30.46846], [60.03369, 30.464], [60.03884, 30.45782], [60.03781, 30.45301], [60.03935, 30.44614], [60.04192, 30.44477], [60.04178, 30.44139], [60.0405, 30.43796], [60.02155, 30.43693]]
                ] } },
        { "type": "Feature", "properties": { "Name": "Красносельский район", "population": 330773, "area": 115},
            "geometry": { "type": "MultiPolygon", "coordinates": [
                    [[59.721466733611265, 30.110373635663596], [59.724216, 30.109577], [59.729062, 30.106659], [59.738579, 30.109406], [59.742645, 30.116615], [59.745845, 30.118675], [59.748958, 30.119019], [59.756654, 30.115242], [59.761582, 30.117645], [59.761237, 30.142708], [59.771955, 30.150604], [59.775584, 30.143738], [59.784915, 30.154381], [59.788198, 30.159531], [59.793553, 30.161247], [59.79528, 30.155754], [59.789753, 30.150948], [59.79148, 30.146141], [59.80103, 30.16016], [59.79585, 30.17664], [59.79377, 30.17938], [59.7917, 30.17732], [59.79101, 30.17972], [59.79187, 30.18899], [59.79446, 30.1938], [59.79567, 30.20101], [59.7974, 30.20959], [59.79792, 30.21474], [59.80379, 30.21989], [59.81329, 30.22642], [59.82381, 30.22539], [59.82537, 30.22745], [59.82278, 30.19758], [59.82399, 30.18384], [59.83313, 30.19414], [59.84021, 30.20444], [59.86417, 30.23912], [59.86486, 30.21474], [59.86676, 30.2065], [59.86952, 30.20032], [59.86814, 30.19723], [59.87779, 30.17904], [59.88433, 30.16977], [59.872398, 30.130348], [59.866452, 30.097561], [59.856368, 30.097218], [59.854859, 30.097647], [59.854213, 30.099707], [59.853825, 30.099277], [59.854127, 30.095501], [59.852834, 30.089836], [59.836363, 30.090866], [59.835155, 30.085373], [59.838519, 30.069752], [59.81531, 30.075245], [59.816259, 30.084686], [59.81462, 30.091381], [59.81708, 30.10351], [59.808923, 30.12743], [59.804347, 30.122967], [59.802879, 30.104771], [59.79813, 30.105629], [59.796921, 30.104256], [59.796144, 30.098076], [59.789925, 30.097218], [59.786211, 30.098934], [59.784829, 30.097561], [59.783015, 30.096531], [59.782583, 30.091209], [59.780336, 30.087433], [59.780336, 30.083656], [59.775671, 30.083313], [59.766855, 30.057392], [59.764089, 30.042458], [59.762274, 30.043316], [59.763311, 30.057564], [59.761669, 30.057735], [59.761928, 30.059967], [59.757, 30.062027], [59.756741, 30.071297], [59.755271, 30.07164], [59.755271, 30.066833], [59.751726, 30.066147], [59.748007, 30.075417], [59.74178, 30.06237], [59.735421770391575, 30.05503945258516], [59.735378, 30.054989], [59.733734, 30.055847], [59.730533, 30.050526], [59.728456, 30.050011], [59.725773, 30.047264], [59.723783, 30.047092], [59.719542, 30.045547], [59.720927, 30.038338], [59.717811, 30.034561], [59.715733, 30.041428], [59.717291, 30.050354], [59.712443, 30.054474], [59.717032, 30.073528], [59.715647, 30.074043], [59.716512, 30.077648], [59.71582, 30.081253], [59.711751, 30.083828], [59.699368, 30.100651], [59.699281, 30.106487], [59.700407, 30.109062], [59.699022, 30.112839], [59.699368, 30.115585], [59.696856, 30.114727], [59.695384, 30.114899], [59.6944599, 30.1144414], [59.694777, 30.118847], [59.692179, 30.119705], [59.692179, 30.123997], [59.693391, 30.129147], [59.696856, 30.135841], [59.699281, 30.136356], [59.70136, 30.13464], [59.701793, 30.136185], [59.706729, 30.141163], [59.706642, 30.132751], [59.706989, 30.123825], [59.709327, 30.122967], [59.708114, 30.120049], [59.71279, 30.112667], [59.713656, 30.114555], [59.716512, 30.111809], [59.721466733611265, 30.110373635663596]]
                ] } },
        {"properties": { "Name": "Кронштадтский район", "population": 42999, "area": 19.35}, "geometry": { "type": "Polygon", "coordinates": [
                    [[60.04194, 29.60769], [60.0145, 29.64889], [59.99115, 29.6846], [59.96917, 29.8027], [59.98291, 29.83566], [60.00901, 29.80819], [60.039132, 29.747543], [60.05154, 29.65438], [60.04194, 29.60769]]
                ] } },
        {"properties": { "Name": "Курортный район", "population": 67412, "area": 267.92}, "geometry": { "type": "Polygon", "coordinates": [
                    [[60.1925, 29.58675], [60.17816, 29.73369], [60.15835, 29.84149], [60.15972, 29.86553], [60.13955, 29.91703], [60.10398, 29.91909], [60.09987, 29.89368], [60.06288, 29.93076], [60.04573, 29.94237], [60.04341, 29.9707], [60.04436, 29.97568], [60.0369, 29.97842], [60.02048, 30.01765], [60.01752, 30.0325], [60.01282, 30.03719], [60.00835, 30.06465], [60.02242, 30.07152], [60.0454, 30.12371], [60.08207, 30.06946], [60.11722, 30.07507], [60.112948, 30.16983], [60.113974, 30.186653], [60.121671, 30.184593], [60.126118, 30.17395], [60.132444, 30.172234], [60.130393, 30.120049], [60.14434, 30.01934], [60.15083, 30.01934], [60.1604, 30.01041], [60.1645, 29.9905], [60.17304, 29.98088], [60.17645, 29.95822], [60.1826, 29.92664], [60.19011, 29.89643], [60.19523, 29.89231], [60.19625, 29.86621], [60.19659, 29.85248], [60.20274, 29.84287], [60.20308, 29.83188], [60.20751, 29.81334], [60.22048, 29.80236], [60.22157, 29.7956], [60.2232, 29.78931], [60.22764, 29.77626], [60.23343, 29.77008], [60.24264, 29.74399], [60.24025, 29.73438], [60.24127, 29.71035], [60.23309, 29.71378], [60.22695, 29.72271], [60.22695, 29.71309], [60.23752, 29.69524], [60.23786, 29.6767], [60.24059, 29.66091], [60.23889, 29.64374], [60.23411, 29.6355], [60.23718, 29.61902], [60.23514, 29.60323], [60.22866, 29.58812], [60.22082, 29.58538], [60.22525, 29.55036], [60.22423, 29.538], [60.22013, 29.538], [60.22457, 29.52289], [60.23343, 29.52289], [60.2215, 29.49749], [60.22627, 29.48856], [60.19182, 29.42264], [60.19045, 29.4453], [60.18601, 29.45285], [60.18567, 29.46727], [60.18192, 29.47208], [60.18089, 29.45011], [60.17577, 29.43431], [60.16826, 29.47277], [60.1925, 29.58675]]
                ] } },
        {"properties": { "Name": "Московский район", "population": 288744, "area": 71.07},
            "geometry": { "type": "Polygon", "coordinates": [
                    [[59.882736, 30.293427], [59.882736, 30.299435], [59.881702, 30.299435], [59.880841, 30.296516], [59.878515, 30.293255], [59.850161, 30.28759], [59.844125, 30.282269], [59.835328, 30.268364], [59.825579, 30.227509], [59.823681, 30.225277], [59.813498, 30.226307], [59.804088, 30.220299], [59.797871, 30.214119], [59.789925, 30.268879], [59.794935, 30.270081], [59.795885, 30.281754], [59.792258, 30.286732], [59.790962, 30.287247], [59.779127, 30.270252], [59.777744, 30.273514], [59.774806, 30.268536], [59.775152, 30.266819], [59.772672, 30.259237], [59.770771, 30.257177], [59.7674, 30.250654], [59.766708, 30.247736], [59.744747, 30.309706], [59.764115, 30.329447], [59.768869, 30.333223], [59.772499, 30.33288], [59.77561, 30.32773], [59.777597, 30.325842], [59.791161, 30.325499], [59.79237, 30.327387], [59.794788, 30.328073], [59.797638, 30.324297], [59.803596, 30.324812], [59.803769, 30.32567], [59.804114, 30.329447], [59.805582, 30.332022], [59.806531, 30.336485], [59.808172, 30.337858], [59.809207, 30.341635], [59.810848, 30.343008], [59.812488, 30.347986], [59.814559, 30.356054], [59.815768, 30.365152], [59.817235, 30.369272], [59.819047, 30.381975], [59.844065, 30.369444], [59.875009, 30.353823], [59.881125, 30.347986], [59.886637, 30.345755], [59.891891, 30.345755], [59.899554, 30.341635], [59.905321, 30.33906], [59.909022, 30.336142], [59.912207, 30.33597], [59.914014, 30.334768], [59.90885, 30.321379], [59.908506, 30.31846], [59.896626, 30.318975], [59.895938, 30.296831], [59.882736, 30.293427]]
                ] } },
        { "type": "Feature", "properties": { "Name": "Невский район", "population": 467500, "area": 61.79},
            "geometry": { "type": "Polygon", "coordinates": [
                    [[59.83423, 30.47553], [59.80972, 30.50934], [59.81119, 30.509], [59.81464, 30.51226], [59.81904, 30.51999], [59.82129, 30.52102], [59.82284, 30.52153], [59.81317, 30.54917], [59.81671, 30.55415], [59.81801, 30.55724], [59.81913, 30.55535], [59.81991, 30.55689], [59.81939, 30.5593], [59.8206, 30.5629], [59.82249, 30.56565], [59.82396, 30.56736], [59.82595, 30.56204], [59.82914, 30.56101], [59.83414, 30.56239], [59.83587, 30.56153], [59.83716, 30.55638], [59.8344, 30.54385], [59.83328, 30.53938], [59.83561, 30.52805], [59.83794, 30.52067], [59.84268, 30.5114], [59.84466, 30.50454], [59.8457, 30.49698], [59.84742, 30.49286], [59.85087, 30.49166], [59.85484, 30.49424], [59.85725, 30.49475], [59.85863, 30.49424], [59.85915, 30.49819], [59.85941, 30.50419], [59.86035, 30.50883], [59.8613, 30.50831], [59.86337, 30.51999], [59.868951, 30.510406], [59.873432, 30.508347], [59.891004, 30.511436], [59.931796, 30.517273], [59.93509, 30.46299], [59.93715, 30.45149], [59.93655, 30.4472], [59.93044, 30.44068], [59.92046, 30.4254], [59.91573, 30.40892], [59.92106, 30.40291], [59.91513, 30.37476], [59.91418, 30.36343], [59.91117, 30.36583], [59.90411, 30.37751], [59.89567, 30.38901], [59.86897, 30.42351], [59.85734, 30.4424], [59.84889, 30.45527], [59.84553, 30.45682], [59.84613, 30.45887], [59.83423, 30.47553]]
                ] } },
        { "type": "Feature", "properties": { "Name": "Петроградский район", "population": 130417, "area": 24},
            "geometry": { "type": "Polygon", "coordinates": [
                    [[59.97545, 30.20862], [59.96961, 30.21343], [59.9636, 30.23746], [59.95707, 30.26699], [59.9483, 30.29274], [59.94779, 30.30784], [59.945383, 30.316086], [59.952947, 30.342865], [59.95965, 30.33599], [59.96738, 30.33531], [59.97545, 30.32844], [59.98061, 30.31642], [59.98318, 30.29651], [59.98284, 30.28141], [59.98181, 30.27591], [59.98284, 30.25909], [59.98198, 30.24055], [59.97889, 30.21961], [59.97545, 30.20862]]
                ] } },
        {"properties": { "Name": "Петродворцовый район", "population": 140949, "area": 109 }, "geometry": { "type": "Polygon", "coordinates": [
                    [[59.86794, 29.8342], [59.869468, 29.845734], [59.86182, 29.86064], [59.86044, 29.85961], [59.85837, 29.86149], [59.85561, 29.86235], [59.85398, 29.8675], [59.8563, 29.87128], [59.85906, 29.87214], [59.85285, 29.88089], [59.84794, 29.8766], [59.84794, 29.87935], [59.84415, 29.87986], [59.84294, 29.88604], [59.85406, 29.89256], [59.85285, 29.8972], [59.85363, 29.89823], [59.8532, 29.90338], [59.85018, 29.90201], [59.84915, 29.90922], [59.85173, 29.91042], [59.84992, 29.92587], [59.84794, 29.92535], [59.84449, 29.94492], [59.83078, 29.93702], [59.83086, 29.94183], [59.82914, 29.94441], [59.83414, 29.97736], [59.83526, 29.97788], [59.83354, 29.99247], [59.83682, 30.00294], [59.83664, 30.00586], [59.83647, 30.01324], [59.835, 30.01462], [59.8363, 30.01685], [59.83354, 30.02011], [59.83768, 30.03006], [59.83725, 30.04431], [59.83293, 30.04191], [59.83104, 30.03899], [59.82551, 30.03882], [59.82249, 30.0371], [59.81783, 30.04689], [59.81732, 30.05805], [59.8155, 30.07521], [59.83854, 30.07023], [59.83535, 30.08551], [59.83656, 30.09083], [59.8526, 30.08997], [59.85415, 30.09444], [59.85432, 30.09942], [59.85492, 30.09736], [59.8663, 30.09736], [59.86949, 30.04981], [59.8707, 30.00981], [59.88345, 29.97633], [59.89275, 29.9226], [59.89855, 29.88219], [59.90332, 29.87404], [59.90453, 29.84983], [59.90581, 29.83989], [59.90805, 29.832], [59.91304, 29.82067], [59.91734, 29.8138], [59.9213, 29.80865], [59.92577, 29.80178], [59.92956, 29.79389], [59.93265, 29.78256], [59.9342, 29.77397], [59.9354, 29.7623], [59.93644, 29.75132], [59.9397, 29.72831], [59.94314, 29.70359], [59.94314, 29.67475], [59.93269, 29.65742], [59.92693, 29.66832], [59.91919, 29.66119], [59.91428, 29.66969], [59.91252, 29.70849], [59.90129, 29.7272], [59.89233, 29.72308], [59.88114, 29.71733], [59.871019, 29.740334], [59.87101, 29.75166], [59.871364, 29.768143], [59.86498, 29.78942], [59.857403, 29.816551], [59.86794, 29.8342]]
                ] } },
        { "type": "Feature", "properties": { "Name": "Приморский район", "population": 509944, "area": 109.87},
            "geometry": { "type": "Polygon", "coordinates": [ [
                    [59.97848, 30.32215], [59.9826, 30.33039], [59.98398, 30.32979], [59.98527, 30.33047], [59.99266, 30.3279], [59.99377, 30.32601], [59.99446, 30.32876], [59.99832, 30.32309], [60.01917, 30.31193], [60.04532, 30.29768], [60.05287, 30.29288], [60.05758, 30.2867], [60.06878, 30.27282], [60.05198, 30.22304], [60.06107, 30.21377], [60.06038, 30.20862], [60.06227, 30.20072], [60.06072, 30.19558], [60.06381, 30.19043], [60.04838, 30.13137], [60.02249, 30.07232], [60.00825, 30.0646], [60.01198, 30.04237], [60.0128, 30.03765], [60.01769, 30.03181], [60.0203, 30.01773], [60.0369, 29.97825], [60.04418, 29.97516], [60.04324, 29.97087], [60.0453, 29.94289], [60.0363, 29.94375], [60.00791, 29.95697], [59.989715, 30.007782], [59.99349, 30.05859], [59.98278, 30.16842], [59.97952, 30.19572], [59.97574, 30.20808], [59.97926, 30.21906], [59.98209, 30.23829], [59.98295, 30.25889], [59.98201, 30.27588], [59.98312, 30.28172], [59.98355, 30.29665], [59.98072, 30.3164], [59.97848, 30.32215]
                ] ] } },
        { "type": "Feature", "properties": { "Name": "Пушкинский район", "population": 135789, "area": 239.95},
            "geometry": { "type": "Polygon", "coordinates": [ [
                    [59.64485110581441, 30.45888527661885], [59.64079, 30.4642], [59.63932, 30.46643], [59.64001, 30.47038], [59.63975, 30.47518], [59.63775, 30.47965], [59.63932, 30.48222], [59.63984, 30.48531], [59.64148, 30.48531], [59.64235, 30.4884], [59.64331, 30.48874], [59.64469, 30.4951], [59.64461, 30.49733], [59.64608, 30.50351], [59.65389, 30.50368], [59.65814, 30.50265], [59.6688, 30.50179], [59.67000550471717, 30.492838901729044], [59.67028, 30.4908], [59.67756, 30.49819], [59.67929, 30.49115], [59.68397, 30.48909], [59.6851, 30.48634], [59.68821, 30.48789], [59.69385, 30.52308], [59.69567, 30.52222], [59.69662, 30.51999], [59.6993, 30.52205], [59.70052, 30.52445], [59.70337, 30.52479], [59.70476, 30.52943], [59.70727, 30.5308], [59.70664624794755, 30.542409447554295], [59.70545, 30.56462], [59.73061, 30.57769], [59.73076786256212, 30.575116239965148], [59.73122, 30.56774], [59.73624, 30.55864], [59.74973, 30.55709], [59.74809, 30.52465], [59.74748, 30.50439], [59.75786, 30.50989], [59.76694, 30.50972], [59.78007, 30.51761], [59.79332, 30.49716], [59.81142, 30.46457], [59.81824, 30.45238], [59.82974, 30.44343], [59.82681, 30.42592], [59.81887, 30.38214], [59.81714, 30.36944], [59.8155, 30.3648], [59.81412, 30.35553], [59.81102, 30.34335], [59.8092, 30.34232], [59.80817, 30.3382], [59.80635, 30.33665], [59.80489, 30.3315], [59.80402, 30.32979], [59.80342, 30.32515], [59.79772, 30.32498], [59.7947, 30.3279], [59.7928, 30.32721], [59.79124, 30.32412], [59.77811, 30.32498], [59.77612, 30.32635], [59.77388, 30.3303], [59.77163, 30.33253], [59.76385, 30.32927], [59.74483, 30.30953], [59.74786, 30.30095], [59.74068, 30.29357], [59.73704, 30.29236], [59.73298, 30.28687], [59.73203, 30.28275], [59.72934, 30.28361], [59.7232, 30.27279], [59.72095, 30.27176], [59.71896, 30.27949], [59.71515, 30.27588], [59.71653, 30.26919], [59.7142, 30.26799], [59.70736, 30.25992], [59.70207, 30.25563], [59.70121, 30.25151], [59.69324, 30.23451], [59.69203, 30.23675], [59.69034073788685, 30.233297606977377], [59.68951, 30.2316], [59.68605, 30.23657], [59.68414, 30.22919], [59.67322, 30.21906], [59.6708, 30.22284], [59.6695, 30.22902], [59.6714, 30.22748], [59.67357, 30.22936], [59.67296, 30.23537], [59.67088, 30.24292], [59.67132, 30.2491], [59.67062, 30.24996], [59.66143, 30.23795], [59.66091, 30.24189], [59.65857, 30.24172], [59.65354, 30.24361], [59.65293, 30.25271], [59.64886, 30.26043], [59.63897, 30.24327], [59.63394, 30.25408], [59.66221, 30.30644], [59.656642, 30.326385], [59.658203, 30.336685], [59.6584, 30.35141], [59.65571, 30.35159], [59.65051, 30.36652], [59.64981, 30.37922], [59.64756, 30.38558], [59.65007321989414, 30.391319157044567], [59.65207, 30.39588], [59.65051, 30.39948], [59.65137, 30.4012], [59.64886, 30.40566], [59.64816, 30.40772], [59.65701, 30.4218], [59.66282, 30.42368], [59.66308, 30.43501], [59.64485110581441, 30.45888527661885]
                ]] } },
        { "type": "Feature", "properties": { "Name": "Фрунзенский район", "population": 390980, "area": 37.469},
            "geometry": { "type": "Polygon", "coordinates": [[
                    [59.909367, 30.33617], [59.906354, 30.338917], [59.901706, 30.34132], [59.892149, 30.346298], [59.886293, 30.345783], [59.880522, 30.349045], [59.874922, 30.354366], [59.854153, 30.364494], [59.81922, 30.382004], [59.832076, 30.456161], [59.834319, 30.475216], [59.845936, 30.45908], [59.845332, 30.456676], [59.848954, 30.454788], [59.860075, 30.437794], [59.866969, 30.425949], [59.877309, 30.41153], [59.88997, 30.396252], [59.90323, 30.378742], [59.910374, 30.366039], [59.913558, 30.363464], [59.913842, 30.357971], [59.915649, 30.34647], [59.915821, 30.342178], [59.91367, 30.335484], [59.909367, 30.33617]
                ] ] } },
        { "type": "Feature", "properties": { "Name": "Центральный район", "population": 213806, "area": 17.12},
            "geometry": { "type": "Polygon", "coordinates": [[
                    [59.93786, 30.31362],[59.93655, 30.31039],[59.92545, 30.32704],[59.92623, 30.3303], [59.92373, 30.33631], [59.92339, 30.33528], [59.91745, 30.343], [59.91584, 30.3404], [59.91619, 30.34521], [59.91412, 30.36203], [59.91498, 30.37439], [59.921, 30.40185], [59.93098, 30.3943], [59.94251, 30.40151], [59.95145, 30.40357], [59.9542, 30.40082], [59.95729, 30.39327], [59.95712, 30.38366], [59.95403, 30.37611],[59.95128, 30.36306],[59.95282, 30.34383],[59.94388, 30.31259], [59.94117, 30.308876],[59.93786, 30.31362]
                ]]
            } }
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

        for (var i = 0; i < json.length; i++) {
            showDistrictByNumver(i);
        }

    }
    var url;
    var val;

function removeAll() {
  myMap.geoObjects.removeAll();
}
function disable() {
    $('#noActive').css({
        'display': 'block',
    });
    $('#sidebar').css({
        'pointer-events': 'none',
    });
    $('#map').css({
        'pointer-events': 'none',
    });
}
function noDisable() {
    $('#noActive').css({
        'display': 'none',
    });
    $('#sidebar').css({
        'pointer-events': 'auto',
    });
    $('#map').css({
        'pointer-events': 'auto',
    });

}
    function bt(val){
            var message = val;
        removeAll();
        disable();
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
                    noDisable()
                }

        });

        function showDistrictByNumberByColor(ind, color) {
            // Создаем многоугольник, используя вспомогательный класс Polygon.
            var myPolygon = new ymaps.Polygon(
                json[ind].geometry.coordinates
                ,
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