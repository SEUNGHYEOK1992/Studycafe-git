<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String id = (String)session.getAttribute("id"); 
	//System.out.println(id);
%>     
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
        <c:choose>
            <c:when test="${id== bbs.id}">
            <div class="boardTitle"><h1>자유게시판</h1><hr></div>
            <div class="board_zone">
                <div class="board_list_table" style="width: 55%;">
                    <form action="fbUpdateForm" method="post">
                    <table class="table">
                        <thead>
                            <tr>
                                <th style="background-color: rgba(223, 223, 223, 0.719); font-size: 17px;">${bbs.subject }</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <input type="hidden" name ="b_idx" value="${bbs.b_idx }"/>
                                    <span style="margin-right: 10px; font-weight: 800;" name="id">${bbs.id}</span>
                                    <span style="font-size: 13px;" name="reg_date">${bbs.reg_date}</span>
                                    <span style="float: right; font-weight: 700;" name="bHit">${bbs.bHit}</span>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center; padding-top: 30px;">
                                    <span>${bbs.content }<br/><br/></span>
                                    <c:if test="${path ne '/photo/null' }">
                                        <img src="${path }" alt="에러" width="200px" />
                                    </c:if>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    첨부파일 : <input type ="text" placeholder="없음" value="${bbs.oriFileName}" readonly />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br>
                    <a class="btn btn-default pull-right" onclick="location.href='fbList'">목록</a>
                    <input type="submit" class="btn btn-default" style="margin-right: 10px;" value="수정"/>
                    <a class="btn btn-default" onclick="location.href='fbDelete?b_idx=${bbs.b_idx}'" style="margin-right: 10px;">삭제</a>
                    <a class="btn btn-default" onclick="like()" style="margin-right: 10px;">추천</a>
                    <input type ="text" id="likeCount" name="like" value="" />
                    <a class="btn btn-default" onclick="disLike()" style="margin-right: 10px;">싫어요</a>
                    <input type ="text" id="dislikeCount" name="dislike" value="" />
                    <a class="btn btn-default pull-right" onclick="singo()" style="margin-right: 10px;">신고</a>
                    </form>
                </div>
            </div>
            </c:when>
            <c:otherwise>
            <div class="boardTitle"><h1>자유게시판</h1><hr></div>
            <div class="board_zone">
                <div class="board_list_table" style="width: 55%;">
                    <form action="fbUpdateForm" method="post">
                    <table class="table">
                        <thead>
                            <tr>
                                <th style="background-color: rgba(223, 223, 223, 0.719); font-size: 17px;">${bbs.subject }</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <input type="hidden" name ="b_idx" value="${bbs.b_idx }"/>
                                    <span style="margin-right: 10px; font-weight: 800;" name="id">${bbs.id}</span>
                                    <span style="font-size: 13px;" name="reg_date">${bbs.reg_date}</span>
                                    <span style="float: right; font-weight: 700;" name="bHit">${bbs.bHit}</span>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center; padding-top: 30px;">
                                    <span>${bbs.content }<br/><br/></span>
                                    <c:if test="${path ne '/photo/null' }">
                                        <img src="${path }" alt="에러" width="200px" />
                                    </c:if>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    첨부파일 : <input type ="text" placeholder="없음" value="${bbs.oriFileName}" readonly />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br>
                    <a class="btn btn-default pull-right" onclick="location.href='fbList'">목록</a>
                    <a class="btn btn-default" onclick="like()" style="margin-right: 10px;">추천</a>
                    <input type ="text" id="likeCount" name="like" value="" />
                    <a class="btn btn-default" onclick="disLike()" style="margin-right: 10px;">싫어요</a>
                    <input type ="text" id="dislikeCount" name="dislike" value="" />
                    <a class="btn btn-default pull-right" onclick="singo()" style="margin-right: 10px;">신고</a>
                    </form>
                </div>
            </div>
            </c:otherwise>
            </c:choose>

            <!-- 댓글 시작 -->
            <div id="comment" style="margin-left:300px; margin-top:400px; margin-bottom:200px;">
                <table border="1" bordercolor="lightgray">
                    <tr>
                        <form action="rpwrite?b_idx=${bbs.b_idx }" method="post">
                            <input type="hidden" value="${bbs.id }"/>
                            <!-- 아이디-->
                            <td width="150">
                                <div>
                                    ${id}
                                </div>
                            </td>
                            <!-- 본문 작성-->
                            <td width="550">
                                <div>
                                    <textarea name="comment" rows="4" cols="70" ></textarea>
                                </div>
                            </td>
                            <!-- 댓글 등록 버튼 -->
                            <td width="100">
                                <div id="btn" style="text-align:center;">
                                    <input type="submit" value="저장"/>    
                                </div>
                            </td>
                        </form>
                    </tr>
        <!-- 댓글 목록 -->    
           <c:forEach var="Reply" items="${list}">
                   <form method="post" action="rpupdateForm?b_idx=${bbs.b_idx }">
                    <tr>
                        <!-- 아이디 -->
                        <td width="150">
                            <div>              
                               ${Reply.id}<br>
                               <input type="hidden" name="repl_idx" value="${Reply.repl_idx }" />
                            </div>
                        </td>
                        <!-- 본문내용 -->
                       <c:choose>
                            <c:when test="${id== Reply.id}">
                                <td width="550">
                                    <div class="text_wrapper" id="repl_comment">
                                        <input type="text" name="repl_comment" value="${Reply.repl_comment}" />
                                    </div>
                                    </td>
                        <!-- 버튼 -->
                                <td width="100">   
                                    <input type="submit" value="수정"/>   
                                    <input type="button" onclick= "location.href='rpdel?repl_idx=${Reply.repl_idx}&&b_idx=${bbs.b_idx }'" value="삭제"/>                
                                </td>
                              </c:when>
                            <c:otherwise>
                                <td colspan = "2" width="550">
                                    <div class="text_wrapper" id="repl_comment">
                                        ${Reply.repl_comment}
                                    </div>
                                </td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </form>	        
             </c:forEach>
            </table>
        </div>
            <!-- 댓글 끝 -->
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
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}

    function likeCall(){
		var b_idx = "${bbs.b_idx}";
		var id ="${bbs.id}";
		$.ajax({
			type:"get",
			url:"fblikeCall",
			data:{
				"b_idx":b_idx,
				"id":id
			},
			dataType:"JSON",
			success:function(data){
				//console.log(data.call);
				$("#likeCount").val(data.call);
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	function disLikeCall(){
		var b_idx = "${bbs.b_idx}";
		var id ="${bbs.id}";
		$.ajax({
			type:"get",
			url:"fbdisLikeCall",
			data:{
				"b_idx":b_idx,
				"id":id
			},
			dataType:"JSON",
			success:function(data){
				//console.log(data.discall);
				$("#dislikeCount").val(data.discall);
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	likeCall();
	disLikeCall();
	
	function like(){
        if(confirm("추천을 누르시겠습니까?")==true){
            var b_idx = $("input[name='b_idx']").val();
            var id = "${bbs.id}";
            $.ajax({
            	type:"get",
            	url:"fbLike",
            	data:{
            		"b_idx":b_idx
            	},
            	dataType:"JSON",
            	success:function(data){
            		//console.log(data);
            		if(data.like){
            			alert("추천 하였습니다.");
            		}else{
            			alert("이미 추천 혹은 싫어요를 누르셨습니다.");
            		}
            		likeCall();
            	},
            	error:function(e){
            		console.log(e);
            	}
            });
        }else{
        	alert('취소되었습니다.');
            return false;
        }
	}	
	
	function disLike(){
        if(confirm("싫어요를 누르시겠습니까?")==true){
            var b_idx = $("input[name='b_idx']").val();
            $.ajax({
            	type:"get",
            	url:"fbDisLike",
            	data:{
            		"b_idx":b_idx
            	},
            	dataType:"JSON",
            	success:function(data){
            		//console.log(data);
            		if(data.disLike){
            			alert("싫어요를 누르셨습니다.");
            		}else{
            			alert("이미 추천 혹은 싫어요를 누르셨습니다.");
            		}
            		disLikeCall();
            	},
            	error:function(e){
            		console.log(e);
            	}
            });
        }else{
        	alert('취소되었습니다.');
            return false;
        }
	}
	
	function singo(){
		if(confirm("해당 글을 신고 하시겠습니까?")==true){
			var b_idx = "${bbs.b_idx}";
			$.ajax({
				type:"get",
				url:"reportChk",
				data:{"b_idx":b_idx},
				dataType:"JSON",
				success:function(data){
					//console.log(data.reportChk);
					if(!data.reportChk){
						location.href="Complain01.jsp?b_idx=${bbs.b_idx}&&b_id=${bbs.id }";
					}else{
						alert("이미 해당 글을 신고 하신 적이 있습니다.");
					}
				},
				error:function(e){
					console.log(e);
				}
			});		
        }else{
        	alert('취소되었습니다.');
            return false;
        }
	}
</script>
</html>