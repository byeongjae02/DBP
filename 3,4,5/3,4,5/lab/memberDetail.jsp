<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="managerCheck.jsp"%>

<%
String memberId = request.getParameter("member_id");
%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>랩원 상세</title>
</head>
<body>

<jsp:include page="menu.jsp"/>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-4">랩원 상세 정보</h1>
		<p class="lead">랩원의 개인 정보와 참여 프로젝트를 확인합니다.</p>
	</div>
</div>

<div class="container">
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

	String sql = "SELECT * FROM members WHERE member_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(memberId));
	rs = pstmt.executeQuery();

	if(rs.next()) {
%>
	<table class="table table-bordered">
		<tr><th style="width:25%">이름</th><td><%=rs.getString("name")%></td></tr>
		<tr><th>학번</th><td><%=rs.getString("student_id")%></td></tr>
		<tr><th>학과</th><td><%=rs.getString("department")%></td></tr>
		<tr><th>이메일</th><td><%=rs.getString("email")%></td></tr>
		<tr><th>전화번호</th><td><%=rs.getString("phone")%></td></tr>
		<tr><th>역할</th><td><%=rs.getString("lab_role")%></td></tr>
		<tr><th>상태</th><td><%=rs.getString("member_status")%></td></tr>
		<tr><th>연구분야</th><td><%=rs.getString("research_field")%></td></tr>
	</table>

	<h4>참여 프로젝트</h4>
	<ul class="list-group mb-3">
	<%
		PreparedStatement pPstmt = conn.prepareStatement(
			"SELECT p.project_name, pm.project_role, p.project_status " +
			"FROM project_members pm JOIN projects p ON pm.project_id = p.project_id " +
			"WHERE pm.member_id = ?");
		pPstmt.setInt(1, Integer.parseInt(memberId));
		ResultSet pRs = pPstmt.executeQuery();

		boolean hasProject = false;
		while(pRs.next()) {
			hasProject = true;
	%>
		<li class="list-group-item">
			<b><%=pRs.getString("project_name")%></b>
			<span class="badge badge-primary"><%=pRs.getString("project_role")%></span>
			<small>(<%=pRs.getString("project_status")%>)</small>
		</li>
	<%
		}
		if(!hasProject) {
	%>
		<li class="list-group-item">참여 중인 프로젝트가 없습니다.</li>
	<%
		}
		pRs.close();
		pPstmt.close();
	%>
	</ul>

	<% if(canManage) { %>
		<a href="memberEdit.jsp?member_id=<%=memberId%>" class="btn btn-warning">수정</a>
		<a href="processMemberDelete.jsp?member_id=<%=memberId%>" class="btn btn-danger"
			onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
	<% } %>
	<a href="memberList.jsp" class="btn btn-secondary">목록으로</a>

<%
	} else {
%>
	<p>해당 랩원을 찾을 수 없습니다.</p>
	<a href="memberList.jsp" class="btn btn-secondary">목록으로</a>
<%
	}
} catch(Exception e) {
	e.printStackTrace();
%>
	<p>랩원 정보를 불러오는 중 오류가 발생했습니다.</p>
<%
} finally {
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
}
%>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
