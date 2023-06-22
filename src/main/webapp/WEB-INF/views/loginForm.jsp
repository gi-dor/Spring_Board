
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title><link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

    <style>

        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@600&family=Noto+Sans+KR&display=swap');
        .kor{
            font-family: 'Noto Sans KR', sans-serif;
        }

        @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital@1&display=swap');
        .eng{
            font-family: 'Montserrat', sans-serif;
        }

        /*기존꺼 가져옴 깃허브꺼 아님*/


        * { box-sizing:border-box; }
        a { text-decoration: none; }
        form {
            width:500px;
            height: 50em;
            display : flex;
            flex-direction: column;
            align-items:center;
            position : absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%) ;
            border: 1px solid #C2B4AB;
            border-radius: 10px;
            font-family: 'Montserrat', sans-serif;
            background-color: #EFE7E3;
            margin-top: -10px;
        }
        input[type='text'], input[type='password'] {
            width: 300px;
            height: 40px;
            border : 1px solid #EFE7E3;
            border-radius:5px;
            padding: 0 10px;
            margin-bottom: 10px;
            font-family: 'Noto Sans KR', sans-serif;
        }
        button {
            background-color:#C2B4AB;
            width:300px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
        }
        #title {
            font-size : 4em;
            margin: 5px;
            margin-bottom: 0.5em;
            font-family: 'Montserrat', sans-serif;
        }
        #msg {
            height: 1.5em;
            text-align:center;
            font-size:1em;
            color:gray;
            margin-bottom: 10px;
        }

        #imgcontainer{
            text-align: center;
            position: relative;
            background-color: #EFE7E3;
        }
        img.avatar {
            width: 60%;
            border-radius: 50%;
        }

    </style>
</head>
<body>
<div id="menu">
    <ul>
        <li id="logo">Gidor</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/board/list'/>">Board</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
        <li><a href=""><i class="fa fa-search"></i></a></li>
    </ul>
</div>

<form action="<c:url value="/login/login"/>" method="post" onsubmit="return formCheck(this);">
    <h3 id="title">Login</h3>


    <div id="imgcontainer">
        <img src="/img/shark2.jpg" alt="Avatar" class="avatar">
    </div>

    <div id="msg">
        <c:if test="${not empty param.msg}">
            <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
        </c:if>
    </div>


    <input type="text" name="id" value="${cookie.id.value}" placeholder="이메일 입력" autofocus>
    <input type="password" name="pwd" placeholder="비밀번호">
    <input type="hidden" name="toURL" value="${param.toURL}">
    <button>로그인</button>
    <div>
        <label><input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "":"checked"}> 아이디 기억</label> |
        <a href="">비밀번호 찾기</a> |
        <a href="">회원가입</a>
    </div>
    <script>
        function formCheck(frm) {
            let msg ='';

            if(frm.id.value.length==0) {
                setMessage('id를 입력해주세요.', frm.id);
                return false;
            }

            if(frm.pwd.value.length==0) {
                setMessage('password를 입력해주세요.', frm.pwd);
                return false;
            }
            return true;
        }

        function setMessage(msg, element){
            document.getElementById("msg").innerHTML = ` ${'${msg}'}`;

            if(element) {
                element.select();
            }
        }
    </script>
</form>
</body>
</html>