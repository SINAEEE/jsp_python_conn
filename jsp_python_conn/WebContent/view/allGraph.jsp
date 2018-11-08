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
//String sqlOld = "select adopted, n_adopted from ml_result where ydate='2018-11-07';";
String sqlOld = "select adopted, n_adopted from ml_result where id='8';";

pstmtOld = conn.prepareStatement(sqlOld); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 

rsOld = pstmtOld.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 


Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();

while(rsOld.next()){
map = new HashMap<Object, Object>();
map.put("label", "�Ծ�");
map.put("y", rsOld.getInt("adopted"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "�Ծ�X");
map.put("y", rsOld.getInt("n_adopted"));
list1.add(map);
}



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
		text: "���⵿�� �Ծ� ���� ��Ȳ"
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
		name: "�Ծ� ����",
		yValueFormatString: "#0.##",
		showInLegend: true,
		dataPoints: <%out.print(dataPoints1);%>
	},{
		type : "column",
		name : "n_adopted",
		yValueFormatString: "#0.##",
		showInLegend: true,
		datPoints : <%out.print(dataPoints1);%>
	}
	]
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