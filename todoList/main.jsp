<%@page import="dao.ToDoDao"%>
<%@page import="dto.ToDoDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>ToDoList</title>
<link href="./resources/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%ArrayList<ToDoDto> todos = (ArrayList<ToDoDto>) request.getAttribute("todos");
	ArrayList<ToDoDto> doings = (ArrayList<ToDoDto>) request.getAttribute("doings");
	ArrayList<ToDoDto> dones = (ArrayList<ToDoDto>) request.getAttribute("dones");
	%>
	<header>
		<div class="new-todo">
			<form name="addForm" class="btn-new-todo" action="/CloneMomentom/addtodo.jsp" method="post">
				<input type="hidden" name="userName">
				<input class="btn-new-todo btn-input" type="button" value="새로운 TODO등록" onclick="getUserName()">
			</form>
		</div>
	</header>
	
	<div class="js-clock">
      <h1>00:00</h1>
    </div>
    
    <div class="div-greetings">
	    <form class="js-form form">
	      <input type="text" placeholder="What is your name?">
	    </form>
	    <h4 class="js-grettings grettings"></h4>
    </div>
    
    <div class="div-todos-all">
    <div class="div-todos">
    	<h1 class="h1-todo">TODO</h1>
    	<ul class="list-todo">
    	<%
    	if(todos != null){
	    	for(int i=0; i<todos.size(); i++){
	    		ToDoDto item = todos.get(i);
	    		String title = item.getTitle();
	    		String name = item.getName();
	    		int sequence = item.getSequence();
	    		String regdate = item.getRegDate();
	    		String[] date = regdate.split(" ");
	    		String type = item.getType();
	    		Long itemId = item.getId();
    	%>

	    		<li class="todo-item" id="<%=itemId%>">
	    			<h3><%=title %></h3>
	    			등록날짜:<%=date[0]%>, <%=name %>, 우선순위:<%=sequence %>
	    			<form name="updateForm" action="/CloneMomentom/update" method="post">
	    			<input type="hidden" name="itemId" value="<%=itemId %>">
	    			<input type="hidden" name="first" value="true">
	    			<input type="submit" class="todo-item-btn" value="→">
	    			</form>
	    		</li>

		    <%
		    	}
		    }
		    %>
		  	</ul>
	</div>
	<div class="div-todos">
		<h1 class="h1-todo">DOING</h1>
	   	<ul class="list-todo">
	   	<%
	   	if(doings != null){
	    	for(int i=0; i<doings.size(); i++){
	    		ToDoDto item = doings.get(i);
	    		String title = item.getTitle();
	    		String name = item.getName();
	    		int sequence = item.getSequence();
	    		String regdate = item.getRegDate();
	    		String[] date = regdate.split(" ");
	    		String type = item.getType();
	    		Long itemId = item.getId();
	   	%>

	    		<li class="doing-item" id="<%=itemId%>">
	    			<h3><%=title %></h3>
	    			등록날짜:<%=date[0]%>, <%=name %>, 우선순위:<%=sequence %>
	    			<form name="updateForm" action="/CloneMomentom/update" method="post">
	    			<input type="hidden" name="itemId" value="<%=itemId %>">
	    			<input type="hidden" name="first" value="false">
	    			<input type="submit" class="todo-item-btn" value="→">
	    			</form>
	    		</li>

	   	<%
	   		}
	   	}
	   	%>
	   	</ul>
	</div>
	<div class="div-todos">
		<h1 class="h1-todo">DONE</h1>
	   	<ul class="list-todo">
	   	<%
	   	if(dones != null){
	    	for(int i=0; i<dones.size(); i++){
	    		ToDoDto item = dones.get(i);
	    		String title = item.getTitle();
	    		String name = item.getName();
	    		int sequence = item.getSequence();
	    		String regdate = item.getRegDate();
	    		String[] date = regdate.split(" ");
	    		String type = item.getType();
	    		Long itemId = item.getId();
	   	%>

	    		<li class="done-item" id="<%=itemId%>">
	    			<h3><%=title %></h3>
	    			등록날짜:<%=date[0]%>, <%=name %>, 우선순위:<%=sequence %>
	    			<form name="deleteForm" action="/CloneMomentom/delete" method="post">
	    			<input type="hidden" name="itemId" value="<%=itemId %>">
	    			<input type="submit" class="todo-item-btn" value="→">
	    			</form>
	    		</li>

	   	<%
	   		}
	   	}
	   	%>
	  	</ul>
    </div>
    </div>
    
    <script type="text/javascript" src="./resources/js/clock.js"></script>
    <script type="text/javascript" src="./resources/js/greetings.js"></script>
    <script type="text/javascript" src="./resources/js/addFormSubmit.js"></script>
</body>
</html>