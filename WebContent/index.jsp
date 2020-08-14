<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% String id = (String)session.getAttribute("id"); 
	//System.out.println(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>메인</title>
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

      #after_guest{
        width: 300px;
        height: 200px;
        outline: 1px solid greenyellow;
        position: absolute;
        top: 150px;
        right: 20px;
        /* display: none; */
      }

      #after_guest img{
          width: 60px;
          height: 60px;
          outline: 1px solid red;
          margin-top: 30;
          margin-left: 20px;
      }

      #after_guest li{
          list-style: none;
          font-size: 15px;
      }

      #after_guest ul{
          margin-top: 23px;
          margin-bottom: 0;
      }

      #gusetInfo{
          float: right;
          padding: 0;
          margin-right: 30px; 
      }

      #msg{
          width: 300px;
          height: 50px;
          outline: 1px solid navy;
          margin-top: 58;
          text-align: center;
      }


      /*중앙이미지 시작*/
      .main_img{
         width: 100%;
         height: 700px;
         outline: 1px solid rgb(58, 218, 9);
      }
      
      #popularchart{
         position: fixed;
         width: 250px;
         height: 200px;
         font-color : black;
         border : 1px solid black;
         left : 1630px;
         top : 400px;
      }
      
      /*중앙이미지 끝*/

      /*text_img*/
      .text_img{
          width: 100%;
          height: 400px;
          outline: 1px solid red;
      }

      /*하단 스터디룸 이미지 시작*/
      .bottomStudyRoom{
          width: 100%;
          height: 800px;
          outline: 1px solid blue;
      }


      /*푸터시작*/
      #footerBox{ /*footer에는 relative를 주면 안됨*/
             /* margin-top: 70px; */
            width: 100%; height: 180px;
            background-color:#8fcca1;
            }

            #footerBox>#infoBox{
            position: relative; /*부모*/
            width: 1600px; height: 150px;
            margin:0 auto;
            /* outline: 1px solid blue; */
            }

            #footerBox>#infoBox>nav{
                position: absolute;
                width: 50%; height: auto;
                top:20%; left:50%;
                transform:translate(-50%, -50%);
            }

            #footerBox>#infoBox>nav>#info_menu{
                width: 100%;
            }

            #footerBox>#infoBox>nav>#info_menu>li{
                float: left;
                list-style: none;
            }

            #footerBox>#infoBox>nav>#info_menu>li>a::after{
                display: inline-block;
                content: "｜";
                clear: both;
                margin:0 10px;
            }

            #footerBox>#infoBox>nav>#info_menu>li:last-child>a::after{
                display: inline-block;
                content: "";
                clear: both;
            }

            #footerBox>#infoBox>nav>#info_menu>li>a{
                text-decoration: none;
                color: #555;
                font: 18.5px 'NanumGothic';
            }

            #footerBox>#infoBox>nav>#info_menu>li>a:hover{
                opacity: 0.7;
            }

            #infoBox address{
            position: absolute;
            color: #555;
            font: 0.9rem/180% 'NanumGothic';
            width: 50%; height: 50px;
                top:60%; left:50%;
                transform:translate(-50%, -50%); /*position으로 가운데정렬하는코드*/
                bottom:20px;
                text-align: center;
                /* outline: 1px solid red; */
            }

            /*푸터 끝*/
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
             <li><a href="./fbList">자유게시판</a></li>
             <li><a href="./rvlist">후기게시판</a></li>
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
   <!--헤더 끝--> 

    <div id="after_guest">
        <div>
            <img src="" alt="">
            <ul id="gusetInfo">
                <li style="margin-bottom: 5px;">${id}님</li>
                <li style="margin-bottom: 5px;"><button type="submit" formmethod="post" onclick="location.href='profileDetail?id=${id}'">프로필 보기</button></li>
                <li style="margin-bottom: 5px;"><button onclick="location.href='logout'">로그아웃</button></li><br>
            </ul>
        </div>
        <div id="msg">
            <a href="messageList">메시지</a>
        </div>
    </div>
   <!--중앙이미지 시작-->
   <div id="popularchart">         
         <table>          
               <tr>
               		<th>아이디</th>
               		<th>제목</th>
               		<th>조회수</th>
               </tr>
         </table>
   </div>
    
   <div class="main_img">
      <img src=""/>
   </div>
   <!--중앙이미지 끝-->

   <!--텍스트 이미지 시작-->
   <div class="text_img">

   </div>
   <!--텍스트 이미지 끝-->

   <!--하단 스터디룸 이미지-->
   <div class="bottomStudyRoom">

   </div>
   <!--하단 스터디룸 이미지 끝-->
    <!--footer시작-->
   <footer id="footerBox"> 
    <div id="infoBox"> <!--@@width:1100px infoBox시작 -->
 
         <a href="#"><div id="footerLogo"></div></a>

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
        서울특별시 금천구 가산디지털2로 115, 509호, 811호 (가산동, 대륭테크노타운 3차) FAX.02-6740-4949<br>COPYRIGHT ⓒ 2020 Goodee. ALL RIGHT RESERVED.
       </address>

    </div>
 </footer>
   
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg)	
	}
	
	function popList(){
		$.ajax({
			type:"post",
			url:"popList",
			data:{},
			dataType:"JSON",
			success:function(data){
				//console.log(data.popList);
				drawTable(data.popList);
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	popList();
	
	function drawTable(list){
		//for(var i=0; i<list.length;i++){}
		var content="";
		//$("tbody").empty();	
		list.forEach(function(item,num){
			console.log(num,item);
			content = "<tr>"
			+"<td>"+item.id+"</td>"
			+"<td><a href='fbdetail?b_idx="+item.b_idx+"'>"+item.subject+"</a></td>"
			+"<td>"+item.bHit+"</td>"
			+"</tr>";
			$("tbody").append(content);
		});	
	}
</script>
</html>