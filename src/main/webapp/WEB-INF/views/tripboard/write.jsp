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
    <link rel="stylesheet" href="/src/css/tripboard/write.css" />
    <title>Travelego</title>
    <style></style>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <section>
      <form
        action="/tripboard/write.do"
        method="POST"
        enctype="multipart/form-data"
      >
        <div class="input_wrapper">
          <div class="img_upload_wrapper">
            <div class="img_container">
              <img id="mainImg" src="" alt="" style="display: none;" />
              <span>대표 이미지</span>
            </div>
            <label for="inputMainImg" class="btn btn-primary">
              이미지 업로드
            </label>
            <input
              type="file"
              name="file"
              id="inputMainImg"
              style="display: none;"
            />
          </div>
          <div class="input_main_wrapper">
            <div class="writer_area">
              <span>작성자</span>
              <span>${sessionScope.member.memberId }</span>
              <input
                type="hidden"
                name="tripBoardWriter"
                value="${sessionScope.member.memberId}"
              />
            </div>
            <div class="input_region_area">
              <span>여행 지역</span>
              <input
                type="search"
                name=""
                id="inputRegion"
                class="form-control"
              />
              <input type="hidden" name="regionNo" id="inputRegionNo" />
            </div>
            <div class="trip_date_area">
              <span>여행 기간</span>
              <input
                type="text"
                name="tripDays"
                id="inputTripDay"
                class="form-control"
              />
            </div>
            <div class="input_title_area">
              <span>제목</span>
              <input
                type="text"
                name="tripBoardTitle"
                id=""
                class="form-control"
              />
            </div>
          </div>
          <div class="select_trip_wrapper">
            <span>여행 루트</span>
            <div class="route_container">
              <textarea
                class="form-control"
                name="tripRoute"
                id="textRoute"
                cols="30"
                rows="3"
                readonly
                style="display: none;"
              ></textarea>
              <span>먼저 일정을 불러와주세요.</span>
            </div>
            <div class="route_btn_container">
              <button
                type="button"
                class="btn btn-primary"
                id="selectTripBtn"
                data-toggle="modal"
                data-target="#selectTripModal"
              >
                내 일정 불러오기
              </button>
              <button
                type="button"
                class="btn btn-danger"
                id="cancelRoute"
                style="display: none;"
              >
                취소
              </button>
            </div>
          </div>
        </div>
        <div class="editor_wrapper">
          <textarea id="editor4" name="tripBoardContent"></textarea>
        </div>
        <div class="form_button_wrapper">
          <button type="button" class="btn btn-danger">취소</button>
          <button type="button" class="btn btn-primary" id="submitBtn">
            작성 완료
          </button>
        </div>
      </form>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <!-- Modal -->
    <div class="modal" tabindex="-1" role="dialog" id="selectTripModal">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">일정 선택</h5>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <table class="table">
              <thead class="thead-light">
                <tr>
                  <th scope="col">번호</th>
                  <th scope="col">여행지역</th>
                  <th scope="col">일정</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${list }" var="vo" varStatus="status">
                  <tr
                    regionNo="${vo.regionNo}"
                    tripNo="${vo.tripNo}"
                    tripDay="${vo.tripDay}"
                  >
                    <th scope="row">${status.count}</th>
                    <td>${vo.regionName}</td>
                    <td>${vo.tripDate}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">
              취소
            </button>
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
    <!-- <script src="/src/js/header/waypoints.min.js"></script> -->
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
    <script src="/src/ckeditor/ckeditor.js"></script>
    <script src="/src/js/tripboard/write.js"></script>
    <script>
      $("#submitBtn").click(function () {
        $("section").find("form").submit();
      });
    </script>
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
