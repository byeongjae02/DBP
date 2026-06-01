<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Lab Manager</title>
</head>
<body>

<jsp:include page="menu.jsp"/>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-4">연구실 랩원 관리 시스템</h1>
		<p class="lead">연구실 구성원, 프로젝트, 공지사항을 관리하는 웹 시스템입니다.</p>
	</div>
</div>

<div class="container">
	<h3>연구실 소개</h3>
	<p>
		본 연구실은 AI·SW 기반 연구와 프로젝트를 수행하며,
		랩원 정보와 연구 활동을 체계적으로 관리합니다.
	</p>

	<hr>

	<h3>최근 공지사항</h3>

	<ul class="list-group">
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

		String sql = "SELECT * FROM notices ORDER BY notice_id DESC LIMIT 3";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while(rs.next()) {
	%>
			<li class="list-group-item">
				<b><%=rs.getString("title")%></b>
				<br>
				<small>작성자: <%=rs.getString("writer")%> | 작성일: <%=rs.getDate("created_at")%></small>
			</li>
	<%
		}
	} catch(Exception e) {
		e.printStackTrace();
	%>
		<li class="list-group-item">공지사항을 불러오는 중 오류가 발생했습니다.</li>
	<%
	} finally {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
	%>
	</ul>

	<hr>

	<a href="login.jsp" class="btn btn-primary">로그인</a>
	<a href="join.jsp" class="btn btn-success">회원가입</a>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>