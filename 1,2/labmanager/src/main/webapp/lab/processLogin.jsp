<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String password = request.getParameter("password");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:h2:tcp://localhost/~/bookmarketdb";
String user = "user1";
String dbPassword = "1234";

try {
	Class.forName("org.h2.Driver");
	conn = DriverManager.getConnection(url, user, dbPassword);

	String sql = "SELECT * FROM users WHERE user_id = ? AND password = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);

	rs = pstmt.executeQuery();

	if(rs.next()) {
		String name = rs.getString("name");
		String role = rs.getString("role");

		session.setAttribute("sessionId", id);
		session.setAttribute("sessionName", name);
		session.setAttribute("sessionRole", role);

		response.sendRedirect("welcomeUser.jsp");
	} else {
%>
		<script>
			alert("아이디 또는 비밀번호가 올바르지 않습니다.");
			history.back();
		</script>
<%
	}

} catch(Exception e) {
	e.printStackTrace();
%>
	<script>
		alert("로그인 처리 중 오류가 발생했습니다.");
		history.back();
	</script>
<%
} finally {
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
}
%>