<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a814f74484.js" crossorigin="anonymous"></script>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
        @import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
        
        html, body{
        	margin: 0;
        	padding: 0;
        	height: 100%;
        }
        
        body{
            font-family: 'Noto Sans KR', sans-serif;
            background-color: white;
        }

        /* ---------- header ---------- */

        #header{
            position: relative;
            background-color: #ABD0CE;
            top: -10px;
            width: 100%;
            height: 175px;
            z-index: 100;
        }

        #logo{
            position: absolute;
            left: 100px;
        }

        #menu{
            position: relative;
            top: 90px;
            left: 600px;
            width: 900px;            
        }
        
        #menu ul{
            list-style: none;
        }

        #menu ul li{
            float: left;
            margin-right: 60px;
        }

        #menu ul li a{
            text-decoration: none;
            color: #7C7877;
            padding: 15px;
            font-size: 23px;
            font-weight: bold;
            font-family: 'NanumSquare', sans-serif;
            display: inline-block;
        }

        #menu ul li a:after{
            display: block;
            content: '';
            border-bottom: solid 3px#ff7473;  
            transform: scaleX(0);  
            transition: transform 250ms ease-in-out;
        }

        #menu ul li a:hover:after{
            transform: scaleX(1);
        }

        #loginBox{
            position: relative;
            top: 10px;
            left: 300px;
            font-size: 18px;
            padding: 20px;
            width: 210px;
        }
        
        #loginBox a{
	        display: inline-block;
        	text-decoration: none;
        	color: #7C7877;
        	font-weight: 700;
        	padding: 15px;
        }
        
        /* ----- accountBox ----- */
        	
        	#accountBox {
                position: relative;
                top: -10px;
                left: 1250px;
                background-color: #1f4e5f;
                width: 260px;
                height: 130px;
                border-radius: 15px;
                border: 2px solid rgb(88, 88, 88);
            }

            #idBox{
                position: relative;
                top: -5px;
                left: 19%;
                transform: translate(0% 50%);
                width: 160px;
                height: 25px;
                font-size: 17px;
                font-weight: 600;
                text-align: center;
            }
            
            #idBox span{
            	position: relative;
            	top: -18px;
            }
            
            #buttonBox{
            	position: relative;
            	top: -23px;
            }

            #hrBar{
                width: 220px;
                border: 1px solid #c6a49a;
                position: relative;
                top: -15px;
            }

            #profile, #message, #logout{
                background-color: rgb(216, 216, 216);
                border: 0px;
                margin-right: 5px;
                position: relative;
                left: 9px;
                top: 7px;
            }

            #profile:hover, #message:hover, #logout:hover{
                background-color: white;
            }

            #profile, #message{
                height: 40px;
                width: 60px;
            }
            
            #message{
                margin-right: 5px;
            }

            #logout{
                height: 40px;
                width: 100px;
            }

            #logout span{
                font-size: 18px;
                font-weight: 600;
            }
            
            #createBox {
			    position: relative;
			    left: 1350px;
			}
            
            /* ----- accountBox 끝 ----- */

        /* ---------- header 끝 ---------- */

        /* ---------- main ---------- */
        
        #main {
            min-height: 100%;
        }

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

        /* ---------- main 끝 ---------- */

        /* ---------- footer ---------- */

        #footer{
            bottom:0;
            width:100%;
            height:130px;   
            background-color: #ABD0CE;
        }
        
        #footer li{
            float: left;
            list-style: none;
        }
        
        #footer li a{
            display: inline-block;
            content: "｜";
            clear: both;
            margin:0 10px;
            text-decoration: none;
            color: black;
        }
        
        #footer nav{
            left: 50%;
            transform: translate(-50%, 100%);
            position: absolute;
        }
        
        address{
            position: relative;
            top: 60%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: black;
        }

        /* ---------- footer 끝 ---------- */

	</style>
</head>
<body>
    
    <!-- 헤더 -->
    <div id="header">
        <div id="logo">
            <a href="#">
                <img src="./logo.png">
            </a>
        </div>
        <div id="menu">
            <ul>
	                <li><a href="#">스터디룸</a></li>
	                <li><a href="#">예약</a></li>
	                <li><a href="./fbList">자유게시판</a></li>
	                <li><a href="./rvlist">후기</a></li>
	                <li><a href="./ask">고객센터</a></li>
            </ul>
        </div>
        <div id="loginBox">
            <%if(session.getAttribute("id") != null){%>
				<div id="accountBox">
					<div id="firstBox">
						<div id="imgBox">
							<img src="" alt="">
	                </div>
				<div id="idBox">
                    <span style="color: rgb(255, 255, 255);">${id}님</span>
                </div>
				</div>
				<hr id="hrBar" >
				<div id="buttonBox">
	                <button id="profile" class="btn btn-default" type="submit" formmethod="post" onclick="location.href='profileDetail?id=${id}'"><i class="fas fa-user-cog fa-lg"></i></button>
	                <!-- <a id="message" class="btn btn-default" href="messageList"><i class="far fa-envelope fa-2x"></i></i></i></a> -->
	                <button id="message" class="btn btn-default" onclick="location.href='messageList'"><i class="far fa-envelope-open fa-lg"></i></button>
	                <button id="logout" class="btn btn-default" onclick="location.href='logout'"><span>로그아웃</span></button>
				</div>
		</div>    
            <%}else{%>
                <div id="createBox">
                	<a href="member01_login.jsp">로그인 / 회원가입</a>
                </div> 
            <%}%>
        </div>
    </div>
    <!-- 헤더 끝 -->

<!------------------------------------------------------------------------------------------------------->
 	
    <!-- 메인 시작 -->
    <div id="main">
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
                    <th>보낸 사람</th>
                    <th>내용</th>
                    <th>날짜</th>
                </tr>
                <c:forEach items="${mchk_list }" var="msgChk">
                <tr>
                    <td><input type="checkbox" value="${msgChk.m_idx }" /></td> <!-- 체크박스는 mvc 에서 코딩할 때 했던 방법 사용할지?-->
                    <td>${msgChk.m_idx }</td>
                    <td>${msgChk.send_id }</td>
                    <td><div class="txt_line"><a href="messageDetail?m_idx=${msgChk.m_idx }">${msgChk.mess_content }</a></div></td>
                    <!--showpopup(); = 쪽지 상세보기 팝업 함수-->
                    <td>${msgChk.mess_reg_date }</td>
                </tr>
                </c:forEach>
            </table>
                <div class="text-center">
		    		<ul class="pagination">
		    			<li class="page-item">
		    				<a class="page-link" href="./falseMsg?page=1"><span>처음</span></a>
		    				<a id="prevPage" class="page-link" href="./falseMsg?page=${currPage-1}" aria-label="Previous">
		    					<span aria-hidden="true">&laquo;</span>
	                    		<span class="sr-only">Previous</span>
		    				</a>
		    			</li>
		    			<li>
		    				<a>${currPage}</a>
		    			</li>
		    			<li class="page-item">
		    				<a id="nextPage" class="page-link" href="./falseMsg?page=${currPage+1}" aria-label="Next">
		    					<span aria-hidden="true">&raquo;</span>
	                    		<span class="sr-only">Next</span>
		    				</a>
		    				<a class="page-link" href="./falseMsg?page=${endPage }"><span>끝</span></a>
		    			</li>
		    		</ul>
		    	</div>
        </div>
    </div>
    <!-- 메인 끝 -->

<!------------------------------------------------------------------------------------------------------->

    <!-- footer 시작 -->
    <footer id="footer">
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
            <br>
            서울특별시 금천구 가산디지털2로 115, 509호, 811호 (가산동, 대륭테크노타운 3차) FAX.02-6740-4949<br>
            COPYRIGHT ⓒ 2020 Goodee. ALL RIGHT RESERVED.
        </address>
    </footer>
    <!-- footer 끝-->

</body>
<script>
	var currPage = ${currPage};
	console.log(currPage);
	
	var currPage = ${currPage};
	var endPage = ${endPage};
	
	if(currPage==1){
		document.getElementById("prevPage").style.display="none";
	}
	if(currPage >1 && currPage < endPage){
		document.getElementById("prevPage").style.display="inline";
		document.getElementById("nextPage").style.display="inline";
	}
	
	if(currPage == endPage){
		document.getElementById("nextPage").style.display="none";
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
				location.href="falseMsg";
			},
			error:function(e){
				console.log(e);
			}
		});
	}
</script>
</html>