<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="DBConn.jsp" %>
<h1>회원매출조회</h1>
<table border=1 id="tab3">
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>고객등급</th>
		<th>매출</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select b.custno,a.custname,a.grade,sum(b.price) from member0126 a,money0126 b where a.custno=b.custno group by b.custno,a.custname,a.grade order by sum(b.price) desc";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			int custno=rs.getInt(1);
			String custname=rs.getString(2);
			String grade=rs.getString(3);
			if(grade.equals("A")){
				grade="VIP";
			}else if(grade.equals("B")){
				grade="일반";
			}else{
				grade="직원";
			}
			int price=rs.getInt(4);
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td><%=custno %></td>
		<td><%=custname %></td>
		<td><%=grade %></td>
		<td><%=price %></td>
	</tr>
<%
		}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
		e.printStackTrace();
	}
%>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>