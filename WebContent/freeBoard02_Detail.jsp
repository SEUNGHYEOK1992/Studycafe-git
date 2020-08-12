<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String id = (String)session.getAttribute("id"); 
%>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자유게시판</title>
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
			   <li><a href="./rvlist">후기게시판</a></li>
			   <li><a href="#">고객센터</a></li>
			</ul>
			</div>
			<div id="log"><a href="#">로그인/회원가입</a></div>  
		</div>
		<!----------------------------------------------------->
		<c:choose>
		<c:when test="${id== bbs.id}">
		<div class="boardTitle"><h1>자유게시판</h1><hr></div>
		<div class="board_zone">
			<div class="board_list_table" style="width: 55%;">
				<form action="fbUpdateForm" method="post">
				<table class="table">
					<thead>
						<tr>
							<th style="background-color: rgba(223, 223, 223, 0.719); font-size: 17px;">${bbs.subject }</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<input type="hidden" name ="b_idx" value="${bbs.b_idx }"/>
								<span style="margin-right: 10px; font-weight: 800;" name="id">${bbs.id}</span>
								<span style="font-size: 13px;" name="reg_date">${bbs.reg_date}</span>
								<span style="float: right; font-weight: 700;" name="bHit">${bbs.bHit}</span>
							</td>
						</tr>
						<tr>
							<td style="text-align: center; padding-top: 30px;">
								<span>${bbs.content }<br/><br/></span>
								<img src="${path }" alt="이미지 없음" width="200px" />
							</td>
						</tr>
						 <tr>
	            			<td>
	            				첨부파일 : <input type ="text" placeholder="없음" value="${bbs.oriFileName}" readonly />
	            			</td>
            			</tr>
					</tbody>
				</table>
				<br>
				<a class="btn btn-default pull-right" onclick="location.href='fbList'">목록</a>
				<input type="submit" class="btn btn-default" style="margin-right: 10px;" value="수정"/>
				<a class="btn btn-default" onclick="location.href='fbDelete?b_idx=${bbs.b_idx}'" style="margin-right: 10px;">삭제</a>
				<a class="btn btn-default" onclick="location.href='#'" style="margin-right: 10px;">추천</a>
				<input type ="text" name="like" value="추천 수 " />
				<a class="btn btn-default" onclick="location.href='#'" style="margin-right: 10px;">싫어요</a>
				<input type ="text" name="dislike" value="싫어요 수 " />
				<a class="btn btn-default pull-right" onclick="location.href='#'" style="margin-right: 10px;">신고</a>
				</form>
			</div>
		</div>
		</c:when>
		<c:otherwise>
		<div class="boardTitle"><h1>자유게시판</h1><hr></div>
		<div class="board_zone">
			<div class="board_list_table" style="width: 55%;">
				<form action="fbUpdateForm" method="post">
				<table class="table">
					<thead>
						<tr>
							<th style="background-color: rgba(223, 223, 223, 0.719); font-size: 17px;">${bbs.subject }</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<input type="hidden" name ="b_idx" value="${bbs.b_idx }"/>
								<span style="margin-right: 10px; font-weight: 800;" name="id">${bbs.id}</span>
								<span style="font-size: 13px;" name="reg_date">${bbs.reg_date}</span>
								<span style="float: right; font-weight: 700;" name="bHit">${bbs.bHit}</span>
							</td>
						</tr>
						<tr>
							<td style="text-align: center; padding-top: 30px;">
								<span>${bbs.content }<br/><br/></span>
								<img src="${path }" alt="이미지 없음" width="200px" />
							</td>
						</tr>
						 <tr>
	            			<td>
	            				첨부파일 : <input type ="text" placeholder="없음" value="${bbs.oriFileName}" readonly />
	            			</td>
            			</tr>
					</tbody>
				</table>
				<br>
				<a class="btn btn-default pull-right" onclick="location.href='fbList'">목록</a>
				<a class="btn btn-default" onclick="location.href='#'" style="margin-right: 10px;">추천</a>
				<input type ="text" name="like" value="추천 수 " />
				<a class="btn btn-default" onclick="location.href='#'" style="margin-right: 10px;">싫어요</a>
				<input type ="text" name="dislike" value="싫어요 수 " />
				<a class="btn btn-default pull-right" onclick="location.href='#'" style="margin-right: 10px;">신고</a>
				</form>
			</div>
		</div>
		</c:otherwise>
		</c:choose>
	</body>
	<script>
		
	</script>
</html>