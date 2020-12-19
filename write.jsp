<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<%
	
	String uid = (String) session.getAttribute("uid");
	String uname = (String) session.getAttribute("uname");
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String itemid = request.getParameter("itemid");
	

	
	if(uid == null ||  uname == null || uid.equals("") || uname.equals("")) {
%>
<!doctype html>
<html><head><title>비정상 접근</title>
<script>
	alert("로그인 진행 후 이용 가능합니다.");
	document.location = "index.jsp";
</script>
</head><body></body></html>
<%
	return;
	}	

	if(title == null || content == null || title.equals("") || content.equals("")) {
%>
<!doctype html>
<html><head><title>비정상 접근</title>
<script>
    alert("비정상적인 접근입니다.");
    document.location = "mypqge.jsp";
</script>
</head><body></body></html>
<%
	return;
	}

	Connection conn = null;
	PreparedStatement ps = null;
	
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mypet?serverTimezone=Asia/Seoul", "hanjuren", "1210");
		ps = conn.prepareStatement("insert into review (itemid, uname, rtitle, rcontent, rdate) values (?, ?, ?, ?, current_timestamp())");
		ps.setString(1, itemid);
		ps.setString(2, uname);
		ps.setString(3, title);
		ps.setString(4, content);
		ps.executeUpdate();
    } 
    catch (Exception e) {
%>

<html><head><title>리뷰작성 실패</title><script>
alert("입력하신 정보는 이미 존재하는 정보 입니다.");
document.location = "mypage.jsp";
</script></head><body><%= e.toString() %></body></html>
<%
    return;
} finally {
    
    try{if(ps!=null)ps.close();} catch(Exception se){}
    try{if(conn!=null)conn.close();} catch(Exception se){}
}
	response.sendRedirect("mypage.jsp");	
%>
