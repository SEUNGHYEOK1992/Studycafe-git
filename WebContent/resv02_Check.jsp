<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

    <head>

        <title> 메인 페이지 </title>
        <style>
            
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
            html, body{
                font-family: 'Noto Sans KR', sans-serif;
            margin: 0px;
            box-sizing: border-box;
            padding: 0;
            height: 1300px;
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


            #roomImg{
                margin-left: 100px;
                margin-top: 100px;
                height: 400px;
                width: 700px;
                background-color: rgb(185, 185, 185);
            }

            /* ---------------------------- li, ul ----------------------- */
           
            .tab li{
                
                width: 300px;
                height: 100px;
                float: left;
            }

            .content li{
                width: 300px;
                height: 100px;
                float: left;
            }

            .tab{
                margin-top: 50px;
                margin-left: 130px;
                border: 1px solid black;
            }

            .cn{
                width: 400px;
                height: 80px;
                border: 1px solid black;
            }

            .cot{
                text-align: center;
                width: 400px;
                height: 130px;
                border: 1px solid black;
            }

            .state{
                text-align: center;
                width: 400px;
                height: 130px;
                border: 1px solid black;
            }

            .box{
                border: 1px solid black;
                width: 40px;
                height: 80px;
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
                <li><a href="./fbList">자유게시판</a></li>
                <li><a href="./rvlist">후기게시판</a></li>
                <li><a href="./ask">고객센터</a></li>
            </ul>
            </div>
            <div id="log"><a href="#">로그인/회원가입</a></div>  
         </div>


         <table class="tab" >
            <th> </th>
            <th class="cn">날짜</th>
            <th class="cn">스터디룸</th>
            <th class="cn">시간</th>
            <th class="cn" >사용여부</th>
             
            <tr>
                <td class="box"> <input type="checkbox" class="checking" style="margin-left: 13px;" sta="대기"> </td>
                <td class="cot">0000.00.00</td>
                <td class="cot">ㅗㅗㅗㅗㅗ</td>
                <td class="cot">00:00 - 00:00</td>
                <td class="state"><a>사용대기 </a></td>
            </tr>
            <tr>
                
                <td class="box"> <input type="checkbox" class="checking" style="margin-left: 13px;" sta="대기"> </td>
                <td class="cot">0000.00.00</td>
                <td class="cot">ㅗㅗㅗㅗㅗ</td>
                <td class="cot">00:00 - 00:00</td>
                <td class="state"><a>사용대기 </a></td>
            </tr>
            <tr>
                
                <td class="box"> <input type="checkbox" class="checking" style="margin-left: 13px;" sta="완료"> </td>
                <td class="cot">0000.00.00</td>
                <td class="cot">ㅗㅗㅗㅗㅗ</td>
                <td class="cot">00:00 - 00:00</td>
                <td class="state"> <a>사용완료 </a></td>
            </tr>
            <tr>
                
                <td class="box"> <input type="checkbox" class="checking" style="margin-left: 13px;" sta="대기"> </td>
                <td class="cot">0000.00.00</td>
                <td class="cot">ㅗㅗㅗㅗㅗ</td>
                <td class="cot">00:00 - 00:00</td>
                <td class="state"><a>사용대기 </a></td>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
            </tr>
            </table>

            <input type="button" value="확인" style="background-color: white; border: 1px solid rgb(30, 145, 240); width: 100px; height: 40px; margin-left: 50%; margin-top: 100px;">
            <input type="button" value="예약취소" onclick="chk()" style="background-color: white; border: 1px solid rgb(30, 145, 240); width: 100px; height: 40px; margin-left: -220px; margin-top: -100px;">

      

    </body>

    <script>
        function chk() {

            var n = document.getElementsByClassName("checking");
            var x = document.getElementsByClassName("state");
            for(i = 0; i < n.length; i++) {

                if(n[i].checked) {
                    if(n[i].getAttribute('sta') == "완료") {
                        alert('사용 완료된 내역은 삭제가 안돼요.');
                    } 
                    
                }
                
                
            }

            alert('예약이 취소되었어요.')

            

        }
    </script>

</html>