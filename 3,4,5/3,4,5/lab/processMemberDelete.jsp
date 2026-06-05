<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="managerCheck.jsp"%>
<%
if(!canManage) {
	response.sendRedirect("memberList.jsp");
	return;
}

String memberId = request.getParameter("member_id");

Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:h2:tcp://localhost/~/bookmarketdb";
String user = "user1";
String dbPassword = "1234";

try {
	Class.forName("org.h2.Driver");
	conn = DriverManager.getConnection(url, user, dbPassword);

	// 외래키 제약 때문에 참여 프로젝트 정보(project_members)를 먼저 삭제
	pstmt = conn.prepareStatement("DELETE FROM project_members WHERE member_id = ?");
	pstmt.setInt(1, Integer.parseInt(memberId));
	pstmt.executeUpdate();
	pstmt.close();

	// 그 다음 랩원 삭제
	pstmt = conn.prepareStatement("DELETE FROM members WHERE member_id = ?");
	pstmt.setInt(1, Integer.parseInt(memberId));
	pstmt.executeUpdate();

	response.sendRedirect("memberList.jsp");

} catch(Exception e) {
	e.printStackTrace();
%>
	<script>
		alert("랩원 삭제 중 오류가 발생했습니다.");
		history.back();
	</script>
<%
} finally {
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
}
%>
