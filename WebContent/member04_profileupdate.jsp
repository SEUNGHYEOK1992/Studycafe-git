<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <meta charset="utf-8">
        <script src="hhttps://code.jquery.com/jquery-3.5.1.min.js"></script>
        <title>02 Query Selector</title>
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
      #profile{
          position: absolute;
          top: 33%;
          left: 44%;
        }

        #profilepic{
            position: absolute;
            top: 33%;
            left: 27%;
            width: 200;
            height: 200;
        }
        #name{
            position: absolute;
            top: 40%;
            left: 40%;

        }

        #sname{
            position: absolute;
            top: 40%;
            left: 43%;
        }


        #birth{
            position: absolute;
            top: 43%;
            left: 40%;
        }

        #sbirth{
            position: absolute;
            top: 43%;
            left: 44%;
        }

        #email{
            position: absolute;
            top: 46%;
            left: 40%;
        }

        #semail{
            position: absolute;
            top: 46%;
            left: 43%;
        }

        #live{
            position: absolute;
            top: 49%;
            left: 40%;
        }

        #slive{
            position: absolute;
            top: 49%;
            left: 43%;
        }

        #smartphone{
            position: absolute;
            top: 52%;
            left: 40%;
        }

        #ssmartphone{
            position: absolute;
            top: 52%;
            left: 43%;
        }


        #propic{
            position: absolute;
            top: 55%;
            left: 40%;
        }

        #uploadbox{
            position: absolute;
            top: 55%;
            left: 45%;
        }
        
        #upload{
            position: absolute;
            top: 55%;
            left: 55%;
        }

        #picbox{
            position: absolute;
            top: 55%;
            left: 45%;
        }

        #save{
            position: absolute;
            top: 60%;
            left: 45%;
        }
            
        </style>
    </head>
    <body>
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
                <a href="#">로그인/회원가입</a>
            </div>  
        </div>
        <form action="profileUpdate" method="post">       
	        <table>          
	            <div id=profile>
	               ${profileUpdateForm.id}님의 프로필
	               <input type="hidden" name="id" value="${profileUpdateForm.id}">
	            </div>
	            <tr>
	                <td>
	                    <div id="name">이름</div>
	                </td>
	                <td>
	                    <input type="text" id="sname" name="name" value="${profileUpdateForm.name}"></div>
	                </td>        
	            </tr>
	            <tr>
	                <td>
	                    <div id="birth">생년월일</div>
	                    
	                </td>
	                <td>
	                    <div id="sbirth">
	                    	<input type="text" name="birth" value="${profileUpdateForm.birth}">
	                    </div>
	                </td>
	                    
	            </tr>
	            <tr>
	                <td>
	                    <div id="email">이메일</div>
	                </td>
	                <td>
	                    <div id="semail">
	                        <input type="text" name="email" value="${profileUpdateForm.email}">
	                    </div>
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <div id="smartphone">휴대폰</div>
	                </td>
	                <td>
	                    <div id="ssmartphone">
	                    	<input type="text" name="phone" value="${profileUpdateForm.phone}">
	                    </div>
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <div id="live">주소</div>
	                </td>
	                <td>
	                    <div id="slive">
	                        <input type="text" name="addr" value="${profileUpdateForm.addr}">
	                    </div>
	                </td>
	            </tr>
	           <tr>
	               <td>
	                    <div id="propic">프로필사진</div>
	               </td>
	               <td>
	                    <input type="file" id="upload" value="첨부파일">
	               </td>
	           </tr>        
	            <input type="submit" id="save" value="저장">
	        </table>
        </form>
    <script  type="text/javascript">
        $("#save").click(function(){
            if(confirm("저장하시겠습니까?")==true){
                alert("프로필이 저장되었습니다.");
            }
        });

      
    </script>
</html>