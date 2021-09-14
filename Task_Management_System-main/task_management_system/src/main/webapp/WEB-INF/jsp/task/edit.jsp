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

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Task Management</a>
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

<h3 class="text-muted text-center mt-3">Edit Task</h3>
<div class="container">
    <form action="/tasks/${task.id}" class="mt-3" method="post">

        <div class="row">
            <div class="col-md-3">
                Name
            </div>
            <div class="col-md-6">
                <input type="text" name="name" class="form-control" value="${task.name}">
            </div>
        </div>


        <div class="row mt-3">
            <div class="col-md-3">
                Description
            </div>
            <div class="col-md-6">
                <textarea rows="4" name="description" class="form-control" >${task.description}</textarea>
            </div>
        </div>


        <div class="row mt-3">
            <div class="col-md-3">
                Start Date
            </div>
            <div class="col-md-6">
                <input type="date" name="start_date" class="form-control" value="${task.start_date}">
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-3">
                End Date
            </div>
            <div class="col-md-6">
                <input type="date" name="end_date" class="form-control" value="${task.end_date}">
            </div>
        </div>

        <div class="text-center">
            <input class="btn btn-primary mt-3" type="submit" value="Save">
        </div>
    </form>
</div>
</body>
</html>