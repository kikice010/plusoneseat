$(function () {
    function initMap() {
        var uluru = {lat: 45.4642700, lng: 9.1895100};
        var map = new google.maps.Map(document.getElementById('map-container'), {
          zoom: 15,
          styles: [
            {elementType: 'labels.text.fill', stylers: [{color: '#ef804a'}]},
            {
              featureType: 'administrative.locality',
              elementType: 'labels.text.fill',
              stylers: [{color: '#ef804a'}]
            },
            {
              featureType: 'poi',
              elementType: 'labels.text.fill',
              stylers: [{color: '#ef804a'}]
            },
            {
              featureType: 'poi.park',
              elementType: 'labels.text.fill',
              stylers: [{color: '#ef804a'}]
            },
            {
              featureType: 'road',
              elementType: 'labels.text.fill',
              stylers: [{color: '#ef804a'}]
            },
            {
              featureType: 'road.highway',
              elementType: 'labels.text.fill',
              stylers: [{color: '#ef804a'}]
            },
            {
              featureType: 'transit.station',
              elementType: 'labels.text.fill',
              stylers: [{color: '#ef804a'}]
            },
            {
              featureType: 'water',
              elementType: 'labels.text.fill',
              stylers: [{color: '#ef804a'}]
            }
          ],
          center: uluru
        });
        
        $.mapNS.map = map;
        
        overlay = new CustomMarker(
            new google.maps.LatLng(45.4642400, 9.2895140), 
            map,
            {
                marker_id: '123',
                price: '$50',
                decimal: ''
            }
        );

        overlay = new CustomMarker(
            new google.maps.LatLng(45.4643500, 9.1895150), 
            map,
            {
                marker_id: '123',
                price: 'Milos is:',
                decimal: 'AWESOME'
            }
        );

        overlay = new CustomMarker(
            new google.maps.LatLng(45.4641400, 9.1875160), 
            map,
            {
                marker_id: '123',
                price: '$5',
                decimal: ''
            }
        );

        overlay = new CustomMarker(
            new google.maps.LatLng(45.4652500, 9.1825130), 
            map,
            {
                marker_id: '123',
                price: '$50.',
                decimal: '3'
            }
        );

        overlay = new CustomMarker(
            new google.maps.LatLng(45.4742800, 9.1855120), 
            map,
            {
                marker_id: '123',
                price: '$50.',
                decimal: '34'
            }
        );
    }
    google.maps.event.addDomListener(window, 'load', initMap);
});


$(function(){
    $.mapNS = new Object();
    $.mapNS.resized = true;
    var container = $('#floating-container');
    var left = $('#results-container').width();
    var donatorBarHeight = $('#top-donators-container').height();
    var navBarHeight = $('#header').height();
    var mapHeight = $(window).height() - donatorBarHeight - navBarHeight;
    var map = $('#map-container');

    $('#results-container').css("min-height",($(window).height() - navBarHeight));

    var maxTop = $('footer').offset().top - $(window).height() - 5; 

    map.css('height', mapHeight);
    container.css('left', left);
    

    $(document).scroll(function() {
        var scrollVal = $(document).scrollTop();
        
        container.css('top', scrollVal);

        if(container.offset().top < 0)
        {
            container.css('top', 0 ); 
        }
        
        if (scrollVal > maxTop ) {
            container.css('top', maxTop );    
        }
    });

    $(window).on('resize', function(){
        if($.mapNS.resized)
        {
            setTimeout(onResizeMapNS,10);
            $.mapNS.resized = false;
        }        
    });

    function onResizeMapNS(){
        var win = $(this); 
        mapHeight = win.height() - donatorBarHeight - navBarHeight;
        map.css('height', mapHeight);
        left = $('#results-container').width();
        container.css('left', left);
        $.mapNS.resized = true;
        google.maps.event.trigger($.mapNS.map, "resize");
        maxTop = $('footer').offset().top - $(window).height() - 5;
    }
});

