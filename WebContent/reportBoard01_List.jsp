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
			.board_zone{
				position: relative;
				top: 150px;
				left: 15%;
			}
			.boardTitle{
				position: absolute;
				top: 170px;
				left: 15%;
			}
			th{
				text-align: center;
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
			   <li><a href="./ask">고객센터</a></li>
			</ul>
			</div>
			<div id="log"><a href="#">로그인/회원가입</a></div>  
		</div>
		<!----------------------------------------------------->
		<div class="boardTitle"><h1>공지사항</h1><hr></div>
		<div class="board_zone">
			<div class="board_list_table" style="width: 70%;">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
							<th>조회</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="bbs">
							<tr>
								<td style="text-align: center;">${bbs.b_idx}</td>
								<td style="text-align: center;">${bbs.subject}</td>
								<td style="text-align: center;">${bbs.id}</td>
								<td style="text-align: center;">${bbs.reg_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<a class="btn btn-default pull-right" onclick="location.href='reportBoardWriteForm.jsp'">글쓰기</a>
				<br><br>
				<div class="text-center">
					<ul class="pagination">
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Previous">
							  <span aria-hidden="true">&laquo;</span>
							  <span class="sr-only">Previous</span>
							</a>
						 </li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">6</a></li>
						<li><a href="#">7</a></li>
						<li><a href="#">8</a></li>
						<li><a href="#">9</a></li>
						<li><a href="#">10</a></li>
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Next">
							  <span aria-hidden="true">&raquo;</span>
							  <span class="sr-only">Next</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</body>
	<script>
		
	</script>
</html>