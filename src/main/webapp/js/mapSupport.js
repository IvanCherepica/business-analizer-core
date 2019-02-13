ymaps.ready(init);

// function getColor(num) {
//     var resultColor = '#FF0000';
//     if (num > 0.8) {
//         resultColor = '#FF0000';
//     } else if (num > 0.6) {
//         resultColor = '#ff7f2e';
//     } else if (num > 0.4) {
//         resultColor = '#ffd31b';
//     } else if (num > 0.2) {
//         resultColor = '#b3ff3a';
//     } else {
//         resultColor = '#00FF00';
//     }
//     return resultColor;
// }
//
// function calculateColor(innerListOfNumberOfElements) {
//     var maxNum = Math.max.apply(1, innerListOfNumberOfElements);
//     var colorList = [];
//     console.log(maxNum);
//
//     for (var j = 0; j < innerListOfNumberOfElements.length; j++) {
//         console.log(innerListOfNumberOfElements[j]/maxNum);
//         colorList.push(getColor(innerListOfNumberOfElements[j]/maxNum));
//     }
//     //console.log(colorList);
//     return colorList;
// }
//
// function showDistrictByNumver(ind) {
//     // Создаем многоугольник, используя вспомогательный класс Polygon.
//     var myPolygon = new ymaps.Polygon(
//         zones.features[ind].geometry.coordinates
//         ,
//         { hintContent : zones.features[ind].properties.name}
//         ,
//         { fillColor: '#ffd31b',
//             opacity: 0.5,
//             strokeColor: '#808080',
//             strokeWidth: 1}
//     );
//     myMap.geoObjects.add(myPolygon);
// }
//
// function showDistrictByNumberByColor(ind) {
//     console.log("showDistrictByNumberByColor started");
//     var colorList = calculateColor(listOfNumberOfElements);
//     // Создаем многоугольник, используя вспомогательный класс Polygon.
//     var myPolygon = new ymaps.Polygon(
//         zones.features[ind].geometry.coordinates
//         ,
//         { hintContent : zones.features[ind].properties.name}
//         ,
//         { fillColor: colorList[ind],
//             opacity: 0.8,
//             strokeColor: '#808080',
//             strokeWidth: 1}
//     );
//
//     myMap.geoObjects.add(myPolygon);
// }


var myMap;

var zones;

function init() {

    jQuery.ajaxSetup({async:false});
    $.get("http://localhost:8080/districtsData").success(function (data) {
        zones = data;
    }).error(function () {
        console.error('error');
    });
    jQuery.ajaxSetup({async:true});


    myMap = new ymaps.Map("map", {
            center: [30.25385, 59.90024],
            zoom: 10
        },
        { searchControlProvider: 'yandex#search'}
    );

    function showDistrictByNumver(ind) {
        // Создаем многоугольник, используя вспомогательный класс Polygon.
        var myPolygon = new ymaps.Polygon(
            zones.features[ind].geometry.coordinates
            ,
            { hintContent : zones.features[ind].properties.name}
            ,
            { fillColor: '#ffd31b',
                opacity: 0.5,
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
            console.log(data);
            console.log("1");

            objects = ymaps.geoQuery(data).addToMap(myMap);

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

    function getColor(num) {
        var resultColor = '#FF0000';
        if (num > 0.8) {
            resultColor = '#FF0000';
        } else if (num > 0.6) {
            resultColor = '#ff7f2e';
        } else if (num > 0.4) {
            resultColor = '#ffd31b';
        } else if (num > 0.2) {
            resultColor = '#b3ff3a';
        } else {
            resultColor = '#00FF00';
        }
        return resultColor;
    }

    function calculateColor(innerListOfNumberOfElements) {
        var maxNum = Math.max.apply(1, innerListOfNumberOfElements);
        var colorList = [];
        console.log(maxNum);

        for (var j = 0; j < innerListOfNumberOfElements.length; j++) {
            console.log(innerListOfNumberOfElements[j]/maxNum);
            colorList.push(getColor(innerListOfNumberOfElements[j]/maxNum));
        }
        //console.log(colorList);
        return colorList;
    }



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
                opacity: 0.6,
                strokeColor: '#808080',
                strokeWidth: 1}
        );

        myMap.geoObjects.add(myPolygon);
    }

}

function bt(val){
    jQuery.ajaxSetup({async:false});

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

            objects = ymaps.geoQuery(data).addToMap(myMap);

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

    function getColor(num) {
        var resultColor = '#FF0000';
        if (num > 0.8) {
            resultColor = '#FF0000';
        } else if (num > 0.6) {
            resultColor = '#ff7f2e';
        } else if (num > 0.4) {
            resultColor = '#ffd31b';
        } else if (num > 0.2) {
            resultColor = '#b3ff3a';
        } else {
            resultColor = '#00FF00';
        }
        return resultColor;
    }

    function calculateColor(innerListOfNumberOfElements) {
        var maxNum = Math.max.apply(1, innerListOfNumberOfElements);
        var colorList = [];
        console.log(maxNum);

        for (var j = 0; j < innerListOfNumberOfElements.length; j++) {
            console.log(innerListOfNumberOfElements[j]/maxNum);
            colorList.push(getColor(innerListOfNumberOfElements[j]/maxNum));
        }
        //console.log(colorList);
        return colorList;
    }

    function showDistrictByNumberByColor(ind) {
        console.log("showDistrictByNumberByColor started");
        var colorList = calculateColor(listOfNumberOfElements);
        // Создаем многоугольник, используя вспомогательный класс Polygon.
        var myPolygon = new ymaps.Polygon(
            zones.features[ind].geometry.coordinates
            ,
            { hintContent : zones.features[ind].properties.Name}
            ,
            { fillColor: colorList[ind],
                opacity: 0.6,
                strokeColor: '#808080',
                strokeWidth: 1}
        );

        myMap.geoObjects.add(myPolygon);
    }

}

