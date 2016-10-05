CustomMarker.prototype = new google.maps.OverlayView();

function CustomMarker(latlng, map, args) {
	this.latlng_ = latlng;	
	this.args_ = args;
	this.map_ = map;	

	this.div_ = null;
	this.setMap(map);
}

CustomMarker.prototype.onAdd = function() {

}

CustomMarker.prototype.draw = function() {
	
	var self = this;
	
	var div = this.div_;
	var p;
	
	if (!div) {
	
		div = this.div_ = document.createElement('div');
		
		div.className = 'p1s-marker';
		p = document.createElement('p');
		p.className = 'price'
		p.innerText = this.args_.price;
		div.appendChild(p);
		p = document.createElement('p');
		p.className = 'decimal'
		p.innerText = this.args_.decimal;
		div.appendChild(p);
		
		if (typeof(self.args_.marker_id) !== 'undefined') {
			div.dataset.marker_id = self.args_.marker_id;
		}
		
		google.maps.event.addDomListener(div, "click", function(event) {
			alert('You clicked on a custom marker!');			
			google.maps.event.trigger(self, "click");
		});
		
		var panes = this.getPanes();
		panes.overlayImage.appendChild(div);
	}
	
	var point = this.getProjection().fromLatLngToDivPixel(this.latlng_);
	
	if (point) {
		div.style.left = (point.x - div.clientWidth/2) + 'px';
		div.style.top = (point.y - div.clientHeight/2) + 'px';
	}
};

CustomMarker.prototype.remove = function() {
	if (this.div_) {
		this.div_.parentNode.removeChild(this.div_);
		this.div_ = null;
	}	
};

CustomMarker.prototype.getPosition = function() {
	return this.latlng_;	
};