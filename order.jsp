<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%
    String uid = (String) session.getAttribute("uid");

    String count = request.getParameter("count");
    String num = request.getParameter("itemid");

if(uid == null){
%>
<html><head><title>비정상 접근</title><script>
alert("로그인 진행 후 구매 가능합니다.");
document.location = "login.html";
</script></head><body></body></html>
<%
        return;
    }
else{
%>
    <html><head><title>비정상 접근</title><script>
    alert("주문하신 상품 개수는" + <%= count %> + "개 입니다.");
    </script></head><body></body></html>
<%
}

Connection con = null;
PreparedStatement ps = null;
//ResultSet rs = null;
boolean bsuccess = true;
try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mypet?serverTimezone=Asia/Seoul","hanjuren", "1210");
    ps = con.prepareStatement("insert into orders (uid, itemid, ocount) values (?,?,?)");
    ps.setString(1, uid);
    ps.setString(2, num);
    ps.setString(3, count);

    ps.executeUpdate();
    
} catch (Exception e) {

    return;
} finally {
    //try{if(rs!=null)rs.close();} catch(Exception se){}
    try{if(ps!=null)ps.close();} catch(Exception se){}
    try{if(con!=null)con.close();} catch(Exception se){}
}
%>
<html><head><title>주문 완료</title><script>
alert("주문이 완료되었습니다.");
document.location = "item.jsp?image=<%= num %>";
</script></head><body></body></html>
<%
//response.sendRedirect("item/item.jsp?image="+num);
%>