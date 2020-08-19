<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
            height: 750px;
        }
        
        #main::after {
        	width: 100%;
			height: 100%;
			content: "";
			background: url("./15.jpg");
			position: absolute;
			top: 0;
			left: 0;
			z-index: -1;
			opacity: 0.4;
			-webkit-background-size: cover;
			-moz-background-size: cover;
			-o-background-size: cover;
			background-size: cover;
        }
		
		#joinform{
			position: relative;
		    top: 100px;
		    left: 600px;
		    background-color: #a3a1a1;
		    width: 750px;
		    height: 500px;
		    border-radius: 10px;
		}
		
		table{
			position: absolute;
			position: absolute;
		    top: 40px;
		    left: 90px;
		    color: white;
		}
		        
        td, th{
        	padding: 10px;
        }
        
        input, option{
        	color: black;
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
            <a href="./index.jsp">
                <img src="./logo.png">
            </a>
        </div>
        <div id="menu">
            <ul>
	                <li><a href="intro.jsp">스터디룸</a></li>
	                <li><a href="resv01_reservation.jsp">예약</a></li>
	                <li><a href="./fbList">자유게시판</a></li>
	                <li><a href="./rvlist">후기</a></li>
	                <li><a href="./reportlist">고객센터</a></li>
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
        <div id="joinform">
            <table width="1000px">
                <tr>
                    <td>
                        이름
                    </td>
                    <td>
                        <input type="text" name="name" id="name" size="20px"> 
                    </td>
                </tr>
                <tr>
                    <td>
                        아이디
                    </td>
                    <td>
                        <input type="text" name="id" id="id" size="20px">
                        <input type="button" id="overlay" value="중복확인" style="margin-left: 10px;" class="btn btn-default">
                        <input type="button" id="kickChk" value="제명확인" style="margin-left: 10px;" class="btn btn-default">
                    </td>
                </tr>
                <tr>
                    <td>
                       비밀번호
                    </td>
                    <td>
                        <input type="password" name="pw" id="pw" size="20px"> 
                    </td>
                </tr>
                <!--  비밀번호 확인은 나중에
                <tr>
                    <td>
                        비밀번호 확인
                    </td>
                    <td>
                        <input type="text" name="pwcheck" id="pwcheck" size="20px">
                    </td>
                </tr>
                -->
                <tr>
                      <td>생년월일</td>
                      <td style="color: black;">
                               <script type="text/javascript">
                             var today = new Date();
                             var toyear = parseInt(today.getFullYear ());
                             var start = toyear;
                             var end = toyear - 60;
        
                             document.write("<select name=birth1> ");
                             document.write("<option value='2015' selected>");
                             for (i=start;i>=end;i--) document.write("<option>"+i);
                             document.write("</select>년  ");
        
                             document.write("<select name=birth2>");
                             document.write("<option value='' selected>");
                             for (i=1;i<=12;i++) document.write("<option>"+i);
                             document.write("</select>월  ");
        
                             document.write("<select name=birth3>");
                             document.write("<option value='' selected>");
                             for (i=1;i<=31;i++) document.write("<option>"+i);
                             document.write("</select>일  </font>");
                             </script>
                        </td>
                   </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <input type="text" name="addr" id="addr" size="60"> 
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td style="color: black;">
                        <input type="text" name="email" id="email" size="10">@
                        <select name ="email2" id="email2">
                            <option value="google.com">google.com</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.com">daum.com</option>
                            <option value="nate.com">nate.com</option>
                        </select>
                    </td>
                </tr>
        
                <tr>
                    <td>
                        전화번호
                    </td>
                    <td style="color: black;">
                        <select id="phone" name="phone">
                            <option value="010">010</option>
                            <option value="011">011</option>                  
                        </select>
                        -<input type="text" name="phone1" size="5">
                        -<input type="text" name="phone2" size="5">
                    </td>
                </tr>
            </table>
            <input type="button" id="join" value="회원가입" style="left: 310px; position: absolute; top: 400px; width: 100px; height: 40px; font-size: 17px;" class="btn btn-default">
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
	var overChk = false;
	var kickChk = false;
	
    $("#overlay").click(function(){
        var id = $("input[name='id']").val();
        //console.log("id : " +id);
        $.ajax({
            type:"get",
            url:"overlay",
            data:{"id":id},
            dataType:"JSON",
            success:function(data){
                //console.log(data);
                if(data.overlay){
                    alert("이미 사용중인 아이디 입니다.");
                    $("input[name='id']").val("");
                    overChk=false;
                }else{
                    alert("사용 가능한 아이디 입니다.");
                    overChk = true;
                }
            },
            error:function(e){
                console.log(e);
            }
        });
    });
    
    $("#kickChk").click(function(){
    	var id = $("input[name='id']").val();
    	console.log("id : " + id);
    	$.ajax({
    		type:"get",
    		url:"kickChk",
    		data:{"id":id},
    		dataType:"JSON",
    		success:function(data){
    			//console.log(data.kickChk);
    			if(data.kickChk){
    				alert("사용할 수 없는 아이디 입니다.");
    				$("input[name='id']").val("");
    				kickChk=false;
    			}else{
    				alert("사용 가능한 아이디 입니다.");
    				kickChk=true;
    			}
    		},
    		error:function(e){
    			console.log(e);
    		}
    	});
    });


    //console.log($id);
    $("#join").click(function(){
        if(overChk){
        	if(kickChk){
        		var $id = $("input[name='id']");
                var $pw = $("input[name='pw']");
                var $name = $("input[name='name']");
                var $addr = $("input[name='addr']");
                var $email = $("input[name='email']");
                var $email2 = $("select[name='email2']");
                var $phone = $("select[name='phone']");
                var $phone1 = $("input[name='phone1']");
                var $phone2 = $("input[name='phone2']");
                var $birth1 = $("select[name='birth1']");
                var $birth2 = $("select[name='birth2']");
                var $birth3 = $("select[name='birth3']");
                
                if($id.val() == ""){
                    alert("아이디를 확인해주세요");
                }else if($pw.val() == ""){
                    alert("비밀번호를 확인해주세요.");
                }else if($name.val() == ""){
                    alert("이름 확인해주세요.");
                }else if($addr.val() == ""){
                    alert("주소를 확인해주세요.");
                }else if($email.val() == "" || $email2.val() ==""){
                    alert("이메일을 확인해주세요.");
                }else if($phone.val() == "" || $phone1.val() == "" || $phone2.val() == ""){
                    alert("전화번호를 확인해주세요.");
                }else if($birth1.val() == "" || $birth2.val() == "" || $birth3.val() == ""){
                    alert("생년월일 확인해주세요.");
                }else{ // 모든 항목을 입력 했을 경우
                    console.log('서버로 전송');
                    var param ={};
                    param.id = $id.val();
                    param.pw = $pw.val();
                    param.name = $name.val();
                    param.addr = $addr.val();
                    param.email = $email.val();
                    param.email2 = $email2.val();
                    param.phone = $phone.val() + $phone1.val() + $phone2.val();
                    param.birth = $birth1.val() + $birth2.val() + $birth3.val();
                    console.log("param : ",param); // 콘솔에 + 찍으면 문자열로 바뀜
                    
                    $.ajax({
                        type:"post",
                        url:"join",
                        data:param,
                        dataType:"JSON",
                        success:function(data){
                            console.log(data);
                            if(data.join){
                                alert("가입 성공");
                                location.href="member01_login.jsp";
                            }else{
                                alert("실패");
                                location.href="member02_join.jsp";
                            }
                        },
                        error:function(e){
                            console.log(e);
                        }
                    });
                }
        	}else{
        		alert("제명 확인을 확인 해 주세요.");
        		$("input[name='id']").focus();
        	}
        }else{
            alert("중복 체크를 확인 해 주세요.");
            $("input[name='id']").focus();
        }
    });
</script>
</html>