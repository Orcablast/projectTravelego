<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="/src/css/header/header.css" />
<link rel="stylesheet" href="/src/css/footer/footer.css" />
<link rel="stylesheet" href="/src/css/main/web_default.css" />
<link rel="stylesheet"
	href="/src/css/member/modiFied/memberModified.css" />
<!-- 아이콘 키값 -->
<script src="/src/js/fontawesome/8bd2671777.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section>
		<div class="joincontent">
			<h1>회원정보 수정</h1>
			<hr>
			<div class="textdiv">
				<form action="/companyModified.do" method="post">
					<label id="lId" for="memberId" class="col-lg-2 control-label">아이디</label>
					<div class="col-lg-6">
						<input type="text" class="form-control" name="memberId"
							id="memberId" data-rule-required="true" value="${m.memberId }"
							readonly> <br> <span id="sId"></span>
					</div>
					<br> 
					<div class="btn_wrapper"><button type="button" id="pwChangeBtn" class="btn btn-primary">비밀번호 변경</button></div>
					<div class="pass_wrapper">
					<label for="memberPw" class="col-lg-2 control-label">패스워드</label>
					<div class="col-lg-6">
						<input type="password" class="form-control" id="memberPw"
							name="memberPw" data-rule-required="true" ><br>
						<span id="sPw"></span>
					</div>
					<br> <label id="lPwRe" for="memberPwRe"
						class="col-lg-2 control-label">패스워드 확인</label>
					<div class="col-lg-6">
						<input type="password" class="form-control" id="memberPwRe"
							placeholder="패스워드 확인" ><br> <span
							id="sPwRe"></span>
					</div>
				</div>
					<br> <label id="lName" for="memberName"
						class="col-lg-2 control-label">이름</label>
					<div class="col-lg-6	">
						<input type="text" class="form-control onlyHangul" id="memberName"
							name="memberName" value="${m.memberName }"><br> <span
							id="sName"></span>
					</div>
					<br> <label id="lNickname" for="memberNickname"
						class="col-lg-2 control-label">닉네임</label>
					<div class="col-lg-5">
						<input type="text" class="form-control" id="memberNickname"
							name="memberNickname" value="${m.memberNickname }"><br>
						<span id="sNickname"></span>
					</div>
					<br> <label id="lAge" for="age" class="col-lg-2 control-label">나이</label>
					<div class="col-lg-6">
						<input type="text" class="form-control" id="age" name="age"
							value="${m.age }"><br> <span id="sAge"></span>
					</div>
					<br> <label id="lEmail" for="email"
						class="col-lg-2 control-label">이메일</label>
					<div class="col-lg-5">
						<input type="text" class="form-control" id="email" name="email"
							value="${m.email }" readonly> <br> <span id="sEmail"></span>
					</div>
					<br> <br> <br> <label id="lPhone" for="phone"
						class="col-lg-2 control-label">휴대폰 번호</label>
					<div class="col-lg-6">
						<input type="tel" class="form-control onlyNumber" id="phone"
							name="phone" value="${m.phone }"><br> <span
							id="sPhone"></span>
					</div>
					<br> <label id="lLicense" for="license" class="col-lg-2 control-label">사업자
					번호</label>
				<div class="col-lg-6">
					<input type="text" class="form-control onlyNumber" id="license"
						name="license" value="${cp.license }">
						 <br>
					<span id="sLicense"></span>
				</div>
				<br> <label id="lUrl" for="companyUrl" class="col-lg-2 control-label">회사
					URL</label>
				<div class="col-lg-6">
					<input type="text" class="form-control onlyNumber" id="companyUrl"
						name="companyUrl" value="${cp.companyUrl }">
						 <br>
					<span id="sUrl"></span>
				</div>
					<br> <label for="gender" class="col-lg-2 control-label">성별</label>
					<div class="col-lg-6">
						<select class="form-control" id="gender" name="gender" readonly>
							<option value="M">남</option>
							<option value="F">여</option>
						</select>
					</div>
					<br>
			</div>
			<div class="divBtn" id="divBtn">
				<button id="modifyBtn" type="submit" class="btn btn-primary">회원정보
					수정</button>
			</div>
			</form>
		</div>
		<input type="hidden" name="memberLevel" id="memberLevel" value="${m.memberLevel }" >
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script>

	$("#pwChangeBtn").click(function(){
		$(".pass_wrapper").slideToggle();
		$(this).hide();
	});
	var mailCode = "";
	var regExp = "";
	var checkArr = [ true, true, true, true, true, true, true, true ];
	$("#memberPw").keyup(function(event) {
		regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		if($("#memberPw").val()==""){
			
			$("#sPw").html("");
				checkArr[0] = true;
		} else {			
			if (regExp.test($("#memberPw").val())) {
								$("#lPW").css("color", "green");
								$("#sPw").html("생성 가능한 비밀번호 입니다.");
								$("#sPw").css("color", "green");
								checkArr[0] = true;
							} else {
								$("#sPw").html("비밀번호 규격을 맞춰주세요<br>(8~15글자 특수문자,대/소문자,숫자 15글자 이내)");
								$("#sPw").css("color", "red");
								$("#lPW").css("color", "red");
								$("#memberPw").focus();
								checkArr[0] = false;
							}
		}
		pwrecheck();
	});	
	$("#memberPwRe").keyup(function() {
		pwrecheck();
		
	});
	function pwrecheck(){		
		if ($("#memberPwRe").val() == "") {
			// $("#sPwRe").html("비밀번호를 입력해주세요.");
			// $("#sPwRe").css("color", "red");
			$("#sPwRe").html("");
			checkArr[1] = true;
		} else {
			if ($("#memberPw").val() == $("#memberPwRe").val()) {
				$("#sPwRe").html("비밀번호가 일치합니다.");
				$("#sPwRe").css("color", "green");
				$("#lPwRe").css("color", "green");
				checkArr[1] = true;
			} else {
				$("#memberPwRe").focus();
				$("#sPwRe").html("비밀번호가 일치하지 않습니다.");
				$("#sPwRe").css("color", "red");
				checkArr[1] = false;
			}
		}
	}
	$("#memberName").change(function() {
		regExp = /^[가-힣]{2,5}$/;
		
			if (regExp.test($("#memberName").val())) {
				$("lName").css("color", "green");
				$("#sName").html("");
				checkArr[2] = true;
			} else {
				$("#sName").html("이름규격에 맞춰주세요.<br>(한글 2글자 이상,5글자 이하)");
				$("#sName").css("color", "red");
				checkArr[2] = false;
			
		}
	});
	$("#memberNickname").change(function() {
		regExp = /^[a-zA-Z가-힣0-9]{2,10}$/;
		
			if (regExp.test($("#membeNickname").val())) {
				var memberNickname = $("#memberNickname").val();
				$.ajax({
					url : "/chkNickname.do",
					type : "post",
					data : {
						memberNickname : memberNickname
					},
					success : function(data) {
						if (data == '0') {
							$("#sNickname").html("생성가능한 닉네임입니다.");
							$("#sNickname").css("color", "green");
							$("#lNickname").css("color", "green");
							checkArr[3] = true;
						} else {
							$("#sNickname").html("생성가능한 불닉네임입니다.");
							$("#sNickname").css("color", "red");
							$("#memberId").focus();
							$("#lNickname").css("color", "red");
							checkArr[3] = false;
						}
					},
					error : function() {
						console.log("아이디 중복체크 실페");
					}
				});
			} else {
				$("#sNickname").html("생성불가능한 닉네임입니다.<br>닉네임을 다시 확인해주세요.");
				$("#sNickname").css("color", "red");
				checkArr[3] = false;
			}
		
	});
	$("#age").change(function() {
		regExp = /^[0-9]{2}$/;
			if (regExp.test($("#age").val())) {
				$("#lAge").css("color", "green");
				$("#sAge").html("");
				checkArr[4] = true;
			} else {
				$("#lAge").css("color", "red");
				$("#sAge").html("나이를  확인해주세요.");
				$("#sAge").css("color", "red");
				checkArr[4] = false;
		}

	});
	$("#phone").change(function() {
		regExp = /^\d{3}\d{3,4}\d{4}$/;
			if (regExp.test($("#phone").val())) {
				$("#lPhone").css("color", "green");
				$("#sPhone").html("");
				checkArr[5] = true;
			} else {
				$("#phone").focus();
				$("#sPhone").html("핸드폰번호는 - 없이 11자리까지 가능합니다.");
				$("#sPhone").css("color", "red");
				checkArr[5] = false;
			
		}
	});
	$("#license").change(function(){
		regExp =/^[1-9]{1}[0-9]{9}/;
		if(regExp.test($("#license").val())){
			$("#lLicense").css("color", "green");
			$("#sLicense").html("");
			checkArr[6]=true;
		}else{
			$("#lLicense").css("color", "red");
			$("#sLicense").html("사업자번호 양식이 올바르지않습니다.");
			$("#sLicense").css("color", "red");
			checkArr[6]=false;
		}
		
	});
	$("#companyUrl").change(function(){
		regExp=/(http(s)?:\/\/)([a-z0-9\w]+\.*)+[a-z0-9]{2,4}/gi;
		if(regExp.test($("#companyUrl").val())){
			$("#lUrl").css("color", "green");
			$("#sUrl").html("");
			checkArr[7]=true;
		}else{
			$("#lUrl").css("color", "red");
			$("#sUrl").html("URL양식이 올바르지 않습니다.");
			$("#sUrl").css("color", "red");
			checkArr[7] = false;
		}
		
	});
	var count = 0;
	$("form").submit(function() {
		for (i = 0; i < checkArr.length; i++) {
			if (checkArr[i] == true) {
				count++;
			}

		}
		if (count <= 5) {
			alert("정보수정 절차에 맞게 작성해주세요.");
			count = 0;
			return false;
		} else if (count == 6) {
			return true;
		}

	});
	$("#gender").val("${m.gender}").prop("selected",true);
</script>
</html>