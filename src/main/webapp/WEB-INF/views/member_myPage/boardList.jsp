<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- 비 로그인시 알람 부트스트랩  -->
    <script src="/src/js/jquery/jquery-3.5.1.js"></script>
    <script src="/src/js/bootstrap/popper.min.js"></script>
    <script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
    
    <!-- 수민 버튼 부트스트랩 -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    
    
    <!-- 테이블 부트스트랩 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    
    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link
      rel="shortcut icon"
      type="image/x-icon"
      href="/src/imgs/header/favicon.png"
    />
    <!-- Place favicon.ico in the root directory -->
    <script
      src="/src/js/fontawesome/8bd2671777.js"
      crossorigin="anonymous"
    ></script>
    <!-- CSS here -->
    <link rel="stylesheet" href="/src/css/header/header.css" />
    <link rel="stylesheet" href="/src/css/footer/footer.css" />
    <link rel="stylesheet" href="/src/css/main/web_default.css" />
    <title>Travelego</title>
    <style>
        #user{
            font-size: 40px;
        }
        button{
            width: 110px;
            height: 40px;
            float: left;
            border-radius: 0px;
        }
        table{
            width: 100%;
            border-spacing: 0px;
            border-left: none;
            border-right: none;
            border-top: none;
            margin-bottom: 30px;
        }
        td{
            border-left: none;
            border-right: none;
            text-align: center;
        }
        .tr{
        	font-weight: bold;
        }
    </style>
  </head>
  <script>
  	$(function(){
  		$(".board").click(function(){
  			$(this).css("background-color","#117a8b");
  			var val = $(this).val();
  			location.href="/boardList.do?board="+val+"&reqPage=1";
  		});
  		
  		function selected(){
  			var board = ${board};
  			if(board==0){
  				$("button").eq(0).css("background-color","#117a8b");
  			}else if(board==5){
  				$("button").eq(1).css("background-color","#117a8b");
  			}else if(board==2){
  				$("button").eq(2).css("background-color","#117a8b");
  			}else if(board==3){
  				$("button").eq(3).css("background-color","#117a8b");
  			}
  		};
  		selected();
  	});
  </script>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
    <section>
      <div id="user" style="width:80%; margin:0 auto; font-size:30px; font-weight: bold; margin-bottom:20px;">${sessionScope.member.memberNickname }</div>
        <br>
        <div style="width:80%; margin:0 auto; font-size:18px;">내가 작성한 게시글</div>
        <br>
        <div style="width:80%; margin:0 auto; margin-bottom:20px;">
        	<button class="board btn btn-info" value="0" style="border-radius:0px;">전체</button>
            <button class="board btn btn-info" value="5" style="border-radius:0px;">일정 게시판</button>
            <button class="board btn btn-info" value="2" style="border-radius:0px;">추천 게시판</button>
            <button class="board btn btn-info" value="3" style="border-radius:0px;">동행 구하기</button>
        </div>
        <table border="1px solid black" style="width:80%; margin:0 auto;" class="table table-hover">
            <thead>
            <tr class="tr"><td width="10%">#</td>
                <td width="60%">제목</td>
                <td width="20%">작성일</td>
                <td width="10%">조회수</td>
            </tr></thead>
            <c:forEach items="${bList }" var="b">
            	<tr>
            		<td>${b.rnum }</td>
            		<td>${b.boardTitle }</td>
            		<td>${b.boardDate }</td>
            		<td>${b.readCount }</td>
            	</tr>
            </c:forEach>
        </table>
        <div style="width:80%; margin:50px auto; text-align: center;">${pageNavi }</div>
    </section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <!-- Modal -->
    <div
      class="modal fade custom_search_pop"
      id="exampleModalCenter"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalCenterTitle"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="serch_form">
            <input type="text" placeholder="Search" />
            <button type="submit">search</button>
          </div>
        </div>
      </div>
    </div>
    <!-- JS here -->
    <script src="/src/js/header/vendor/modernizr-3.5.0.min.js"></script>
    <!-- <script src="/src/js/header/vendor/jquery-1.12.4.min.js"></script>
	<script src="/src/js/header/popper.min.js"></script> -->
    <script src="/src/js/header/owl.carousel.min.js"></script>
    <script src="/src/js/header/isotope.pkgd.min.js"></script>
    <script src="/src/js/header/ajax-form.js"></script>
    <script src="/src/js/header/waypoints.min.js"></script>
    <script src="/src/js/header/jquery.counterup.min.js"></script>
    <script src="/src/js/header/imagesloaded.pkgd.min.js"></script>
    <script src="/src/js/header/scrollIt.js"></script>
    <script src="/src/js/header/jquery.scrollUp.min.js"></script>
    <script src="/src/js/header/wow.min.js"></script>
    <script src="/src/js/header/nice-select.min.js"></script>
    <script src="/src/js/header/jquery.slicknav.min.js"></script>
    <script src="/src/js/header/jquery.magnific-popup.min.js"></script>
    <script src="/src/js/header/plugins.js"></script>
    <script src="/src/js/header/gijgo.min.js"></script>
    <script src="/src/js/header/slick.min.js"></script>

    <!--contact js-->
    <script src="/src/js/header/contact.js"></script>
    <script src="/src/js/header/jquery.ajaxchimp.min.js"></script>
    <script src="/src/js/header/jquery.form.js"></script>
    <script src="/src/js/header/jquery.validate.min.js"></script>
    <script src="/src/js/header/mail-script.js"></script>
    <script src="/src/js/header/main.js"></script>
    <script>
      $(function () {
        $('[data-toggle="popover"]').popover();
      });

      $("#datepicker").datepicker({
        iconsLibrary: "fontawesome",
        icons: {
          rightIcon: "_$tag___________________________$tag__",
        },
      });
    </script>
  </body>
</html>
