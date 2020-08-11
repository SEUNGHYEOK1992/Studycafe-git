<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member02_View</title>
   <style>
      @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
      body{
         font-family: 'Noto Sans KR', sans-serif;
         margin: 0px;
      }
      /*헤더 시작*/
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
      /*헤더 끝*/

      /*중앙이미지 시작*/
      .main_img{
         width: 100%;
         height: 700px;
         outline: 1px solid rgb(58, 218, 9);
      }
      /*중앙이미지 끝*/

      /*관리 목록 리스트 시작*/
      .main_img>ul{
         position: relative;
         top: 100px;
         left: 200px;
         width: 127px;
         height: 415px;
      }
      .main_img>ul>li{
         border: 1px solid black;
         list-style: none;
         height:100px;
         width: 120px;
         text-align: center;
         
      }
      .main_img>ul>li>a{
         position: relative;
         top: 36%;
      }
      /*관리 목록 리스트 끝*/

      /*테이블 div 영역 시작*/
      .main_img>#memberManage{
         position: relative;
         top: -330px;
         left: 500px;
         width: 1000px;
         height: 450px;
      }
      /*테이블 div 영역 끝*/
      
      /*테이블 영역 시작*/
      table{
          margin-bottom: 10px;
      }
      table,th,td{
         border: 1px solid black;
         border-collapse: collapse;
      }
      th,td{
         padding: 10px;
         width: 200px;
         height: 30px;
      }
      /*테이블 영역 끝*/

      /*수정, 취소 버튼 영역*/
      #btn_update{
        position: relative;
        width: 100px;
        height: 40px;
        left: 100px;
      }
      #btn_cancel{
        position: relative;
        width: 100px;
        height: 40px;
        left: 150px;
      }

      /*수정, 취소 버튼 영역*/
   </style>
</head>
<body>
   <!--헤더 시작-->
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
      <div id="log"><a href="admin00_Main.jsp"><%if(session.getAttribute("id") != null){%>
         							${id } 님</a>
         						<%}else{ %>
         							<a href="member01_login.jsp">로그인/회원가입</a> 
         						<%} %></div>  
  </div>
   <!--헤더 끝--> 

   <!--중앙이미지 시작-->
   <div class="main_img">
      <img src=""/>
      <span>관리자 프로필 폼</span>
      <ul>
         <li><a href="memberList">회원관리</a></li>
         <li><a href="report">신고내역</a></li>
         <li><a href="blackList">블랙리스트</a></li>
         <li><a href="kick">제명목록</a></li>
      </ul>
      <div id="memberManage">
        <form method="post" action="update">
            <table>
                <tr>
                <th>아이디</th>
                <td><input type="text" name="id" value="${info.id }" readonly/></td>
                </tr>
                <tr>
                <th>성명</th>
                <td><input type="text" name="name" value="${info.name }"/></td>
                </tr>
                <tr>
                <th>생년월일</th>
                <td><input type="text" name="birth" value="${info.birth }"/></td>
                </tr>
                <tr>
                <th>이메일</th>
                <td><input type="text" name="email" value="${info.email }"/></td>
                </tr>
                <tr>
                <th>전화번호</th>
                <td><input type="text" name="phone" value="${info.phone }"/></td>
                </tr>
                <tr>
                <th>주소</th>
                <td><input type="text" name="addr" value="${info.addr }"/></td>
                </tr>
                <tr>
                <th>블랙리스트</th>
                <td><input type="text" name="blacklist" value="${info.blacklist }"/>
                <!--  
                        &nbsp;&nbsp;&nbsp;
                    <input type="radio" name="blackList" value="True"/>등록
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="blackList" value="False"/>해제
                    -->
                    </td>
                </tr>
                <tr>
                </tr>
            </table>
 			<input type="submit" id="btn_Update" value="수정"/>
        </form>
        <button id="btn_delete">삭제</button>
        <button id="btn_cancel" onclick="location.href='memberList'">취소</button>
      </div>
   </div>
   <!--중앙이미지 끝-->
   <div>

   </div>


    

   <!-- <footer>푸터 추가</footer> -->
   
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
	
	
	
	
</script>
</html>