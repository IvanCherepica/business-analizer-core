<%@ page language="java" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Business analyzer</title>
    <link rel="shortcut icon" href="/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
        @media (min-width: 768px) {
            .wrapper {
                overflow: auto;
            }
            .left-sidebar {
                float: left
            }
            .left-sidebar{
                position: absolute;
                top: 0;
                left: 0%;
                width: 10%;
                height: 100%;
                background-color:#eaf4f9;
            }
            .bar-text{
                text-align: center;
                font-family: 'Open Sans', Arial, sans-serif;
                font-weight: 600;
                font-style: normal
            }
        }
        button.new {
            display: inline-block;
            font-family: 'Open Sans', arial,sans-serif;
            font-size: 13px;
            font-weight: bold;
            color: rgb(68,68,68);
            text-decoration: none;
            user-select: none;
            padding: .1em 1.2em;
            border: 1px solid rgba(0,0,0,.1);
            border-radius: 2px;
            background: rgb(210, 233, 244);
            width:100%;
            height: 4em;
        }
        button.new:hover {
            color: rgb(24,24,24);
            border: 1px solid rgb(198,198,198);
            background:#eaf4f9;
            box-shadow: 0 1px 2px rgba(0,0,0,.1);
            width:100%;
            height: 4em;
        }
        button.new:active {
            color: rgb(51,51,51);
            border: 1px solid rgb(204,204,204);
            background:#70c5ef;
            box-shadow: 0 1px 2px rgba(0,0,0,.1) inset;
            width:100%;
            height: 4em;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Trigger the modal with a button -->

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add new district</h4>
                </div>
                <div class="modal-body">
                    <form action="/action_page.php">
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" class="form-control" id="name">
                        </div>
                        <div class="form-group">
                            <label for="crd">Coordinates:</label>
                            <input type="text" class="form-control" id="crd">
                        </div>
                        <button type="button" class="btn btn-danger">Add</button>
                    </form>
                </div>
            </div>

        </div>
    </div>

</div>

<div class="container-fluid">
    <div class="left-sidebar">
        <div class = "bar-text">
            <form>
                <h1>Entity</h1>
                <button formmethod="get" formaction="/admin/business" class="new">Business</button>
                <button formmethod="get" formaction="/admin/districts" class="new">Districts</button>
                <button formmethod="get" formaction="/admin/points" class="new">Points</button>
            </form>
        </div>
    </div>
</div>


<div class="container-fluid" style="position: absolute;
    top: 0;
    left: 10%;
    width: 80%;
    height: 100%;
   ">
    <h1>Admin panel</h1>
        <div align="left">
            <table class = "table table-bordered">
                <caption ><h2>List of Districts</h2></caption>
                <div style="text-align: right">
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Add</button>
                </div>
                <thead>
            <tr class="info">
                <th>Name</th>
                <th>Сoordinate</th>
                <th>Options</th>
            </tr>
            </thead>
            <c:forEach items="${districts}" var="district" >
                <tbody >
                <tr>
                    <td>${district.getName()}</td>
                    <td>${district.getLongitude()}/${district.getLatitude()}</td>
                    <td>
                        <a href="${pageContext.servletContext.contextPath}/admin/districts/edit?id=${district.getId()}"
                                class="btn btn-default" role="button">Edit</a>
                        <a href="${pageContext.servletContext.contextPath}/admin/districts/delete?id=${district.getId()}"
                                class="btn btn-default" role="button">Delete</a>
                    </td>
                </tr>
                </tbody>
            </c:forEach>
            </table>
        </div>
</div>
</body>
</html>