<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 상세보기</title>
   <style>
        /*받은사람 보낸사람 확인*/
        #uptext{
           border: 1px solid black;
           width: 400px;
           height: 100px;
           position: absolute;
           left: 50%;
           top: 15%;
           transform: translate(-50%, -50%);         
        }
        /*받은 내용*/
        #downtext{
            border: 1px solid black;
            width: 400px;
            height: 300px;
            position: absolute;
            left: 50%;
            top: 48%;
            transform: translate(-50%, -50%);  
        }
        /*답장 버튼*/
        #btn_reply{
            position: absolute;
            left: 50%;
            top: 75%;
            transform: translate(-50%, -50%); 
        }
       /*버튼 폰트 크기*/
       #btn_size{
           font-size: 18px;
        }
   </style>
</head>
<body>
    <!--받는사람 시간 확인-->
    <div id = "uptext">
        <p>받는 사람 : ${m_sendInfo.recv_id }<br>보낸 날짜 : ${m_sendInfo.mess_reg_date }</p>
    </div>

    <!--보낸 내용-->
    <div id = "downtext">
        <p>${m_sendInfo.mess_content }</p>
    </div>
    <div id = "btn_reply">
        <input type="button" id="btn_size" onclick="location.href='sendList'" value="돌아가기"/>
    </div>   

</body>
<script>

</script>
</html>