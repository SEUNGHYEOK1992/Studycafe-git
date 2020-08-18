<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a814f74484.js" crossorigin="anonymous"></script>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
        @import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
        
        html, body{
        	margin: 0;
        	padding: 0;
        	height: 100%;
        }
        
        body{
            font-family: 'Noto Sans KR', sans-serif;
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
            top: 90px;
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
            left: 300px;
            font-size: 18px;
            padding: 20px;
            width: 210px;
        }
        
        #loginBox a{
	        display: inline-block;
        	text-decoration: none;
        	color: #7C7877;
        	font-weight: 700;
        	padding: 15px;
        }
        
        /* ----- accountBox ----- */
        	
        	#accountBox {
                position: relative;
                top: -10px;
                left: 1250px;
                background-color: #1f4e5f;
                width: 260px;
                height: 130px;
                border-radius: 15px;
                border: 2px solid rgb(88, 88, 88);
            }

            #idBox{
                position: relative;
                top: -5px;
                left: 19%;
                transform: translate(0% 50%);
                width: 160px;
                height: 25px;
                font-size: 17px;
                font-weight: 600;
                text-align: center;
            }
            
            #idBox span{
            	position: relative;
            	top: -18px;
            }
            
            #buttonBox{
            	position: relative;
            	top: -23px;
            }

            #hrBar{
                width: 220px;
                border: 1px solid #c6a49a;
                position: relative;
                top: -15px;
            }

            #profile, #message, #logout{
                background-color: rgb(216, 216, 216);
                border: 0px;
                margin-right: 5px;
                position: relative;
                left: 9px;
                top: 7px;
            }

            #profile:hover, #message:hover, #logout:hover{
                background-color: white;
            }

            #profile, #message{
                height: 40px;
                width: 60px;
            }
            
            #message{
                margin-right: 5px;
            }

            #logout{
                height: 40px;
                width: 100px;
            }

            #logout span{
                font-size: 18px;
                font-weight: 600;
            }
            
            #createBox {
			    position: relative;
			    left: 1350px;
			}
            
            /* ----- accountBox 끝 ----- */

        /* ---------- header 끝 ---------- */

        /* ---------- main ---------- */
        
        #main {
            min-height: 100%;
        }

        /* ---------- main 끝 ---------- */

        /* ---------- footer ---------- */

        #footer{
            bottom:0;
            width:100%;
            height:130px;   
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
            <a href="#">
                <img src="./logo.png">
            </a>
        </div>
        <div id="menu">
            <ul>
	                <li><a href="#">스터디룸</a></li>
	                <li><a href="#">예약</a></li>
	                <li><a href="./fbList">자유게시판</a></li>
	                <li><a href="./rvlist">후기</a></li>
	                <li><a href="./ask">고객센터</a></li>
            </ul>
        </div>
        <div id="loginBox">
            <%if(session.getAttribute("id") != null){%>
				<div id="accountBox">
					<div id="firstBox">
						<div id="imgBox">
							<img src="" alt="">
	                </div>
				<div id="idBox">
                    <span style="color: rgb(255, 255, 255);">${id}님</span>
                </div>
				</div>
				<hr id="hrBar" >
				<div id="buttonBox">
	                <button id="profile" class="btn btn-default" type="submit" formmethod="post" onclick="location.href='profileDetail?id=${id}'"><i class="fas fa-user-cog fa-lg"></i></button>
	                <!-- <a id="message" class="btn btn-default" href="messageList"><i class="far fa-envelope fa-2x"></i></i></i></a> -->
	                <button id="message" class="btn btn-default" onclick="location.href='messageList'"><i class="far fa-envelope-open fa-lg"></i></button>
	                <button id="logout" class="btn btn-default" onclick="location.href='logout'"><span>로그아웃</span></button>
				</div>
		</div>    
            <%}else{%>
                <div id="createBox">
                	<a href="member01_login.jsp">로그인 / 회원가입</a>
                </div> 
            <%}%>
        </div>
    </div>
    <!-- 헤더 끝 -->

<!------------------------------------------------------------------------------------------------------->
 	
    <!-- 메인 시작 -->
    <div id="main">
        <div class="boardTitle"><h1>공지사항</h1><hr></div>
		<div class="board_zone">
			<div class="board_list_table" style="width: 55%;">
				<form action="write" method="post" enctype="multipart/form-data">
				<table class="table">
					<thead>
						<tr>
							<th><input type="text" style="border:none; background-color: rgb(238, 238, 238); width: 1040px; height: 30px;" placeholder="제목을 입력해주세요."></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="text-align: center;">
								<span>
									<textarea name="" id="" cols="30" rows="10" style="margin: 0px; width: 1000px; height: 300px; resize: none; margin-top: 20px; margin-bottom: 20px;"></textarea>
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<span style="margin-right: 10px; font-weight: 800;"><input type="file"></span>
							</td>
						</tr>
					</tbody>
				</table>
				<a class="btn btn-default pull-right" onclick="location.href='#.jsp'" style="margin-right: 30px;">취소</a>
				<a class="btn btn-default pull-right" onclick="location.href='#.jsp'" style="margin-right: 10px;">작성</a>
				</form>
			</div>
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