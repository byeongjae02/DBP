package lab;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletContext;

// 브라우저 접근 주소labcontrol로 변경
@WebServlet("/labcontrol")
// 프로필 사진 파일 업로드 기능이 나중에 필요할 수 있으므로 Multipart 설정은 유지
@MultipartConfig(maxFileSize=1024*1024*2, location="c:/Temp/img")
public class LabController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    // private UserDAO userDao; // DAO를 만들어주면 주석 해제
    private ServletContext ctx;
    
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        // userDao = new UserDAO(); // DB 연동 시 활성화
        ctx = getServletContext();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        String view = "";
        
        // action 값이 없으면 무조건 메인 화면(welcome)으로 강제 이동
        if(action == null) {
            getServletContext().getRequestDispatcher("/labcontrol?action=welcome").forward(request, response);
            return;
        } 
        
        switch(action) {
            case "welcome": view = welcome(request, response); break;
            case "login": view = login(request, response); break;
            case "register": view = register(request, response); break; // 회원가입 화면 분기 추가
            case "processLogin": view = processLogin(request, response); break;
            case "processLogout": view = processLogout(request, response); break;
            case "processRegister": view = processRegister(request, response); break; // 회원가입 처리 로직 추가
        }
        
        if(view != null && !view.isEmpty()) {
            getServletContext().getRequestDispatcher("/lab/" + view).forward(request, response);     
        }
    }
    
    // --- 화면 이동 메서드 ---
    private String welcome(HttpServletRequest request, HttpServletResponse response) {
        return "welcome.jsp";
    }
    
    private String login(HttpServletRequest request, HttpServletResponse response) {
        return "login.jsp";
    }

    private String register(HttpServletRequest request, HttpServletResponse response) {
        return "register.jsp";
    }
        
    // --- 비즈니스 로직 처리 메서드 ---
    private String processLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        // DAO를 만들어주면 여기서 DB를 조회해 비밀번호가 맞는지 인증하는 로직을 추가해야함

        // 현재는 DB 연결 전이므로, 입력만 하면 무조건 로그인 통과되도록 임시 처리
        HttpSession session = request.getSession();
        session.setAttribute("sessionId", id);
        session.setAttribute("role", "member"); // 로그인 시 '일반 랩원' 권한 세션 부여

        return "welcomeUser.jsp";       
    }

    private String processLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate(); // 접속 중인 세션 폭파 (로그아웃)

        return "welcome.jsp";       
    }

    private String processRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // register.jsp 입력 폼에서 사용자가 작성한 데이터 받아오기
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String memberId = request.getParameter("memberId");
        String department = request.getParameter("department");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // DAO를 완성하면 여기서 받은 정보들을 H2 DB에 INSERT 하는 코드를 넣어야 함
        
        // 콘솔 창에 가입 시도 로그 남기기
        ctx.log("신규 랩원 가입 시도: " + name + " (학번: " + memberId + ")");

        // 회원가입 처리가 끝났다고 가정하고 로그인 화면으로 리다이렉트
        return "login.jsp";
    }
}