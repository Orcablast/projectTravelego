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
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
    
    
    <title>Travelego</title>
    <style>
        #datePicker{
            float: left;
        }
        #tt{
            float: left;
            margin-left: 100px;
        }
        #regionValue{
            margin-left: 600px;
        }
        #makeBtn{
        	background-color: gray;
        }
        #dateList{
        	margin-top: 200px;
        	background-color: lightpink;
        	width: 1200px;
        	height: 1500px;
        }
        textarea{
        	width: 300px;
        	height: 50px;
        	resize: none;
        }
        .divFloat1{
            width: 30px;
            height: 50px;
            display:inline-block;
        }
        .divFloat2{
            border: 1px solid black;
            display:inline-block;
            width: 300px;
            padding: 10px;
        }
        .divFloat2>div:nth-child(1){
            font-weight: 900;
            font-size: 20px;
        }
        .divFloat2>div:nth-child(2){
            color: gray;
            font-size: 10px;
        }
        .divFloat2>div:nth-child(3){
            
            border: 1px solid black;
            border-radius: 5px;
        }
        .divFloat3{
            border: 1px solid black;
            display:inline-block;
        }
        .divFloat3>div:nth-child(1){
            border: 1px solid black;
            width: 50px;
            height: 50px;
            margin-left: 10px;
            display:inline-block;
        }
        .divFloat3>div:nth-child(2){
            border: 1px solid black;
            width: 50px;
            height: 50px;
            margin-left: 10px;
            display:inline-block;
        }
        .divFloat3>div:nth-child(3){
            border: 1px solid black;
            width: 50px;
            height: 50px;
            margin-left: 10px;
            display:inline-block;
        }
        button[name=addSpot]{
        	float: left;
        }
       	.spotDiv{
       		float: left;
       		border: 1px solid black;
       		width: 200px;
       		height: 80px;
       	}
       	.divClass{
       		overflow:hidden;
       	}

    </style>
  </head>
  <body>
  <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6a06442e34483b47b4ab9ad0c820edd&libraries=services"></script>

    <!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
    <section>
      <!-- 여기서부터 작성하시면 됨!!!!!!! -->
      <c:if test="${not empty sessionScope.member }">
      		<button type="button" name="invite">초대팝업</button>
      		<c:forEach items="${detailList }" var="detailList">
      			<input type="hidden" name="detailList" value="${detailList.tripDate }">
      			<input type="hidden" name="detailList" value="${detailList.tripOrder }">
      			<input type="hidden" name="detailList" value="${detailList.tripSpot }">
      			<input type="hidden" name="detailList" value="${detailList.tripContent }">
      		</c:forEach>
      		<button type="button" name="testBtn">test용버튼</button>
      		<input type="text" name="tripNoIs" value="${tripNoIs }">
      		<input type="text" name="regionNoIs" value="${regionNoIs }">
      		<input type="text" name="beginDateIs" value="${beginDateIs }">
      		<input type="text" name="endDateIs" value="${endDateIs }">
	      <div>
				<input type="text" name="placeAddr"><br>
				<input type="text" name="receivePlace"><br>
				<input type="text" name="receiveAddr"><br>
				<div id="map" style="width:100%;height:350px;"></div>
				<button type="button" name="addPlace">경로만들기</button>
			</div>
				
	      	<input type="text" id="datePicker">
	      	<div id="tt">
	      		<input type="text" name="regionCity" placeholder="도시명/나라명"><br>
	      		<table border="1" id="regionTable">
	      			<tr>
	      				<th>사진</th><th>도시</th><th>나라</th>
	      			</tr>
	      			<c:forEach items="${regionList }" var="regionList">
						<tr>
							<td>${regionList.filename }</td><input type='hidden' value="${regionList.regionNo }">
							<td>${regionList.regionCity }</td>
							<td>${regionList.regionCountry }</td>
						</tr>
					</c:forEach>
	      		</table>
	      	</div>
	      
	      <br><br><br>
	      <input type="text" name="cityValue"><br>
	      <input type="text" name="countryValue"><br>
	      <input type="text" name="regionNo"><br>
		  <button type="button" id="makeBtn">버튼</button><br>
		  <input type="text" name="currValIs"><br>
	      <div id="dateList">
	      		
	      </div>
	  </c:if>
    </section>
	<script>
		var mouseoverEvent = 0;
		var tripNoIs = $("input[name=tripNoIs]").val();
		var regionNoIs = $("input[name=regionNoIs]").val();
		var beginDateIs = $("input[name=beginDateIs]").val();
		var endDateIs = $("input[name=endDateIs]").val();
		
		$(document).ready(function(){
			
			if(tripNoIs==0){
				console.log("0임");
				if(tripNoIs==0){
					mouseoverEvent = 1;
				}
			}else{
				mouseoverEvent = 0;
				console.log("불러오기임");
				$("#datePicker").datepicker("setDate",beginDateIs,endDateIs);
				$("input[name=regionNo]").attr("value",regionNoIs);
				cityValue=1;
				if(dat1Copy!=""&&cityValue!=""){
					$("#makeBtn").css("background-color","blue");
					$("#makeBtn").attr("disabled",false);
				}
				dateFunc();
				$("#dateList").append("<button type='button' name='editBtn'>편집하기</button>");
				$("#dateList").append(inputDateValue());
				$("input[name=currValIs]").attr("value",$("input[name=tripNoIs]").val());
			}
		});
		
		$(document).on("mouseover","section",function(){
			if(mouseoverEvent==0){
				for(var j=0; j<$("button[name=addMemo]").length; j++){
					for(var i=0; i<$("input[name=detailList]").length; i++){
						if($("input[name=detailList]:eq("+i+")").val() == $("button[name=addMemo]:eq("+j+")").val()){
							var html = "";
							var sValue = $("input[name=detailList]:eq("+(i+2)+")").val();
							sValue = sValue.split(",");
							html += "<div class='divClass'><div class='divFloat1'><div></div><div>"+$("input[name=detailList]:eq("+(i+1)+")").val()+"</div></div>";
							html += "<div class='divFloat2'><div>"+sValue[0]+"</div><div>"+sValue[1]+"</div><div>"+$("input[name=detailList]:eq("+(i+3)+")").val()+"</div></div></div>";
							$("button[name=addMemo]:eq("+j+")").before(html);
							console.log(html);
						}
						
						
					}
				}
				mouseoverEvent = 1;
				for(var i=0; i<$(".divFloat2").length; i++){
					if($(".divFloat2:eq("+i+")").children().eq(0).text()==""){
						$(".divFloat2:eq("+i+")").children().eq(0).css("display","none");
						$(".divFloat2:eq("+i+")").children().eq(1).css("display","none");
					}else if($(".divFloat2:eq("+i+")").children().eq(2).text()==""){
						$(".divFloat2:eq("+i+")").children().eq(2).css("display","none");
					}else{
						$(".divFloat2:eq("+i+")").children().eq(1).css("margin-bottom","10px");
					}
				}
			}
				
			
		});
		
		$(document).on("click",".upBtn",function(){
			var saveValue1 = $(this).parent().parent().children().eq(0).children().eq(1).text();
			var saveValue2 = $(this).parent().parent().children().eq(1).children().eq(0).text();
			var saveValue3 = $(this).parent().parent().children().eq(1).children().eq(1).text();
			var saveValue4 = $(this).parent().parent().children().eq(1).children().eq(2).text();
			var prevValue1 = "";
			var prevValue2 = "";
			var prevValue3 = "";
			var prevValue4 = "";
			var tripDate = $(this).parent().parent().parent().find("button[name=addMemo]").val();
			var thisNo = $("input[name=currValIs]").val();
			
			if($(this).parent().parent().children().eq(0).children().eq(1).text()!=1){
				prevValue1 = $(this).parent().parent().prev().children().eq(0).children().eq(1).text();
				prevValue2 = $(this).parent().parent().prev().children().eq(1).children().eq(0).text();
				prevValue3 = $(this).parent().parent().prev().children().eq(1).children().eq(1).text();
				prevValue4 = $(this).parent().parent().prev().children().eq(1).children().eq(2).text();
				var this1 = $(this).parent().parent().prev();
				var this2 = $(this).parent().parent();
				var this3 = $(this).parent().parent().prev().children().eq(0).children().eq(1);
				var this4 = $(this).parent().parent().prev().children().eq(0);
				var form = {
						"saveValue1":saveValue1,
						"saveValue2":saveValue2,
						"saveValue3":saveValue3,
						"saveValue4":saveValue4,
						"prevValue1":prevValue1,
						"prevValue2":prevValue2,
						"prevValue3":prevValue3,
						"prevValue4":prevValue4,
						"tripNo":thisNo,
						"tripDate":tripDate
				}
				$.ajax({
					url : "/changeOrder.do",
					data : form,
					success : function(){
						console.log("0으로순서변경성공");
						var html = "";
						html += "<div class='divClass'><div class='divFloat1'><div></div><div>"+prevValue1+"</div></div>";
						html += "<div class='divFloat2'><div>"+saveValue2+"</div><div>"+saveValue3+"</div>";
						html += "<div>"+saveValue4+"</div></div>";
						html += "<div class='divFloat3'><div class='upBtn'>위로</div><div class='downBtn'>아래로</div>";
						html += "<div class='deleteBtn'>삭제</div></div></div>";
						this1.before(html);
						this3.remove();
						this4.append("<div>"+saveValue1+"</div>");
						this2.remove();
					},
					error : function(){
						console.log("0으로순서변경실패");
					}
				});
			}else{
				//$(this).parent().parent().parent().prev().children().last().before();
			}
			$("button[name=addPlace]").trigger("click");
		});
		
		
		$(document).on("click",".downBtn",function(){
			var saveValue1 = $(this).parent().parent().children().eq(0).children().eq(1).text();
			var saveValue2 = $(this).parent().parent().children().eq(1).children().eq(0).text();
			var saveValue3 = $(this).parent().parent().children().eq(1).children().eq(1).text();
			var saveValue4 = $(this).parent().parent().children().eq(1).children().eq(2).text();
			var prevValue1 = "";
			var prevValue2 = "";
			var prevValue3 = "";
			var prevValue4 = "";
			var tripDate = $(this).parent().parent().parent().find("button[name=addMemo]").val();
			var thisNo = $("input[name=currValIs]").val();
			var lastNum = $(this).parent().parent().parent().find("button[name=addMemo]").prev().children().eq(0).children().eq(1).text();
			if($(this).parent().parent().children().eq(0).children().eq(1).text()!=lastNum){
				prevValue1 = $(this).parent().parent().next().children().eq(0).children().eq(1).text();
				prevValue2 = $(this).parent().parent().next().children().eq(1).children().eq(0).text();
				prevValue3 = $(this).parent().parent().next().children().eq(1).children().eq(1).text();
				prevValue4 = $(this).parent().parent().next().children().eq(1).children().eq(2).text();
				var this1 = $(this).parent().parent().next();
				var this2 = $(this).parent().parent();
				var this3 = $(this).parent().parent().next().children().eq(0).children().eq(1);
				var this4 = $(this).parent().parent().next().children().eq(0);
				var form = {
						"saveValue1":saveValue1,
						"saveValue2":saveValue2,
						"saveValue3":saveValue3,
						"saveValue4":saveValue4,
						"prevValue1":prevValue1,
						"prevValue2":prevValue2,
						"prevValue3":prevValue3,
						"prevValue4":prevValue4,
						"tripNo":thisNo,
						"tripDate":tripDate
				}
				$.ajax({
					url : "/changeOrder2.do",
					data : form,
					success : function(){
						console.log("0으로순서변경성공");
						var html = "";
						html += "<div class='divClass'><div class='divFloat1'><div></div><div>"+prevValue1+"</div></div>";
						html += "<div class='divFloat2'><div>"+saveValue2+"</div><div>"+saveValue3+"</div>";
						html += "<div>"+saveValue4+"</div></div>";
						html += "<div class='divFloat3'><div class='upBtn'>위로</div><div class='downBtn'>아래로</div>";
						html += "<div class='deleteBtn'>삭제</div></div></div>";
						this1.after(html);
						this3.remove();
						this4.append("<div>"+saveValue1+"</div>");
						this2.remove();
					},
					error : function(){
						console.log("0으로순서변경실패");
					}
				});
			}else{
				//$(this).parent().parent().parent().prev().children().last().before();
			}
			$("button[name=addPlace]").trigger("click");
		});
		
		$(document).on("click",".deleteBtn",function(){
			var tripOrder = $(this).parent().parent().find(".divFloat1").children().eq(1).text();
			var tripDate = $(this).parent().parent().parent().find("button[name=addMemo]").val();
			var sortNum = $(this).parent().parent().parent().children().length;
			var thisRemove = $(this).parent().parent();
			var thisNo = $("input[name=currValIs]").val();
			
			
			var form = {
					"tripOrder":tripOrder,
					"tripDate":tripDate,
					"tripNo":thisNo
			};
			
			$.ajax({
				url : "/deleteMemo.do",
				data : form,
				success : function(data){
					console.log("메모지우기성공");
					for(var i=0; i<$(".divClass").length-1; i++){
						$(".divFloat1:eq("+i+")").children().eq(1).remove();
					}
					thisRemove.remove();
					for(var i=0; i<data.length-1; i++){
						$(".divFloat1:eq("+i+")").append("<div>"+data[i].tripOrder+"</div>");
					}
				},
				error : function(){
					console.log("메모지우기실패");
				}
			});
			$("button[name=addPlace]").trigger("click");
		});
		
		$(document).on("click","button[name=editBtn]",function(){
			if($("button[name=editBtn]").val()==""){
				for(var i=0; i<$(".divClass").length; i++){
					var html = "";
					html += "<div class='divFloat3'><div class='upBtn'>위로</div><div class='downBtn'>아래로</div><div class='deleteBtn'>삭제X</div></div>";
					$(".divClass:eq("+i+")").append(html);
				}
				$("button[name=editBtn]").attr("value","1");
				$("button[name=addMemo]").css("display","none");
			}else{
				/* for(var i=0; i<$(".divFloat3").length; i++){
					$(".divFloat3")[i].remove();
				} */
				$(".divFloat3").remove();
				$("button[name=editBtn]").removeAttr("value");
				$("button[name=addMemo]").css("display","block");
			}
			
		});
		
		$(document).on("click","button[name=testBtn]",function(){
			for(var i=0; i<$(".divClass").length; i++){
	    		if($(".divFloat2:eq("+i+")").children().eq(1).text()!="undefined"){
	    			positions.push($(".divFloat2:eq("+i+")").children().eq(1).text());
	    			//var test = await getCode($(".divFloat2:eq("+i+")").children().eq(1).text());
	    			//coords.push(test);
	    			//linePath.push(test);
	    			
	    		}
	    	
	    	}
			console.log(positions);
		});
		
		
		function inputDateValue(){
			var html = "";
			var arrIs = "";
			for(var i=0; i<datArr.length; i++){
				html += "<div><div>"+(datArr[i].getMonth()+1)+"월 "+datArr[i].getDate()+"일</div>";
				if(datArr[i].getMonth()<10 && datArr[i].getDate()<10){
					arrIs = (datArr[i].getYear()-100)+"/0"+datArr[i].getMonth()+"/0"+datArr[i].getDate();
				}else if(datArr[i].getMonth()<10){
					arrIs = (datArr[i].getYear()-100)+"/0"+datArr[i].getMonth()+"/"+datArr[i].getDate();
				}else if(datArr[i].getDate()<10){
					arrIs = (datArr[i].getYear()-100)+"/"+datArr[i].getMonth()+"/0"+datArr[i].getDate();
				}else{
					arrIs = (datArr[i].getYear()-100)+"/"+datArr[i].getMonth()+"/"+datArr[i].getDate();
				}
				html += "<button type='button' name='addMemo' value='"+arrIs+"'>장소/메모 추가</button></div><br><br>";
			}
			return html;
		}
		
		function dateFunc(){
			var dpValue = $("#datePicker").val();
	        var arr = dpValue.split(',');
	        if(arr.length==1){
	        	dat1Copy = "";
	        }else if(arr.length==2){
	        	var arr1 = arr[0].split('-');
		        var arr2 = arr[1].split('-');
		        var dat1 = new Date(arr1[0],arr1[1],arr1[2]);
		        dat2 = new Date(arr2[0],arr2[1],arr2[2]);
		        
		        if(dat1>dat2){
		        	datSet = dat2;
		        	dat2 = dat1;
		        	dat1 = datSet; 
		        }
		        dat1.setDate(dat1.getDate()+3);
		        dat1.setDate(dat1.getDate()-3);
		        dat2.setDate(dat2.getDate()+3);
		        dat2.setDate(dat2.getDate()-3);
		        dat1.setMonth(dat1.getMonth()-1);
		        dat2.setMonth(dat2.getMonth()-1);
		        dat1Copy = new Date(dat1);
		        datArr = new Array();
		        while(true){
		        	var datPush = new Date(dat1);
		        	datArr.push(datPush);
		        	console.log(datArr);
		        	if((dat1.getMonth()==dat2.getMonth())&&(dat1.getDate()==dat2.getDate())){
		        		break;
		        	}
		        	dat1.setDate(dat1.getDate()+1);
		        	if(dat1.getMonth()!=dat2.getMonth()){
			        
			        	if(dat1.getMonth()!=1){
			        		
			        		if((dat1.getMonth()==3||dat1.getMonth()==5||dat1.getMonth()==8||dat1.getMonth()==10)&&dat1.getDate()==31){
			        			dat1.setDate(dat1.getDate()+1);//+1 한 날짜가 31일이고 해당 달은 31일이 없을 때 한번 더 +1일 해줌
			        		}else{
			        		}
			        	}else{
			        		//2월
			        		if(((dat1.getFullYear()%4==0&&dat1.getFullYear()%100!=0)||dat1.getFullYear()%400==0)&&dat1.getDate()==30){
			        			dat1.setDate(dat1.getDate()+2);//29일까지존재
			        		}else if((!(dat1.getFullYear()%4==0&&dat1.getFullYear()%100!=0)||dat1.getFullYear()%400==0)&&dat1.getDate()==29){
			        			dat1.setDate(dat1.getDate()+3);//28
			        		}
			        		
			        	}
			        }
		        	
		        }
		        
		        if(dat1Copy!=""&&cityValue!=""){
					$("#makeBtn").css("background-color","blue");
					$("#makeBtn").attr("disabled",false);
				}else{
					$("#makeBtn").css("background-color","gray");
					$("#makeBtn").attr("disabled",true);
				}
	        }else if(arr.length==3){
	        	  var arr1 = arr[0].split('-');
	              var arr2 = arr[1].split('-');
	              var arr3 = arr[2].split('-');
	              var dat1 = new Date(arr1[0],arr1[1],arr1[2]);
	              var dat2 = new Date(arr2[0],arr2[1],arr2[2]);
	              var dat3 = new Date(arr3[0],arr3[1],arr3[2]);
	              if(dat1>dat2){
	                 var datSet = dat2;
	                 dat2 = dat1;
	                 dat1 = datSet; 
	              }
	              if((dat3>dat1&&dat3<dat2)||dat2<dat3){
	                 $("#datePicker").datepicker().datepicker("setDate",arr[0],arr[2]);
	              }else if(dat1>dat3){
	            	  $("#datePicker").datepicker().datepicker("setDate",arr[2],arr[0]);
	              }
	        }
		}
		
	
		var positions = [];
	    var coords = [];
	    //var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	    var markers = [];
	    var linePath = [];
	    	
	    $(function() { 
	    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.515133, 126.934086), // 지도의 중심좌표
		        level: 9 // 지도의 확대 레벨
		    };  
			 // 지도를 생성합니다    
			map = new kakao.maps.Map(mapContainer, mapOption);
	    });
	    
	    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });
		
		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
		
		    return marker;
	    }
	    
	    
	    function getCode(addr){
	    	return new Promise(function(resolve,reject){        		
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder =   new kakao.maps.services.Geocoder();
				geocoder.addressSearch(addr,  function(result, status) {
					 if (status === kakao.maps.services.Status.OK) {
						 resolve(new kakao.maps.LatLng(result[0].y, result[0].x));
					 }
				});
	    	});
	    }
	    
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	    function removeMarker() {
	        for ( var i = 0; i < markers.length; i++ ) {
	            markers[i].setMap(null);
	        }   
	        markers = [];
	    }
	  
	    $(document).on("click","button[name=addPlace]",async function(){
	    	positions = [];
		    coords = [];
		    markers = [];
		    linePath = [];
	    	removeMarker();
	    	for(var i=0; i<$(".divClass").length; i++){
	    		if($(".divFloat2:eq("+i+")").children().eq(1).text()!="undefined"){
	    			positions.push($(".divFloat2:eq("+i+")").children().eq(1).text());
	    			var test = await getCode($(".divFloat2:eq("+i+")").children().eq(1).text());
	    			coords.push(test);
	    			linePath.push(test);
	    		}
	    	
	    		
	    	}
			/* positions.push($("input[name=receiveAddr]").val());
			var test = await getCode($("input[name=receiveAddr]").val());
			coords.push(test);
			removeMarker();
			linePath.push(test); */
			
			
			
			
			
			
			//var polyline.setMap(null);
			//console.log(positions);
			// 주소-좌표 변환 객체를 생성합니다
			//var geocoder =   new kakao.maps.services.Geocoder();
			/* var polyline = new kakao.maps.Polyline(null);
			
			polyline.setMap(null); */
			
				for(var i=0; i<positions.length; i++){
					var am = addMarker(coords[i],i);
					console.log(positions.length);
					console.log(coords.length);
					//polyline.setMap(map);
					//var imageSize = new kakao.maps.Size(24, 35); 
					//var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
					/* var marker = new kakao.maps.Marker({
				            map: map, // 마커를 표시할 지도
				            position: coords[i], // 마커를 표시할 위치
				            //title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				            image : a // 마커 이미지 
				      }); */
					
					
					
					
			    	 //console.log(positions[i]);
						// 주소로 좌표를 검색합니다
						//geocoder.addressSearch(positions[i],  function(result, status) {
						
						    // 정상적으로 검색이 완료됐으면 
						     //if (status === kakao.maps.services.Status.OK) {
						    	// 마커 이미지의 이미지 크기 입니다
						    	//var imageSize = new kakao.maps.Size(24, 35); 
						    	    
						    	    // 마커 이미지를 생성합니다    
						    	//var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
						    	 
						    	 
						       // coords.push(new kakao.maps.LatLng(result[0].y, result[0].x));
								//console.log(coords);
						     // 마커를 생성합니다
						       /*  var marker = new kakao.maps.Marker({
						            map: map, // 마커를 표시할 지도
						            position: coords[i], // 마커를 표시할 위치
						            //title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						            image : markerImage // 마커 이미지 
						        }); */
						     //console.log(marker);
						
						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        //var infowindow = new kakao.maps.InfoWindow({
						        //    content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
						        //});
						        //infowindow.open(map, marker);
						
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords[i]);
						         
						    } 
						    var polyline = new kakao.maps.Polyline({
						        path: linePath, // 선을 구성하는 좌표배열 입니다
						        strokeWeight: 5, // 선의 두께 입니다
						        //strokeColor: '#FFAE00', // 선의 색깔입니다
						        strokeColor: '#FF0040',
						        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
						        strokeStyle: 'solid' // 선의 스타일입니다
						    });
						    polyline.setMap(map);
	    });
					
				
	    	 
	    	 
	    	 
			/* positions.forEach(function(addr, index) {
			    geocoder.addressSearch(addr, function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			            var marker = new kakao.maps.Marker({
			                map: map,
			                position: coords
			            });
			            var infowindow = new kakao.maps.InfoWindow({
			                content: '<div style="width:150px;text-align:center;padding:6px 0;">' + listData[index] + '</div>',
			                disableAutoPan: true
			            });
			            infowindow.open(map, marker);
			        } 
			    });
			}); */
	    	 
	    
		
		
		
		
	
		
		
	
		var dat1Copy="";
		var dat2="";
		var regionNo="";
		var cityValue="";
		var countryValue="";
		var datArr;
		var currDate;
		
		$(document).on("click","#regionTable tr",function(){//동적으로 생성된 태그에 이벤트 적용
			//regionNo = $(this).children(input type=hidden).val();
			regionNo = $(this).children().eq(1).val();
			cityValue = $(this).children().eq(2).text();
			countryValue = $(this).children().eq(3).text();
			$("input[name=cityValue]").attr("value",cityValue);
			$("input[name=countryValue]").attr("value",countryValue);
			$("input[name=regionNo]").attr("value",regionNo);
			//console.log(dat1Copy+"ddd");
			if(dat1Copy!=""){
				//$("#makeBtn").attr("disabled",true);
				$("#makeBtn").css("background-color","blue");
				$("#makeBtn").attr("disabled",false);
			}else{
				$("#makeBtn").css("background-color","gray");
				$("#makeBtn").attr("disabled",true);
			}
		});
		
		/* $(document).on("change","#datePicker",function(){
			$("#dataList").children().remove();
			if(dat1Copy!=""){
				for(var i=0; i<datArr.length; i++){
					$("#dateList").append("<input type='text' name='datArr[]' value=''>");
					$("#dateList").children().last().attr("value",datArr[i]);
				}
			}
		}); */
		
		
		
		$(function(){
		
			$(document).on("click","button[name=addMemo]",function(){
				$(this).css("display","none");
				var html = "";
				html += "<div><input type='hidden' name='memoContent'>";
				html += "<div><button type='button' name='addSpot'>장소 선택</button>";
				html += "<div class='spotDiv'><div name='receivePlace'></div>";
				html += "<div name='receiveAddr'></div></div></div>";
				html += "<div><textarea></textarea>";
				html += "<button type='button' name='addBtn'>등록</button>";
				html += "<button type='button' name='cancelBtn'>취소</button></div></div>";
				$(this).before(html);
			});
			
			
			$(document).on("click","button[name=invite]",function(){
				var currValIs = $("input[name=currValIs]").val();
				var popUrl = "/invitePopup.do?currValIs="+currValIs;
				var popOption = "width=650px, height=550px, resizable=no, location=no, top=300px, left=300px;";
				var windowObj = window.open(popUrl,"타이틀들어갈제목 ",popOption);
			});
			
			$(document).on("click","button[name=addSpot]",function(){
			    var num = $(this).val();
				var popUrl ="/mapPopup.do?spotValue="+num;
			    var popOption = "width=650px, height=550px, resizable=no, location=no, top=300px, left=300px;";
			    var windowObj = window.open(popUrl,"타이틀들어갈제목 ",popOption); 
			});
			

			
			$(document).on("click","button[name=addBtn]",function(){
				
				$("input[name=memoContent]").attr("value",$("textarea").val());
				console.log("addBtn버튼클릭!!!!");
				//console.log(currDate);
				//var thisDate = $(this).next().next().next().val();
				var thisDate = $(this).parent().parent().parent().find("button[name=addMemo]").val();
				var tripNo = $("input[name=currValIs]").val();
				//var tripContent = $(this).prev().val();
				var tripContent = $(this).parent().find("textarea").val();
				var tripSpot = $("input[name=placeAddr]").val();
				var to = $(this).parent().parent();
				/* console.log(tripDate);
				console.log(tripNo);
				console.log(tripContent);
				console.log(tripSpot);
				console.log(to); */
				$(this).parent().parent().css("display","none");
				$(this).parent().parent().parent().parent().find("button[name=addMemo]").css("display","block");
				/* if(tripSpot=="" && tripContent==""){
					return;	
				} */
				
				var form = {
						"tripNo":tripNo,
						"tripDate":thisDate,
						"tripContent":tripContent,
						"tripSpot":tripSpot
				}
				$.ajax({
					url : "/addMemo.do",
					//data : {"tripContent":memoContent},
					data : form,
					success : function(data){
						var tripOrder2;
						tripOrder2 = data.tripOrder;
						var html = "";
						html += "<div class='divClass'><div class='divFloat1'>";
						html += "<div></div><div>"+tripOrder2+"</div></div>";
						//html += "<div class='divClass'><div class='divFloat1'></div>";
						html += "<div class='divFloat2'><div>"+$("input[name=receivePlace]").val()+"</div>";
						html += "<div>"+$("input[name=receiveAddr]").val()+"</div><div>"+tripContent+"</div></div></div>";
						$("input[name=placeAddr]").val("");
						$("input[name=receivePlace]").val("");
						$("input[name=receiveAddr]").val("");
						console.log("addmemo아작스성공");
						if(tripSpot=="" && tripContent==""){
							to.remove();
							return;	
						}else{
							to.before(html);
							to.remove();
						}
						
						
					},
					error : function(){
						console.log("addmemo아작스실패");
						console.log(tripDate);
						console.log(tripNo);
						console.log(tripContent);
						console.log(tripSpot);
						console.log(to);
					}
				});
			});
			
			$(document).on("click","button[name=cancelBtn]",function(){
				$(this).parent().parent().parent().find("button[name=addMemo]").css("display","block");
				$(this).parent().parent().remove();
				$("input[name=placeAddr]").val("");
				$("input[name=receivePlace]").val("");
				$("input[name=receiveAddr]").val("");
			});
			
			$("#makeBtn").click(function(){
				var form = {
						"sendArr":datArr,
						"regionNo":regionNo
				}
				$.ajax({
					url : "/makeMytrip.do",
					type : "POST",
					data : form,
					traditional : true,
					success : function(data){
						//inputDateValue();
						$("input[name=currValIs]").attr("value",data[0].tripNo);
						$("input[name=tripNoIs]").attr("value",data[0].tripNo);
						$("#dateList").append("<button type='button' name='editBtn'>편집하기</button>");
						$("#dateList").append(inputDateValue());
						/* var datArrFormat;
						for(var i=0; i<datArr.length; i++){
							if(datArr[i].getMonth()<10){
								datArrFormat = datArr[i].getFullYear()+"/0"+datArr[i].getMonth()+"/"+datArr[i].getDate();
								$("button[name=addSpot]").attr("value",datArrFormat);
								$("button[name=addMemo]").attr("value",datArrFormat);
							}else{
								datArrFormat = datArr[i].getFullYear()+"/"+datArr[i].getMonth()+"/"+datArr[i].getDate();
								$("button[name=addSpot]").attr("value",datArrFormat);
								$("button[name=addMemo]").attr("value",datArrFormat);
							}
						} */
						console.log("아작스성공!!!!!!!!");
					},
					error : function(){
						console.log("ajax통신 실패222");
					}
				});
			});
			
			$("input[name=regionCity]").keyup(function(){
				var regionCity = $("input[name=regionCity]").val();
				$.ajax({
					url : "/searchRegion.do",
					type : "get",
					data : {regionCity:regionCity},
					success : function(data){
						var html = "";
						$("table>tbody").empty();
						html += "<tr><th>사진</th><th>도시</th><th>나라</th></tr>"
						if(data!="0"){
						for(var i=0; i<data.length; i++){
							html += "<tr><td>"+data[i].filename+"</td>";
							html += "<input type='hidden' value='"+data[i].regionNo+"'>";
							html += "<td>"+data[i].regionCity+"</td>";
							html += "<td>"+data[i].regionCountry+"</td></tr>";
						}
						$("table>tbody").append(html);
						}
					},
					error : function(){
						console.log("ajax통신 실패");
					}
				});
			});
			
			$("#makeBtn").click(function(){
				console.log("버튼클릭성공");
			});
			
		});
		
		
		
	
	
	
		$('#datePicker').datepicker({
			format : "yyyy-mm-dd", // 달력에서 클릭시 표시할 값 형식
			language : "kr",
			todayHighlight : true,
			multidate : true,
			todayBtn : true
		});
		
	    $("#datePicker").on("change",function(){
	    	dateFunc();
	    });
	</script>

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
    <!-- <script src="/src/js/header/gijgo.min.js"></script> -->
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
