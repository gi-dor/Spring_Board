<%--
  Created by IntelliJ IDEA.
  User: Han
  Date: 2023-06-23
  Time: PM 7:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>fastcampus</title>

  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital@1&display=swap');
    table {
      margin-left: auto;
      margin-right: auto;
    }
  </style>
</head>
<body>

<div id="menu">
  <ul>
    <li id="logo">Gidor</li>
    <li><a href="<c:url value='/'/>">Home</a></li>
    <li><a href="<c:url value='/board/list'/>">Board</a></li>
    <li><a href="<c:url value='/login/login'/>">login</a></li>
    <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
    <li><a href=""><i class="fas fa-search small"></i></a></li>
  </ul>
</div>
<script>
  let msg = "${msg}"
  if(msg == "Write_OK") alert("등록 되었습니다.");
  if(msg == "DELETE_OK") alert("성공적으로 삭제가 되었습니다.");
  if(msg == "DELETE_ERROR") alert("삭제에 실패했습니다..");
</script>
<div style="text-align:center">
  <button type="button" id="writeBtn"  onclick="location.href = '<c:url value = "/board/write"/>'">글쓰기</button>
  <table border = "1">
    <tr>
      <th>번호</th>
      <th>분류</th>
      <th>제목</th>
      <th>등록일</th>
      <th>조회 수</th>
    </tr>

    <c:forEach var = "boardDto" items = "${list}">
      <tr>
        <td>${boardDto.bno}</td>
        <td><a href="<c:url value='/board/read?bno=${boardDto.bno}&page=${page}&pageSize=${pageSize}'/>">${boardDto.title}</a></td>
        <td>${boardDto.writer}</td>
        <td>${boardDto.reg_date}</td>
        <td>${boardDto.view_cnt}</td>
      </tr>

    </c:forEach>
  </table>
</div>
<br>
<div style="text-align: center;">

  <c:if test="${ph.showFirst}">
    <a href="<c:url value='/board/list?page=1&pageSize=${ph.pageSize}'/>">&lt;&lt;</a>
  </c:if>

  <c:if test = "${ph.showPrev}">
    <a href = "<c:url value = '/board/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
  </c:if>


  <c:forEach var = "i" begin = "${ph.beginPage}" end = "${ph.endPage}">
    <a href = "<c:url value = '/board/list?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
  </c:forEach>


  <c:if test = "${ph.showNext}">
    <a href = "<c:url value = '/board/list?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
  </c:if>


  <c:if test="${ph.showLast}">
    <a href="<c:url value='/board/list?page=${ph.totalPage}&pageSize=${ph.pageSize}'/>">&gt;&gt;</a>
  </c:if>

</div>

</div>
</body>
</html>