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

<%@ include file = "dbconn_oracle.jsp" %>

<%
String id = request.getParameter("id");
String passwd = request.getParameter("password");
String name = request.getParameter("name");
String email = request.getParameter("email");

PreparedStatement pstmt = null;
ResultSet rs = null;  //select한 결과를 담는 객체, Select한 레코드셋을 담고 있다.
String sql = null;

try {
	// 레코드 삭제, 폼에서 넘긴 ID, Passwd 와 DB의 Id와 Passwd가 일치할떄 레코드 제거, id(primary key)
	sql = "select id, pass from mbTbl where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,id);
	rs = pstmt.executeQuery();
	
	if(rs.next()) { /// ID가 존재할떄
		//rs의 결과 레코드를 변수에 할당.
		String rId = rs.getString("id");
		String rPassword = rs.getString("pass");
		
		//패스워드가 일치하는지 확인
		if(passwd.equals(rPassword)) { // 폼의 password와 DB의 Password가 일치할떄
			sql = "delete mbTbl where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,rId);
			pstmt.executeUpdate();
			
			out.println("테이블에서 해당 아이디 : " + id + "가 잘삭제 되었습니다.");
			
			
		}else { // 폼의 password와 DB의 Password가 일치하지 않을때
			out.println("해당 아이디는 존재하지 않습니다.");
		}
		
	}else { // ID가 존재하지 않을떄
		out.println("해당 아이디는 존재하지 않습니다.");
	}
	
	out.println(sql);
	
	
	
	
	
}catch (Exception ex) {
	out.println(ex.getMessage());
}finally {
	if(rs != null)
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn!=null)
		conn.close();
}




%>


</body>
</html>

<!-- 
	method = "post"
	
	method = "get"


 -->