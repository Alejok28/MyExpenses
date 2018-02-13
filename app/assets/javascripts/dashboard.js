$(document).on('turbolinks:load',function(){
	// CanvasJS.addColorSet("colors",["#324D5C","#46B29D","#F0CA4D","#E37B40","#F53855"]);
	$.getJSON("http://localhost:3000/months.json", function(values) {
		var chart1 = new CanvasJS.Chart("last-six-month-expenses-chart", {
		animationEnabled: true,
		theme: "dark2",
		colorSet: "colors",
		data: [{
			type: "stackedColumn",
			showInLegend: true,
			// color: "#696661",
			name: "Purchase",
			dataPoints: [
				{ y: parseInt(values[5].purchase), label: values[5].month  },
				{ y: parseInt(values[4].purchase), label: values[4].month  },
				{ y: parseInt(values[3].purchase), label: values[3].month  },
				{ y: parseInt(values[2].purchase), label: values[2].month  },
				{ y: parseInt(values[1].purchase), label: values[1].month  },
				{ y: parseInt(values[0].purchase), label: values[0].month  }
			]
			},
			{
				type: "stackedColumn",
				showInLegend: true,
				name: "Withdrawal",
				// color: "#EDCA93",
				dataPoints: [
					{ y: parseInt(values[5].withdrawal), label: values[5].month },
					{ y: parseInt(values[4].withdrawal), label: values[4].month },
					{ y: parseInt(values[3].withdrawal), label: values[3].month },
					{ y: parseInt(values[2].withdrawal), label: values[2].month },
					{ y: parseInt(values[1].withdrawal), label: values[1].month },
					{ y: parseInt(values[0].withdrawal), label: values[0].month }
				]
			},
			{
				type: "stackedColumn",
				showInLegend: true,
				name: "Transfer",
				// color: "#695A42",
				dataPoints: [
					{ y: parseInt(values[5].transfer), label: values[5].month },
					{ y: parseInt(values[4].transfer), label: values[4].month },
					{ y: parseInt(values[3].transfer), label: values[3].month },
					{ y: parseInt(values[2].transfer), label: values[2].month },
					{ y: parseInt(values[1].transfer), label: values[1].month },
					{ y: parseInt(values[0].transfer), label: values[0].month }
				]
			},
			{
				type: "stackedColumn",
				showInLegend: true,
				name: "Payment",
				// color: "#B6B1A8",
				dataPoints: [
					{ y: parseInt(values[5].payment), label: values[5].month },
					{ y: parseInt(values[4].payment), label: values[4].month },
					{ y: parseInt(values[3].payment), label: values[3].month },
					{ y: parseInt(values[2].payment), label: values[2].month },
					{ y: parseInt(values[1].payment), label: values[1].month },
					{ y: parseInt(values[0].payment), label: values[0].month }
				]
		}]
	});
	chart1.render();
	});

	$.getJSON("http://localhost:3000/daily.json", function(values) {
		var dataPoints2 = [];
		values.map(function(value){
			dataPoints2.push({ y: parseInt(value.expense), x: value.day});
		})
		var chart2 = new CanvasJS.Chart("daily-expenses-chart", {
			animationEnabled: true,
			theme: "dark2",
			colorSet: "colors",
			axisX: {
				interval: 1,
			},
			data: [{
				type: "column",

				dataPoints: dataPoints2
			}]
		});
		chart2.render();

	});

	$.getJSON("http://localhost:3000/category.json", function(data) {
		var dataPoints = [];
		var categories = ["Restaurants", "Gocery", "Car", "Services", "Home", "Education", "Fun", "Travel"]
		var i = 0;
		data.map(function(value){
			dataPoints.push({ y: parseInt(value[1]), name: categories[i]});
			i+=1;
		})
	    var chart3 = new CanvasJS.Chart("category-chart",{
				theme: "dark2",
				colorSet: "colors",
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
	    chart3.render();
	});
	$.getJSON("http://localhost:3000/accumulated.json", function(values) {
		var dataPoints3 = [];
		var dataPoints4 = [];
		values.map(function(value){
			dataPoints3.push({ y: parseInt(value.last), label: value.day});
			dataPoints4.push({ y: parseInt(value.actual), label: value.day});
		})
		var chart4 = new CanvasJS.Chart("month-acc", {
			animationEnabled: true,
			colorSet: "colors",
			theme: "dark2",
		axisX: {
			interval: 5,
		},
		data: [{
			name: "Last Month",
			showInLegend: true,
			legendMarkerType: "square",
			type: "area",
			markerSize: 0,
			dataPoints: dataPoints3,
		},
		{
			name: "Actual Month",
			showInLegend: true,
			legendMarkerType: "square",
			type: "area",
			markerSize: 0,
			dataPoints: dataPoints4,
		}]
	});
	chart4.render();
	});

})
