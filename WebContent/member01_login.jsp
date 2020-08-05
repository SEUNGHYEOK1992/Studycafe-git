<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
    <style type="text/css">
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

        #loginId{
            position: absolute;
            top: 23%;
            left: 45%;     
            width:200px;
            margin:100px auto;
            border: 1px solid gray;
            border-radius: 5px;
            padding: 15px;
        }      

        #loginPw{
            position: absolute;
            top :28%;
            left : 45%;
            width:200px;
            margin:100px auto;
            border: 1px solid gray;
            border-radius: 5px;
            padding: 15px;
            
        }

        #login{
            position: absolute;
            top: 47%;
            left: 45%;  
        }

        #join{
            position: absolute;
            top: 47%;
            left: 49%;  
        }

        #keep{
            position: absolute;
            top :44%;
            left : 45%;
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
               <li><a href="#">후기게시판</a></li>
               <li><a href="#">고객센터</a></li>
            </ul>
            </div>
            <div id="log">
                <a href="member01_login.jsp">로그인/회원가입</a>
            </div>  
         </div>

        <form method="post" id="authForm" action="login">
            <div>            
                <input type="text" id="loginId" name="id" placeholder="ID" >          
                <input type="password" id="loginPw" name="pw" placeholder="Password" >
            </div>            
            <div id="login">
                <input type="submit" value="로그인">
            </div>        
            <div id="join">
                <input type="button" onclick="location.href='member02_join.jsp'" value="회원가입">
            </div>              
            <div id="keep">
                <input type="checkbox" id="keepLogin" name="keepLogin">
            </div> 
        </form>
    </body>
    <script>
		var msg = "${msg}";
		if(msg != ""){
			alert(msg)	
		}
    </script>
</html>