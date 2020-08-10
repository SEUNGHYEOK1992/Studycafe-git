<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String id = (String)session.getAttribute("id"); 
%>   


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
			   <li><a href="./ask">고객센터</a></li>
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
		<c:choose>
		<c:when test="${id== bbs.id}">
		<div class="boardTitle"><h1>문의하기</h1><hr></div>
		<div class="board_zone">
			<div class="board_list_table" style="width: 55%;">
				<table class="table">
					<thead>
						<tr>
							<td id=b_dix>${bbs.b_idx}</td>
						</tr>
						<tr>
							<th id= subject style="background-color: rgba(223, 223, 223, 0.719); font-size: 17px;">${bbs.subject}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<span id= id style="margin-right: 10px; font-weight: 800;">${bbs.id}</span>
								<span id = rge_date style="font-size: 13px;">${bbs.reg_date}</span>
							</td>
						</tr>
						<tr>
							<td style="text-align: center; padding-top: 30px;">
								<span id = content>
									${bbs.content}
								</span>
							</td>
						</tr>
					</tbody>
				</table>
				<br>
				<a class="btn btn-default pull-right" href="./ask">목록</a>
				<a class="btn btn-default" href='askupdateform?b_idx=${bbs.b_idx}' style="margin-right: 10px;">수정</a>
				<a class="btn btn-default" onclick="del();" style="margin-right: 10px;">삭제</a>
			</div>
		</div>
		</c:when>
		<c:otherwise>
		<div class="boardTitle"><h1>문의하기</h1><hr></div>
		<div class="board_zone">
			<div class="board_list_table" style="width: 55%;">
				<table class="table">
					<thead>
						<tr>
							<td id=b_dix>${bbs.b_idx}</td>
						</tr>
						<tr>
							<th id= subject style="background-color: rgba(223, 223, 223, 0.719); font-size: 17px;">${bbs.subject}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<span id= id style="margin-right: 10px; font-weight: 800;">${bbs.id}</span>
								<span id = rge_date style="font-size: 13px;">${bbs.reg_date}</span>
							</td>
						</tr>
						<tr>
							<td style="text-align: center; padding-top: 30px;">
								<span id = content>
									${bbs.content}
								</span>
							</td>
						</tr>
					</tbody>
				</table>
				<br>
				<a class="btn btn-default pull-right" href="./ask">목록</a>
			</div>
		</div>
		</c:otherwise>
		</c:choose>
	</body>
	<script>
	var msg = "${msg}";
	if(msg !=""){
		alert(msg);
	}


	function del(){
        if(confirm("정말로 삭제 하시겠습니까?")==true){
            alert('삭제 되었습니다.');
            location.href='askdel?b_idx=${bbs.b_idx}';
        }else{
        	alert('삭제가 취소되었습니다.');
            return false;
        }
	}
	</script>
</html>