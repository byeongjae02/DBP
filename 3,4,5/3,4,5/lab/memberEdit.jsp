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
ResultSet rs = null;

String url = "jdbc:h2:tcp://localhost/~/bookmarketdb";
String user = "user1";
String dbPassword = "1234";

String userId = "", name = "", studentId = "", department = "",
       email = "", phone = "", labRole = "", memberStatus = "", researchField = "";

try {
	Class.forName("org.h2.Driver");
	conn = DriverManager.getConnection(url, user, dbPassword);

	pstmt = conn.prepareStatement("SELECT * FROM members WHERE member_id = ?");
	pstmt.setInt(1, Integer.parseInt(memberId));
	rs = pstmt.executeQuery();

	if(rs.next()) {
		userId = rs.getString("user_id") == null ? "" : rs.getString("user_id");
		name = rs.getString("name");
		studentId = rs.getString("student_id");
		department = rs.getString("department");
		email = rs.getString("email");
		phone = rs.getString("phone");
		labRole = rs.getString("lab_role");
		memberStatus = rs.getString("member_status");
		researchField = rs.getString("research_field");
	}
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
}
%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>랩원 수정</title>
</head>
<body>

<jsp:include page="menu.jsp"/>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-4">랩원 수정</h1>
		<p class="lead">랩원 정보를 수정합니다.</p>
	</div>
</div>

<div class="container">
	<div class="col-md-6">
		<form action="processMemberUpdate.jsp" method="post">

			<input type="hidden" name="member_id" value="<%=memberId%>">

			<div class="form-group">
				<label>연결 계정(아이디)</label>
				<input type="text" name="user_id" class="form-control" value="<%=userId%>">
			</div>

			<div class="form-group">
				<label>이름</label>
				<input type="text" name="name" class="form-control" value="<%=name%>" required>
			</div>

			<div class="form-group">
				<label>학번</label>
				<input type="text" name="student_id" class="form-control" value="<%=studentId%>">
			</div>

			<div class="form-group">
				<label>학과</label>
				<input type="text" name="department" class="form-control" value="<%=department%>">
			</div>

			<div class="form-group">
				<label>이메일</label>
				<input type="email" name="email" class="form-control" value="<%=email%>">
			</div>

			<div class="form-group">
				<label>전화번호</label>
				<input type="text" name="phone" class="form-control" value="<%=phone%>">
			</div>

			<div class="form-group">
				<label>역할</label>
				<select name="lab_role" class="form-control">
					<option value="랩원" <%="랩원".equals(labRole) ? "selected" : ""%>>랩원</option>
					<option value="랩장" <%="랩장".equals(labRole) ? "selected" : ""%>>랩장</option>
				</select>
			</div>

			<div class="form-group">
				<label>상태</label>
				<select name="member_status" class="form-control">
					<option value="활동중" <%="활동중".equals(memberStatus) ? "selected" : ""%>>활동중</option>
					<option value="휴면" <%="휴면".equals(memberStatus) ? "selected" : ""%>>휴면</option>
				</select>
			</div>

			<div class="form-group">
				<label>연구분야</label>
				<input type="text" name="research_field" class="form-control" value="<%=researchField%>">
			</div>

			<input type="submit" class="btn btn-warning btn-block" value="수정">
		</form>
		<br>
		<a href="memberDetail.jsp?member_id=<%=memberId%>" class="btn btn-secondary">취소</a>
	</div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
