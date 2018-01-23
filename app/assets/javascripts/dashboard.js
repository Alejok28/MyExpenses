window.onload = function () {
	// var dataPoints = [];
	// $.getJSON("http://localhost:3000/expenses.json", function(data) {
	//     $.each(data, function(key, value){
	//         dataPoints.push({x: value[0], y: parseInt(value[1])});
	//     });
	//     var chart = new CanvasJS.Chart("chartContainer",{
	//         title:{
	//             text:"Rendering Chart with dataPoints from External JSON"
	//         },
	//         data: [{
	//         type: "line",
	//             dataPoints : dataPoints,
	//         }]
	//     });
	//     chart.render();
	// });
	var chart = new CanvasJS.Chart("chartContainer", {
		theme: "dark2",//theme1
		title:{
			text: "last 6 months"
		},
		animationEnabled: false,   // change to true
		data: [
		{
			// Change type to "bar", "area", "spline", "pie",etc.
			type: "column",
			dataPoints: [
				{ label: "apple",  y: 10  },
				{ label: "orange", y: 15  },
				{ label: "banana", y: 25  },
				{ label: "mango",  y: 30  },
				{ label: "grape",  y: 28  }
			]
		}
		]
	});
	chart.render();
}
