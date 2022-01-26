<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		if(document.form.custname.value==""){
			alert("회원성명이 입력되지 않았습니다");
			document.form.custname.focus();
		}else if(document.form.phone.value==""){
			alert("회원전화가 입력되지 않았습니다.");
			document.form.phone.focus();
		}else if(document.form.address.value==""){
			alert("회원주소가 입력되지 않았습니다.");
			document.form.address.focus();
		}else if(document.form.joindate.value==""){
			alert("가입일자가 입력되지 않았습니다.");
			document.form.joindate.focus();
		}else if(document.form.grade.value==""){
			alert("고객등급이 입력되지 않았습니다.");
			document.form.grade.focus();
		}else if(document.form.city.value==""){
			alert("도시코드가 입력되지 않았습니다.");
			document.form.city.focus();
		}else{
			document.form.submit();
		}
	}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String custno=request.getParameter("custno");
	
	try{
		String sql="select custno,custname,phone,address,to_char(joindate,'yyyy-mm-dd'),grade,city from member0126 where custno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		rs=pstmt.executeQuery();
		if(rs.next()){
			custno=rs.getString(1);
			String custname=rs.getString(2);
			String phone=rs.getString(3);
			String address=rs.getString(4);
			String joindate=rs.getString(5);
			String grade=rs.getString(6);
			String city=rs.getString(7);
			System.out.println("데이터 조회 성공");
%>
<form name="form" method="post" action="update_memberProcess.jsp">
<h1>홈쇼핑 회원 수정</h1>
<table border=1 id="tab1">
	<tr>
		<th id="th1">회원번호(자동발생)</th>
		<td><input type="text" name="custno" value="<%=custno %>" id="in1"><td>
	</tr>
	<tr>
		<th id="th1">회원성명</th>
		<td><input type="text" name="custname" value="<%=custname %>" id="in1"><td>
	</tr>
	<tr>
		<th id="th1">회원전화</th>
		<td><input type="text" name="phone" value="<%=phone %>"><td>
	</tr>
	<tr>
		<th id="th1">회원주소</th>
		<td><input type="text" name="address" value="<%=address %>" id="in2"><td>
	</tr>
	<tr>
		<th id="th1">가입일자</th>
		<td><input type="text" name="joindate" value="<%=joindate %>" id="in1"><td>
	</tr>
	<tr>
		<th id="th1">고객등급[A:VIP,B:일반,C:직원]</th>
		<td><input type="text" name="grade" value="<%=grade %>" id="in1"><td>
	</tr>
	<tr>
		<th id="th1">도시코드</th>
		<td><input type="text" name="city" value="<%=city %>" id="in1"><td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="수정" onclick="check()">
			<input type="button" value="목록" onclick="location.href='select_member.jsp'">
		</td>
	</tr>
<%
		}
	}catch(SQLException e){
		System.out.println("데이터 조회 실패");
		e.printStackTrace();
	}
%>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>