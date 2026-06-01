<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>로그인</title>
</head>
<body>

<jsp:include page="menu.jsp"/>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-4">로그인</h1>
		<p>랩원 계정으로 로그인합니다.</p>
	</div>
</div>

<div class="container" align="center">
	<div class="col-md-4">
		<form action="processLogin.jsp" method="post">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" name="id" class="form-control" required>
			</div>

			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="password" class="form-control" required>
			</div>

			<input type="submit" class="btn btn-primary btn-block" value="로그인">
		</form>

		<br>
		<a href="join.jsp">아직 계정이 없나요? 회원가입</a>
	</div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>