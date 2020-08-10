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
	<div> <!-- dispaly none주고 수정 클릭시 뜨게  -->
		<form action="rvupdate" method="post">
			<table style="outline:1px solid red;">
				<tr>
					<th  style="float:left;">${bbs.id}</th>
					<input type="hidden" name ="idx" value="${bbs.b_idx }"/>
				</tr>
				<tr>
					<td>
						<textarea id="content" name = "content" style="width: 800px; height: 100px; outline: 1px solid #666; resize: none;" >${bbs.content}</textarea>
					</td>
				</tr>
				<td><input type="submit" value="저장" style="float:right;" /></td>
			</table>
		</form>
	</div>

</body>
<script>
	var msg = "${msg}";
	if(msg!=""){
		alert(msg)
	}
</script>
</html>