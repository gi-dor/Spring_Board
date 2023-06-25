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
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital@1&display=swap');
        table {
            margin-left: auto;
            margin-right: auto;
        }
        button{
            float: right;
            min-width: 120px;
            border-color: #000;
            color: #000;
            background: #fff;
            border: 1px solid #999;
            padding: 0 30px;
            height: 40px;
            line-height: 38px;
            font-size: 14px;

        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .button-container button {
            margin: 0 10px;
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

<script>
    let msg = ${msg};
    if(msg == "Write_Error") alert("등록 실패 했습니다.");

</script>


<div style="text-align:center">
    <div><p>
    <h2> 게시물  ${mode == "new" ? "글 작성" : " 읽 기 "}</h2>
    </div></p>

    <form action = "" id = "form">
        <div>
        <input type="hidden" name = "bno" value="${boardDto.bno}" >
        </div>

        <div>
        <input type="text" name = "title" value = "${boardDto.title}" ${mode == "new"? '' : ' readonly = "readonly" '}>
        </div>

        <div>
        <textarea name = "content" id = "" cols = "30" rows="10"  ${mode == "new"? '' : ' readonly = "readonly" '} >${boardDto.content}</textarea>
        </div>

        <div class = "button-container">
        <button type="button" id ="writeBtn" class = btn> 글 작성  </button>
        <button type="button" id ="modifyBtn" class = btn> 수정 </button>
        <button type="button" id ="removeBtn" class = btn> 삭제 </button>
        <button type="button" id ="listBtn" class = btn> 목록 </button>
        </div>

    </form>
</div>
<br>




</div>
<script>
    $(document).ready(function (){  // main()


        let writer = "<%= session.getAttribute("id") %>"; // 작성자
        let nowUser = "<%= session.getAttribute("id") %>"; // 현재 로그인한 사용자의 아이디

        $('#writeBtn00').on('click', function() {
            $('#modifyBtn, #removeBtn').prop('disabled', true).hide(); // 수정, 삭제, 버튼 비활성화 및 숨기기
            $('#writeBtn, #listBtn').prop('disabled', false).show(); // 글 작성, 목록 버튼 활성화 및 보이기
        });


        // if (writer == nowUser) {
        //     // 글 작성자인 경우
        //     $('#modifyBtn, #removeBtn , #listBtn').prop('disabled', false).show(); // 수정, 삭제 ,목록 버튼 활성화 및 보이기
        //     $('#writeBtn').prop('disabled', true).hide(); // 글 작성 버튼 비활성화 및 숨기기
        // } else {
        //     // 글 작성자가 아닌 경우
        //     $('#modifyBtn, #removeBtn ,#writeBtn ').prop('disabled', true).hide(); // 수정, 삭제 버튼 비활성화 및 숨기기
        //     $('#listBtn').prop('disabled', false).show(); // 목록 버튼 활성화 및 보이기
        // }




        $('#listBtn').on("click",function (){
            location.href = "<c:url value = '/board/list'/>?page=${page}&pageSize=${pageSize}";
        });

        $('#modifyBtn').on("click",function (){
            // 읽기 상태이면 수정 상태로 변경
            let form = $("#form");
            let isReadOnly = $("input[name=title]").attr('readonly');

            if(isReadOnly == 'readonly'){
                $("input[name=title]").attr('readonly',false); //title
                $("textarea").attr('readonly',false); //content
                $("#modifyBtn").html("등록");
                $("h2").html("게시물 수정");
                return;
            }
            // 수정 상태이면 수정된 내용을 서버로 전송
            form.attr("action","<c:url value = '/board/modify'/>");
            form.attr("method", "post");
            form.submit();
        });


        $('#writeBtn').on("click",function (){

            let form = $("#form");
            form.attr("action","<c:url value = '/board/write'/>");
            form.attr("method", "post");
            form.submit();
        });

            $('#removeBtn').on("click",function (){
                if (!confirm("정말로 삭제하시겠습니까?")) return;
            let form = $("#form");
            form.attr("action","<c:url value = '/board/remove'/>?page=${page}&pageSize=${pageSize}");
            form.attr("method", "post");
            form.submit();
            });


    });


</script>

</body>
</html>