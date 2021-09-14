<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Task Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
            integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"
            integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/"
            crossorigin="anonymous"></script>
</head>
<body>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Task Management</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
                aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="tasks/new">New Task</a>
                </li>
            </ul>
            <span class="navbar-text">
        <a href="/logout" class="btn btn-sm btn-danger">Log out</a>
      </span>
        </div>
    </div>
</nav>


<h2 class="mt-2 text-muted text-center">List Tasks</h2>
<div class="container">
    <table border="2" width="70%" cellpadding="2" class="table mt-3">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Description</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Status</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="emp" items="${tasks}">
            <tr>
                <td>${emp.id}</td>
                <td>${emp.name}</td>
                <td>${emp.description}</td>
                <td>${emp.start_date}</td>
                <td>${emp.end_date}</td>
                <td>${emp.status}</td>
                <td><a href="tasks/${emp.id}/edit" class="btn btn-sm btn-secondary">Edit</a></td>
                <td><a href="tasks/${emp.id}" class="btn btn-sm btn-danger">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <br/>

    <p>
        <a href="/tasks/new" class="btn btn-primary">New Task</a>
    </p>
</div>
</body>
</html>