
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
<title>공지사항</title>
</head>
<body>
<div class="wrapper">  
    
        <div id="header"></div>

        <div class="main-content">

            <div class="notice">
                <!-- 자주묻는 질문 -->
                <div class="bestfaq-title"><span>BEST FAQ</span></div>
                <div class="bestfaq">
                    <table id="best-faq">
                        <tr>
                            <th style="width:10%">NO</th>
                            <th style="width:15%">분류</th>
                            <th>내용</th>
                        </tr>
<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
String bid = request.getParameter("bid");
String nid = request.getParameter("nid");
try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mypet?serverTimezone=Asia/Seoul","hanjuren", "1210");
    ps = con.prepareStatement("select bid, bcategory, btitle from bestfaq order by bid desc limit 0,10");
    rs = ps.executeQuery();
    while(rs.next()) {
%>
                        <tr>
                            <td style="width:10%"><%= rs.getInt(1) %></td>
                            <td style="width:10%"><%= rs.getString(2) %></td>
                            <td><a href="#" id="<%= rs.getInt(1) %>" onclick="view(this.id);"><%= rs.getString(3) %></a></td>
                        </tr>                    
<%  
    }
    rs.close();
    ps.close();
    ps = con.prepareStatement("select bcontent, btitle from bestfaq where bid=?");
    ps.setString(1, bid);
    rs = ps.executeQuery();
    rs.next();
    if(bid!=null){
%>                  </table>
                    <table id="best" onclick="closed();">
                        <tr id="no" >
                            <th colspan=2><%= rs.getString(2) %></th>
                        </tr>
                        <tr>
                            <td style="width:10%;">내용</td>
                            <td style="height:80px;"><%= rs.getString(1) %></td>
                        </tr>
<%
    }
%>
                    </table>
                </div>

                <!-- 공지사항 -->
                <div class="notice-title"><span>공지사항❕</span></div>
                <div class="bestfaq">
                    <table id="best-faq">
                        <tr>
                            <th style="width:10%">NO</th>
                            <th style="width:15%">분류</th>
                            <th style="width:10%">공지일자</th>
                            <th>내용</th>
                        </tr>
<%
rs.close();
ps.close();
ps = con.prepareStatement("select nid, ncategory, ntitle, date_format(ndate, '%Y.%m.%d') from notice order by nid desc limit 0,10");
rs = ps.executeQuery();
while(rs.next()){
%>
                        <tr>
                            <td style="width:10%"><%= rs.getInt(1) %></td>
                            <td style="width:10%"><%= rs.getString(2) %></td>
                            <td style="width:10%"><%= rs.getString(4) %></td>
                            <td><a href="#" id="<%= rs.getInt(1) %>" onclick="notice(this.id);"><%= rs.getString(3) %></a></td>
                        </tr>                       
<%                   
    }
    rs.close();
    ps.close();
    ps = con.prepareStatement("select ncontent, ntitle from notice where nid=?");
    ps.setString(1, nid);
    rs = ps.executeQuery();
    rs.next();
    if(nid!=null){
%>
                    </table>
                    <table id="best" onclick="closed();">
                        <tr id="no">
                            <th colspan=2><%= rs.getString(2) %></th>
                            
                        </tr>
                        <tr>
                            <td style="width:10%;">내용</td>
                            <td style="height:80px;"><%= rs.getString(1) %></td>
                        </tr>
<%
    }
%>
                    </table>              
                </div>

            </div>
            
            
        </div>

        <!-- 푸터 -->
        <div id="footer"></div>

</div>

    
<script src="js/include.js"></script>
<script src="js/app.js"></script>   
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