<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	int b_idx = Integer.parseInt(request.getParameter("b_idx"));
	String b_id = request.getParameter("b_id");
	String repo_id = (String)request.getSession().getAttribute("id");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>01_start.html</title>
        <!--다른 자바스크립트 파일 불러오기-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
		body{
                font-family: 'Noto Sans KR', sans-serif;
            	margin: 0px;
      	}
        </style>
    </head>
    <body>
        <div id="complainBox">
            <br/>
            <h3>신고하기</h3>
            <hr/>
            <form method="post" action="complain?repo_id=<%=repo_id%>">
	            <table>
	            	<tr><td><input type="radio" name="report" value="욕설/비난"/> 욕설/비난</td></tr>
		            <tr><td><input type="radio" name="report" value="광고"/> 광고</td></tr>
		            <tr><td><input type="radio" name="report" value="도배"/> 도배</td></tr>
		            <tr><td><input type="radio" name="report" value="기타"/> 기타</td></tr>
		            <tr>
		            	<td>
		            		<input type="hidden" name="b_idx" value="<%=b_idx %>" />
		            		<input type="hidden" name="b_id" value="<%=b_id %>" />
		            	</td>
	            	</tr>
		            <tr>
		            	<td>
		            		<input type="submit" value="보내기"/>
		            		<input type="button" onclick="location.href='fbdetail?b_idx=<%=b_idx %>'" value="취소"/>
		            	</td>
		            </tr>
	            </table>
            </form>

        </div>
    </body>
    <script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg)	
	}
    </script>
</html>