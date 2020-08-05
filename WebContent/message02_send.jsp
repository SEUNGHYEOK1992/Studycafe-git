<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 발신</title>
   <style>
        .send{
            position: absolute;
            left: 18%;
            top: 16%;
        }
        #formtext{
            resize: none;
            width: 313px;
            height: 300px;
            position: absolute;
            left: 18%;
            top: 22%;           
        }
        #btn_send{
            position: absolute;
            left: 43%;
            top: 70%;
        }
   </style>
</head>
<body>  
    <!--받는 사람 및 상단-->
    <div class="send">
        <b>받는사람 :</b> <input type="text" name="getper"" value="" maxlength="8"/>
        <button>ID 체크</button>
    </div>
    <!--내용-->
    <div>
        <textarea id="formtext"></textarea>
    </div>
    <!--보내기 버튼-->
    <div>
        <button id="btn_send" onclick="sendconf();">보내기</button>
    </div>
</body>
<script>
        /*쪽지 보내기 Alert*/
        function sendconf(){
            var result = confirm("쪽지를 보내시겠습니까?");
            if(result){
                alert('쪽지를 보냈습니다.');
            }else{
                return false;
            }
        }
</script>
</html>