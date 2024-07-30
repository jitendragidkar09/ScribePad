<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Results</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
<%! String searchws="";%>
<% searchws=request.getParameter("searchws"); %>
<div class="container">
    <%@include file="navbar.jsp"%>
    <br>
    <h1 class="text-uppercase">Search results for <%=searchws %>...</h1>
    <div class="row">
    <div class="col-12">
    <%
    Session s=FactoryProvider.getFactory().openSession();
    Query<Note> q=s.createQuery("from Note as n where n.title like '%"+searchws+"%'");
	
   List<Note> list=q.list();
 for(Note note:list)
 {
		%>
    	<div class="card" >
  <img src="img/notes.png" style="max-width:100px;" class="card-img-top m-4 mx-auto" alt="...">
  <div class="card-body px-5">
    <h5 class="card-title"><%=note.getTitle() %></h5>
    <p class="card-text">
    <%=note.getContent() %>
    </p>
    <p><%=note.getAddedDate() %></p>
    <div class="container" text-center mt-2>
    <a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
    <a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
    </div>
  </div>
</div>
    	<%
    	
    }
    s.close();
    %>
    </div>
    </div>
    </div>
    	
</body>
</html>