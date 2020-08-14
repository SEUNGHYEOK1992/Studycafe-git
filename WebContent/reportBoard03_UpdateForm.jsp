
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
            input, textarea:focus {
                outline:none;
            }
			textarea{
				border-radius: 10px;
			}
			input[type=file]{
 			   margin-bottom: -19px;
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
                <li><a href="./fbList">자유게시판</a></li>
                <li><a href="./rvlist">후기게시판</a></li>
                <li><a href="./ask">고객센터</a></li>
			</ul>
			</div>
			<div id="log"><a href="#">로그인/회원가입</a></div>  
		</div>
		<!----------------------------------------------------->
		<div class="boardTitle"><h1>공지사항</h1><hr></div>
		<div class="board_zone">
			<form action="update" method="post">
			<div class="board_list_table" style="width: 55%;">
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
				<a class="btn btn-default pull-right" onclick="location.href='#.jsp'" style="margin-right: 10px;">수정</a>
			</div>
			</form>
		</div>
	</body>
	<script>
		
	</script>
</html>