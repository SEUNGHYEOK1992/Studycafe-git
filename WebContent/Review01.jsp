<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%String id = (String)session.getAttribute("id");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
		body{
                font-family: 'Noto Sans KR', sans-serif;
            	margin: 0px;
            	overflow:scroll;
            	height: 100%
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
        
       	.pageArea{
			margin:10px;
		}
		
		.pageArea span{
			border:1px solid gray;
			padding:2px 10px;
			margin:5px;
		}

       /*푸터시작*/
      #footerBox{ /*footer에는 relative를 주면 안됨*/
             /* margin-top: 70px; */
            width: 100%; height: 180px;
            background-color:#8fcca1;
            position:absolute;
            bottom:0;
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
	            <li><a href="#">자유게시판</a></li>
	            <li><a href="./rvlist">후기게시판</a></li>
	            <li><a href="./ask">고객센터</a></li>
	         </ul>
         </div>
         <div id="log">
         		<%if(session.getAttribute("id") != null){%>
         							${id } 님
         						<%}else{ %>
         							<a href="member01_login.jsp">로그인/회원가입</a>
         </div> 
         						<%} %>
	</div>  
      
 <!--헤더 끝-->
 	<!-- <div style="width:800px; height:150px; outline:1px solid red"> --> 
 	<!-- --------------------------------------------- -->
		    <form action="rvwrite" method="post">
		        <div class="reviewBox" style="top: 30%; left: 50%; position: absolute; transform: translate(-50%,-50%);">
		            <h2>후기게시판</h2>
		            <div>
		            	<textarea id="content" name = "content" placeholder="내용을 입력해주세요." style="width: 800px; height: 100px; outline: 1px solid #666; resize: none;" ></textarea>
		            </div>
		            <div id="sendBox" style="width: 800px; height: 20;">
		                <input type="submit" id="sendbtn" value="저장" style="float: right; margin-top: 5px;">
		            </div>
		        </div>
		    </form>
	
<!-- 		<div style="width:800px; height:800px; outline:1px solid green; dispaly:table; top: 400px; left: 29%; position: relative; "> -->
		    <div class="aa" style="width: 800px; height: 600px; position: absolute; top:50%; left:29%;">
                <c:forEach items="${list}" var="bbs">
                    <c:choose>
                        <c:when test="${id==bbs.id}">		        
                                <div style="border:1px solid #666; border-bottom:none; height:30px;">
                                        ${bbs.id}
                                        <input type="hidden" name="b_idx" value="${bbs.b_idx}"/>
                                        &nbsp; &nbsp; &nbsp; &nbsp;
                                        <button id="updateBtn" style="float: right;" onclick="location.href='rvupdateForm?idx=${bbs.b_idx}'">수정</button>
                                        &nbsp; &nbsp; &nbsp; &nbsp;
                                        <button style="float: right; margin-right: 30px;" onclick="location.href='rvdel?idx=${bbs.b_idx}'">삭제</button> 
                                </div>      	
                                <div style="border:1px solid #666;  border-bottom:none; resize: none width: 800px; height: 80px;">${bbs.content}</div>
                                                        
                        </c:when>
                            
                        <c:when test="${id != bbs.id}">                		
                                <div style="border:1px solid #666; border-bottom:none;" >
                                    ${bbs.id}
                                    <input type="hidden" name="b_idx" value="${bbs.b_idx}"/>
                                </div>	         	
                            <div style="resize: none width: 800px; height: 80px; border:1px solid #666;  border-bottom:none;">${bbs.content}</div>
                            
                        </c:when>
                    </c:choose>	
                </c:forEach>
		    </div>
		<!-- </div> -->
    <!--footer시작-->
 <!--   <footer id="footerBox"> 
    <div id="infoBox">
 
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
 </footer> -->
</body>
<script>
	var msg = "${msg}";
	if(msg!=""){
		alert(msg)
	}




</script>
</html>