<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="managerCheck.jsp"%>
<%
if(!canManage) {
	response.sendRedirect("memberList.jsp");
	return;
}

request.setCharacterEncoding("UTF-8");

String memberId = request.getParameter("member_id");
String userId = request.getParameter("user_id");
String name = request.getParameter("name");
String studentId = request.getParameter("student_id");
String department = request.getParameter("department");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String labRole = request.getParameter("lab_role");
String memberStatus = request.getParameter("member_status");
String researchField = request.getParameter("research_field");

if(userId != null && userId.trim().equals("")) {
	userId = null;
}

Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:h2:tcp://localhost/~/bookmarketdb";
String user = "user1";
String dbPassword = "1234";

try {
	Class.forName("org.h2.Driver");
	conn = DriverManager.getConnection(url, user, dbPassword);

	String sql = "UPDATE members SET user_id=?, name=?, student_id=?, department=?, "
			+ "email=?, phone=?, lab_role=?, member_status=?, research_field=? WHERE member_id=?";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, userId);
	pstmt.setString(2, name);
	pstmt.setString(3, studentId);
	pstmt.setString(4, department);
	pstmt.setString(5, email);
	pstmt.setString(6, phone);
	pstmt.setString(7, labRole);
	pstmt.setString(8, memberStatus);
	pstmt.setString(9, researchField);
	pstmt.setInt(10, Integer.parseInt(memberId));

	pstmt.executeUpdate();

	response.sendRedirect("memberDetail.jsp?member_id=" + memberId);

} catch(Exception e) {
	e.printStackTrace();
%>
	<script>
		alert("랩원 수정 중 오류가 발생했습니다.");
		history.back();
	</script>
<%
} finally {
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
}
%>
