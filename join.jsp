<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");
%>
<%
String uid = request.getParameter("uid");
String pwd = request.getParameter("pwd");
String phone = request.getParameter("phone");
String uname = request.getParameter("uname");

if(uid == null){
%>
<html><head><title>비정상 접근</title><script>
alert("비정상적인 접근입니다.");
document.location = "index.html";
</script></head><body></body></html>
<%
    return;
}
Connection con = null;
PreparedStatement ps = null;
//ResultSet rs = null;
boolean bsuccess = true;
try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mypet?serverTimezone=Asia/Seoul","hanjuren", "1210");
    ps = con.prepareStatement("insert into mypet (uid, pwd, phone, uname) values (?,md5(?),?,?)");
    ps.setString(1, uid);
    ps.setString(2, pwd);
    ps.setString(3, phone);
    ps.setString(4, uname);
    ps.executeUpdate();
    

} catch (Exception e) {
%>

<html><head><title>로그인오류</title><script>
alert("입력하신 정보는 이미 존재하는 정보 입니다.");
document.location = "join.html";
</script></head><body><%= e.toString() %></body></html>
<%
    return;
} finally {
    //try{if(rs!=null)rs.close();} catch(Exception se){}
    try{if(ps!=null)ps.close();} catch(Exception se){}
    try{if(con!=null)con.close();} catch(Exception se){}
}
if(bsuccess){
%>
    <html><head><title>회원가입</title><script>
    alert("가입이 성공했습니다.")
    document.location = "index.jsp";
    </script></head><body></body></html>
<%
    //response.sendRedirect("login.html");
}else { 
%>   
   <html><head><title>회원가입 실패</title><script>
    alert("가입이 실패했습니다.")
    document.location = "join.html";
    </script></head><body></body></html>
<%
}
%>


