<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>message01_List</title>
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

      /*버튼 영역 시작*/
      #btn_del{
        position: relative;
        width: 100px;
        height: 40px;
        top: 80px;
        left: 260px;
      }
      #btn_wri{
        position: relative;
        width: 100px;
        height: 40px;
        top: 80px;
        left: 300px;
      }
      /*버튼 영역 끝*/

      /*테이블 영역 시작*/
      table{
          position: relative;
          top: 100px;
          left: 400px;
          width: 1000px;
          height: 100px;
      }

      table, th, td{
          border: 1px solid black;
          border-collapse: collapse;
          text-align: center;
      }
      /*테이블 영역 끝*/
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
       <li><a href="#">후기게시판</a></li>
       <li><a href="#">고객센터</a></li>
    </ul>
    </div>
    <div id="log"><a href="#">로그인/회원가입</a></div>  
 </div>
   <!--헤더 끝--> 

   <!--중앙이미지 시작-->
   <div class="main_img">
      <img src=""/>
      <button id="btn_del">삭제</button>
      <button id="btn_wri" onclick="sendmessage();">쓰기</button>
      <table>
          <tr>
              <th>체크</th>
              <th>보낸 사람</th>
              <th>내용</th>
              <th>날짜</th>
          </tr>
          <tr>
              <td><input type="checkbox"/></td> <!-- 체크박스는 mvc 에서 코딩할 때 했던 방법 사용할지?-->
              <td>정현승</td>
              <td><a href="#" onclick="Showpopup();">안녕하세요 가나다라마...</a></td>
              <!--showpopup(); = 쪽지 상세보기 팝업 함수-->
              <td>2020.08.03</td>
          </tr>
      </table>
   </div>
   <!--중앙이미지 끝-->

   <!-- <footer>푸터 추가</footer> -->
   
</body>
<script>
    /*쪽지 상세보기 팝업 가져오는 함수*/
    function Showpopup(){
        window.open("messageViewDetails.html","messageViewDetails","width=515,height=651,left=550,top=150");
    };
    /*쪽지 발신 팝업 함수*/
    function sendmessage(){
        window.open("messagesend.html","messagesend","width=515,height=651,left=550,top=150");
    };
</script>
</html>