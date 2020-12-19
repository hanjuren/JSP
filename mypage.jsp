<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    
    String uid = (String) session.getAttribute("uid");
    String uname = (String) session.getAttribute("uname");
    String itemid = request.getParameter("itemid");
    
    if(uid == null){
%>
    <html><head><title>비정상 접근</title><script>
    alert("비정상적인 접근입니다.");
    document.location = "index.jsp";
    </script></head><body></body></html>
<%
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/mypage.css"/>
<link href='http://www.openhiun.com/hangul/nanumbarungothic.css' rel='stylesheet' type='text/css'>
<title>개인 홈페이지</title>
</head>
<body>
    <div class="wrapper">
        <div class="logo-box">
            <a href="index.jsp"><h3>MY PET</h3></a>
        </div>
    <!-- 메뉴바 -->
        <div class="container">
            <div class="menu-bar">
                    <ul>
                        <li class="home"><a href="index.jsp">Home</a></li>
                        <li class="menu"><a href="market.jsp">Market</a></li>
                        <li class="menu"><a href="board.jsp">Notice</a></li> 
                    </ul> 
            </div>
            <div class="menu-last">
                <ul>
                <%
                if(uid == null){
                %>
                    <li class="menu-user"><a href="login.html">Login</a></li> 
                    <li class="menu-user"><a href="join.html">Join</a></li>
                <%
                } else {
                %>
                    <li class="menu-user"><a href="logout.jsp">Logout</a></li>
                    <li class="menu-user"><a href="mypage.jsp">my page</a></li>
                <%
                }
                %>
                    
                </ul>
            </div>          
        </div>
        <div class="main-content">
            <div class="buyitem">
                <div class="title1"><%= uname %>님의 구매하신 상품</div>
                <div class="order-table">
                    <table id="table">
<%
    
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mypet?serverTimezone=Asia/Seoul","hanjuren", "1210");
        ps = con.prepareStatement("select i.itemimage, i.itemtitle, o.uid, o.ocount, m.uname, i.price*o.ocount as total, i.itemid from orders o, items i, mypet m where o.uid=? and o.itemid=i.itemid and m.uname=?");
        ps.setString(1, uid);
        ps.setString(2, uname);
        rs = ps.executeQuery();
        while(rs.next()){
%>
                        
                        <tr>
                            <td rowspan=4 id="timage"><img src="<%= rs.getString(1) %>" alt=""></td>
                            <td colspan=2><%= rs.getString(2) %></td>   
                        </tr>
                        <tr>
                            <td colspan=2>주문상품 수 : <%= rs.getString(4) %></td>
                        </tr>
                        <tr>
                            <td colspan=2>주문고객 이름 : <%= rs.getString(5) %></td>
                        </tr>
                        <tr>
                            <td id="lasttr">총 가격 : <%= rs.getString(6) %>원</td>
                            <td id="lasttr"><button type="button" id="<%= rs.getString(7) %>" onclick="wr(this.id);">리뷰작성</button></td>
                        </tr>
                        
<%
    }
    rs.close();
    ps.close();
    ps = con.prepareStatement("select count(orderid) as total from orders o, items i, mypet m where o.uid=? and o.itemid=i.itemid and m.uname=?");
    ps.setString(1, uid);
    ps.setString(2, uname);
    rs = ps.executeQuery();
    rs.next();
%>   
                    </table>
                    <div id="total-price">주문건수 : <%= rs.getString(1) %>건</div>
                </div> 
            </div> 
        

<%
     
    rs.close();
    ps.close();
    ps = con.prepareStatement("select itemtitle from items where itemid=?");
    ps.setString(1, itemid);
    rs = ps.executeQuery();
    while(rs.next()){
%>
        <div class="review">
        <form name="rewrite" action="write.jsp?itemid=<%= itemid %>" method="post">
            <table>
                <tr>
                    <td style="height:50px">제목</td>
                    <td style="height:50px" colspan=3><input type="text" name="title" id="re-title" /></td>
                </tr>
                <tr>
                    <td>상품명</td>
                    <td><%= rs.getString(1) %></td>
                    <td>작성자</td>
                    <td><%= uname %></td>
                </tr>
                <tr>
                    <td id="content">내용</td>
                    <td id="content" colspan=3><textarea name="content" row="20" id="text-area" ></textarea></td>
                </tr>
            </table>
            <div class="rebtn">
                <button type="button" id="rebtn" onclick="reviewwrite();">리뷰작성</button>
            </div>
            </form>
        </div>
<%
    }
%>
        </div>
        <!-- 푸터 -->
        <div class="footer-container">
            <div class="footer-1">
                <div class="company"><span>마이펫(주)</span> <br><br>
                대표이사: 한주련, 주소: 경기도 안양시 평촌동 329, Tel: 031-424-8649 <br>
                사업자 등록번호: 000-00-12562 통신판매업신고 : 2020-경기남부-1445
                </div>
                <div class="footer-info">
                마이펫(주)는 통신판매중개자로서 오픈마켓 마이펫의 거래당사자가 아니며, 
                입점판매자가 등록한 상품정보 및 거래에 대해 마이펫(주)는 일체 책임을 지지 않습니다.
                </div>
            </div>
            <div class="footer-2">
                <div class="number">
                    <div id="customer">고객센터 <span style="color:red;">1599-0001</span></div>
                    <br>
                    08378) 서울특별시 구로구 디지털로 306 (구로동) <br>
                    Fax : 02-849-4962 / E-mail : customerservice@mypet.co.kr
                </div>
                <div class="number-2">
                    <span>전자금융거래분쟁담당</span><br>
                    Tel : 1599-0110 / Fax : 02-849-4962<br>
                    E-mail : customerservice@mypet.co.kr
                </div>
            </div>
        </div>
    </div>

    <script src="js/app.js"></script>
</body>
</html>
<%
    } 
    catch (Exception e) {
        return;
    } 
    finally {
        try{if(rs!=null)rs.close();} catch(Exception se){}
        try{if(ps!=null)ps.close();} catch(Exception se){}
        try{if(con!=null)con.close();} catch(Exception se){}
    }
    	
%>