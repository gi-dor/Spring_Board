<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>fastcampus</title>
  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital@1&display=swap');

  </style>

</head>
<body>
<div class = frame>

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

<div class = "dashboard">

  <h1 class ="korean-comment">안녕하세요 <br>
    <a class = "highlight type1">요리</a> 도 할줄 아는<a class = "highlight type2"> 개발자 </a><br>
    <a class = "highlight type3"> 한기선 </a> 입니다 <br>
    현재는 <a class = "highlight type4">Back-end 개발자 </a>가 되기 위해  공부 중 입니다.<br>
  </h1>
  <br>
  <br>
  <br>
  <br>
  <p>
  <div class = "oneline"></div>
  </p>
  <br>
  <br>
  <br>
  <br>
  <br>

<%-- -------- footer----------%>

  <p class = "english-comment">Based  in Gyeonggi-do and Seoul , South Korea<br>
    I used to be a chef <br>
    And I could cook Western, Japanese, and Korean cuisine. <br>
    Currently, I am dreaming of becoming a backend developer </p>


</div>


<h5 class="recent-menu">RECENT WORKS</h5>

<div class ="recent-works"></div>

<footer class= "footer">
  <h3 class = "contact">CONTACT ME</h3>
  <div class = "links">
    <a class = "blog" href="https://gi-dor.tistory.com"  target="_blank">BLOG</a>
    <a class = "github" href="http://github.com/gi-dor"  target="_blank">GITHUB</a>
    <a class = "instagram" href="http://instagram.com/gi.dor"  target="_blank">INSTAGRAM</a>
  </div>

  <br>
  <p class = "english-comment"> Email : rltjs3563@naver.com</p>
  <p>Fell free to contact me !</p>
</footer>

</div>

</div>
</body>
</html>