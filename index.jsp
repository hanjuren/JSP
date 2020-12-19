<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    String uid = (String) session.getAttribute("uid");
    String uname = (String) session.getAttribute("uname");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css"/>
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
        <!-- 메인 이미지 -->
        <div class="image-container">
            <div class="image-view">
                
                <div class="slide">	
                    	
                </div>	
                
            </div>
        </div>
    <div class="main-content">
    <!-- 상품 이미지  -->
        <div class="best-item">
            <div><span>BEST ITEM</span></div>
        </div>
        <div class="item-container">
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
                    <li id="5" onclick="pagechange(this.id);">
                        <div class="item">
                            <div class="item-img">
                                <img src="images/item/dogcushion.jpg" alt="">
                            </div>
                            <div class="brand">
                                <span>초코펫 하우스</span>
                            </div>
                            <div class="item-info">
                                <span id="info">강아지 쿠션</span><br>극강의 편안함/무중력쿠션<br>
                                <span id="price"><br>32800원</span>
                            </div>
                        </div>
                    </li>  
                </ul>
            </div>
        </div>
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