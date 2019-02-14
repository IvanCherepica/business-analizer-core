<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Login page</title>
    <link rel="shortcut icon" href="/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="bello-bootstrap-ui.min.css">

</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-lg-6 col-md-6 col-xs-11 col-md-offset-3 col-xs-offset-2 login-form">
            <div class="col-xs-8 col-md-offset-2">
                <h2>Please sign in</h2>
                <form action="${pageContext.request.contextPath}/login" method="POST">
                    <div class="form-group login-group">
                        <input type="text" class="form-control" id="uName" name="login" required/>
                        <input type="password" class="form-control" type="text" id="uPass" name="password"
                               required placeholder="Password" />
                    </div>
                    <input type="submit" class="btn btn-defaul" value="Sign in"/>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
