<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>연구실 대시보드</title>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    
    <div class="jumbotron text-center">
        <div class="container">
            <h2 class="display-4">
                <span style="color: #007bff; font-weight: bold;">${sessionId}</span> 랩원님, 반갑습니다!
            </h2>
            <p class="lead mt-3">
                <c:choose>
                    <c:when test="${role == 'admin'}">
                        <span class="badge badge-danger">관리자 (연구실장)</span>
                    </c:when>
                    <c:otherwise>
                        <span class="badge badge-info">일반 랩원</span>
                    </c:otherwise>
                </c:choose>
            </p>
        </div>
    </div>  
    
    <div class="container">
        <div class="row text-center mt-4">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <h4 class="card-title">👨‍🔬 랩원 목록</h4>
                        <p class="card-text text-muted">연구실 구성원들의 상세 프로필과 연락처, 연구 분야를 조회합니다.</p>
                        <a href="/exercise/labcontrol?action=memberList" class="btn btn-primary">조회하기</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <h4 class="card-title">📁 프로젝트 관리</h4>
                        <p class="card-text text-muted">진행 중인 프로젝트 현황 및 본인의 참여 내역을 관리합니다.</p>
                        <a href="/exercise/labcontrol?action=projectList" class="btn btn-success">현황 보기</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <h4 class="card-title">📢 공지사항</h4>
                        <p class="card-text text-muted">연구실 주요 일정 및 중요 공지사항을 확인하세요.</p>
                        <a href="/exercise/labcontrol?action=noticeList" class="btn btn-warning">공지 게시판</a>
                    </div>
                </div>
            </div>
        </div>
        <hr>
    </div>  
    
    <jsp:include page="footer.jsp" />
</body>
</html>