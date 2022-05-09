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

<%@ include file = "dbconn1_oracle.jsp" %>

<table width = "1000" border="1">
	
	<tr>
		<th>사원번호</th>
		<th>사원명</th>
		<th>직무</th>
		<th>직속상사</th>
		<th>입사일자</th>
		<th>급여</th>
		<th>보너스</th>
		<th>부서번호</th>
	</tr>
		
</table>




<%
	ResultSet rs = null;
	Statement stmt = null;
	
	try {
		String sql = "SELECT * FROM emp_copy";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			int eno = rs.getInt("eno");
			String ename = rs.getString("ename");
			String job = rs.getString("job");
			int manager = rs.getInt("manager");
			String hiredate = rs.getString("hiredate");
			int salary = rs.getInt("salary");
			String commission = rs.getString("commission");
			int dno = rs.getInt("dno");
			
			%>
			
			<table width = "1000" border="1">
	
				<tr>
					<th><%= eno %></th>
					<th><%= ename %></th>
					<th><%= job %></th>
					<th><%= manager %></th>
					<th><%= hiredate %></th>
					<th><%= salary %></th>
					<th><%= commission %></th>
					<th><%= dno %></th>
				</tr>
		
			</table>
			<%
		}
			
			
			
		}catch(Exception ex) {
			out.println("테이블 호출에 실패 했습니다.");
			out.println(ex.getMessage());
		}finally {
			if(rs != null) {
				rs.close();
			}
			if(stmt != null) {
				stmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}


%>





</body>
</html>