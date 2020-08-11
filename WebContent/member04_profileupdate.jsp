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
                <a href="#">로그인/회원가입</a>
            </div>  
        </div>
        <div>
        <form action="profileUpdate" method="post" enctype="multipart/form-data">       
	        <table>  
	        	<tr>
	        		<td colspan="2">        
	               		${profileUpdateForm.id}님의 프로필
	               		<input type="hidden" name="id" value="${profileUpdateForm.id}"/>
	            	</td>
	            </tr>	
	            <tr>
	                <td>이름</td>
	                <td>
	                    <input type="text" id="sname" name="name" value="${profileUpdateForm.name}" />
	                </td>        
	            </tr>
	            <tr>
	                <td>생년월일</td>
	                <td>
	                    <input type="text" name="birth" value="${profileUpdateForm.birth}" />
	                </td>
	            </tr>
	            <tr>
	                <td>이메일</td>
	                <td>
	                     <input type="text" name="email" value="${profileUpdateForm.email}" />
	                </td>
	            </tr>
	            <tr>
	                <td>휴대폰</td>
	                <td>
	                    <input type="text" name="phone" value="${profileUpdateForm.phone}" />
	                </td>
	            </tr>
	            <tr>
	                <td>주소</td>
	                <td>
	                	<input type="text" name="addr" value="${profileUpdateForm.addr}" />
	                </td>
	            </tr>
	           <tr>
	               <td>프로필사진</td>
	               <td>
	               		<a href="/photo/${profileUpdateForm.newFileName }" target="_blank">${profileUpdateForm.oriFileName }</a>
	                    <input type="file" id="upload" name="photo" />
	               </td>
	           </tr>
	           <tr>
	           		<td colspan="2"><input type="submit" id="save" value="저장" /></td>
	           	</tr>
	        </table>
        </form>
      </div>
	</body>
<script>
      
</script>
</html>