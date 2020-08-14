<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <meta charset="utf-8">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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

    #modified{
        position: absolute;
        top: 55%;
        left: 42%;
    }

    #delete{
        position: absolute;
        top: 55%;
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
	                <li><a href="#">스터디룸</a></li>
	                <li><a href="#">예약</a></li>
	                <li><a href="./fbList">자유게시판</a></li>
	                <li><a href="./rvlist">후기</a></li>
	                <li><a href="./ask">고객센터</a></li>
            </ul>
            </div>
            <div id="log">
                <%if(session.getAttribute("id") != null){%>
         							${id} 님
         						<%}else{ %>
         							<a href="member01_login.jsp">로그인/회원가입</a> 
         						<%} %>
            </div>  
        </div>
        <img src="${path }" width="200px" />       
        <form action="profileUpdateForm" method="post">        
	        <table>
	      		<tr>
	      			<th>${profileDetail.id}님의 프로필
	        	        <input type="hidden" name="id" value="${profileDetail.id}" readonly />
	            	</th>
	            </tr>
	            <tr>
	                <th>이름</th>
	                <td>
	                	<input type="text" name="name" value="${profileDetail.name}" readonly />
	                </td>        
	            </tr>
	            <tr>
	                <th>생년월일</th>
	                <td>
	                    <input type="text" name="birth" value="${profileDetail.birth}" readonly />
	                </td>
	            </tr>
	            <tr>
	                <th>이메일</th>
	                <td>
	                    <input type="text" name="email" value="${profileDetail.email}" readonly />
	                </td>
	            </tr>
	            <tr>
	                <th>휴대폰</th>
	                <td>
	                    <input type="text" name="phone" value="${profileDetail.phone}" readonly />
	                </td>
	            </tr>
	            <tr>
	                <th>주소</th>
	                <td>
	                    <input type="text" name="addr" value="${profileDetail.addr}" readonly />
	                </td>
	            </tr>
	            <%-- <img src="/photo/${detail.newFileName}" id="profilepic"/>         --%>
	            <tr>
	            	<th>프로필 사진</th>
	            	<td>
	            		<input type ="text" value="${profileDetail.oriFileName}" readonly />
	            	</td>
	            </tr>     
	            <tr>
	            	<td colspan="2">       
	            		<input type="submit" id="modified" value="수정" >
           				<input type="button" id="delete" value="탈퇴" onclick="location.href='delProfile?id=${profileDetail.id}'">
           			</td>
           		</tr>
        	</table>
        </form>
    <script  type="text/javascript">
     
        $(document).on('click', ':not(form)[data-confirm]', function(e){
            if(!confirm($(this).data('confirm'))){
                e.stopImmediatePropagation();
                e.preventDefault();
            }
        });

        $(document).on('submit', 'form[data-confirm]', function(e){
            if(!confirm($(this).data('confirm'))){
                e.stopImmediatePropagation();
                e.preventDefault();
            }
        });

      
    </script>
</html>