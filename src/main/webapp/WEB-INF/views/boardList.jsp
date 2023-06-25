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
  <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">


  <style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital@1&display=swap');
    /*table {*/
    /*  margin-left: auto;*/
    /*  margin-right: auto;*/
    /*  border-collapse: separate;*/
    /*  border-spacing: 0;*/

    /*}*/

    /*th {*/
    /*  border-top: 1px solid #C2B4AB;*/
    /*  border-bottom: 1px solid #C2B4AB;*/
    /*  width: 10%;*/
    /*  text-align: center;*/
    /*}*/

    /*td {*/
    /*  width: 10%;*/
    /*}*/


    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: "Noto Sans KR", sans-serif;
    }

    a {
      text-decoration: none;
      color: black;
    }
    button,
    input {
      border: none;
      outline: none;
    }

    .board-container {
      width: 60%;
      height: 1200px;
      margin: 0 auto;
      /* border: 1px solid black; */
    }
    .search-container {
      background-color: rgb(253, 253, 250);
      width: 100%;
      height: 110px;
      border: 1px solid #ddd;
      margin-top : 10px;
      margin-bottom: 30px;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .search-form {
      height: 37px;
      display: flex;
    }
    .search-option {
      width: 100px;
      height: 100%;
      outline: none;
      margin-right: 5px;
      border: 1px solid #ccc;
      color: gray;
    }

    .search-option > option {
      text-align: center;
    }

    .search-input {
      color: gray;
      background-color: white;
      border: 1px solid #ccc;
      height: 100%;
      width: 300px;
      font-size: 15px;
      padding: 5px 7px;
    }
    .search-input::placeholder {
      color: gray;
    }

    .search-button {
      /* 메뉴바의 검색 버튼 아이콘  */
      width: 20%;
      height: 100%;
      background-color: rgb(22, 22, 22);
      color: rgb(209, 209, 209);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 15px;
    }
    .search-button:hover {
      color: rgb(165, 165, 165);
    }

    table {
      border-collapse: collapse;
      width: 100%;
      border-top: 2px solid rgb(39, 39, 39);
    }

    tr:nth-child(even) {
      background-color: #f0f0f070;
    }

    th,
    td {
      width:300px;
      text-align: center;
      padding: 10px 12px;
      border-bottom: 1px solid #ddd;
    }

    td {
      color: rgb(53, 53, 53);
    }

    .no      { width:150px;}
    .title   { width:50%;  }

    td.title   { text-align: left;  }
    td.writer  { text-align: left;  }
    td.viewcnt { text-align: right; }

    td.title:hover {
      text-decoration: underline;
    }

    .paging {
      color: black;
      width: 100%;
      align-items: center;
    }

    .page {
      color: black;
      padding: 6px;
      margin-right: 10px;
    }
    .paging-active {
      background-color: rgb(216, 216, 216);
      border-radius: 5px;
      color: rgb(24, 24, 24);
    }

    .paging-container {
      width:100%;
      height: 70px;
      display: flex;
      margin-top: 50px;
      margin : auto;
    }


    .btn-write:hover {
      cursor: pointer; /* Mouse pointer on hover */
      text-decoration: underline;
    }

  </style>
</head>
<body>

<div class = frame>


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


<%--  alert  --%>
<script>
  let msg = "${msg}"
  if(msg == "Write_OK") alert("등록 되었습니다.");
  if(msg == "DELETE_OK") alert("성공적으로 삭제가 되었습니다.");
  if(msg == "DELETE_ERROR") alert("삭제에 실패 했습니다..");
</script>



<div style="text-align:center">



  <table >
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
        <td><a href="<c:url value='/board/read?bno=${boardDto.bno} & page=${page} & pageSize=${pageSize}'/>">${boardDto.title}</a></td>
        <td>${boardDto.writer}</td>
        <td>${boardDto.reg_date}</td>
        <td>${boardDto.view_cnt}</td>
      </tr>

    </c:forEach>
  </table>
</div>

<div>
  <p>
  <button type="button" id="writeBtn00"  onclick="location.href = '<c:url value = "/board/write"/>'">글쓰기</button>
  </p>
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