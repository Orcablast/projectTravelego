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
    <link rel="stylesheet" href="/src/css/tripboard/board.css" />
    <title>Travelego</title>
    <style></style>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <section>
      <div class="board">
        <c:forEach items="${list }" var="b">
          <div
            class="content"
            data-container="body"
            data-toggle="popover"
            data-placement="bottom"
            data-content="${b.tripBoardTitle}"
          >
            <c:if test="${not empty b.filepath}">
              <img src="${b.filepath}" alt="" />
            </c:if>
            <c:if test="${empty b.filepath}">
              <img src="/src/imgs/header/rogo2.png" alt="" />
            </c:if>

            <i
              class="fas fa-ellipsis-v"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >
              <div class="dropdown-menu">
                <a class="dropdown-item" href="javascript:void(0)">북마크</a>
                <a class="dropdown-item" href="javascript:void(0)"
                  >게시글 신고</a
                >
              </div>
            </i>
            <div>
              <span>대한민국 - 제주도</span>
              <div>
                <i class="far fa-thumbs-up"></i>
                <span>0</span>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
      <nav class="page_nav" aria-label="Page navigation">
        ${pageNavi}
      </nav>
      <div class="form-group">
        <form id="searchForm">
          <select class="form-control" name="searchOption" id="selectOption">
            <option value="1">지역</option>
            <option value="2">제목</option>
            <option value="3">내용</option>
            <option value="4">제목+내용</option>
          </select>
          <input
            type="search"
            class="form-control"
            name="keyword"
            id="inputSearch"
            placeholder="검색어를 입력하세요"
            autocomplete="off"
          />
          <button class="btn btn-outline-primary" id="searchBtn">
            <i class="fas fa-search"></i>
          </button>
        </form>
        <button class="btn btn-primary" id="writeBtn" type="button">
          글쓰기
        </button>
      </div>
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
      <script src="/src/js/header/popper.min.js"></script>
    <script src="/src/js/header/owl.carousel.min.js"></script>
    <script src="/src/js/header/isotope.pkgd.min.js"></script>
    <script src="/src/js/header/ajax-form.js"></script>
    <script src="/src/js/header/waypoints.min.js"></script> -->
    <script src="/src/js/header/jquery.counterup.min.js"></script>
    <script src="/src/js/header/imagesloaded.pkgd.min.js"></script>
    <script src="/src/js/header/scrollIt.js"></script>
    <script src="/src/js/header/jquery.scrollUp.min.js"></script>
    <script src="/src/js/header/wow.min.js"></script>
    <!-- <script src="/src/js/header/nice-select.min.js"></script> -->
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
    <script src="/src/js/message/messageSend.js"></script>
    <script>
      sendMessage("user01");
    </script>
    <c:if test="${not empty sessionScope.member.memberId }">
      <script>
        $("#writeBtn").click(function () {
          location.href = "/tripboard/writeFrm.do";
        });
      </script>
    </c:if>
    <c:if test="${empty sessionScope.member.memberId }">
      <script>
        $("#writeBtn").click(function () {
          alert("로그인이 필요한 기능입니다.");
        });
      </script>
    </c:if>
    <script>
      $(function () {
        // $('[data-toggle="popover"]').popover();
        $(".content").mouseenter(function () {
          $(this).popover("show");
        });
        $(".content").mouseleave(function () {
          $(this).popover("hide");
        });
      });
    </script>
  </body>
</html>
