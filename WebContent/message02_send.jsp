<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String recv_id = request.getParameter("recv_id");
	String id = (String)request.getSession().getAttribute("id");
	if(recv_id == null){
		recv_id ="";
	}
	//System.out.println("recv_id : " + recv_id + " / id : " + id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 발신</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
        <b>받는사람 :</b> <input type="text" id="recv_id" name="recv_id" value="<%=recv_id %>" maxlength="8"/>
        <!--<button id="idchk" onclick="location.href='msgIdChk?idChk=<%=recv_id%>'">ID 체크</button> -->
        <input type="button" id="idchk" value="ID체크"/>
    </div>
    <!--내용-->
    <div>
        <textarea id="formtext"></textarea>
    </div>
    <!--보내기 버튼-->
    <div>
        <input type="button" id="btn_send" value="보내기"/>
    </div>
</body>
<script>
	/*id 체크*/
	var idChk = false;
	$("#idchk").click(function(){
		var chk_id = $("#recv_id").val();
		//console.log("id : " + chk_id);
		$.ajax({
			type:"get",
			url:"msgIdChk",
			data:{"chk_id":chk_id},
			dataType:"JSON",
			success:function(data){
				//console.log(data.chk_id);
				if(data.chk_id){
					alert("입력한 ID 가 존재합니다.");
					idChk = true;
				}else{
					alert("입력한 ID 가 존재하지 않습니다.");
					$("#recv_id").val("");
					idChk=false;
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	});

	/*쪽지 보내기 Alert*/
	/*
	function sendconf(){
	    var result = confirm("쪽지를 보내시겠습니까?");
	    if(result){
	        alert('쪽지를 보냈습니다.');
	    }else{
	        return false;
	    }
	}
	*/
	$("#btn_send").click(function(){
		if(idChk){
			var $recv_id = $("#recv_id");
			var $formtext = $("#formtext");
			if($recv_id.val()== ""){
				alert("수신 받을 ID 를 입력해주세요.");
			}else if($formtext.val()==""){
				alert("전송할 내용을 입력해주세요.");
			}else{
				//console.log('서버로 전송');
				var param = {};
				param.recv_id = $recv_id.val();
				param.formtext = $formtext.val();
				//console.log("param : ",param);
				
				$.ajax({
					type:"post",
					url:"messageSend",
					data:param,
					dataType:"JSON",
					success:function(data){
						//console.log(data.send);
						alert("전송 성공");
						location.href="messageList";
					},
					error:function(e){
						//console.log(e);
						alert("전송 실패");
						location.href="messageList";
					}
				});
				
			}
		}else{
			alert("ID 체크를 확인 해 주세요.");
			$("#recv_id").focus();
		}
	});

	
</script>
</html>