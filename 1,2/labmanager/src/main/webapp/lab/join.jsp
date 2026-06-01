<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원가입</title>
</head>
<body>

<jsp:include page="menu.jsp"/>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-4">회원가입</h1>
		<p>랩원 계정을 생성합니다.</p>
	</div>
</div>

<div class="container" align="center">
	<div class="col-md-5">
		<form action="processJoin.jsp" method="post">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" name="id" class="form-control" required>
			</div>

			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="password" class="form-control" required>
			</div>

			<div class="form-group">
				<label>이름</label>
				<input type="text" name="name" class="form-control" required>
			</div>

			<div class="form-group">
				<label>권한</label>
				<select name="role" class="form-control">
					<option value="MEMBER">일반 랩원</option>
					<option value="ADMIN">관리자</option>
				</select>
			</div>

			<input type="submit" class="btn btn-success btn-block" value="회원가입">
		</form>
	</div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>