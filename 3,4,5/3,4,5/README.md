# 랩원 관리 파트 (WEB 3 · 4 · 5) — 1,2 연동용

이 폴더에는 **내 파트(3,4,5)** JSP 파일만 들어 있습니다.
코드 자체가 1,2 파트에 그대로 붙도록 작성되어 있어, 아래 lab/ 안의 파일을
1,2 프로젝트의 lab/ 폴더에 복사하기만 하면 됩니다.

## 포함 파일 (8개)
```
lab/
├─ memberList.jsp            WEB 3 : 랩원 목록
├─ memberDetail.jsp          WEB 4 : 랩원 상세 + 참여 프로젝트
├─ memberForm.jsp            WEB 5 : 등록 폼
├─ processMemberInsert.jsp   WEB 5 : 등록 처리(INSERT)
├─ memberEdit.jsp            WEB 5 : 수정 폼
├─ processMemberUpdate.jsp   WEB 5 : 수정 처리(UPDATE)
├─ processMemberDelete.jsp   WEB 5 : 삭제 처리(DELETE)
└─ managerCheck.jsp          공통 : 관리자/랩장 권한 확인 include
```
(footer.jsp, menu.jsp, h2 드라이버, DB sql 은 1,2 파트에 이미 있으므로 포함하지 않음)

## 1,2 와 어떻게 연동되는가 (이미 코드에 반영됨)
1. 세션 공유
   - 1,2 의 processLogin.jsp 가 로그인 시 sessionId / sessionName / sessionRole 저장
   - 이 파트의 managerCheck.jsp 가 sessionId / sessionRole 를 그대로 읽어 권한 판단
     → 1,2 에서 로그인하면 이 페이지들이 그 로그인 상태를 자동 인식
2. 같은 DB
   - 모든 JSP 가 1,2 와 동일하게
     jdbc:h2:tcp://localhost/~/bookmarketdb (user1 / 1234) 로 접속
3. 같은 공통 화면
   - 모든 페이지가 1,2 의 menu.jsp, footer.jsp 를 include → 메뉴/푸터 동일

## 설치 (2단계)
1) lab/ 안 8개 파일을 1,2 프로젝트의 lab/ 폴더에 복사한다. (끝)

2) (메뉴에서 바로 이동하고 싶을 때만) 1,2 의 menu.jsp 에서
   로그인 상태( else 블록 )에 아래 한 줄을 추가한다.

   <li class="nav-item">
       <a class="nav-link" href="memberList.jsp">랩원 목록</a>
   </li>

   * 이 한 줄을 넣지 않아도, 주소창에 직접 memberList.jsp 로 접근하면
     모든 기능은 정상 동작한다.

## 권한 규칙 (WEB 5)
- ADMIN 계정(admin) 또는 members.lab_role 이 '랩장' 인 사용자만
  등록 / 수정 / 삭제 가능. (그 외에는 자동으로 memberList.jsp 로 이동)

## 주의 — DB 이름
url 이 1,2 와 똑같이 bookmarketdb 로 되어 있다. 1,2 가 이 이름을 쓰면 수정 불필요,
다른 이름을 쓰면 1,2 와 동일한 이름으로 이 파일들의 url 도 맞춰주면 된다.
