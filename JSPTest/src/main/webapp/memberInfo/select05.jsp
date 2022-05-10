<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB의 내용을 가져와서 출력하기</title>
</head>
<body>
<!--
	Statement :
	- 단일로 한번만 실행할때 빠른속도를 가진다.
	- 쿼리에 인자를 부여할 수 없다. 변수를 쿼리에 적용할떄 따옴표 처리를 잘해 줘야 한다.
	- 매번 컴파일을 수행해야 됩니다. (cache 를 사용하지 않는다)
	PreparedStatement :
	- 쿼리에 인자를 부여 할 수 있다. (?) ?인자에 변수를 할당한다.
	- 처음 컴파일 된 이후, 그이후에는 컴파일을 수행하지 않는다. (cache 를 사용한다).
	- 여러번 수행할때 빠른 속도를 가집니다.



  -->


<%@ include file = "dbconn_oracle.jsp" %>

<table width = "500" border="1">
	
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>email</th>
			<th>city</th>
			<th>phone</th>
		</tr>
	

</table>

<%
//ResultSet 객체는 DB의 테이블을 Select 해서 나온 결과 레코드셋을 담는 객체
	ResultSet rs = null;
//SQL 쿼리를 담아서 실행하는 객체
//	Statement stmt = null;  
	PreparedStatement pstmt = null;

	try {
		String sql = "SELECT * FROM mbTbl";
		pstmt = conn.prepareStatement(sql);  // PreparedStatement 객체 생성시 sql 쿼리를 넣는다.
		rs = pstmt.executeQuery();  // connection객체의 createStatement()로 stmt를 활성화
				//stmt.executeQuery(sql) : select 한 결과를 ResultSet객체에 저장해야함.
				//stmt.executeUpdate(sql) : insert, update, delete
		
		while(rs.next()) {
			String id = rs.getString("id");
			String pw = rs.getString("pass");
			String name = rs.getString("name");
			String email = rs.getString("email");
			String city = rs.getString("city");
			String phone = rs.getString("phone");
		%>
		
		<table width = "500" border="1">
		<tr>
			<td><%= id %></td>
			<td><%= pw %></td>
			<td><%= name %></td>
			<td><%= email %></td>
			<td><%= city %></td>
			<td><%= phone %></td>
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
		if(pstmt != null) {
			pstmt.close();
		}
		if(conn != null) {
			conn.close();
		}
	}
	
	
	%>







</body>
</html>