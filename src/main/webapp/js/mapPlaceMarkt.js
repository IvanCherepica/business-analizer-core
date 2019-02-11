// Как только будет загружен API и готов DOM, выполняем инициализацию


//alert("wow");

ymaps.ready(init);

function init () {
    var myMap = new ymaps.Map('map', {
            center: [59.930163, 30.311312],
            zoom: 10
        }, {
            searchControlProvider: 'yandex#search'
        }),
        objectManager = new ymaps.ObjectManager({
            // Чтобы метки начали кластеризоваться, выставляем опцию.
            clusterize: true,
            // ObjectManager принимает те же опции, что и кластеризатор.
            gridSize: 32,
            clusterDisableClickZoom: true
        });




}