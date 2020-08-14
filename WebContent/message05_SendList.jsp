<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
      
      .txt_line {
      	width:130px;
      	padding:0 5px;
      	overflow:hidden;
      	text-overflow:ellipsis;
      	white-space:nowrap;
      }

      
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
	                <li><a href="#">스터디룸</a></li>
	                <li><a href="#">예약</a></li>
	                <li><a href="./fbList">자유게시판</a></li>
	                <li><a href="./rvlist">후기</a></li>
	                <li><a href="./ask">고객센터</a></li>
    </ul>
    </div>
    <div id="log"><%if(session.getAttribute("id") != null){%>
         							${id } 님
         						<%}else{ %>
         							<a href="member01_login.jsp">로그인/회원가입</a> 
         						<%} %></div>  
 </div>
   <!--헤더 끝--> 

   <!--중앙이미지 시작-->
   <div class="main_img">
      <img src=""/>
      <button id="btn_del" onclick="del()">삭제</button>
      <button id="btn_wri" onclick="location.href='message02_send.jsp'">쓰기</button>
      <a href="messageList">전체보기</a>
      <a href="falseMsg">안읽은 메시지 보기</a>
      <a href="sendList">보낸 메시지 보기</a>
      <table>
          <tr>
              <th>체크</th>
              <th>번호</th>
              <th>받는 사람</th>
              <th>내용</th>
              <th>날짜</th>
          </tr>
          <c:forEach items="${send_List }" var="sendList">
          <tr>
              <td><input type="checkbox" value="${sendList.m_idx }" /></td> <!-- 체크박스는 mvc 에서 코딩할 때 했던 방법 사용할지?-->
              <td>${sendList.m_idx }</td>
              <td>${sendList.recv_id }</td>
              <td><div class="txt_line"><a href="sendDetail?m_idx=${sendList.m_idx }">${sendList.mess_content }</a></div></td>
              <!--showpopup(); = 쪽지 상세보기 팝업 함수-->
              <td>${sendList.mess_reg_date }</td>
          </tr>
          </c:forEach>
      </table>
            <div class="pageArea">
				<a href="./sendList?page=${currPage -1 }"><span id="spanPage">이전 페이지</span></a>
				<span><b>${currPage }</b></span>
				<a href="./sendList?page=${currPage+1 }"><span>다음 페이지</span></a>
		</div>
   </div>
   <!--중앙이미지 끝-->

   <!-- <footer>푸터 추가</footer> -->
   
</body>
<script>

	var currPage = ${currPage};
	//console.log(currPage);
	
	if(currPage<1){
		alert("이전 페이지가 없습니다.");
		location.href="sendList";
	}
	
	function del(){
		var checkArr = [];
		$("input[type='checkbox']:checked").each(function(idx,item){
			console.log(idx,$(this).val());
			checkArr.push($(this).val())
		});
		console.log(checkArr);
		
		$.ajax({
			type:"get",
			url:"msgDel",
			data:{"delList":checkArr},
			dataType:"JSON",
			success:function(result){
				console.log(result);
				if(result.msgDelete){
					alert("게시물 삭제에 성공 했습니다.");
				}
				location.href="sendList";
			},
			error:function(e){
				console.log(e);
			}
		});
	}
</script>
</html>