<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String delete_id = (String)request.getAttribute("delete_id");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
        @import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
        
        body{
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            background-color: white;
        }

        /* ---------- header ---------- */

        #header{
            position: relative;
            background-color: #ABD0CE;
            top: -10px;
            width: 100%;
            height: 175px;
            z-index: 100;
        }

        #logo{
            position: absolute;
            left: 100px;
        }

        #menu{
            position: relative;
            top: 110px;
            left: 600px;
            width: 900px;            
        }
        
        #menu ul{
            list-style: none;
        }

        #menu ul li{
            float: left;
            margin-right: 60px;
        }

        #menu ul li a{
            text-decoration: none;
            color: #7C7877;
            padding: 15px;
            font-size: 23px;
            font-weight: bold;
            font-family: 'NanumSquare', sans-serif;
            display: inline-block;
        }

        #menu ul li a:after{
            display: block;
            content: '';
            border-bottom: solid 3px#ff7473;  
            transform: scaleX(0);  
            transition: transform 250ms ease-in-out;
        }

        #menu ul li a:hover:after{
            transform: scaleX(1);
        }

        #loginBox{
            position: relative;
            top: 10px;
            left: 1600px;
            font-size: 18px;
            padding: 20px;
            width: 210px;
        }
        
        #loginBox a{
	        display: inline-block;
        	text-decoration: none;
        	color: #7C7877;
        	padding: 15px;
        }

        /* ---------- header 끝 ---------- */
        
        /* ---------- main ---------- */
        
        #main {
        	min-height: calc(100vh - 140px);
        }
        
        #sidebar{
        	position: relative;
        	top: 150px;
        	left: 400px;
        	width: 200px;
        }
        
        #sidebar ul li{
        	list-style: none;
        	margin-bottom: 50px;
        }
        
        #sidebar ul li a{
        	font-family: 'NanumSquare', sans-serif;
            font-size: 23px;
        	font-weight: 800;
        	text-decoration: none;
        	color: #4e4c4b;
            transition: 0.4s;
            border-radius: 10px;
            padding: 15px;
        }

        #sidebar ul li a:hover{
            background-color: #F16B6F;
            color: floralwhite;
        }
        
        #thisbar{
        	background-color: #F16B6F;
            color: floralwhite;
        }

        #memberKick{
        	position: absolute;
        	top: 280px;
        	left: 700px;
        	width: 600px;
        }
        
        #memberList table{
        	background-color: white;
        }
        
        #memberList table, th, td{
        	text-align: center;
        }
        
        /* ---------- main 끝 ---------- */

        /* ---------- footer ---------- */

        #footer{
        	position: absolute;
            width:100%;
            height:140px;   
            background-color: #ABD0CE;
        }
        
        #footer li{
            float: left;
            list-style: none;
        }
        
        #footer li a{
            display: inline-block;
            content: "｜";
            clear: both;
            margin:0 10px;
            text-decoration: none;
            color: black;
        }
        
        #footer nav{
            left: 50%;
            transform: translate(-50%, 100%);
            position: absolute;
        }
        
        address{
            position: relative;
            top: 60%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: black;
        }

        /* ---------- footer 끝 ---------- */

	</style>
</head>
<body>
    	<!-- 헤더 -->
	    <div id="header">
	        <div id="logo">
	            <a href="./index.jsp">
	                <img src="./logo.png">
	            </a>
	        </div>
	        <div id="menu">
	            <ul>
	                <li><a href="intro.jsp">스터디룸</a></li>
	                <li><a href="resv01_reservation.jsp">예약</a></li>
	                <li><a href="./fbList">자유게시판</a></li>
	                <li><a href="./rvlist">후기</a></li>
	                <li><a href="./reportlist">고객센터</a></li>
	            </ul>
	        </div>
	        <div id="loginBox">
	            <a href="admin00_Main.jsp"><%if(session.getAttribute("id") != null){%>
	                ${id}님</a>
	            <%}else{%>
	                <a href="member01_login.jsp">로그인 / 회원가입</a> 
	            <%}%>
	        </div>
	    </div>
	    <!-- 헤더 끝 -->
	
	<!------------------------------------------------------------------------------------------------------->
	
	    <!-- 메인 시작 -->
	    <div id="main">
	    	<div id="sidebar">
		    	<ul>
		    		<li><a href="memberList">회원관리</a></li>
		    		<li><a href="report">신고내역</a></li>
		    		<li><a href="blackList">블랙리스트</a></li>
		    		<li><a href="kick" id="thisbar">제명목록</a></li>
		    	</ul>
		    </div>
		    <div id="memberKick">
                <form method="post" action="kickAdd">
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <td><input type="hidden" name="id" value="<%=delete_id %>"/></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><b>삭제 사유</b></td>
                                <td><input type="text" name="cause" placeholder="삭제 사유를 입력해주세요" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="submit" id="btn_Update" value="삭제"/>
                </form>
                <button id="btn_cancel" onclick="location.href='memberList'">취소</button>
		    </div>
	    </div>
	    <!-- 메인 끝 -->
	
	<!------------------------------------------------------------------------------------------------------->
	
    <!-- footer 시작 -->
    <footer id="footer">
        <nav>
            <ul id="info_menu">
                <li><a href="#">이용약관</a></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">이메일</a></li>
                <li><a href="#">무단수집거부</a></li>
                <li><a href="#">법적고지</a></li>
                <li><a href="#">사이트맵</a></li>
            </ul>
        </nav>
        <address>
            <br>
            서울특별시 금천구 가산디지털2로 115, 509호, 811호 (가산동, 대륭테크노타운 3차) FAX.02-6740-4949<br>
            COPYRIGHT ⓒ 2020 Goodee. ALL RIGHT RESERVED.
        </address>
    </footer>
    <!-- footer 끝-->
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
</script>
</html>