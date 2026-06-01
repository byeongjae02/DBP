<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");
String role = request.getParameter("role");

Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:h2:tcp://localhost/~/bookmarketdb";
String user = "user1";
String dbPassword = "1234";

try {
	Class.forName("org.h2.Driver");
	conn = DriverManager.getConnection(url, user, dbPassword);

	String sql = "INSERT INTO users(user_id, password, name, role) VALUES(?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, role);

	pstmt.executeUpdate();

	response.sendRedirect("login.jsp");

} catch(Exception e) {
	e.printStackTrace();
%>
	<script>
		alert("회원가입 중 오류가 발생했습니다. 아이디가 중복되었을 수 있습니다.");
		history.back();
	</script>
<%
} finally {
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
}
%>