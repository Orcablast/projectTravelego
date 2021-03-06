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
    <title>Travelego</title>
    <style>
        section{
            display: block;
            overflow: hidden;
        }
        header{
            z-index: 100;
        }
    	.search-area{
    		margin-top: 50px;
            padding-bottom: 20px;
            border-bottom: 1px solid lightgray;
            overflow: hidden;
    	}
        .search-area select{
            width: 200px;
            height: 30px;
            margin: 10px;
            margin-left:0;
            box-sizing: border-box;
        }
        .search-area input{
        	margin:10px;
        	margin-left:0;
        }
        #searchtext{
            width: 430px;
        }
        .tourContent{
            margin-top: 20px;
            overflow:hidden;
        }
        .item{
            float: left;
            width: 280px;
            height: 400px;
            overflow:hidden;
            border-radius: 20px;
            margin: 10px;
            position: relative;
            z-index:50;
            box-shadow: 2px 2px 5px 0 lightgray;
        }
        .item>div{
            overflow: hidden;
        }
        .item>h1{
        	width:280px;
        	height:280px;
        	line-height:280px;
        	position:absolute;
        	padding:0;
        	margin:0;
        	top:0;
        	text-align: center;
        	background:gray;
        	z-index:53;
        	font-size:100px;
        	color:white;
        	opacity:0.7;
        }
        .item:hover{
            cursor: pointer;
            box-shadow: 3px 3px 10px 5px lightgray;
            transition-duration: 0.3s;
        }
        .item:hover img{
            transform: scale(1.3,1.3);
            transition-duration: 0.5s;
        }
        .itemTitle{
            width:100%;
            height: 70px;
            padding:10px;
            text-overflow: ellipsis;
        }
        .item-main-img{
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            width: 280px;
            height: 280px;
        }
        .itemBtn{
        	width:100%;
        	height:30px;
        	position: absolute;
        	top:240px;
        	z-index: 55;
        }
        .itemBtn>button{
        	float:right;
        	margin-right:10px;
        	line-height:22px;
        	height:30px;
        }
        .term{
        	border-top:1px solid gray;
        	margin-top:10px;
        	text-align:center;
        }
        .item-top{
        	position:absolute;
            background-color:rgba(100,100,100,0.3);
            width:100%;
            z-index: 51;
        }
        .region{
        	text-align:left;
        	float:left;
        	padding:10px;
        	padding-bottom:0;
            color:white;
            width:50%;
            z-index: 52;
        }
        .score{
            text-align: right;
            float:right;
            padding:10px;
            padding-bottom:0;
            color:white;
            width:50%;
            z-index: 52;
        }
        .morebtn{
        	overflow:hidden;
        }
        #more-btn{
        	width:100%;
        	height:50px;
        }
        .morebtn>label>img{
        	width:50px;
        	height:50px;
        	margin:0 auto;
        }
    </style>
    <script>
    	$(function(){
    		function fn_more(start,val){
    			var regionCountry = "${t.regionCountry}";
    			var regionNo = "${t.regionNo }";
    			var tourDate = "${t.tourDate }";
    			var searchValue = "${t.searchValue }";
    			var array1 = $("select[name=array1]").val();
    			var array2 = $("select[name=array2]").val();
    			var param = {start:start,val:val,regionCountry:regionCountry,regionNo:regionNo,searchValue:searchValue,tourDate:tourDate,array1:array1,array2:array2};
    			$.ajax({
    				url: "/moreItem.do",
    				data : param,
    				type : "post",
    				dataType : "json",
    				success : function(data){
    					console.log(data.length);
    					var html = "";
    					for(var i=0; i<data.length; i++){
    						html += "<div class='item card bg-light mb-3' itemNo="+data[i].itemNo+" onclick='itemView("+data[i].itemNo+");'>";
    						html+="<div class='item-top'>";
    						html += "<div class='region'>"+data[i].regionCountry+"-"+data[i].regionCity+"</div>";
    						if(data[i].score==0){
    							html += "<div class='score'>후기가 없습니다</div>";
    						}else{
    							html += "<div class='score'>★"+data[i].score.toFixed(1)+"점</div>";
    						}
    						html+="</div>";
    						html += "<div><img class='item-main-img' src='../../../upload/images/tour/thumnail/"+data[i].filepath+"'></div>";
    						html += "<div class='itemBtn'>";
    						if(data[i].closeCheck==1){
    							html += "<button class='btn btn-danger btn-sm' type='button' onclick='deleteItem("+data[i].itemNo+");'>삭제</button>";
    							html += "<button class='btn btn-primary btn-sm' type='button' onclick='modifyItem("+data[i].itemNo+");'>수정</button></div>";
    						}else{
    							html += "<button class='btn btn-primary btn-sm' type='button' onclick='closeItem("+data[i].itemNo+");'>마감</button></div>";
    						}
    						if(data[i].closeCheck==1){
    							html += "<h1>마감</h1>";
    						}
    						html += "<div class='itemTitle'>"+data[i].itemTitle+"</div>";
    						html += "<div class='term'>"+data[i].beginDate+" ~ "+data[i].endDate+"</div>";
    						html += "</div>";
    					}
    					$(".tourContent").append(html);
    					$("#more-btn").val(Number(start)+12);
    					$("#more-btn").attr("currentCount",Number($("#more-btn").attr("currentCount"))+data.length);
    					var totalCount = $("#more-btn").attr("totalCount");
    					var currentCount = $("#more-btn").attr("currentCount");
    					if(totalCount<=currentCount){
    						$("#more-btn").prop("disabled",true);
    						$("#more-btn").css("display","none");
    					}
    				},
    				error : function(){
    					console.log("실패");
    				}
    			});
    		}
    		
    		$("#region-country").change(function(){
				var regionCountry = $(this).val();
				if(regionCountry=="default"){
					$("#regionCity").html("<option value=0>도시 선택");
				}
				else{
					$.ajax({
						url : "/selectCityList.do",
						data: {regionCountry:regionCountry},
						type : "post",
						success : function(data){
							$("#regionCity").html("");
							html = "";
							html += "<option value=0>도시 선택";
							for(var i=0; i<data.length; i++){
								html += "<option value="+data[i].regionNo+">"+data[i].regionCity;
							}
							$("#regionCity").append(html);
							if(regionCountry=="${t.regionCountry}"){
								$("select[name=regionNo]").val("${t.regionNo }").prop("selected", true);
							}
						},error : function(){
							console.log("ajax 통신 실패");
						}
					});
				}
			});
   			
   			$("select[name=array1]").change(function(){
   				$(".tourContent").html("");
   				$("#more-btn").attr("currentCount",0);
   				$("#more-btn").prop("disabled",false);
				$("#more-btn").css("display","block");
   				fn_more(1,"ctl");
   			});
   			$("select[name=array2]").change(function(){
   				$(".tourContent").html("");
   				$("#more-btn").attr("currentCount",0);
   				$("#more-btn").prop("disabled",false);
				$("#more-btn").css("display","block");
   				fn_more(1,"ctl");
   			});
   			
   			$("select[name=regionCountry]").val("${t.regionCountry }").prop("selected", true);
   			$("select[name=regionCountry]").change();
   			$("input[name=tourDate]").val("${t.tourDate }");
   			$("input[name=searchValue]").val("${t.searchValue }");
    		
    		$("#makeItem").click(function(){
    			location.href="/createTourFrm.do";
    		});
    		
   			fn_more(1,"ctl");
   			$("#more-btn").click(function(){
   				fn_more($(this).val(),"ctl");
   			});
    	});
    	
     	function modifyItem(itemNo){
    		event.stopPropagation();
    		$.ajax({
    			url:"/modifyCheckReserve.do",
    			data:{itemNo:itemNo},
    			type:"post",
    			dataType:"json",
    			success:function(data){
    				if(data>0){
    					alert("해당 상품에 진행중인 예약이 남아있어 수정이 불가능합니다.");
    				}else{
    					location.href="/modifyItemFrm.do?itemNo="+itemNo;
    				}
    			},error:function(){
    				console.log("해당아이템의 예약을 불러오는데 에러발생");
    			}
    		});
    	};
    	
    	function itemView(itemNo){
   			location.href="/tourView.do?itemNo="+itemNo;
    	};
    	
    	function closeItem(itemNo){
    		event.stopPropagation();
    		if(confirm("정말 마감하시겠습니까?")){
        		$.ajax({
        			url:"/closeItem.do",
        			data:{itemNo:itemNo},
        			type:"post",
        			dataType:"json",
        			success:function(data){
        				if(data>0){
        					console.log("마감성공");
        				}else{
        					alert("마감 실패");
        				}
        				location.reload();
        			},error:function(){
        				console.log("상품 마감 오류");
        			}
        		});
    		}
    	};
    	
    	function deleteItem(itemNo){
    		event.stopPropagation();
    		if(confirm("삭제한 상품은 더이상 볼 수 없습니다. 그래도 삭제 하시겠습니까?")){
    			$.ajax({
        			url:"/deleteItem.do",
        			data:{itemNo:itemNo},
        			type:"post",
        			dataType:"json",
        			success:function(data){
        				if(data>0){
        					console.log("삭제성공");
        				}else{
        					alert("삭제 실패");
        				}
        				location.reload();
        			},error:function(){
        				console.log("상품 삭제 오류");
        			}
        		});
    		}
    	}
    </script>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
    <section>
      <!-- 여기서부터 작성하시면 됨!!!!!!! -->
        <div class="search-area">
            <div class="search">
                <form action="/comTourList.do" method="get">
                	<div>
		                <select name="regionCountry" id="region-country">
		                    <option value="default">나라 선택
							<c:forEach items="${rlist }" var="r">
							<option value="${r.regionCountry }">${r.regionCountry }
							</c:forEach>
		                </select>
		                <select name="regionNo" id="regionCity">
							<option value=0>도시 선택
						</select>
					</div>
					<input type="date" name="tourDate">
                    <input id="searchtext" type="text" name="searchValue" placeholder="보고싶은 상품 또는 지역을 입력해주세요">
                    <input type="submit" value="검색">
                </form>
            </div>
        </div>
        <div>
        	<div style="display:inline-block;">
	        	<p>정렬</p>
	        	<select name="array1">
	        		<option value="regDate">최신</option>
	        		<option value="score">별점</option>
	        		<option value="reserveCnt">예약수</option>
	       		</select>
	       		<select name="array2">
	       			<option value="up">내림차순</option>
	       			<option value="down">오름차순</option>
	      		</select>
      		</div>
      		<button type="button" id="makeItem" class="btn btn-primary" style="float:right; margin-top:10px;">상품등록</button>
        </div>
        <div class="tourContent">
        </div>
        <div class="morebtn">
       		<button class="btn btn-outline-info" id="more-btn" totalCount="${totalCount }" currentCount="0" value="">더보기</button>
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
<!--    <script src="/src/js/header/nice-select.min.js"></script>-->
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