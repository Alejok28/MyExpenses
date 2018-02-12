$(document).on('turbolinks:load',function(){
	var dataPoints = [];
	var categories = ["Restaurants", "Gocery", "Car", "Services", "Home", "Education", "Fun", "Travel"]
	var i = 0;
	$.getJSON("http://localhost:3000/category.json", function(data) {
		data.map(function(value){
			dataPoints.push({ y: parseInt(value[1]), name: categories[i]});
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

	$.getJSON("http://localhost:3000/months.json", function(values) {
		var chart2 = new CanvasJS.Chart("last-six-month-expenses-chart", {
		animationEnabled: true,
		theme: "dark2",
		data: [{
			type: "stackedColumn",
			showInLegend: true,
			color: "#696661",
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
				color: "#EDCA93",
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
				color: "#695A42",
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
				color: "#B6B1A8",
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
	chart2.render();
	});
})
