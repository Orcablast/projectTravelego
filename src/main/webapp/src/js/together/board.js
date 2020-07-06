$(".autosize").on("keyup", function (event) {
  const key = event.key;
  const lineNum = $(this).val().split("\n").length;
  if (key == "Enter") {
    $(this)
      .height(1)
      .height($(this).prop("scrollHeight") + 12);
  } else if (key == "Backspace") {
    const lineNum = $(this).val().split("\n").length;
    $(this).height(lineNum * 15 + 26);
  }
});

$(".content").on("mouseenter mouseleave", toggleStrech);
$(".show_comment").click(showComment);

function toggleStrech() {
  $(this).find(".stretch_area").slideToggle();
}

$(".content").on("click", contentClick);

function contentClick() {
  if (!$(this).hasClass("open_content")) {
    const togetherNo = $(this).attr("boardNum");
    const content = $(this);
    $.ajax({
      url: "/together/view.do",
      type: "POST",
      data: { togetherNo: togetherNo },
      success: function (data) {
        content.find("#commentCount").html("(" + data.commentCount + ")");
      },
      error: function () {
        alert("게시글 조회에 실패하였습니다.");
      },
    });

    $(this).off();
    $(this).removeClass();
    $(this).addClass("open_content");
    $(this).find(".stretch_area").on("click", openContentClick);
  }
}

function openContentClick(event) {
  event.stopPropagation();
  $(this).off();
  const content = $(this).parent();
  content.removeClass();
  content.addClass("content");
  content.on("mouseenter mouseleave", toggleStrech);
  content.on("click", contentClick);
}

$(".search_tab").children().on("click", selectTab);

function selectTab() {
  $(".search_tab").children().removeClass();
  $(this).addClass("selected_tab");
  const selectTab = $(this).find("a").html();

  if (selectTab == "지역") {
    $(".region_area").show();
    $(".search_area").hide();
  } else if (selectTab == "검색") {
    $(".region_area").hide();
    $(".search_area").show();
  }
}

$(".select_region").children().on("click", selectRegion);

function selectRegion() {
  const regionNo = $(this).attr("regionNo");
  $(".content_area").children().remove();

  $.ajax({
    url: "/together/asyncBoardByRegion.do",
    type: "POST",
    data: { regionNo: regionNo },
    success: function (data) {
      loadContent(data);
    },
    error: function () {
      console.log("서버 접속에 실패하였습니다.");
    },
  });
}

$("#mainSearch").on("submit", function (e) {
  const postData = $(this).serializeArray();
  $.ajax({
    url: "/together/asyncBoardByKeyword.do",
    type: "POST",
    data: postData,
    success: function (data) {
      if (data.length != 0) {
        $(".content_area").children().remove();
        loadContent(data);
      } else {
        alert("검색 결과가 없습니다.");
      }
    },
    error: function () {
      console.log("서버 접속에 실패하였습니다.");
    },
  });
  e.preventDefault();
});
