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
    <!--보낸사람 시간 확인-->
    <div id = "uptext">
        <p>보낸 사람 : ${m_info.send_id }<br>받은 시간 : ${m_info.mess_reg_date }</p>
        <form><input type="hidden" name ="send_id" value="${m_info.send_id }"/></form>
    </div>

    <!--받은내용-->
    <div id = "downtext">
        <p>${m_info.mess_content }</p>
    </div>
    <!--답장버튼-->
    <div id = "btn_reply">
        <input type="submit" id="btn_size" onclick="sendmessage();" value="답장"/>
    </div>   

</body>
<script>
    /*쪽지 보내기 함수*/
    function sendmessage(){
     window.open("message02_send.jsp","messagesend","width=515,height=651,left=550,top=150");
    };
</script>
</html>