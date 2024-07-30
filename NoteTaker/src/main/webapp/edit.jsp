<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
<div class="container-fluid m-0 p-0">
    <%@include file="navbar.jsp"%>
    <h1>Edit Your Note</h1>
    <br>
    <%
    int noteId=Integer.parseInt(request.getParameter("note_id"));
    Session s=FactoryProvider.getFactory().openSession();
	Note note=(Note)s.get(Note.class,noteId);
    
    %>
    <form action="UpdateServlet" method="post">
    <input value="<%=note.getId() %>" name="noteId" type="hidden"/>
  <div class="mb-3">
    <label for="title" class="form-label">Note Title</label>
    <input type="text" name="title" class="form-control" id="title" required value="<%=note.getTitle() %>"/>
  </div>
  <div class="mb-3">
    <label for="content" class="form-label">Note Content</label>
    <textarea id="content" name="content" class="form-control" placeholder="Enter your content here" style="height:250px;" required ><%=note.getContent() %></textarea>
  </div>
  <div class="container">
  <button type="submit" class="btn btn-success">Save your note</button>
  </div>
</form>
    </div>
</body>
</html>