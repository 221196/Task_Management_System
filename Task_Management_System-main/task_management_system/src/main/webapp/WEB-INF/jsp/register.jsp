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
<body class="bg-light">
<h2 class="text-center text-muted mt-5">Register</h2>
<div class="container">
    <form action="/users/save" class="mt-3" method="post">

        <div class="row ">
            <div class="col-md-3">
                Username
            </div>
            <div class="col-md-6">
                <input type="text" name="username" class="form-control">
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-3">
                Email
            </div>
            <div class="col-md-6">
                <input type="text" name="email" class="form-control">
            </div>
        </div>


        <div class="row mt-3">
            <div class="col-md-3">
                Password
            </div>
            <div class="col-md-6">
                <input type="password" name="password" class="form-control">
            </div>
        </div>

        <div class="text-center">
            <input class="btn btn-primary mt-3" type="submit" value="Sign up">
        </div>

    </form>
    <br>
    <a href="/login" class="btn btn-secondary">Log in</a>
</div>
</body>
</html>