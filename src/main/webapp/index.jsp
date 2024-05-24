<%@ page import="com.tictactoe.Sign" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <title>Tic-Tac-Toe</title>
    <link href="static/main.css" rel="stylesheet">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
    <script src="<c:url value="/static/jquery-3.6.0.min.js"/>"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col"></div>
        <div class="col"><h1>Tic-Tac-Toe</h1></div>
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col"></div>
        <div class="col">
            <table class="table table-bordered">
                <tr>
                    <td onclick="window.location='/logic?click=0'">${data.get(0).getSign()}</td>
                    <td onclick="window.location='/logic?click=1'">${data.get(1).getSign()}</td>
                    <td onclick="window.location='/logic?click=2'">${data.get(2).getSign()}</td>
                </tr>
                <tr>
                    <td onclick="window.location='/logic?click=3'">${data.get(3).getSign()}</td>
                    <td onclick="window.location='/logic?click=4'">${data.get(4).getSign()}</td>
                    <td onclick="window.location='/logic?click=5'">${data.get(5).getSign()}</td>
                </tr>
                <tr>
                    <td onclick="window.location='/logic?click=6'">${data.get(6).getSign()}</td>
                    <td onclick="window.location='/logic?click=7'">${data.get(7).getSign()}</td>
                    <td onclick="window.location='/logic?click=8'">${data.get(8).getSign()}</td>
                </tr>
            </table>
        </div>
        <div class="col"></div>
    </div>

    <br>
    <div class="row">
        <div class="col"></div>
        <div class="col">
            <div>
                <hr>
                <c:set var="CROSSES" value="<%=Sign.CROSS%>"/>
                <c:set var="NOUGHTS" value="<%=Sign.NOUGHT%>"/>

                <c:if test="${winner == CROSSES}">
                    <h1>CROSSES WIN!</h1>
                    <button type="button" class="btn btn-primary" onclick="restart()">Start again</button>
                </c:if>
                <c:if test="${winner == NOUGHTS}">
                    <h1>NOUGHTS WIN!</h1>
                    <button type="button" class="btn btn-primary" onclick="restart()">Start again</button>
                </c:if>
            </div>
            <div>
                <c:if test="${draw}">
                    <h1>IT'S A DRAW</h1>
                    <br>
                    <button type="button" class="btn btn-primary" onclick="restart()">Start again</button>
                </c:if>
            </div>
        </div>
        <div class="col"></div>
    </div>
</div>
<script>
    function restart() {
        $.ajax({
            url: '/restart',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            async: false,
            success: function () {
                location.reload();
            }
        });
    }
</script>
</body>
</html>