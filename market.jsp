<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    
    String uid = (String) session.getAttribute("uid");
    String uname = (String) session.getAttribute("uname");
    String category = request.getParameter("category"); 
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/market.css"/>
<title>개인 홈페이지</title>
</head>
<body>
    <div class="wrapper">
        <div id="header"></div>
            <div class="main">
                
                    <div class="item-bar">
                        <ul>
                            <li class="item"><a href="#" id="dog" onclick="itemchange(this.id);">Dog</a></li>
                            <li class="item"><a href="#" id="cat" onclick="itemchange(this.id);">Cat</a></li>
                            <li class="item"><a href="#" id="organic" onclick="itemchange(this.id);">Organic</a></li>
                            <li class="item"><a href="#" id="other" onclick="itemchange(this.id);">Other</a></li> 
                        </ul> 
                    </div>
<%
    if(category == null){
%>
                    <div id="item-container1">
                        <div class="item-list">
                            <ul>
                                <li id="1" onclick="pagechange(this.id);">
                                    <div class="item">
                                        <div class="item-img">
                                            <img src="images/item/feed.jpg" alt="">
                                        </div>
                                        <div class="brand">
                                            <span>노브랜드</span>
                                        </div>
                                        <div class="item-info">
                                            <span id="info">강아지 사료15kg</span><br>(중/대형견용)<br>
                                            <span id="price"><br>39000원</span>
                                        </div>
                                    </div>
                                </li>
                                <li id="2" onclick="pagechange(this.id);">
                                    <div class="item">
                                        <div class="item-img">
                                            <img src="images/item/catfeed.jpg" alt="">
                                        </div>
                                        <div class="brand">
                                            <span>마이비 펫</span>
                                        </div>
                                        <div class="item-info">
                                            <span id="info">프로베스트 캣 밸런스7kg</span><br>(전연령)<br>
                                            <span id="price"><br>18900원</span>
                                        </div>
                                    </div>
                                </li>
                                <li id="3" onclick="pagechange(this.id);">
                                    <div class="item">
                                        <div class="item-img">
                                            <img src="images/item/cathouse.jpg" alt="">
                                        </div>
                                        <div class="brand">
                                            <span>피단 스튜디오</span>
                                        </div>
                                        <div class="item-info">
                                            <span id="info">이글루 토일렛 화이트</span><br>(고양이 화장실+모래삽)<br>
                                            <span id="price"><del style="color:red;font-size: 12px;">68900원</del><br>58000원</span>
                                        </div>
                                    </div>
                                </li>
                                <li id="4" onclick="pagechange(this.id);">
                                    <div class="item">
                                        <div class="item-img">
                                            <img src="images/item/dogmattjpg.jpg" alt="">
                                        </div>
                                        <div class="brand">
                                            <span>디자인 디팡</span>
                                        </div>
                                        <div class="item-info">
                                            <span id="info">디팡 16단 매트</span><br>[완벽더블8+8/강아지매트 1위]<br>재구매 1위 상품
                                            <span id="price"><br>256000원~</span>
                                        </div>
                                    </div>
                                </li>  
                            </ul>
                        </div>
                    </div>
<%
    }
%>
                    <div class="item-container">
                    <div class="item-list">
                    <ul>
<%


Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mypet?serverTimezone=Asia/Seoul","hanjuren", "1210");
    ps = con.prepareStatement("select itemid, itemimage, itemtitle, price, company, info from items where category=?");
    ps.setString(1, category);
    rs = ps.executeQuery();
    while(rs.next()) {
%>
                    
                    <li id="<%= rs.getInt(1) %>" onclick="pagechange(this.id);">
                        <div class="item">
                            <div class="item-img">
                                <img src="<%= rs.getString(2) %>" alt="">
                            </div>
                            <div class="brand">
                                <span><%= rs.getString(5) %></span>
                            </div>
                            <div class="item-info">
                                <span id="info"><%= rs.getString(3) %></span><br><%= rs.getString(6) %><br>
                                <span id="price"><br><%= rs.getString(4) %>원</span>
                            </div>
                        </div>
                    </li>
                          
<%
    }
    } catch (Exception e) {
    return;
    } finally {
        try{if(rs!=null)rs.close();} catch(Exception se){}
        try{if(ps!=null)ps.close();} catch(Exception se){}
        try{if(con!=null)con.close();} catch(Exception se){}
    }
%>
                        </ul>
                    </div>
                </div>
            </div>
        <div id="footer"></div>
        <script src="js/include.js"></script>
        <script src="js/app.js"></script>
    </div>
</body>
</html>