<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="/src/css/header/header.css" />
<link rel="stylesheet" href="/src/css/footer/footer.css" />
<link rel="stylesheet" href="/src/css/main/web_default.css" />
<link rel="stylesheet" href="/src/css/member/memberjoin/memberjoin.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section>
		<div class="joincontent">
		<div class="textdiv">
		<form action="/memberjoin.do" method="post">
			<label for="memberId" class="col-lg-2 control-label">아이디</label>
			<div class="col-lg-6">
				<input type="text" class="form-control" name="memberId" id="memberId"
					data-rule-required="true" placeholder="생성할 아이디를 입력해주세요"><button class="btn btn-primary" id="idchk" name="idchk">중복확인</button><br>
					<span id="sId"></span>
			</div><br>
			<label for="memberPw" class="col-lg-2 control-label">패스워드</label>
			<div class="col-lg-6">
				<input type="password" class="form-control" id="memberPw"
					name="memberPw" data-rule-required="true" placeholder="패스워드"><br>
					<span id="sPw"></span>
			</div><br>
			<label for="memberPwRe" class="col-lg-2 control-label">패스워드
				확인</label>
			<div class="col-lg-6">
				<input type="password" class="form-control" id="memberPwRe"
					placeholder="패스워드 확인"><br>
					<span id="sRePw"></span>
			</div><br>
			<label for="memberName" class="col-lg-2 control-label">이름</label>
			<div class="col-lg-6	">
				<input type="text" class="form-control onlyHangul" id="memberName"
					name="memberName" placeholder="한글만 입력 가능합니다.">
			</div><br>
			<label for="memberNickname" class="col-lg-2 control-label">닉네임</label>
			<div class="col-lg-6">
				<input type="text" class="form-control" id="memberNickname"
					name="memberNickname" placeholder="닉네임">
			</div><br>
			<label for="age" class="col-lg-2 control-label">나이</label>
			<div class="col-lg-6">
				<input type="text" class="form-control" id="age"
					name="age" placeholder="나이">
			</div><br>
			<label for="email" class="col-lg-2 control-label">이메일</label>
			<div class="col-lg-5">
				<input type="email" class="form-control" id="email" name="email" placeholder="이메일">
				<button type="button" id="emailBtn" name="emailBtn" class="btn btn-primary">이메일 인증</button><br>
			</div><br>
			<label for="emailCode" class="col-lg-2 control-label" ">이메일 인증코드</label>
			<div class="col-lg-5">
				<input type="text" class="form-control" id="emailCode" name = "emailCode" placeholder="인증코드를 입력하세요."><button type="button" id="emailCodeBtn" name="emailCodeBtn" class="btn btn-primary" >인증코드 확인</button><br>
					<span id="mailMsg"></span>
			</div><br><br>
			<label for="phone" class="col-lg-2 control-label">휴대폰
				번호</label>
			<div class="col-lg-6">
				<input type="tel" class="form-control onlyNumber" id="phone"
					name="phone" placeholder="-를 제외하고 숫자만 입력하세요.">
			</div><br>
			<label for="gender" class="col-lg-2 control-label">성별</label>
			<div class="col-lg-6">
				<select class="form-control" id="gender" name="gender">
					<option value="M">남</option>
					<option value="F">여</option>
				</select>
			</div><br>
			</div>
			<div class="divBtn" id="divBtn">
				<button type="submit" class="btn btn-primary">회원가입</button>
				<button type="reset" class="btn btn-primary">초기화</button>
			</div>
			</form>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script>
//자바로 메일 보내기
var mailCode="";
var regExp = "";
$("#memberId").focusout(function(){
	regExp=/^[a-zA-Z][0-9]{5,15}$/;
	if($("#memberId").val() == ""){
		$("#sId").html("아이디를 입력해주세요.");
		$("#sId").css("color","red");
		return false;
	}
	if(regExp.test($("#memberId").val())){
		$("#sId").html("생성 가능한 아이디입니다.");
		$("#sId").css("color","green");
		
	}else{
		$("#sId").html("아이디 생성규격을 맞춰주세요<br>(대문자,소문자로 시작히여 15글자 이내)");
		$("#sId").css("color","red");
		return false;
	}
});
$("#memberPw").focusout(function(){
	regExp=/^[a-zA-Z][0-9]{5,15}/;
	if(regExp.test($("#memberPw").val())){
		$("#sPw").html("생성 가능한 비밀번호 입니다.");
		$("#sPw").css("color","green");
		
	}else{
		$("#sPw").html("비밀번호 규격을 맞춰주세요<br>(대문자,소문자,숫자 로  15글자 이내)");
		$("#sPw").css("color","red");
		return false;
	}
	
});
$("#memberPwRe").focusout(function(){
	if($("#memberPw").val()==$("#memberPwRe").val()){
		$("#sRePw").html("비밀번호가 일치합니다.");
		$("#sRePw").css("color","green");
	}else{
		$("#sRePw").html("비밀번호가 일치하지 않습니다.");
		$("#sRePw").css("color","red");	
		return false;
	}
});
$("#emailBtn").click(function(){	
	var email = $("#email").val();
	$.ajax({
		url : "/sendMail.do",
		type : "post",
		data : {email:email},
		success :function(data){
			mailCode=data;
			
			alert("이메일을 송신했습니다.");
		}
	})
});
$("#emailCodeBtn").click(function(){
	if($("#emailCode").val() == mailCode){
		$("#mailMsg").html('인증성공');
		$("#mailMsg").css('color','green');
	}else{
		$("#mailMsg").html('인증실패');
		$("#mailMsg").css('color','red');
		return false;
	}
})

</script>
</html>