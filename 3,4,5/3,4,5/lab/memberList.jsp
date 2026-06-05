<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="managerCheck.jsp"%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>랩원 목록</title>
</head>
<body>

<jsp:include page="menu.jsp"/>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-4">랩원 목록</h1>
		<p class="lead">연구실 전체 랩원 정보를 조회합니다.</p>
	</div>
</div>

<div class="container">

	<% if(canManage) { %>
		<a href="memberForm.jsp" class="btn btn-success mb-3">랩원 등록</a>
	<% } %>

	<table class="table table-hover">
		<thead class="thead-dark">
			<tr>
				<th>이름</th>
				<th>학번</th>
				<th>학과</th>
				<th>역할</th>
				<th>상태</th>
				<th>상세</th>
			</tr>
		</thead>
		<tbody>
		<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String url = "jdbc:h2:tcp://localhost/~/bookmarketdb";
		String user = "user1";
		String dbPassword = "1234";

		try {
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection(url, user, dbPassword);

			String sql = "SELECT * FROM members ORDER BY member_id";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
		%>
			<tr>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("student_id")%></td>
				<td><%=rs.getString("department")%></td>
				<td><%=rs.getString("lab_role")%></td>
				<td><%=rs.getString("member_status")%></td>
				<td>
					<a href="memberDetail.jsp?member_id=<%=rs.getInt("member_id")%>" class="btn btn-sm btn-info">보기</a>
				</td>
			</tr>
		<%
			}
		} catch(Exception e) {
			e.printStackTrace();
		%>
			<tr><td colspan="6">랩원 목록을 불러오는 중 오류가 발생했습니다.</td></tr>
		<%
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		%>
		</tbody>
	</table>

</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
