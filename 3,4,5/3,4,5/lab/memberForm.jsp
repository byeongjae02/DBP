<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="managerCheck.jsp"%>
<%
// 관리자 또는 랩장만 접근 가능
if(!canManage) {
	response.sendRedirect("memberList.jsp");
	return;
}
%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>랩원 등록</title>
</head>
<body>

<jsp:include page="menu.jsp"/>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-4">랩원 등록</h1>
		<p class="lead">새로운 랩원 정보를 등록합니다.</p>
	</div>
</div>

<div class="container">
	<div class="col-md-6">
		<form action="processMemberInsert.jsp" method="post">

			<div class="form-group">
				<label>연결 계정(아이디)</label>
				<input type="text" name="user_id" class="form-control" placeholder="users 테이블의 user_id">
			</div>

			<div class="form-group">
				<label>이름</label>
				<input type="text" name="name" class="form-control" required>
			</div>

			<div class="form-group">
				<label>학번</label>
				<input type="text" name="student_id" class="form-control">
			</div>

			<div class="form-group">
				<label>학과</label>
				<input type="text" name="department" class="form-control">
			</div>

			<div class="form-group">
				<label>이메일</label>
				<input type="email" name="email" class="form-control">
			</div>

			<div class="form-group">
				<label>전화번호</label>
				<input type="text" name="phone" class="form-control">
			</div>

			<div class="form-group">
				<label>역할</label>
				<select name="lab_role" class="form-control">
					<option value="랩원">랩원</option>
					<option value="랩장">랩장</option>
				</select>
			</div>

			<div class="form-group">
				<label>상태</label>
				<select name="member_status" class="form-control">
					<option value="활동중">활동중</option>
					<option value="휴면">휴면</option>
				</select>
			</div>

			<div class="form-group">
				<label>연구분야</label>
				<input type="text" name="research_field" class="form-control">
			</div>

			<input type="submit" class="btn btn-success btn-block" value="등록">
		</form>
		<br>
		<a href="memberList.jsp" class="btn btn-secondary">목록으로</a>
	</div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
