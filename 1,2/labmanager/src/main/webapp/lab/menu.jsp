<%@ page contentType="text/html; charset=utf-8"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
String sessionRole = (String) session.getAttribute("sessionRole");
%>

<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand" href="welcome.jsp">Lab Manager</a>

		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a class="nav-link" href="welcome.jsp">Home</a>
			</li>

			<% if(sessionId == null) { %>
				<li class="nav-item">
					<a class="nav-link" href="login.jsp">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="join.jsp">회원가입</a>
				</li>
			<% } else { %>
				<li class="nav-item">
					<a class="nav-link" href="welcomeUser.jsp">마이페이지</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="processLogout.jsp">로그아웃</a>
				</li>
			<% } %>
		</ul>
	</div>
</nav>