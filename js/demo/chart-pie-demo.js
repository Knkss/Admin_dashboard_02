// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    // labels: ["Direct", "Referral", "Social"],
     labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
    datasets: [{
      // data: [55, 30, 15],
       data: [],
      backgroundColor: ['#8B008B', '#EE82EE', '#8A2BE2', '#0000FF', '#0D98BA', '#008000', '#9ACD32', '#FFFF00', '#FFA500', '#FF5349', '#FF0000'],
      hoverBackgroundColor: ['#8B008B', '#EE82EE', '#8A2BE2', '#0000FF', '#0D98BA', '#008000', '#9ACD32', '#FFFF00', '#FFA500', '#FF5349', '#FF0000'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});

$.ajax({
  url: '../js/demo/pie_chart.php', 
  method: 'GET', 
  success: function(data) {
   
    var earnings = JSON.parse(data);

    myPieChart.data.datasets[0].data = earnings;


    myPieChart.update();
  }
});