
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
            body{
                font-family: 'Noto Sans KR', sans-serif;
				margin: 0px;
            }
			/* 헤더 */
			#header{
				width: 100%;   
				height: 150px;
				background-color: #333;
			}
			#top_navi {   
				list-style-type: none;
				position: absolute;
				top: 70px;
				left: 550px;
			}
			#top_navi li{
				float: left;
				margin-right: 50px;
			}
			#top_navi li a {
				display: block;
				color: white;
				text-align: center;
				padding: 14px 16px;
				text-decoration: none;
				font-size: 25px;
			}
			#top_navi li a:hover {
				color: rgb(248, 248, 90);
			}
			#log{
				float: right;
				font-size: 20px;
				margin-top: 80px;
				margin-right: 30px;
			}
			#log a{
				color: white;   
				text-decoration: none;
			}
			/* 헤더 */
			.board_zone{
				position: relative;
				top: 170px;
				left: 21%;
			}
			.boardTitle{
				position: absolute;
				top: 170px;
				left: 15%;
			}
			hr{
                border: 1px solid rgb(148, 148, 148);
            }
		</style>
	</head>
	<body>
		<!----------------------------------------------------->
		<div id="header">
			<div id="top_logo">
			   <img src=""/>
			</div>
			<div>
			<ul id="top_navi">
			   <li><a href="#">스터디룸 소개</a></li>
			   <li><a href="#">예약하기</a></li>
			   <li><a href="#">자유게시판</a></li>
			   <li><a href="#">후기게시판</a></li>
			   <li><a href="#">고객센터</a></li>
			</ul>
			</div>
         <div id="log"><%if(session.getAttribute("id") != null){%>
      							${id} 님
      						<%}else{ %>
      							<a href="member01_login.jsp">로그인/회원가입</a> 
      						<%} %>
         </div> 
		</div>
		<!----------------------------------------------------->
		<div class="boardTitle"><h1>공지사항</h1><hr></div>
		<div class="board_zone">
			<div class="board_list_table" style="width: 55%;">
				<table class="table">
					<thead>
						<tr>
							<th style="background-color: rgba(223, 223, 223, 0.719); font-size: 17px;">글제목은 이렇습니다</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<span style="margin-right: 10px; font-weight: 800;">ID : dkgibmsk</span>
								<span style="font-size: 13px;">작성일 : 2020-08-20</span>
								<span style="float: right; font-weight: 700;">조회수 : 50</span>
							</td>
						</tr>
						<tr>
							<td style="text-align: center; padding-top: 30px;">
								<span>
									안녕하세요. 항상 십분을 사랑해주시는 고객님들께 감사드립니다.<br><br>
									아래의 일시에 서비스 품질 향상 작업을 위해 서버 점검 작업이 예정되어 있습니다.<br><br>
									작업 시간 중에는 서비스 이용이 중단되거나 접속이 원활하지 않을 수 있으니 양해해주시기 바랍니다.<br><br>
									▶일시 : 2020년 3월 19일(목) AM 02:00~08:00<br><br>
									십분은 고객님들께 더 나은 서비스를 제공할 수 있도록 항상 최선을 다하겠습니다.<br><br>
									감사합니다.
								</span>
							</td>
						</tr>
					</tbody>
				</table>
				<br>
				<a class="btn btn-default pull-right" onclick="location.href='#.jsp'">목록</a>
				<a class="btn btn-default" onclick="location.href='#.jsp'" style="margin-right: 10px;">수정</a>
				<a class="btn btn-default" onclick="location.href='#.jsp'" style="margin-right: 10px;">삭제</a>
			</div>
		</div>
	</body>
	<script>
		
	</script>
</html>