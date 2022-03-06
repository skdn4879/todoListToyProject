<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./resources/css/addtodostyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<% String name = request.getParameter("userName"); %>
	<div class="container">
		<h1 class="form-add">할일 등록</h1>
		<form class="form-add" action="/CloneMomentom/AddTodo" method="post">
			<h5 class="form-label">어떤 일인가요?</h5>
			<input class="form-input title" type="text" name="title" placeholder="할 일(24자까지)">
			<h5 class="form-label">누가 할 일인가요?</h5>
			<input class="form-input name" type="text" name="name" placeholder="이름" value="<%=name%>">
			<h5 class="form-label">우선 순위를 선택하세요.</h5>
			<input type="radio" name="sequence" value="1">
			<label for="1">1순위</label>
			<input type="radio" name="sequence" value="2">
			<label for="2">2순위</label>
			<input type="radio" name="sequence" value="3">
			<label for="3">3순위</label>
			<div class="form-button">
			<a href="/CloneMomentom/main">이전</a><input class="btn-form" type="submit" value="제출"><input class="btn-form" type="reset" value="내용지우기">
			</div>
		</form>
	</div>
</body>
</html>