<%@ page contentType="text/html; charset=utf-8"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
String sessionName = (String) session.getAttribute("sessionName");
String sessionRole = (String) session.getAttribute("sessionRole");

if(sessionId == null) {
	response.sendRedirect("login.jsp");
}
%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>로그인 성공</title>
</head>
<body>

<jsp:include page="menu.jsp"/>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-4">로그인 성공</h1>
		<p><b><%=sessionName%></b>님, 환영합니다.</p>
	</div>
</div>

<div class="container">
	<h3>사용자 정보</h3>
	<p>아이디: <%=sessionId%></p>
	<p>이름: <%=sessionName%></p>
	<p>권한: <%=sessionRole%></p>

	<hr>

	<% if("ADMIN".equals(sessionRole)) { %>
		<h4>관리자 메뉴</h4>
		<p>랩원 등록, 수정, 삭제 기능을 사용할 수 있습니다.</p>
	<% } else { %>
		<h4>일반 랩원 메뉴</h4>
		<p>랩원 목록과 공지사항을 확인할 수 있습니다.</p>
	<% } %>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>