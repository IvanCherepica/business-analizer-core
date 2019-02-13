ymaps.ready(init);

var opacity_for_all = 0.7;

function getColor(num) {
    if (num > 0.5) {
        return getGradientColor('#fffa00', '#FF0000', (num-0.5)*2);
    } else {
        return getGradientColor('#00FF00', '#fffa00', num*2);
    }
    // return getGradientColor('#00FF00', '#FF0000', num);
    //return getGradientColor('#008200', '#FF0000', num);
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
                opacity: opacity_for_all,
                strokeColor: '#808080',
                strokeWidth: 1}
        );

        myMap.geoObjects.add(myPolygon);
    }

}

