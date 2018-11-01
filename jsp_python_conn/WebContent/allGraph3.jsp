<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="jsp_python_conn.test" %>

<%
Connection conn = test.getMySqlConnection();

PreparedStatement pstmtOld = null;
ResultSet rsOld = null;
String sqlOld = "select age_u, count(*) from animal_2015 group by age_u;";
			
pstmtOld = conn.prepareStatement(sqlOld); // prepareStatement에서 해당 sql을 미리 컴파일한다. 

rsOld = pstmtOld.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다. 


Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();

while(rsOld.next()){
map = new HashMap<Object, Object>();
map.put("label", rsOld.getString("age_u"));
map.put("y", rsOld.getInt("count(*)"));
list1.add(map);}



String dataPoints1 = gsonObj.toJson(list1);
/* System.out.println(dataPoints1);
System.out.println(dataPoints2);
System.out.println(dataPoints3);
System.out.println(dataPoints4); */

%>


<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	title: {
		text: "연도별 유기동물 종류 및 입양상황"
	},
	toolTip: {
		shared: true
	},
	legend: {
		cursor: "pointer",
		itemclick: toggleDataSeries
	},
	data: [{
		type: "column",
		name: "Dogs",
		yValueFormatString: "#0.##",
		showInLegend: true,
		dataPoints: <%out.print(dataPoints1);%>
	}]
});
chart.render();
 
function toggleDataSeries(e) {
	if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	}
	else {
		e.dataSeries.visible = true;
	}
	chart.render();
}
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 100%; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html> 