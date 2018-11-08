<!DOCTYPE HTML>
<html>
<head>
  <script type="text/javascript" src="../chart/canvasjs.min.js"></script>
  <script type="text/javascript">
      window.onload = function () {
          var chart = new CanvasJS.Chart("chartContainer", {
              data: [
              {
                  type: "pie",
                  dataPoints: [
                  { x: 10, y: 10 },
                  { x: 20, y: 15 },
                  { x: 30, y: 25 },
                  { x: 40, y: 30 },
                  { x: 50, y: 28 }
                  ]
              }
              ]
          });
 
          chart.render();
      }
  </script>
</head>
 
<body>
  <div id="chartContainer" style="height: 500px; width: 50%;"></div>
</body>
</html>