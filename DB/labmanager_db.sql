DROP TABLE IF EXISTS project_members;
DROP TABLE IF EXISTS notices;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id VARCHAR(20) PRIMARY KEY,
    password VARCHAR(20) NOT NULL,
    name VARCHAR(20) NOT NULL,
    role VARCHAR(20) NOT NULL
);

CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(20),
    name VARCHAR(20) NOT NULL,
    student_id VARCHAR(20),
    department VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    lab_role VARCHAR(20),
    member_status VARCHAR(20),
    research_field VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    project_type VARCHAR(20),
    description VARCHAR(500),
    start_date DATE,
    end_date DATE,
    project_status VARCHAR(20)
);

CREATE TABLE project_members (
    project_id INT NOT NULL,
    member_id INT NOT NULL,
    project_role VARCHAR(20),
    joined_date DATE,
    PRIMARY KEY (project_id, member_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

CREATE TABLE notices (
    notice_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content VARCHAR(500),
    writer VARCHAR(20),
    created_at DATE,
    FOREIGN KEY (writer) REFERENCES users(user_id)
);

INSERT INTO users(user_id, password, name, role)
VALUES('admin', '1234', '관리자', 'ADMIN');

INSERT INTO users(user_id, password, name, role)
VALUES('user1', '1234', '박소영', 'MEMBER');

INSERT INTO users(user_id, password, name, role)
VALUES('user2', '1234', '김병재', 'MEMBER');

INSERT INTO users(user_id, password, name, role)
VALUES('user3', '1234', '반재민', 'MEMBER');

INSERT INTO users(user_id, password, name, role)
VALUES('user4', '1234', '김예준', 'MEMBER');

INSERT INTO users(user_id, password, name, role)
VALUES('user5', '1234', '정다은', 'MEMBER');


INSERT INTO members(user_id, name, student_id, department, email, phone, lab_role, member_status, research_field)
VALUES('user1', '박소영', '20240001', 'AI·SW학부', 'student1@hs.ac.kr', '010-1111-2222', '랩원', '활동중', 'LLM 응용');

INSERT INTO members(user_id, name, student_id, department, email, phone, lab_role, member_status, research_field)
VALUES('user2', '김병재', '20230002', '컴퓨터공학부', 'student2@hs.ac.kr', '010-3333-4444', '랩장', '활동중', '웹 개발');

INSERT INTO members(user_id, name, student_id, department, email, phone, lab_role, member_status, research_field)
VALUES('user3', '반재민', '20240003', 'AI·SW학부', 'student3@hs.ac.kr', '010-5555-6666', '랩원', '활동중', '데이터 분석');

INSERT INTO members(user_id, name, student_id, department, email, phone, lab_role, member_status, research_field)
VALUES('user4', '김예준', '20230004', '컴퓨터공학부', 'student4@hs.ac.kr', '010-7777-8888', '랩원', '활동중', '백엔드 개발');

INSERT INTO members(user_id, name, student_id, department, email, phone, lab_role, member_status, research_field)
VALUES('user5', '정다은', '20220005', '정보통신학부', 'student5@hs.ac.kr', '010-9999-0000', '랩원', '휴면', 'UI/UX 설계');


INSERT INTO projects(project_name, project_type, description, start_date, end_date, project_status)
VALUES('랩원 관리 시스템', '토이프로젝트', '연구실 랩원과 프로젝트 정보를 관리하는 웹 시스템 개발', DATE '2026-06-01', DATE '2026-06-30', '진행중');

INSERT INTO projects(project_name, project_type, description, start_date, end_date, project_status)
VALUES('AI 공지 요약 시스템', '소학회', '연구실 공지사항을 요약하고 분류하는 시스템 개발', DATE '2026-06-05', DATE '2026-07-10', '계획중');

INSERT INTO projects(project_name, project_type, description, start_date, end_date, project_status)
VALUES('Java 웹 튜터링', '튜터링', 'JSP와 DB 연동 실습을 위한 튜터링 프로젝트', DATE '2026-06-10', DATE '2026-07-01', '진행중');

INSERT INTO projects(project_name, project_type, description, start_date, end_date, project_status)
VALUES('논문 리뷰 소학회', '소학회', 'AI 및 데이터베이스 관련 논문을 읽고 발표하는 소학회', DATE '2026-06-03', DATE '2026-08-31', '진행중');

INSERT INTO projects(project_name, project_type, description, start_date, end_date, project_status)
VALUES('데이터베이스 튜터링', '튜터링', 'JSP, SQL, H2 DB 연동을 함께 학습하는 튜터링', DATE '2026-06-07', DATE '2026-07-20', '진행중');

INSERT INTO projects(project_name, project_type, description, start_date, end_date, project_status)
VALUES('연구실 공지 웹앱', '토이프로젝트', '연구실 공지사항과 랩원 정보를 관리하는 웹 애플리케이션', DATE '2026-06-12', DATE '2026-07-15', '계획중');


INSERT INTO project_members(project_id, member_id, project_role, joined_date)
VALUES(1, 1, '기획', DATE '2026-06-01');

INSERT INTO project_members(project_id, member_id, project_role, joined_date)
VALUES(1, 2, '개발', DATE '2026-06-01');

INSERT INTO project_members(project_id, member_id, project_role, joined_date)
VALUES(2, 1, '데이터 정리', DATE '2026-06-05');

INSERT INTO project_members(project_id, member_id, project_role, joined_date)
VALUES(3, 3, '튜티', DATE '2026-06-10');

INSERT INTO project_members(project_id, member_id, project_role, joined_date)
VALUES(3, 4, '튜터', DATE '2026-06-10');

INSERT INTO project_members(project_id, member_id, project_role, joined_date)
VALUES(4, 1, '발표', DATE '2026-06-03');

INSERT INTO project_members(project_id, member_id, project_role, joined_date)
VALUES(4, 3, '자료 조사', DATE '2026-06-03');

INSERT INTO project_members(project_id, member_id, project_role, joined_date)
VALUES(5, 2, '튜터', DATE '2026-06-07');

INSERT INTO project_members(project_id, member_id, project_role, joined_date)
VALUES(5, 4, '튜티', DATE '2026-06-07');

INSERT INTO project_members(project_id, member_id, project_role, joined_date)
VALUES(6, 1, '기획', DATE '2026-06-12');

INSERT INTO project_members(project_id, member_id, project_role, joined_date)
VALUES(6, 5, 'UI 설계', DATE '2026-06-12');


INSERT INTO notices(title, content, writer, created_at)
VALUES('연구실 정기 회의 안내', '이번 주 금요일 오후 3시에 연구실 정기 회의를 진행합니다.', 'admin', CURRENT_DATE);

INSERT INTO notices(title, content, writer, created_at)
VALUES('신규 프로젝트 참여자 모집', 'AI 공지 요약 시스템 프로젝트 참여자를 모집합니다.', 'admin', CURRENT_DATE);

INSERT INTO notices(title, content, writer, created_at)
VALUES('프로젝트 진행 상황 공유 요청', '각 프로젝트 담당자는 이번 주까지 진행 상황을 정리해 주세요.', 'admin', CURRENT_DATE);

INSERT INTO notices(title, content, writer, created_at)
VALUES('소학회 발표 자료 업로드 안내', '논문 리뷰 소학회 발표자는 발표 전날까지 자료를 공유해 주세요.', 'admin', CURRENT_DATE);

INSERT INTO notices(title, content, writer, created_at)
VALUES('랩원 정보 확인 요청', '랩원 목록의 이메일, 전화번호, 연구분야 정보를 확인해 주세요.', 'admin', CURRENT_DATE);


SELECT * FROM users;
SELECT * FROM members;
SELECT * FROM projects;
SELECT * FROM project_members;
SELECT * FROM notices;