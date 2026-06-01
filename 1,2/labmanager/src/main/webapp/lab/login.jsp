<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>연구실 관리 시스템 - 로그인</title>
</head>
<body>
    <jsp:include page="./menu.jsp" />
    
    <div class="jumbotron">
        <div class="container text-center">
            <h1 class="display-4">시스템 로그인</h1>
        </div>
    </div>
    
    <div class="container" align="center">
        <div class="col-md-4 col-md-offset-4">
            <h5 class="form-signin-heading mb-4">랩원 아이디와 패스워드를 입력하세요</h5>
            
            <form class="form-signin" action="/exercise/labcontrol?action=processLogin" method="post">
                <div class="form-group">
                    <label for="inputUserName" class="sr-only">User ID</label> 
                    <input type="text" class="form-control" placeholder="학번/사번 (ID)" name="id" required autofocus>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="sr-only">Password</label> 
                    <input type="password" class="form-control" placeholder="비밀번호" name="password" required>
                </div>      
                <button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>
            </form>
            
            <div class="mt-3">
                <p>아직 연구실 계정이 없으신가요? <br>
                <a href="/exercise/labcontrol?action=register" class="btn btn-sm btn-outline-primary mt-2">랩원 계정 생성 (회원가입)</a></p>
            </div>
        </div>
    </div>
    
    <div style="margin-top: 100px;">
        <jsp:include page="footer.jsp" />
    </div>
</body>
</html>