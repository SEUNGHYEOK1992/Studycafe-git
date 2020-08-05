<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <script type="text/javascript" src="event.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
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
            <a href="#">로그인/회원가입</a>
        </div>  
    </div>

    <div id="joinform">
    <form method="GET" name="inputForm">
    <table width="1000px">
        <tr>
            <td>
                <label for="sname">이름
            </td>
            <td>
                <input type="text" name="sname" id="sname" size="20px"> 
            </td>
        </tr>
        <tr>
            <td>
                <label for="id">아이디
            </td>
            <td>
                <input type="text" name="id" id="id" size="20px">
                <input type="button" id="check" value="중복확인">
            </td>
        </tr>
        <tr>
            <td>
                <label for="pwd">비밀번호
            </td>
            <td>
                <input type="text" name="pwd" id="pwd" size="20px"> 
                *영문 대소문자/숫자/특수문자를 혼용하여 2종류10~16자 또는 3종 8~16자
            </td>
        </tr>
        <tr>
            <td>
                <label for="pwdCheck">비밀번호 확인
            </td>
            <td>
                <input type="text" name="pwdCheck" id="pwdCheck" size="20px">
            </td>
        </tr>
        <tr>
               <td>
                     생일/성별
                </td>
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
            <td>
                <label for="home">집주소
            </td>
            <td>
                <input type="text" name="home" id="home" size="60"> 
            </td>
        </tr>
        <tr>
            <td>
                <label for="homeAddress">상세주소
            </td>
            <td>
                <input type="text" name="homeAddress" id="homeAddress" size="60">   
            </td>
        </tr>

        <tr>
            <td>
                <label for="email">이메일
            </td>
            <td>
                <input type="text" name="email" id="email" size="10">@
                <select id="email2">
                    <option value=""></option>
                    <option value="1">http://www.google.com</option>
                    <option value="2">http://www.naver.com</option>
                    <option value="3">http://www.daum.com</option>
                    <option value="4">http://www.nate.com</option>
                </select>
                <input type="button" id="check2" value="중복확인">
            </td>
        </tr>

        <tr>
            <td>
                휴대폰
            </td>
            <td>
                <select id="smartPhone" name="smartPhone">
                    <option value="010">010</option>
                    <option value="011">011</option>                  
                </select>
                -<input type="text" name="smartPhone1" size="5">
                -<input type="text" name="smartPhone2" size="5">
            </td>
        </tr>
    </table>
    <input type="button" id="join" value="회원가입" onclick="location.href='01_team.html'">
</form>
</div>
</body>

<script type="text/javascript">
    window.onload = function(){
        function idcheck(){
            var insertId=document.inputForm.id.value;
            alert("아이디는 "+insertId+" 입니다.");
            return;
        }
        function emailcheck(){
            var email1 = document.inputForm.email.value;
            var email2 = document.inputForm.email2.value;
            alert("이메일은 "+email1+email2+" 입니다.");                 
            return;
        }
        
        function joincheck(){
            var birth1 = document.inputForm.birth1.value;
            var birth2 = document.inputForm.birth2.value;
            var birth3 = document.inputForm.birth3.value;
            var Hobbys = [];
            for(var i=0; i<document.inputForm.hobby.length; i++){
                if(document.inputForm.hobby[i].checked) {
                    Hobbys.push(document.inputForm.hobby[i].value);
                }
            }
            alert("이름 :"
            +"생년월일:"+birth1+"년"+birth2+"월"+birth3+"일"+"\n"
            +"취미:"+Hobbys.join("-"));
            return;
        }
        
        var checkBtn = document.getElementById("check");
        var checkEmail = document.getElementById("check2");
        var joinBtn = document.getElementById("join");
        addEvent(checkBtn, 'click', idcheck);
        addEvent(checkEmail, 'click', emailcheck);
        addEvent(joinBtn, 'click', joincheck);
    }
        $("#join").click(function(){
            if(confirm("회원가입하시겠습니까?")==true){
                alert("회원가입이완료되었습니다.");
            }
        });

</script>
</html>