<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>연구실 관리 시스템 - 메인</title>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    
    <div class="jumbotron">
        <div class="container text-center">
            <h2 class="display-4">AI & SW 연구실에 오신 것을 환영합니다</h2>
            <p class="lead mt-3">최신 인공지능 기술과 소프트웨어 엔지니어링을 연구하는 공간입니다.</p>
            <div class="mt-4">
                <a class="btn btn-primary btn-lg" href="/exercise/labcontrol?action=login" role="button">로그인</a>
                <a class="btn btn-outline-secondary btn-lg" href="/exercise/labcontrol?action=register" role="button">회원가입</a>
            </div>
        </div>
    </div>  
    
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h4 class="mb-3">최근 공지사항</h4>
                <ul class="list-group">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <a href="#" class="text-dark">이번 주 전체 랩미팅 일정 안내</a>
                        <span class="badge badge-primary badge-pill">New</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <a href="#" class="text-dark">서버실 출입 및 GPU 사용 수칙 개정</a>
                        <span class="text-muted small">2026-05-28</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <a href="#" class="text-dark">하계 학술대회 논문 제출 기한 리마인드</a>
                        <span class="text-muted small">2026-05-25</span>
                    </li>
                </ul>
            </div>
            
            <div class="col-md-4">
                <h4 class="mb-3">Quick Links</h4>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">프로젝트 현황</h5>
                        <p class="card-text">현재 진행 중인 연구실 프로젝트와 참여 인원을 확인하세요.</p>
                        <a href="#" class="btn btn-sm btn-info">프로젝트 보기</a>
                    </div>
                </div>
            </div>
        </div>
        <hr>
    </div>  
    
    <jsp:include page="footer.jsp" />
</body>
</html>