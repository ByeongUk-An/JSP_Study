<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*,java.util.*" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert후 출력 페이지</title>
<link href = "filegb.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file = "db_conn_oracle.jsp" %>
	
<%
	//Vector 컬렉션을 생성해서 DB에서 가져온 데이터를 저장하는 Vector 객체 생성
	Vector name = new Vector();  // 이름 컬럼만 저장하는 벡터
	Vector email = new Vector(); // 이메일 컬럼만 저장하는 벡터
	Vector inputdate = new Vector(); 
	Vector subject = new Vector();
	Vector content = new Vector();
	
	//페이징 처리할 변수 선언
	int where = 1;       // 현재 위치한 page 번호
	int totalgroup = 0;  // 페이지 그룹의 갯수
	int maxpage = 2;  // 출력할 페이지 갯수
	int startpage = 1;  // 출력할 페이지의 첫번째 레코드
	int endpage = startpage + maxpage - 1; // 출력 페이지의 마지막 레코드
	int wheregroup = 1;  // 현재 위치한 pagegroup
	
	//Get 방식으로 페이지를 선택 했을때 go(현재 페이지), 
		//gogroup(현재 페이지 그룹) 변수를 받아서 처리를 함.
	
	if(request.getParameter("go") != null) { // 현재 페이지 번호가 넘어올때
		where = Integer.parseInt(request.getParameter("go"));
		wheregroup = (where-1)/maxpage + 1;
		startpage = (wheregroup - 1) * maxpage +1;
		endpage = startpage + maxpage - 1;
	}else if(request.getParameter("group") != null) { // 현재 페이지 그룹의 번호가 넘어올때
		wheregroup = Integer.parseInt(request.getParameter("gogroup"));
	startpage = (wheregroup - 1) * maxpage + 1;
	where = startpage;
	endpage = startpage + maxpage - 1;
	}
	
	int nextgroup = wheregroup + 1;  // [다음] 링크걸릴 변수
	int priorgroup = wheregroup -1;  // [이전] 링크걸릴 변수
	
	int nextpage = where + 1;  // 다음 페이지
	int priogroup = where - 1;  // 이전 페이지
	
	int startrow = 0;  // 특정 페이지에서 시작레코드 번호
	int endrow = 0;
	int maxrows = 2;  // 출력시 2개의 레코드만 출력
	int totalrows = 0;  // 총 레코드 갯수 (DB)
	int totalpage = 0;
	
	
	String sql = null;
	Statement st = null;
	ResultSet rs = null;

	try {
		sql = "select * from guestboard2 order by inputdate desc";
		st = conn.createStatement();
		rs = st.executeQuery(sql); // executeQuery Selet 문일때 사용

		if(!(rs.next())) {
			out.println("블로그에 올린 글이 없습니다.");
		}else {  //DB에서 가져온 값을 출력 시작
			do {		
%>
		<table width="600" border="1">
            <tr height="25"><td colspan="2">&nbsp;</td></tr>
            <tr><td colspan="2" align="center"><h3><%= rs.getString("subject") %></h3></td></tr>
            <tr>
               <td>글쓴이 : <%= rs.getString("name") %></td>
               <td>이메일 : <%= rs.getString("email") %></td>
            </tr>
            <tr><td colspan="2">작성일 : <%= rs.getString("inputdate") %></td></tr>
            <tr><td colspan="2" width="600">내용 : <%= rs.getString("content") %></td></tr>
            <tr height="25"><td colspan="2">&nbsp;</td></del></tr>
            </table>
		
<%	}while(rs.next());  // rs에 값이 존재하는동안 계속 순환하면서 출력.
		}  // DB에서 가져온 값을 출력 끝
	}catch (Exception ex) {
		out.println(ex.getMessage());
	}finally {
		if(rs != null) {
			rs.close();
		}
		if(st != null) {
			st.close();
		}
		if(conn != null) {
			conn.close();
		}
	}



%>



</body>
</html>