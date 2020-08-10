<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <script type="text/javascript" src="event.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <meta charset="UTF-8"/>
    <title> html </title>
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

        #joinform{
            position: absolute;
            top:30%;
            left:30%;
            
        }

        #join{
            position: absolute;
            top:100%;
            left:20%;
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
                <input type="button" id="overlay" value="중복확인">
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
              <td>
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
            <td>
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
            <td>
                <select id="phone" name="phone">
                    <option value="010">010</option>
                    <option value="011">011</option>                  
                </select>
                -<input type="text" name="phone1" size="5">
                -<input type="text" name="phone2" size="5">
            </td>
        </tr>
    </table>
    <input type="button" id="join" value="회원가입">
</div>
</body>

<script type="text/javascript">
	var overChk = false;

	$("#overlay").click(function(){
		var id = $("input[name='id']").val();
		console.log("id : " +id);
		$.ajax({
			type:"get",
			url:"overlay",
			data:{"id":id},
			dataType:"JSON",
			success:function(data){
				console.log(data);
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


//console.log($id);
	$("#join").click(function(){
		if(overChk){
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
			alert("중복 체크를 확인 해 주세요.");
			$("input[name='id']").focus();
		}
	});	
</script>
</html>