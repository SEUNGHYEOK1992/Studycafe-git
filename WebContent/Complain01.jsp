<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
            <input type="checkbox" name="report" value="욕설/비난"> 욕설/비난<br/>
            <br/>
            <input type="checkbox" name="report" value="광고"> 광고<br/>
            <br/>
            <input type="checkbox" name="report" value="도배"> 도배<br/>
            <br/>
            <input type="checkbox" name="report" value="기타"> 기타<br/>
            <br/>
            <!-- <input type="text"  style="width: 400; height: 200;" placeholder="상세사유를 입력해주세요."/><br/>
            <br/> -->
            <input type="submit" value="보내기"/>

        </div>
    </body>
    <script>
        
    </script>
</html>