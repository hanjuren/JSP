<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%
String uid = request.getParameter("uid");
String pwd = request.getParameter("pwd");
if(uid == null || pwd == null){
%>
<html><head><title>비정상 접근</title><script>
alert("비정상적인 접근입니다.");
document.location = "login.html";
</script></head><body></body></html>
<%
    return;
}


Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
boolean bsuccess = true;
try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mypet?serverTimezone=Asia/Seoul","hanjuren", "1210");
    ps = con.prepareStatement("select * from mypet where uid=? and pwd=md5(?)");
    ps.setString(1, uid);
    ps.setString(2, pwd);
    rs = ps.executeQuery();
    if(rs.next()){  //로그인 성공
        session.setAttribute("uid", uid);

    } else {   //로그인 실패
        bsuccess = false;
    }
} catch (Exception e) {
%>

<html><head><title>로그인오류</title><script>
alert("데이터 베이스 오류입니다. 관리자에게 문의하세요.");
document.location = "index.html";
</script></head><body><%= e.toString() %></body></html>
<%
    return;
} finally {
    try{if(rs!=null)rs.close();} catch(Exception se){}
    try{if(ps!=null)ps.close();} catch(Exception se){}
    try{if(con!=null)con.close();} catch(Exception se){}
}
if(bsuccess){
    response.sendRedirect("index.html"); //성공
}else { //실패 아이디 패스워드 오류
%>   
   <html><head><title>로그인실패</title><script>
    alert("아이디 또는 비밀번호를 확인하세요.")
    document.location = "login.html";
    </script></head><body></body></html>
<%
}
%>