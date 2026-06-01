<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>연구실 관리 시스템 - 회원가입</title>
</head>
<body>
    <!-- 상단 네비게이션 바 포함 -->
    <jsp:include page="./menu.jsp" />
    
    <div class="jumbotron">
        <div class="container text-center">
            <h1 class="display-4">랩원 계정 생성</h1>
        </div>
    </div>
    
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h5 class="mb-4 text-center">연구실 시스템 사용을 위해 정보를 입력해 주세요.</h5>
                
                <!-- 입력된 정보가 컨트롤러의 processRegister 액션으로 넘어갑니다 -->
                <form action="/exercise/labcontrol?action=processRegister" method="post" class="border p-4 bg-light rounded">
                    
                    <!--  로그인 계정 정보 (users 테이블용) -->
                    <h6 class="font-weight-bold text-primary mb-3">계정 정보</h6>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">아이디</label>
                        <div class="col-sm-9">
                            <input type="text" name="id" class="form-control" placeholder="사용할 아이디" required autofocus>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">비밀번호</label>
                        <div class="col-sm-9">
                            <input type="password" name="password" class="form-control" placeholder="비밀번호" required>
                        </div>
                    </div>
                    
                    <hr>
                    
                    <!--  랩원 상세 정보 (members 테이블용) -->
                    <h6 class="font-weight-bold text-success mb-3">개인 인적사항</h6>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">이름</label>
                        <div class="col-sm-9">
                            <input type="text" name="name" class="form-control" placeholder="실명 입력" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">학번/사번</label>
                        <div class="col-sm-9">
                            <input type="text" name="memberId" class="form-control" placeholder="예: 20261234" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">학과</label>
                        <div class="col-sm-9">
                            <input type="text" name="department" class="form-control" placeholder="소속 학과" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">이메일</label>
                        <div class="col-sm-9">
                            <input type="email" name="email" class="form-control" placeholder="example@university.edu" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">전화번호</label>
                        <div class="col-sm-9">
                            <input type="text" name="phone" class="form-control" placeholder="010-0000-0000" required>
                        </div>
                    </div>
                    
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-primary btn-lg px-5">가입하기</button>
                        <a href="/exercise/labcontrol?action=welcome" class="btn btn-secondary btn-lg px-4">취소</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>