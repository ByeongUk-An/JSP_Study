<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee</title>
</head>
<body>
	<form method = "post" action="insert01_process.jsp">
		<label>
			사원번호 : <input type ="text" name ="eno" >
		</label>
		<br>
		<label>
			사원명 : <input type ="text" name ="ename" >
		</label>
		<br>
		<label>
			직무 : <input type ="text" name ="job" >
		</label>
		<br>
		<label>
			직속상사 : <input type ="text" name ="manager" >
		</label>
		<br>
		<label>
			입사일자 : <input type ="date" name ="hiredate" >
		</label>
		<br>
		<label>
			급여 : <input type ="text" name ="salary" >
		</label>
		<br>
		<label>
			보너스 : <input type ="text" name ="commission" >
		</label>
		<br>
		<label>
			부서번호 : <input type ="text" name ="dno" >
		</label>
		<br>
		<input type = "submit" values="전송">
		
	</form>




</body>
</html>