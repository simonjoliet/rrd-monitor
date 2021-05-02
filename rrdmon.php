<!DOCTYPE HTML>
<?php

//Getting the available disk space	
exec("df -h | grep root | awk '{print $2}' | sed -e 's\\G\\\\g'", $totalSpace);
exec("df -h | grep root | awk '{print $3}' | sed -e 's\\G\\\\g'", $usedSpace);
$freeSpace = $totalSpace[0] - $usedSpace[0];

//Getting the Ping data from RRD and loading it in a concatenated string
exec("rrdtool fetch rrd/ping/ping.rrd AVERAGE", $rrdDataPing);

for ($i=2; $i < sizeof($rrdDataPing) - 1; $i++) {

	$rrdExtractPing[$i] = explode(": ",$rrdDataPing[$i]);
	$dataLinePing .= "[new Date(".$rrdExtractPing[$i][0]."*1000),".floatval($rrdExtractPing[$i][1])."]";
	if( $i < sizeof($rrdDataPing) - 2 ) {
		$dataLinePing .= ",";
	}
}

//Getting the Temperature data from RRD and loading it in a concatenated string
exec("rrdtool fetch rrd/temp/temp.rrd AVERAGE", $rrdDataTemp);

for ($i=2; $i < sizeof($rrdDataTemp) - 1; $i++) {

	$rrdExtractTemp[$i] = explode(": ",$rrdDataTemp[$i]);
	$dataLineTemp .= "[new Date(".$rrdExtractTemp[$i][0]."*1000),".floatval($rrdExtractTemp[$i][1]/1000)."]";
	if( $i < sizeof($rrdDataTemp) - 2 ) {
		$dataLineTemp .= ",";
	}
}

?>
<html>
	<head>
		<title>Raspi RRD Monitoring</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
//Set Pie chart for Disk usage
google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			['Space', 'Usage'],
			['Free', <?php echo ($freeSpace); ?>],
			['Used', <?php echo ($usedSpace[0]); ?>],
		]);

		var options = {
			title: 'Disk Space',
			'backgroundColor': 'transparent',
			pieHole: 0.4,
		};
	var chart = new google.visualization.PieChart(document.getElementById('piechart'));
	chart.draw(data, options);
}
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {
	
	//Set the Ping line chart
	var dataPing = new google.visualization.DataTable();
	dataPing.addColumn('datetime', 'X');
	dataPing.addColumn('number', 'msec');
	
	dataPing.addRows([<?php echo $dataLinePing; ?> ]);
	var options = {
		hAxis: {
			title: 'Time',
			gridlines: {
				count: -1,
				units: {
					days: {format: ['MMM dd']},
					hours: {format: ['HH:mm', 'ha']},
				}
			},
			minorGridlines: {
				units: {
					hours: {format: ['hh:mm:ss a', 'ha']},
					minutes: {format: ['HH:mm a Z', ':mm']}
				}
			},
			format: 'MMM dd, yyyy'
		},
		vAxis: {
			title: 'Ping [ms]',
			unit: 'ms'
		},
		colors: ['blue'],'backgroundColor': 'transparent'
	};
	var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
	chart.draw(dataPing, options);
	
	var dataTemp = new google.visualization.DataTable();
	dataTemp.addColumn('datetime', 'X');
	dataTemp.addColumn('number', '°C');
	
	//Set the Temperature line chart
	dataTemp.addRows([
	<?php echo $dataLineTemp; ?> ]);

	var optionsTemp = {
	hAxis: {
		title: 'Time',
		gridlines: {
			count: -1,
			units: {
				days: {format: ['MMM dd']},
				hours: {format: ['HH:mm', 'ha']},
			}
		},
		minorGridlines: {
			units: {
				hours: {format: ['hh:mm:ss a', 'ha']},
				minutes: {format: ['HH:mm a Z', ':mm']}
			}
		},
		format: 'MMM dd, yyyy'
	},
	vAxis: {
		title: 'Temperature [°C]',
		unit: 'C'
	},
	colors: ['red'],'backgroundColor': 'transparent'};
	var chartTemp = new google.visualization.LineChart(document.getElementById('temp_div'));
	chartTemp.draw(dataTemp, optionsTemp);
}
</script>
<style type="text/css">
meter::-webkit-meter-horizontal-bar {
	-webkit-appearance: meter;
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#DDD), color-stop(0.2, #EEE), color-stop(0.45, #CCC), color-stop(0.55, #CCC), to(#DDD));
}
</style>
	</head>
	<body style="background-color:AliceBlue;">
		<div id="supervision">
			<section id="supervision" class="three">
				<div class="container" >
					<div id="piechart" style="width: 450px; height: 500px; float: right;"></div>
					<div id="chart_div" style="width: 800px; height: 250px; position: relative; float: left;"></div>
					<div id="temp_div" style="width: 800px; height: 250px; position: relative; float: left;"></div>							
				</div>
			</section>
		</div>
	</body>
</html>
