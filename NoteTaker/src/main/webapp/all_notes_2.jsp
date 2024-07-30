<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes: Note Taker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
<div class="container">
    <%@include file="navbar.jsp"%>
    <br>
    <h1 class="text-uppercase">All Notes</h1>
    <div class="row">
    <div class="col-12">
    <%
    Session s=FactoryProvider.getFactory().openSession();
    Query q=s.createQuery("from Note");
    q.setFirstResult(2);
	q.setMaxResults(2);
    List<Note> list=q.list();
    for(Note note:list){
    	%>
    	<div class="card" >
  <img src="img/notes.png" style="max-width:85px;" class="card-img-top m-4 mx-auto" alt="...">
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
    <div class="container">
    <nav aria-label="Page navigation example">
    <ul class="pagination">
    <li class="page-item"><a class="page-link" style=color:black href="all_notes.jsp">Previous</a></li>
    <a style=color:black class="text-decoration-none" href=all_notes.jsp><button type="button" style=color:black class="btn btn-secondary">1</button></a>
    <a style="color:black;" class="text-decoration-none" href="all_notes_2.jsp"><button type="button" style="color:black; background-color: white;" class="btn btn-secondary">2</button></a>
    <a style=color:black class="text-decoration-none" href=all_notes_3.jsp><button type="button" style=color:black class="btn btn-secondary">3</button></a>
    <li class="page-item"><a class="page-link" style=color:black href="all_notes_3.jsp">Next</a></li>
    </ul>
    </nav>
    </div>
</body>
</html>