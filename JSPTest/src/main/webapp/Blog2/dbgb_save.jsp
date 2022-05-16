<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*, java.util.*" %>
<!-- Form에서 넘겨지는 한글 처리 -->
<% request.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form에서 넘겨 받은 값을 DB에 insert 하는 페이지</title>
</head>
<body>
<%@ include file = "db_conn_oracle.jsp"  %>   <!-- Connection 객체 -->

<%
	String na = request.getParameter("name");
	String em = request.getParameter("email");
	String sub = request.getParameter("subject");
	String cont = request.getParameter("content");
	String ymd = (new java.util.Date()).toLocaleString();  // 현재 시스템의 로케일(한국)
	
	// 폼에서 넘긴 변수가 잘 넘어오는지 확인
// 	out.println(na + "<br/>");
// 	out.println(em + "<br/>");
// 	out.println(sub + "<br/>");
// 	out.println(cont + "<br/>");
// 	out.println(ymd + "<br/>");

	String sql = null;
	Statement st = null;  // Statement : sql 구문을 실행하는 객체
			//conn 객체에서 자동으로 커밋 구문이 적용되어 있음.
	int cnt = 0;  // insert, update, delete 가 잘 적용되었는지 확인
					// cnt > 0 : insert, update, delete 가 잘 적용되었는지 확인
	
	try {
		sql = "insert into guestboard2 (name, email, inputdate, subject, content)";
		sql = sql + " values('" + na + "','" + em + "' ,'" + ymd + "' ,'" ;
		sql = sql + sub + "','" + cont + "')";
		
		st = conn.createStatement(); // st : Statement 객체 활성화 (XE, hr2, 1234);
		cnt = st.executeUpdate(sql);  // insert, update, delete 문의 경우
		
		if (cnt > 0) {
			out.println("DB에 잘 insert가 되었습니다.");
		}else {
			out.println("DB에 잘 insert가 되지 않았습니다.");
		}
		
// 		out.println(sql);
// 		if(true) return;
		
	}catch(Exception ex) {
		out.println(ex.getMessage());
	}finally {
		if(st !=null) {
			st.close();
		}
		if(conn != null) {
			conn.close();
		}
	}
	
%>

<jsp:forward page = "dbgb_show.jsp"/>




</body>
</html>