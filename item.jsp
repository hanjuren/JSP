<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    
    String uid = (String) session.getAttribute("uid");
    String itemnum = request.getParameter("image");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/item.css"/>
<title>개인 홈페이지</title>
</head>
<body>
    <div class="wrapper">
        <div id="header"></div>
<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
boolean bsuccess = true;
try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mypet?serverTimezone=Asia/Seoul","hanjuren", "1210");
    ps = con.prepareStatement("select itemimage, itemtitle, price, info, content, company, itemid from items where itemid=?");
    ps.setString(1, itemnum);
    rs = ps.executeQuery();
    rs.next();
%>
        <!--이미지 출력-->
        <div class="main">
            <div class="img">
                <!-- 아이템 이미지 -->
                    <div class="item-img">
                        <img src="<%= rs.getString(1) %>" alt="">
                    </div>
                <!-- 아이템 정보 -->
                    <div class="item">

                        <div class="item-info">
                            <div id="item-title"><%= rs.getString(2) %></div> 
                            <div id="info"><%= rs.getString(4) %></div> 
                            <div id="item-content"><%= rs.getString(5) %></div> 
                            <div id="price"> <%= rs.getString(3) %>원 </div>
                        </div>
                <!-- 주문 버튼 -->
                        <div class="order">
                            <form name="orderform" action="order.jsp?itemid=<%= itemnum %>" method="post">
                                <a href="#" onclick="change(1);">➕</a>
                                <input type="text" id="cnt" name="count" readonly value="1" />
                                <a href="#" onclick="change(-1)">➖</a>
                                <button type="button" class="orderbtn" onclick="get();">바로구매</button>
                            </form>
                            
                        </div>

                    </div>
            </div>
            <div class="review">
                <div class="review-box">
                    <div id="review-title">고객님들의 리뷰🧡</div>
                    <div id="review-content">
                        
                            <table>
<%
    rs.close();
    ps.close();
    ps = con.prepareStatement("select uname,rtitle,date_format(rdate, '%Y-%m-%d'),rcount, rcontent from review where itemid=? limit 0, 10 ");
    ps.setString(1, itemnum);
    rs = ps.executeQuery();
    while(rs.next()) {
%>                  
                                <tr>
                                    <td style="width:90%;"><span>작성자 :</span> <%= rs.getString(1) %>님</td>
                                    <td><%= rs.getString(3) %></td>
                                </tr>
                                <tr>
                                    <td><span>제목 :</span> <%= rs.getString(2) %></td>
                                </tr>
                                
                                <tr style="height:100px;">
                                    <td colspan=2 id="table-content"><span id="content"><%= rs.getString(5) %></span></td>
                                </tr>
                                          
                                            
<%
};
%>
                        
                            </table>
                    </div>
                </div>
            </div>    
        </div>

        <div id="footer"></div>
        <script src="js/include.js"></script>
        <script src="js/item.js"></script>
    </div>
</body>
</html>
<%
    
    } catch (Exception e) {
    return;
} finally {
    try{if(rs!=null)rs.close();} catch(Exception se){}
    try{if(ps!=null)ps.close();} catch(Exception se){}
    try{if(con!=null)con.close();} catch(Exception se){}
}
%>