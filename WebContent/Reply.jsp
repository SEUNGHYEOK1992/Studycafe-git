<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<style></style>
</head>
<body>
	<form action="rpwrite" method="post">
		        <div class="replyBox" style="top: 30%; left: 50%; position: absolute; transform: translate(-50%,-50%);">
		            <div>
		            	<textarea id="comment" name = "comment" placeholder="내용을 입력해주세요." style="width: 800px; height: 100px; outline: 1px solid #666; resize: none;" ></textarea>
		            	<input type="hidden" name ="b_idx" value="${bbs.b_idx }"/>
		            </div>
		            <div id="sendBox" style="width: 800px; height: 20;">
		                <input type="submit" id="sendbtn" value="저장" style="float: right; margin-top: 5px;">
		            </div>
		        </div>
		    </form>
	
<!-- 		<div style="width:800px; height:800px; outline:1px solid green; dispaly:table; top: 400px; left: 29%; position: relative; "> -->
		    <div class="replylist" style="width: 800px; height: 600px; position: absolute; top:50%; left:29%;">
                <c:forEach items="${list}" var="rply">        
                                <div style="border:1px solid #666; border-bottom:none; height:30px;">
                                        ${rply.id}
                                        <input type="hidden" name="b_idx" value="${rply.b_idx}"/>
                                        <button id="updateBtn" style="float: right;" onclick="goUpdateForm()'">수정</button>
                                        <button style="float: right; margin-right: 30px;" onclick="location.href='rpdel?idx=${rply.rple_idx}'">삭제</button> 
                                </div>      	
                                <div id="comment" style="border:1px solid #666;  border-bottom:none; resize: none width: 800px; height: 80px;">${rply.repl_comment}</div>

                </c:forEach>
                </div>                            
</body>
<script>
	function goUpdateForm(){
		document.getElementById('comment').setAttribute('type','text');  //이러면 다 바뀌는거아니야?
	};
</script>
</html>