ymaps.ready(init);


var opacity_for_all = 0.7;

isPerPopulationActivated = new Boolean(false);
isPerAreaActivated = new Boolean(false);

isPointsAdded = new Boolean(false);

function getColor(num) {
    var coef = 0.3;
    if (num > coef) {
        return getGradientColor('#fffa00', '#FF0000', (num-coef)/(1-coef));
    } else {
        return getGradientColor('#00FF00', '#fffa00', num/coef);
    }
}


getGradientColor = function(start_color, end_color, percent) {
    // strip the leading # if it's there
    start_color = start_color.replace(/^\s*#|\s*$/g, '');
    end_color = end_color.replace(/^\s*#|\s*$/g, '');

    // convert 3 char codes --> 6, e.g. `E0F` --> `EE00FF`
    if(start_color.length == 3){
        start_color = start_color.replace(/(.)/g, '$1$1');
    }

    if(end_color.length == 3){
        end_color = end_color.replace(/(.)/g, '$1$1');
    }

    // get colors
    var start_red = parseInt(start_color.substr(0, 2), 16),
        start_green = parseInt(start_color.substr(2, 2), 16),
        start_blue = parseInt(start_color.substr(4, 2), 16);

    var end_red = parseInt(end_color.substr(0, 2), 16),
        end_green = parseInt(end_color.substr(2, 2), 16),
        end_blue = parseInt(end_color.substr(4, 2), 16);

    // calculate new color
    var diff_red = end_red - start_red;
    var diff_green = end_green - start_green;
    var diff_blue = end_blue - start_blue;

    diff_red = ( (diff_red * percent) + start_red ).toString(16).split('.')[0];
    diff_green = ( (diff_green * percent) + start_green ).toString(16).split('.')[0];
    diff_blue = ( (diff_blue * percent) + start_blue ).toString(16).split('.')[0];

    // ensure 2 digits by color
    if( diff_red.length == 1 ) diff_red = '0' + diff_red
    if( diff_green.length == 1 ) diff_green = '0' + diff_green
    if( diff_blue.length == 1 ) diff_blue = '0' + diff_blue

    return '#' + diff_red + diff_green + diff_blue;
};


function calculateColor(innerListOfNumberOfElements) {
    jQuery.ajaxSetup({async:false});
    var maxNum = Math.max.apply(1, innerListOfNumberOfElements); //median(innerListOfNumberOfElements); //
    var colorList = [];



    if (isPerPopulationActivated == Boolean(true)) {
        var innerPopulationList = listOfPopulationRealValues;
    } else {
        var innerPopulationList = listOfPopulationOnes;
    }

    jQuery.ajaxSetup({async:false});
    if (isPerAreaActivated == Boolean(true)) {
        var innerAreaList = listOfAreaRealValues;
    } else {
        var innerAreaList = listOfAreaOnes;
    }

    var maxNumPopulation = Math.max.apply(1, innerPopulationList);
    var maxNumArea = Math.max.apply(1, innerAreaList);

    var colorCoefs = [];

    jQuery.ajaxSetup({async:false});

    for (var k = 0; k < innerListOfNumberOfElements.length; k++) {

        var numCompetitors = innerListOfNumberOfElements[k]/maxNum;


        var numPopulation = innerPopulationList[k]; ///maxNumPopulation;


        var numArea = innerAreaList[k]; ///maxNumArea;

        var finalColorCoef = (numCompetitors / numPopulation) / numArea;

        // console.log("finalColorCoef " + finalColorCoef);
        colorCoefs.push(finalColorCoef);
    }

    var maxColorCoefs = Math.max.apply(1, colorCoefs);

    jQuery.ajaxSetup({async:false});
    for (var j = 0; j < innerListOfNumberOfElements.length; j++) {

        var normedColorCoef = colorCoefs[j]/maxColorCoefs;
        // console.log(normedColorCoef);
        colorList.push(getColor(normedColorCoef));
    }
    // console.log("colorList " + colorList);
    return colorList;
}


var myMap;

var zones;

var listOfPopulationRealValues = [];
var listOfPopulationOnes = [];

var listOfAreaRealValues = [];
var listOfAreaOnes = [];

function init() {

    jQuery.ajaxSetup({async:false});
    $.get("http://localhost:8080/districtsData").success(function (data) {
        zones = data;
    }).error(function () {
        console.error('error');
    });
    jQuery.ajaxSetup({async:false});
    // console.log("zones " + zones);

    myMap = new ymaps.Map("map", {
            center: [30.25385, 59.90024],
            zoom: 10
        },
        { searchControlProvider: 'yandex#search'}
    );

    var deliveryZones = ymaps.geoQuery(zones).addToMap(myMap);

    deliveryZones.each(function (obj) {

        listOfPopulationRealValues.push(obj.properties._data.population);
        listOfPopulationOnes.push(1);

        listOfAreaRealValues.push(obj.properties._data.area);
        listOfAreaOnes.push(1);


    });



    function showDistrictByNumver(ind) {
        // Создаем многоугольник, используя вспомогательный класс Polygon.
        var myPolygon = new ymaps.Polygon(
            zones.features[ind].geometry.coordinates
            ,
            { hintContent : zones.features[ind].properties.name}
            ,
            { fillColor: '#fff926',
                opacity: opacity_for_all,
                strokeColor: '#808080',
                strokeWidth: 1}
        );
        myMap.geoObjects.add(myPolygon);
    }


    for (var i = 0; i < zones.features.length; i++) {
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
var hardCodeCostylFormFunctValue = -1;

var objects = [];

var listOfNumberOfElements = [];

var result;

var formListOfNumberOfElements;

function formFunct() {
    valueSelected = hardCodeCostylFormFunctValue;
    // console.log("Value selected" + valueSelected);
    var objects = [];
    var listOfNumberOfElements = [];
    jQuery.ajaxSetup({async:false});
    var val = document.getElementById('formBT').value;
    var message = val;
    removeAll();
    disable();
    // console.log(message);
    var url = "/search?formType=" + message;

    $.ajax({

        url: url,//прописать ссылку на ямап апи
        method: "get",
        error: function (message) {
            console.log(message);
        },
        success: function (data) {
            jQuery.ajaxSetup({async:false});
            // console.log("data " + data);
            // console.log("1");

            if (isPointsAdded == Boolean(true)) {
                objects = ymaps.geoQuery(data).addToMap(myMap);
            } else {
                objects = ymaps.geoQuery(data);//.addToMap(myMap);
            }




            objects = ymaps.geoQuery(data);//.addToMap(myMap);

            outerPoints = objects;


            var deliveryZones = ymaps.geoQuery(zones).addToMap(myMap);


            deliveryZones.each(function (obj) {

                var objInsideDistrict = objects.searchInside(obj);

                var len = objInsideDistrict._objects.length;


                listOfNumberOfElements.push(len);
            });

            formListOfNumberOfElements = listOfNumberOfElements;
            jQuery.ajaxSetup({async:false});

            // console.log("showDistrictByNumberByColor func is about to be used");

            for (var k = 0; k < zones.features.length; k++) {
                showDistrictByNumberByColor(k);
            }

            noDisable();
        }
    });


    function showDistrictByNumberByColor(ind) {
        // console.log("showDistrictByNumberByColor started");
        var colorList = calculateColor(listOfNumberOfElements);
        // Создаем многоугольник, используя вспомогательный класс Polygon.
        var myPolygon = new ymaps.Polygon(
            zones.features[ind].geometry.coordinates
            ,
            { hintContent : zones.features[ind].properties.name}
            ,
            { fillColor: colorList[ind],
                opacity: opacity_for_all,
                strokeColor: '#808080',
                strokeWidth: 1}
        );

        myMap.geoObjects.add(myPolygon);
    }

}


function includePopulation() {


    opacity_for_all = 0.7;

    removeAll();
    disable();

    function showDistrictByNumberByColor(ind) {
        var colorList = calculateColor(listOfNumberOfElements);
        var myPolygon = new ymaps.Polygon(
            zones.features[ind].geometry.coordinates
            ,
            { hintContent : zones.features[ind].properties.name}
            ,
            { fillColor: colorList[ind],
                opacity: opacity_for_all,
                strokeColor: '#808080',
                strokeWidth: 1}
        );

        myMap.geoObjects.add(myPolygon);
    }

    if (box1.checked == true) {
        isPerPopulationActivated = Boolean(true);
    } else {
        isPerPopulationActivated = Boolean(false);
    }


    if (valueSelected != hardCodeCostylFormFunctValue) {
        bt(valueSelected);
    } else {
        listOfNumberOfElements = formListOfNumberOfElements;
        for (var k = 0; k < zones.features.length; k++) {
            showDistrictByNumberByColor(k);
        }

    }

    if (box3.checked == true) {

        isPointsAdded = Boolean(true);
        outerPoints.addToMap(myMap);
        noDisable();

    } else {

        isPointsAdded = new Boolean(false);
    }

    noDisable();

}
function includeArea() {
    opacity_for_all = 0.7;


    removeAll();
    disable();

    function showDistrictByNumberByColor(ind) {

        var colorList = calculateColor(listOfNumberOfElements);

        var myPolygon = new ymaps.Polygon(
            zones.features[ind].geometry.coordinates
            ,
            { hintContent : zones.features[ind].properties.name}
            ,
            { fillColor: colorList[ind],
                opacity: opacity_for_all,
                strokeColor: '#808080',
                strokeWidth: 1}
        );

        myMap.geoObjects.add(myPolygon);
    }

    if (box2.checked == true) {
        isPerAreaActivated = Boolean(true);
    } else {
        isPerAreaActivated = Boolean(false);
    }

    if (valueSelected != hardCodeCostylFormFunctValue) {
        bt(valueSelected);
    } else {
        listOfNumberOfElements = formListOfNumberOfElements;
        for (var k = 0; k < zones.features.length; k++) {
            showDistrictByNumberByColor(k);
        }

    }

    if (box3.checked == true) {
        isPointsAdded = Boolean(true);
        outerPoints.addToMap(myMap);
        noDisable();

    } else {
        isPointsAdded = new Boolean(false);
    }

    noDisable();
}

function includePoints() {

    function showDistrictByNumberByColor(ind) {
        var colorList = calculateColor(listOfNumberOfElements);
        var myPolygon = new ymaps.Polygon(
            zones.features[ind].geometry.coordinates
            ,
            { hintContent : zones.features[ind].properties.name}
            ,
            { fillColor: colorList[ind],
                opacity: opacity_for_all,
                strokeColor: '#808080',
                strokeWidth: 1}
        );

        myMap.geoObjects.add(myPolygon);
    }

    if (box3.checked == true) {

        isPointsAdded = Boolean(true);


        outerPoints.addToMap(myMap);
        noDisable();

    } else {
        removeAll();
        disable();
        // console.log("includePoints started!!!! False");
        isPointsAdded = new Boolean(false);

        function showDistrictByNumberByColor(ind) {
            // console.log("showDistrictByNumberByColor started");
            var colorList = calculateColor(listOfNumberOfElements);
            // Создаем многоугольник, используя вспомогательный класс Polygon.
            var myPolygon = new ymaps.Polygon(
                zones.features[ind].geometry.coordinates
                ,
                { hintContent : zones.features[ind].properties.name}
                ,
                { fillColor: colorList[ind],
                    opacity: opacity_for_all,
                    strokeColor: '#808080',
                    strokeWidth: 1}
            );

            myMap.geoObjects.add(myPolygon);
        }

        if (valueSelected != hardCodeCostylFormFunctValue) {
            bt(valueSelected);
        } else {
            listOfNumberOfElements = formListOfNumberOfElements;
            for (var k = 0; k < zones.features.length; k++) {
                showDistrictByNumberByColor(k);
            }
        }
        noDisable();
    }

}






function boolit(val) {

    var id ="#"+String(val);
    // document.getElementById(id).classList.add('circleactive');
    document.getElementById(val).className = "circleactive";
}

// function disAllBoolit() {
//
//     $('#bool').css({
//         'display': 'none',
//     });
//
//
// }

if(document.getElementsByClassName) {
    getElementsByClass = function(classList, node) {
        return (node || document).getElementsByClassName(classList)
    }
} else {

    getElementsByClass = function(classList, node) {
        var node = node || document,
            list = node.getElementsByTagName('*'),
            length = list.length,
            classArray = classList.split(/\s+/),
            classes = classArray.length,
            result = [], i,j
        for(i = 0; i < length; i++) {
            for(j = 0; j < classes; j++)  {
                if(list[i].className.search('\\b' + classArray[j] + '\\b') != -1) {
                    result.push(list[i])
                    break
                }
            }
        }
        return result
    }
}



function booDisable() {
    var elements = getElementsByClass('circleactive');
    for (var i=0; i<elements.length; i++)  {
        elements[i].className = elements[i].className.replace('circleactive', 'circledisable')
    }
}



var outerPoints;

var valueSelected;

function bt(val){
    booDisable();
    boolit(val);
    jQuery.ajaxSetup({async:false});
    valueSelected = val;

    var listOfNumberOfElements = [];

    removeAll();
    disable();
    // console.log(message);
    var url = "/search?type="+valueSelected;

    $.ajax({
        url: url,//прописать ссылку на ямап апи
        method: "get",
        error: function(valueSelected) {
            console.log(valueSelected);
        },
        success: function(data) {
            jQuery.ajaxSetup({async:false});
            // console.log(data);
            //console.log("1");

            if (isPointsAdded == Boolean(true)) {
                objects = ymaps.geoQuery(data).addToMap(myMap);
            } else {
                objects = ymaps.geoQuery(data);
            }

            outerPoints = objects;


            var deliveryZones = ymaps.geoQuery(zones).addToMap(myMap);


            console.log("is about to start deliveryZones " + '[' + new Date().toUTCString() + '] ');

            deliveryZones.each(function (obj) {

                var objInsideDistrict = objects.searchInside(obj);

                var len = objInsideDistrict._objects.length;

                listOfNumberOfElements.push(len);
            });
            jQuery.ajaxSetup({async:false});

            for (var k = 0; k < zones.features.length; k++) {
                showDistrictByNumberByColor(k);
            }
            console.log("BT per value showDistrictByNumberByColor  " + '[' + new Date().toUTCString() + '] ');

            noDisable()
        }

    });

    function showDistrictByNumberByColor(ind) {
        var colorList = calculateColor(listOfNumberOfElements);
        var myPolygon = new ymaps.Polygon(
            zones.features[ind].geometry.coordinates
            ,
            { hintContent : zones.features[ind].properties.name}
            ,
            { fillColor: colorList[ind],
                opacity: opacity_for_all,
                strokeColor: '#808080',
                strokeWidth: 1}
        );

        myMap.geoObjects.add(myPolygon);
    }

}
