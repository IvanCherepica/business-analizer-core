<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Login page</title>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">--%>

    <link rel="shortcut icon" href="/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="bello-bootstrap-ui.min.css">


    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>--%>
    <%--<style>--%>
        <%--body--%>
        <%--{--%>
            <%--background: #eeeeee;--%>
        <%--}--%>
        <%--.login-form {--%>
            <%--/*margin-top: 100px;*/--%>
            <%--margin-top: 12px;--%>
        <%--}--%>
        <%--.login-group :last-child {--%>
            <%--margin-top: 5px;--%>
        <%--}--%>
        <%--.empty-block {--%>
            <%--height: 88px;--%>
        <%--}--%>
    <%--</style>--%>

</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-lg-6 col-md-6 col-xs-11 col-md-offset-3 col-xs-offset-2 login-form">
            <div class="col-xs-8 col-md-offset-2">
                <%--<c:if test="${!isNotValid && !logout}">--%>
                    <%--<div class="empty-block"></div>--%>
                <%--</c:if>--%>
                <%--<c:if test="${isNotValid}">--%>
                    <%--<div id="login-message" class="alert alert-danger">--%>
                        <%--<h3>Invalid login or password!</h3>--%>
                        <%--<div id="error-message"></div>--%>
                    <%--</div>--%>
                <%--</c:if>--%>
                <%--<c:if test="${logout}">--%>
                    <%--<div id="login-message" class="alert alert-success">--%>
                        <%--<h3>Logout has bean successful</h3>--%>
                        <%--<div id=""></div>--%>
                    <%--</div>--%>
                <%--</c:if>--%>
                <%--<div id="logout-message" class="alert alert-success hidden">--%>
                    <%--<h3>Success!</h3>--%>
                    <%--<div id="success-message">You have been logged out successfully.</div>--%>
                <%--</div>--%>
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
