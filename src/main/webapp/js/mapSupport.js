ymaps.ready(init);

var opacity_for_all = 0.7;

isPerPopulationActivated = new Boolean(false);
isPerAreaActivated = new Boolean(false);

function getColor(num) {
    if (num > 0.5) {
        return getGradientColor('#fffa00', '#FF0000', (num-0.5)*2);
    } else {
        return getGradientColor('#00FF00', '#fffa00', num*2);
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
    var maxNum = Math.max.apply(1, innerListOfNumberOfElements);
    var colorList = [];
    console.log("maxNum " + maxNum);

    if (isPerPopulationActivated == Boolean(true)) {
        var innerPopulationList = listOfPopulationRealValues;
    } else {
        var innerPopulationList = listOfPopulationOnes;
    }
    console.log("innerPopulationList " + innerPopulationList);

    jQuery.ajaxSetup({async:false});
    if (isPerAreaActivated == Boolean(true)) {
        var innerAreaList = listOfAreaRealValues;
    } else {
        var innerAreaList = listOfAreaOnes;
    }
    console.log("innerAreaList " + innerAreaList);

    var maxNumPopulation = Math.max.apply(1, innerPopulationList);
    console.log("maxNumPopulation " + maxNumPopulation);
    var maxNumArea = Math.max.apply(1, innerAreaList);
    console.log("maxNumArea " + maxNumArea);

    var colorCoefs = [];
    console.log("colorCoefs here !!!!111111111111111111");

    jQuery.ajaxSetup({async:false});
    for (var k = 0; k < innerListOfNumberOfElements.length; k++) {
        console.log("k " + k);

        var numCompetitors = innerListOfNumberOfElements[k]/maxNum;
        console.log("numCompetitors " + numCompetitors);
        console.log("innerListOfNumberOfElements[k] " + innerListOfNumberOfElements[k]);

        var numPopulation = innerPopulationList[k]/maxNumPopulation;
        console.log("numPopulation " + numPopulation);
        console.log("innerPopulationList[k] " + innerPopulationList[k]);

        var numArea = innerAreaList[k]/maxNumArea;
        console.log("numArea " + numArea);
        console.log("innerAreaList[k] " + innerAreaList[k]);

        var finalColorCoef = numCompetitors * numPopulation * numArea;

        console.log("finalColorCoef " + finalColorCoef);
        colorCoefs.push(finalColorCoef);
    }

    var maxColorCoefs = Math.max.apply(1, colorCoefs);

    jQuery.ajaxSetup({async:false});
    for (var j = 0; j < innerListOfNumberOfElements.length; j++) {

        var normedColorCoef = colorCoefs[j]/maxColorCoefs;
        console.log(normedColorCoef);
        colorList.push(getColor(normedColorCoef));
    }
    console.log("colorList " + colorList);
    return colorList;
}


var myMap;

var zones;

var listOfPopulation = [];
var listOfArea = [];

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
    console.log("zones " + zones);

    myMap = new ymaps.Map("map", {
            center: [30.25385, 59.90024],
            zoom: 10
        },
        { searchControlProvider: 'yandex#search'}
    );

    var deliveryZones = ymaps.geoQuery(zones);//.addToMap(myMap);

    deliveryZones.each(function (obj) {

        console.log(obj.properties._data.name);
        console.log(obj.properties._data.population);
        console.log(obj.properties._data.area);
        // console.log(objInsideDistrict._objects.length);

        // var len = objInsideDistrict._objects.length;
        // console.log(len);

        // listOfNumberOfElements.push(len);
        // console.log(listOfNumberOfElements);


        listOfPopulationRealValues.push(obj.properties._data.population);
        listOfPopulationOnes.push(1);

        listOfAreaRealValues.push(obj.properties._data.area);
        listOfAreaOnes.push(1);


    });

    console.log("listOfPopulationRealValues " + listOfPopulationRealValues);
    console.log("listOfPopulationOnes " + listOfPopulationOnes);

    console.log("listOfAreaRealValues " + listOfAreaRealValues);
    console.log("listOfAreaOnes " + listOfAreaOnes);

    function showDistrictByNumver(ind) {
        // Создаем многоугольник, используя вспомогательный класс Polygon.
        var myPolygon = new ymaps.Polygon(
            zones.features[ind].geometry.coordinates
            ,
            { hintContent : zones.features[ind].properties.name}
            ,
            { fillColor: '#ffd31b',
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

var objects = [];

var listOfNumberOfElements = [];

var result;

function formFunct() {
    console.log("Value selected" + valueSelected);
    var objects = [];
    var listOfNumberOfElements = [];
    jQuery.ajaxSetup({async:false});
    var val = document.getElementById('formBT').value;
    var message = val;
    removeAll();
    disable();
    console.log(message);
    var url = "/search?formType=" + message;

    $.ajax({

        url: url,//прописать ссылку на ямап апи
        method: "get",
        error: function (message) {
            console.log(message);
        },
        success: function (data) {
            jQuery.ajaxSetup({async:false});
            console.log("data " + data);
            console.log("1");

            objects = ymaps.geoQuery(data);//.addToMap(myMap);

            console.log("2");

            var deliveryZones = ymaps.geoQuery(zones).addToMap(myMap);

            console.log("3");

            console.log("is about to start deliveryZones");

            deliveryZones.each(function (obj) {
                //var color = obj.options.get('fillColor');
                //color = color.substring(0, color.length - 2);
                //obj.options.set({fillColor: color, fillOpacity: 0.4});
                var objInsideDistrict = objects.searchInside(obj);

                var len = objInsideDistrict._objects.length;

                //console.log(obj.properties.name);
                //console.log(obj.properties._data.name);
                //console.log(len);

                listOfNumberOfElements.push(len);
                //console.log(listOfNumberOfElements);
            });
            jQuery.ajaxSetup({async:false});

            console.log("showDistrictByNumberByColor func is about to be used");

            for (var k = 0; k < zones.features.length; k++) {
                showDistrictByNumberByColor(k);
            }

            noDisable()
        }
    });


    function showDistrictByNumberByColor(ind) {
        console.log("showDistrictByNumberByColor started");
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
    isPerPopulationActivated = !isPerPopulationActivated;
    bt(valueSelected);
}
function includeArea() {
    isPerAreaActivated = !isPerAreaActivated;
    bt(valueSelected);
}

var valueSelected;

function bt(val){
    jQuery.ajaxSetup({async:false});
    valueSelected = val;
    console.log("Value selected " + valueSelected);

    var listOfNumberOfElements = [];

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
            jQuery.ajaxSetup({async:false});
            console.log(data);
            console.log("1");

            objects = ymaps.geoQuery(data);//.addToMap(myMap);

            console.log("2");

            var deliveryZones = ymaps.geoQuery(zones).addToMap(myMap);

            console.log("3");

            console.log("is about to start deliveryZones");

            deliveryZones.each(function (obj) {
                //var color = obj.options.get('fillColor');
                //color = color.substring(0, color.length - 2);
                //obj.options.set({fillColor: color, fillOpacity: 0.4});
                var objInsideDistrict = objects.searchInside(obj);

                var len = objInsideDistrict._objects.length;
                //console.log(obj.properties.name);
                console.log(obj.properties._data.name);
                console.log(len);

                listOfNumberOfElements.push(len);
                console.log(listOfNumberOfElements);
            });
            jQuery.ajaxSetup({async:false});
            console.log("showDistrictByNumberByColor func is about to be used");

            for (var k = 0; k < zones.features.length; k++) {
                showDistrictByNumberByColor(k);
            }

            noDisable()
        }

    });

    function showDistrictByNumberByColor(ind) {
        console.log("showDistrictByNumberByColor started");
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

// ymaps.ready(init);
//
// var opacity_for_all = 0.7;
//
// isPerPopulationActivated = new Boolean(false);
// isPerAreaActivated = new Boolean(false);
//
// var counter = 1;
//
// function getColor(num) {
//     if (num > 0.5) {
//         return getGradientColor('#fffa00', '#FF0000', (num-0.5)*2);
//     } else {
//         return getGradientColor('#00FF00', '#fffa00', num*2);
//     }
// }
//
// getGradientColor = function(start_color, end_color, percent) {
//     // strip the leading # if it's there
//     start_color = start_color.replace(/^\s*#|\s*$/g, '');
//     end_color = end_color.replace(/^\s*#|\s*$/g, '');
//
//     // convert 3 char codes --> 6, e.g. `E0F` --> `EE00FF`
//     if(start_color.length == 3){
//         start_color = start_color.replace(/(.)/g, '$1$1');
//     }
//
//     if(end_color.length == 3){
//         end_color = end_color.replace(/(.)/g, '$1$1');
//     }
//
//     // get colors
//     var start_red = parseInt(start_color.substr(0, 2), 16),
//         start_green = parseInt(start_color.substr(2, 2), 16),
//         start_blue = parseInt(start_color.substr(4, 2), 16);
//
//     var end_red = parseInt(end_color.substr(0, 2), 16),
//         end_green = parseInt(end_color.substr(2, 2), 16),
//         end_blue = parseInt(end_color.substr(4, 2), 16);
//
//     // calculate new color
//     var diff_red = end_red - start_red;
//     var diff_green = end_green - start_green;
//     var diff_blue = end_blue - start_blue;
//
//     diff_red = ( (diff_red * percent) + start_red ).toString(16).split('.')[0];
//     diff_green = ( (diff_green * percent) + start_green ).toString(16).split('.')[0];
//     diff_blue = ( (diff_blue * percent) + start_blue ).toString(16).split('.')[0];
//
//     // ensure 2 digits by color
//     if( diff_red.length == 1 ) diff_red = '0' + diff_red
//     if( diff_green.length == 1 ) diff_green = '0' + diff_green
//     if( diff_blue.length == 1 ) diff_blue = '0' + diff_blue
//
//     return '#' + diff_red + diff_green + diff_blue;
// };
//
//
// function calculateColor(innerListOfNumberOfElements) {
//     var maxNum = Math.max.apply(1, innerListOfNumberOfElements);
//     var colorList = [];
//     console.log(maxNum);
//
//     var maxNumPopulation = Math.max.apply(1, listOfPopulation);
//     var maxNumArea = Math.max.apply(1, listOfArea);
//
//
//     for (var j = 0; j < innerListOfNumberOfElements.length; j++) {
//         console.log(innerListOfNumberOfElements[j]/maxNum);
//         colorList.push(getColor((innerListOfNumberOfElements[j]/maxNum) * (listOfPopulation[j]/maxNumPopulation) * (listOfArea[j]/maxNumArea)));
//     }
//     //console.log(colorList);
//     return colorList;
// }
//
//
// var myMap;
//
// var zones;
//
// var listOfPopulation = [];
// var listOfArea = [];
//
// function init() {
//
//     jQuery.ajaxSetup({async:false});
//     $.get("http://localhost:8080/districtsData").success(function (data) {
//         zones = data;
//     }).error(function () {
//         console.error('error');
//     });
//     jQuery.ajaxSetup({async:true});
//
//     if (isPerPopulationActivated == Boolean(true)) {
//         counter = counter + 1;
//     }
//     if (isPerAreaActivated == Boolean(true)) {
//         counter = counter + 1;
//     }
//
//     var listOfNumberOfElements = [];
//     var listOfPopulation = [];
//     var listOfArea = [];
//
//
//     myMap = new ymaps.Map("map", {
//             center: [30.25385, 59.90024],
//             zoom: 10
//         },
//         { searchControlProvider: 'yandex#search'}
//     );
//
//     var deliveryZones = ymaps.geoQuery(zones);//.addToMap(myMap);
//
//
//     deliveryZones.each(function (obj) {
//
//         console.log(obj.properties._data.name);
//         console.log(obj.properties._data.population);
//         console.log(obj.properties._data.area);
//
//         if (isPerPopulationActivated == Boolean(true)) {
//             listOfPopulation.push(obj.properties._data.population);
//         } else {
//             listOfPopulation.push(1);
//         }
//         console.log(listOfPopulation);
//
//         if (isPerAreaActivated == Boolean(true)) {
//             listOfArea.push(obj.properties._data.area);
//         } else {
//             listOfArea.push(1);
//         }
//         console.log(listOfArea);
//
//     });
//
//     function showDistrictByNumver(ind) {
//         // Создаем многоугольник, используя вспомогательный класс Polygon.
//         var myPolygon = new ymaps.Polygon(
//             zones.features[ind].geometry.coordinates
//             ,
//             { hintContent : zones.features[ind].properties.name}
//             ,
//             { fillColor: '#ffd31b',
//                 opacity: opacity_for_all,
//                 strokeColor: '#808080',
//                 strokeWidth: 1}
//         );
//         myMap.geoObjects.add(myPolygon);
//     }
//
//
//     for (var i = 0; i < zones.features.length; i++) {
//         showDistrictByNumver(i);
//     }
// }
//
// var url;
// var val;
//
// function removeAll() {
//     myMap.geoObjects.removeAll();
// }
// function disable() {
//     $('#noActive').css({
//         'display': 'block',
//     });
//     $('#sidebar').css({
//         'pointer-events': 'none',
//     });
//     $('#map').css({
//         'pointer-events': 'none',
//     });
// }
// function noDisable() {
//     $('#noActive').css({
//         'display': 'none',
//     });
//     $('#sidebar').css({
//         'pointer-events': 'auto',
//     });
//     $('#map').css({
//         'pointer-events': 'auto',
//     });
//
// }
//
// var objects = [];
//
// //var listOfNumberOfElements = [];
//
// //var result;
//
// function formFunct() {
//     var objects = [];
//     var listOfNumberOfElements = [];
//     jQuery.ajaxSetup({async:false});
//     var val = document.getElementById('formBT').value;
//     var message = val;
//     removeAll();
//     disable();
//     console.log(message);
//     var url = "/search?formType=" + message;
//
//     $.ajax({
//
//         url: url,//прописать ссылку на ямап апи
//         method: "get",
//         error: function (message) {
//             console.log(message);
//         },
//         success: function (data) {
//             jQuery.ajaxSetup({async:false});
//             console.log(data);
//             console.log("1");
//
//             objects = ymaps.geoQuery(data);//.addToMap(myMap);
//
//             console.log("2");
//
//             var deliveryZones = ymaps.geoQuery(zones).addToMap(myMap);
//
//             console.log("3");
//
//             console.log("is about to start deliveryZones");
//
//             deliveryZones.each(function (obj) {
//
//                 var objInsideDistrict = objects.searchInside(obj);
//
//                 var len = objInsideDistrict._objects.length;
//
//                 console.log(obj.properties._data.name);
//                 console.log(len);
//
//                 listOfNumberOfElements.push(len);
//                 console.log(listOfNumberOfElements);
//             });
//             jQuery.ajaxSetup({async:false});
//
//             console.log("showDistrictByNumberByColor func is about to be used");
//
//             for (var k = 0; k < zones.features.length; k++) {
//                 showDistrictByNumberByColor(k);
//             }
//
//             noDisable()
//         }
//     });
//
//
//     function showDistrictByNumberByColor(ind) {
//         console.log("showDistrictByNumberByColor started");
//         var colorList = calculateColor(listOfNumberOfElements);
//         // Создаем многоугольник, используя вспомогательный класс Polygon.
//         var myPolygon = new ymaps.Polygon(
//             zones.features[ind].geometry.coordinates
//             ,
//             { hintContent : zones.features[ind].properties.name}
//             ,
//             { fillColor: colorList[ind],
//                 opacity: opacity_for_all,
//                 strokeColor: '#808080',
//                 strokeWidth: 1}
//         );
//
//         myMap.geoObjects.add(myPolygon);
//     }
//
// }
//
// function bt(val){
//     jQuery.ajaxSetup({async:false});
//
//     var listOfNumberOfElements = [];
//
//     var message = val;
//     removeAll();
//     disable();
//     console.log(message);
//     var url = "/search?type="+message;
//
//     $.ajax({
//         url: url,//прописать ссылку на ямап апи
//         method: "get",
//         error: function(message) {
//             console.log(message);
//         },
//         success: function(data) {
//             jQuery.ajaxSetup({async:false});
//             console.log(data);
//             console.log("1");
//
//             objects = ymaps.geoQuery(data);//.addToMap(myMap);
//
//             console.log("2");
//
//             var deliveryZones = ymaps.geoQuery(zones).addToMap(myMap);
//
//             console.log("3");
//
//             console.log("is about to start deliveryZones");
//
//             deliveryZones.each(function (obj) {
//
//                 var objInsideDistrict = objects.searchInside(obj);
//
//                 var len = objInsideDistrict._objects.length;
//                 console.log(obj.properties._data.name);
//                 console.log(len);
//
//                 listOfNumberOfElements.push(len);
//                 console.log(listOfNumberOfElements);
//             });
//             jQuery.ajaxSetup({async:false});
//             console.log("showDistrictByNumberByColor func is about to be used");
//
//             for (var k = 0; k < zones.features.length; k++) {
//                 showDistrictByNumberByColor(k);
//             }
//
//             noDisable()
//         }
//
//     });
//
//     function showDistrictByNumberByColor(ind) {
//         console.log("showDistrictByNumberByColor started");
//         var colorList = calculateColor(listOfNumberOfElements);
//         // Создаем многоугольник, используя вспомогательный класс Polygon.
//         var myPolygon = new ymaps.Polygon(
//             zones.features[ind].geometry.coordinates
//             ,
//             { hintContent : zones.features[ind].properties.Name}
//             ,
//             { fillColor: colorList[ind],
//                 opacity: opacity_for_all,
//                 strokeColor: '#808080',
//                 strokeWidth: 1}
//         );
//
//         myMap.geoObjects.add(myPolygon);
//     }
//
// }
//


