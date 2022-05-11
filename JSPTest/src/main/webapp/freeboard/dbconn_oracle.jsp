<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Connection conn = null;  
	String driver = "oracle.jdbc.driver.OracleDriver";   
	String url = "jdbc:oracle:thin:@localhost:1521:XE";

	Class.forName(driver);  
	conn = DriverManager.getConnection(url,"hr2","1234"); 

%>


</body>
</html>