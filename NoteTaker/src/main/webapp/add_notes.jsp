<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
    <!-- <div class="container-fluid m-0 p-0">  -->
    <div class="container">
    <%@include file="navbar.jsp"%>
    <br>
    <h1>Please fill your note detail</h1>
    <br>
    <!-- This is add form -->
    <form action="SaveNoteServlet" method="post">
  <div class="mb-3">
    <label for="title" class="form-label">Note Title</label>
    <input type="text" name="title" placeholder="Enter title.." class="form-control" id="title" required>
  </div>
  <div class="mb-3">
    <label for="content" class="form-label">Note Content</label>
    <textarea id="content" name="content" class="form-control" placeholder="Enter description here" style="height:250px;" required></textarea>
  </div>
  <div class="container">
  <button type="submit" class="btn btn-primary">Add</button>
  </div>
</form>
    </div>
</body>
</html>