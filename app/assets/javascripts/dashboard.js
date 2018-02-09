var dataPoints = [];
var nombre = ["Restaurants", "Gocery", "Car", "Services", "Home", "Education", "Fun", "Travel"]
var i = 0;
$.getJSON("http://localhost:3000/category.json", function(data) {
	data.map(function(value){
		dataPoints.push({ y: parseInt(value[1]), name: nombre[i]});
		i+=1;
	})
    var chart = new CanvasJS.Chart("category-chart",{
			theme: "dark2",
			animationEnabled: true,
        data: [{
	        type: "doughnut",
					innerRadius: 60,
					indexLabelFontSize: 14,
					toolTipContent: "<b>{name}</b>: ${y} (#percent%)",
					indexLabel: "{name}",
	        dataPoints : dataPoints,
        }]
    });
    chart.render();
});
