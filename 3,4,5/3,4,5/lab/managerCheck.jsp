<%@ page import="java.sql.*"%>
<%
// 관리자(ADMIN) 또는 랩장만 랩원 관리(등록/수정/삭제) 가능
// 이 파일을 include 하면 canManage 값을 사용할 수 있다.
String mcId = (String) session.getAttribute("sessionId");
String mcRole = (String) session.getAttribute("sessionRole");
boolean canManage = false;

if(mcId != null) {
	if("ADMIN".equals(mcRole)) {
		canManage = true;
	} else {
		Connection mcConn = null;
		PreparedStatement mcPstmt = null;
		ResultSet mcRs = null;
		try {
			Class.forName("org.h2.Driver");
			mcConn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/bookmarketdb", "user1", "1234");
			mcPstmt = mcConn.prepareStatement("SELECT lab_role FROM members WHERE user_id = ?");
			mcPstmt.setString(1, mcId);
			mcRs = mcPstmt.executeQuery();
			if(mcRs.next() && "랩장".equals(mcRs.getString("lab_role"))) {
				canManage = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(mcRs != null) mcRs.close();
				if(mcPstmt != null) mcPstmt.close();
				if(mcConn != null) mcConn.close();
			} catch(Exception ex) { }
		}
	}
}
%>
