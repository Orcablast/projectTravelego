<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap script -->
 <script src="/src/js/jquery/jquery-3.5.1.js"></script>
 <script src="/src/js/bootstrap/popper.min.js"></script>
 <script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
 <link rel="stylesheet" href="/src/css/member/memberTerms/memberTerms.css" />
 <script
      src="/src/js/fontawesome/8bd2671777.js"
      crossorigin="anonymous"
    ></script>
    <!-- Bootstrap script -->
 <script src="/src/js/jquery/jquery-3.5.1.js"></script>
 <script src="/src/js/bootstrap/popper.min.js"></script>
 <script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
 <link rel="stylesheet" href="/src/css/member/login/login.css" />
 <script
      src="/src/js/fontawesome/8bd2671777.js"
      crossorigin="anonymous"
    ></script>
    <!-- CSS here -->
    <link rel="stylesheet" href="/src/css/header/header.css" />
    <link rel="stylesheet" href="/src/css/footer/footer.css" />
    <link rel="stylesheet" href="/src/css/main/web_default.css" />
<script>
	$(function() {
		$('#chk').click(function() {
			$('input[type=checkbox]').prop('checked', this.checked);
		});
		$("form").submit(function() {
			var count = 0;
			var flag = false;
			var arr = $("input[name=mck]");
			for (var i = 0; i < arr.length; i++) {
				if (arr[i].checked) {
					count++;
				}
			}
			if (count < 3) {
				$("#result").html("필수 항목에 모두 동의해주세요.").css({
					"color" : "red",
					" font-size" : "5px"
				});
				return false;
			}
			if ($("input[name=status]:checked").length == 0) {
				$("#result").html("회원상태 선택해주세요.").css({
					"color" : "red",
					" font-size" : "10px"
				});
				return false;
			} else {
				flag = true;
				var user = $("input[type=radio]:checked").val();
				location.href = "/" + user + "joinFrm.do";
			}
			return false
		});

	});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section>
		<div style="margin-top: 100px;">
			<form name="agree" id="joinForm">
				<div class="join_box">
					<div class="checkBox check01">

						<div class="clearfix">
							<div class="checkAllBtn">
								<input type="checkbox" name="chkAll" id="chk" class="chkAll">
							</div>
							<div id="tf">이용약관에 전체 동의 합니다.</div>
						</div>
					</div>
					<div class="checkBox check02">
						<div class="clearfix">
							<div class="checkBtn">
								<input type="checkbox" name="mck">
							</div>
							<div id="tf">이용약관 동의(필수)</div>

						</div>
						<textarea style="resize: none;"> 제 1 장 총 칙
 
제 1 조 (목적)
본 약관은 Travelego 사이트가 제공하는 서비스(이하 “서비스”)의 이용 조건 및 절차, 이용자와 통합대출센터 역할을 하는 국립중앙도서관(이하 "센터")의 권리, 의무, 책임사항 및 기타 제반 사항을 규정함을 목적으로 합니다.
 
제 2 조 (정의)
①  본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. ‘사이트’라 함은 Travelego 홈페이지를 말합니다.
2. '회원'이라 함은 사이트에 접속하여 이 약관에 동의하고, 개인 정보를 제공하여 회원 등록을 한 자로서, Travelego 참여 도서관에서 제공하는 자료와 서비스를 이용할 수 있는 자를 말합니다.
3. '이용계약'이라 함은 본 약관을 포함하여 서비스 이용과 관련하여 센터와 회원 간에 체결하는 모든 계약을 말합니다.
4. '회원ID(아이디)'라 함은 회원의 식별과 서비스 이용을 위하여 회원이 선정하고 센터에서 부여하는 영문자와 숫자의 조합을 말합니다.
5. '비밀번호'라 함은 이용자ID로 식별되는 회원의 본인 여부를 검증하기 위하여 회원이 설정한 고유의 문자와 숫자의 조합을 말합니다.
6. ‘게시물’이라 함은 회원이 서비스를 이용하면서 게시한 글, 사진, 동영상 등 각종 파일과 링크 등을 말합니다.
7. '탈퇴'라 함은 센터 또는 회원이 이용계약을 종료하는 것을 말합니다.
②  본 약관에서 사용하는 용어 중 제1항에서 정의하지 않은 용어는 관계 법령 및 사이트 별 안내에서 정하는 바에 따르며, 그 외에는 일반 관례에 따릅니다.
 
제 3 조 (약관의 효력 및 변경) 
①  본 약관은 사이트를 통해 온라인으로 공시되고, 합리적인 사유가 발생할 경우 센터는 관련 법령에 위배되지 않는 범위 안에서 개정할 수 있습니다. 개정된 약관은 정당한 절차에 따라 사이트를 통해 공지됨으로써 효력이 발휘됩니다.
②  회원은 정기적으로 사이트를 방문하여 약관의 변경사항을 확인하여야 합니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 회원의 피해는 센터에서 책임지지 않습니다.
③  회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴(해지)를 요청할 수 있습니다.
 
제 4 조 (약관 외 준칙) 
①  센터는 필요한 경우 개별 서비스에 대하여 약관 및 이용 규정을 정할 수 있으며, 본 약관과 서로 상충되는 경우에는 서비스별 안내의 내용을 우선하여 적용합니다.
②  본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 기타 관련 법령의 규정에 의합니다.

 
제 2 장 이용 계약의 성립 및 해지
 
제 5 조 (이용계약의 성립)
①  이용계약은 회원이 되고자 하는 자가 본 이용 약관에 동의와 이용 신청에 대하여 센터의 이용 승낙으로 성립됩니다.
②  이용계약에 대한 동의는 이용 신청 당시 사이트의 ‘확인’버튼을 누름으로써 의사 표시를 합니다.
 
제 6 조 (회원 가입 및 탈퇴)
①  회원 가입은 신청자가 소정의 신청 양식에서 요구하는 사항을 기록하여 가입을 완료하는 것으로 성립됩니다.
②  모든 회원은 반드시 회원 본인의 정보를 제공하여야만 서비스를 이용할 수 있으며, 타인의 정보를 도용하거나 허위의 정보를 등록하는 등 본인의 진정한 정보를 등록하지 않은 회원은 서비스 이용과 관련하여 아무런 권리를 주장할 수 없으며, 관계 법령에 따라 처벌 받을 수 있습니다.
③  다음 각 호의 1에 해당되는 경우 회원 가입을 취소할 수 있습니다.
1. 다른 사람의 명의를 사용하여 신청하였을 경우
2. 회원가입 신청서의 내용을 허위로 기재하였거나 신청하였을 경우
3. 사회의 안녕 질서 혹은 미풍양속을 저해할 목적으로 신청하였을 경우
4. 다른 사람의 사이트 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 경우
5. 사이트를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우
6. 기타 사이트가 정한 회원가입요건이 미비 되었을 때 
④  회원은 이용 계약을 해지하고자 하는 때는 본인이 회원 탈퇴를 해야 합니다.
⑤  회원이 작성한 게시물 및 제공한 정보는 센터의 정책에 의해 일정기간을 유지하고 보관 또는 소멸됩니다. 다만, 타인에 의해 재게시되거나, 게시판, 커뮤니티, 카페 등 공유 및 알림의 목적으로 등록된 게시물 등은 삭제되지 않으니 사전에 삭제 후 탈퇴하여야 합니다. 
 
제 7 조 (회원ID 부여 및 변경)
①  센터는 회원에 대하여 약관 및 이용 규정에 정하는 바에 따라 회원ID를 부여할 수 있습니다. 
②  회원ID는 원칙적으로 변경이 불가능하므로 부득이한 사유로 인하여 변경하고자 하는 경우에는 탈퇴하고 변경하고자 하는 회원ID로 재가입해야 합니다.
③  회원ID가 부정확하거나 불합리할 경우 센터의 판단에 따라 직권으로 변경될 수도 있습니다. 이 때 필요시 회원에게 사전 통보할 수 있습니다.
④  회원ID 및 비밀번호의 관리책임은 회원에게 있습니다. 이를 소홀히 관리하여 발생하는 서비스 이용 상의 손해 또는 제3자에 의한 부정 이용 등에 대한 책임은 모두 회원에게 있으며 센터는 그에 대해 책임지지 않습니다.
 
제 8 조 (이용 신청의 승낙과 제한)
①  센터는 이용신청에 대하여 업무 수행 상 또는 기술상 지장이 없는 경우에 접수 순서에 따라 서비스 이용을 승낙하는 것을 원칙으로 합니다.
②  이용자의 신청내용이 센터에서 규정한 제반사항을 위반한 경우 승낙을 보류할 수 있습니다.
③  센터는 서비스 이용신청이 다음 각 호의 1에 해당하는 경우에는 그 신청에 대하여 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
1. 사이트 설비의 여유가 없는 경우
2. 사이트의 기술상 지장이 있는 경우
3. 기타 사유로 이용승낙이 곤란한 경우
④  센터는 회원 가입 절차 완료 이후 제2항 각 호에 따른 사유가 발견된 경우 이용 승낙을 철회할 수 있습니다.
 
제 9 조  (개인정보의 보호 및 사용)
①  센터는 회원정보를 "공공기관의 개인정보보호에 관한 법률"에 의해 보호합니다.
②  회원의 개인정보는 오직 본인만이 열람/수정/삭제 할 수 있습니다. 또한 비밀번호 등이 타인에게 노출되지 않도록 철저히 관리해야하며, 본인의 회원ID나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 센터에 신고하여야 합니다. 신고를 하지 않아 발생하는 모든 책임은 회원 본인에게 있습니다.
③  센터는 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 다만, 다음과 같은 경우에 법이 허용하는 범위 내에서 회원의 개인정보를 제3자에게 제공할 수 있습니다.
1. 수사기관이나 기타 다른 정부기관으로부터 정보제공을 요청 받은 경우
2. 회원의 법령 또는 약관의 위반을 포함하여 부정행위 확인 등의 정보보호 업무를 위해 필요한 경우
3. 기타 법률에 의해 요구되는 경우

 
제 3 장 서비스의 이용

제 11 조 (서비스의 제공)
①  센터는 회원의 이용신청을 승낙한 때부터 서비스를 개시합니다. 단, 일부 서비스의 경우에는 지정된 일자부터 서비스를 개시합니다.
②  서비스는 센터의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간 운영을 원칙으로 합니다. 단, 센터는 시스템 정기점검, 증설 및 교체를 위해 센터가 정한 날이나 시간에 서비스를 일시 중단할 수 있으며, 예정되어 있는 작업으로 인한 서비스 일시 중단은 사이트를 통해 사전에 공지합니다.
③  센터는 긴급한 시스템 점검, 증설 및 교체, 설비의 장애, 서비스 이용의 폭주, 국가비상사태, 정전 등 부득이한 사유가 발생한 경우 사전 예고 없이 일시적으로 서비스의 전부 또는 일부를 중단할 수 있습니다. 
④  센터는 서비스 개편 등 서비스 운영 상 필요한 경우 회원에게 사전 예고 후 서비스의 전부 또는 일부의 제공을 중단할 수 있습니다.

 
제12조  (서비스의 변경)
①  센터는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 서비스를 변경할 수 있습니다.
②  서비스의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전 7일 이상 해당 서비스 초기화면에 게시하여야 합니다.
③  센터는 정책 및 운영의 필요에 따라 사전공지를 통해 무료로 제공되는 서비스의 일부 또는 전부를 수정, 중단, 변경할 수 있으며, 이용회원에게는 별도의 보상을 하지 않습니다.
 
제 13 조 (게시물의 관리)  
①  회원이 등록한 게시물 등으로 인하여 본인 또는 타인에게 손해나 기타 문제가 발생하는 경우 전적으로 회원에게 책임이 있으며, 센터는 별도의 책임을 지지 않습니다.
②  센터는 다음 각 호의 1에 해당하는 게시물 등을 회원의 사전 동의 없이 임시 게시 중단, 수정, 삭제, 이동 또는 등록 거부 등의 관련 조치를 취할 수 있습니다.
1. 본 서비스 약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우
2. 다른 회원 또는 제 3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우
3. 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우
4. 불법복제 또는 해킹을 조장하는 내용인 경우
5. 영리를 목적으로 하는 광고일 경우
6. 범죄와 결부된다고 객관적으로 인정되는 내용일 경우
7. 다른 이용자 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우
8. 기타 관계법령에 위배된다고 판단되는 경우
③  센터는 게시물 등에 대하여 제3자로부터 명예훼손, 지적재산권 등의 권리 침해를 이유로 게시중단 요청을 받은 경우 이를 임시로 게시중단(전송중단)할 수 있으며, 게시중단 요청자와 게시물 등록자 간에 소송, 합의 기타 이에 준하는 관련기관의 결정 등이 이루어져 도서관에 접수된 경우 이에 따릅니다.
④  해당 게시물 등에 대해 임시게시 중단이 된 경우, 게시물을 등록한 회원은 재게시(전송재개)를 센터에 요청할 수 있으며, 게시 중단일로부터 3개월 내에 재게시를 요청하지 아니한 경우 센터는 이를 삭제할 수 있습니다.
 
제 14 조 (게시물의 저작권)
①  서비스에 대한 저작권 및 지적재산권은 센터에 귀속됩니다.
②  회원이 서비스 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 단, 센터는 서비스의 운영, 전시, 전송, 배포, 홍보의 목적으로 회원의 별도의 허락 없이 무상으로 저작권법에 규정하는 공정한 관행에 합치되도록 합리적인 범위 내에서 다음과 같이 회원이 등록한 게시물을 사용할 수 있습니다.
1. 서비스 내에서 회원 게시물의 복제, 수정, 개조, 전시, 전송, 배포 및 저작물의 원래의 속성을 해치지 않는 범위 내에서의 편집 저작물의 작성
2. 공공기관, 민간기관, 포털, 방송사, 통신사 등 서비스 연계기관에게 회원의 게시물 내용을 제공, 전시 혹은 홍보
③  센터는 전항 이외의 방법으로 회원의 게시물을 이용하고자 하는 경우, 전화, 팩스, 전자우편 등의 방법을 통해 사전에 회원의 동의를 얻어야 합니다. 회원은 언제든지 고객센터를 통해 해당 게시물에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다.
④  회원의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 회원이 부담하여야 합니다.
 
제 15 조 (서비스 이용제한) 
①  센터는 회원이 서비스 이용내용에 있어서 본 약관 제 17조의 내용을 위반하거나, 다음 각 호의 1에 해당하는 경우 서비스 이용제한, 초기화, 이용계약 해지 및 기타 해당 조치를 할 수 있습니다. 
1. 회원정보에 부정한 내용을 등록하거나 타인의 회원ID, 비밀번호 기타 개인정보를 도용하는 행위 또는 회원ID를 타인과 거래하거나 제공하는 행위 
2. 공공질서 및 미풍양속에 위반되는 저속, 음란한 내용 또는 타인의 명예나 프라이버시를 침해할 수 있는 내용을 전송, 게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위 
3. 다른 회원을 희롱 또는 위협하거나, 특정 회원에게 지속적으로 고통 또는 불편을 주는 행위 
4. 센터로부터 특별한 권리를 부여 받지 않고 센터가 제공하는 프로그램을 변경하거나, 서버를 해킹하거나, 사이트 또는 게시된 정보의 일부분 또는 전체를 임의로 변경하는 행위 
5. 서비스를 통해 얻은 정보를 센터의 사전 승낙 없이 서비스 이용 외의 목적으로 복제하거나, 이를 출판 및 방송 등에 사용하거나, 제 3자에게 제공하는 행위 
6. 센터의 운영진, 직원 또는 관계자를 사칭하거나 고의로 서비스를 방해하는 등 정상적인 서비스 운영에 방해가 될 경우 
7. 방송통신심의위원회 등 관련 공공기관의 시정 요구가 있는 경우 
8. 약관을 포함하여 센터가 정한 제반 규정을 위반하거나 범죄와 결부된다고 객관적으로 판단되는 등 제반 법령을 위반하는 행위 
②  회원은 본 조에 따른 이용제한 등에 대해 센터가 정한 절차에 따라 이의신청을 할 수 있으며 정당하다고 인정하는 경우 즉시 서비스의 이용을 재개합니다.
 
 
제 4 장 계약 당사자의 의무 및 책임
 
제 16 조 (센터의 의무)
①  센터는 회원이 희망한 서비스 제공 개시일에 특별한 사정이 없는 한 서비스를 이용할 수 있도록 하여야 합니다.
②  센터는 계속적이고 안정적인 서비스의 제공을 위하여 설비에 장애가 생기거나 멸실된 때에는 부득이한 사유가 없는 한 지체 없이 이를 수리 또는 복구해야 합니다.
③  센터는 회원이 안전하게 서비스를 이용할 수 있도록 개인정보보호를 위한 보안시스템을 구축하며 개인정보 보호정책을 공시하고 준수하여야 합니다.
④  센터는 회원으로부터 제기되는 의견이나 불만이 정당하다고 객관적으로 인정될 경우에는 적절한 절차를 거쳐 즉시 처리하여야 합니다. 다만, 즉시 처리가 곤란한 경우는 회원에게 그 사유와 처리일정을 통보하여야 합니다.
⑤  센터는 회원의 귀책사유로 인한 서비스 이용 장애에 대하여 책임을 지지 않습니다.

 
제 17 조 (회원의 의무)
①  회원은 회원가입 신청 또는 회원정보 변경 시 모든 사항을 사실에 근거하여 본인의 정확한 정보로 작성하여야 하며, 허위 또는 타인의 정보를 등록할 경우 이와 관련된 모든 권리를 주장할 수 없습니다.
②  회원은 관계 법령, 본 약관의 규정, 이용 안내 및 센터가 공지한 주의사항, 센터가 통지하는 사항 등을 준수하여야 하며, 기타 센터의 업무에 방해가 되는 행위, 센터의 명예를 손상시키는 행위, 타인에게 피해를 주는 행위를 해서는 안됩니다.
③  회원은 본인의 회원ID와 비밀번호를 제3자에게 이용하게 해서는 안되며, 이용계약사항이 변경된 경우에 해당 절차를 거쳐 이를 센터에 즉시 알려야 합니다.
④  회원은 센터의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없으며, 그 영리행위의 결과에 대해 센터는 책임을 지지 않습니다. 또한 회원은 이와 같은 영리행위로 센터가 손해를 입은 경우, 회원은 센터에 대해 손해배상 의무를 지며, 센터는 해당 회원에 대해 서비스 이용제한 및 적법한 절차를 거쳐 손해배상 등을 청구할 수 있습니다. 
⑤  회원은 센터의 명시적 동의가 없는 한 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여할 수 없으며 이를 담보로 제공할 수 없습니다.
⑥  회원은 서비스를 이용하여 얻은 정보를 센터의 사전승낙 없이 복사, 복제, 변경, 번역, 출판·방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.
⑦  회원은 센터 및 제 3자의 지적 재산권을 포함한 제반 권리를 침해하거나 다음 각 호의 행위를 하여서는 안됩니다.
1. 다른 회원의 ID를 부정 사용하는 행위
2. 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위
3. 선량한 풍속, 기타 사회질서를 해하는 행위
4. 타인의 명예를 훼손하거나 모욕하는 행위
5. 타인의 지적재산권 등의 권리를 침해하는 행위
6. 해킹행위 또는 컴퓨터바이러스의 유포행위
7. 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위
8. 서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위

 
제 5 장 손해배상 및 기타사항
 
제 18 조 (손해배상)
센터와 회원은 서비스 이용과 관련하여 고의 또는 과실로 상대방에게 손해를 끼친 경우에는 이를 배상하여야 합니다.

 
제 19 조 (면책조항)
① 센터는 천재지변, 전쟁, 기간통신사업자의 서비스 중지 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.
② 센터는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다.
③ 센터는 회원의 컴퓨터 오류에 의해 손해가 발생한 경우, 또는 회원이 신상정보 및 전자우편 주소를 부실하게 기재하여 손해가 발생한 경우 책임을 지지 않습니다.
④ 센터는 회원이 서비스를 이용하여 기대하는 결과를 얻지 못하거나 상실한 것에 대하여 책임을 지지 않으며, 서비스를 이용하면서 얻은 자료로 인한 손해에 대하여 책임을 지지 않습니다. 
⑤ 센터는 회원이 서비스에 게재한 각종 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 대하여 책임을 지지 않으며, 회원 상호간 및 회원과 제 3자 상호 간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없고, 이로 인한 손해를 배상할 책임도 없습니다.
⑥ 센터는 회원의 게시물을 등록 전에 사전심사 하거나 상시적으로 게시물의 내용을 확인 또는 검토하여야 할 의무가 없으며, 그 결과에 대한 책임을 지지 아니합니다.

 
제 20 조 (관할 법원)
본 서비스 이용으로 발생한 분쟁에 대해 소송이 제기되는 경우 대한민국 서울중앙지방법원을 관할 법원으로 합니다.

 
부칙
1. 본 약관은 2010년 10월 1일부터 적용됩니다.    
       </textarea>
					</div>
					<div class="checkBox check03">
						<div class="clearfix">
							<div class="checkBtn">
								<input type="checkbox" name="mck">
							</div>
							<div id="tf">개인정보 수집 및 이용에 대한 안내(필수)</div>
						</div>
						<textarea style="resize: none;">. 목적 : 지원자 개인 식별, 지원의사 확인, 입사전형의 진행, 고지사항 전달, 입사 지원자와의 원활한 의사소통, 지원이력 확인 및 면접 불합격자 재지원 제한
2. 항목 : 아이디(이메일주소), 비밀번호, 이름, 생년월일, 휴대폰번호
3. 보유기간 : 회원 탈퇴 시까지 보유 (단, 지원이력 정보는 일방향 암호화하여 탈퇴일로부터 1년간 보관 후 파기합니다.)
       </textarea>
					</div>
					<div class="checkBox check03">
						<div class="clearfix">
							<div class="checkBtn">
								<input type="checkbox" name="mck" id="chk">
							</div>
							<div>위치정보 이용약관 동의(필수)</div>
						</div>

						<textarea>제 1 조 (목적)
이 약관은 Travelego 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
제 2 조 (약관 외 준칙)
이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.
제 3 조 (서비스 내용 및 요금)
1. ①회사는 직접 위치정보를 수집하거나 위치정보사업자로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.
1. 1.Geo Tagging 서비스: 게시물에 포함된 개인위치정보주체 또는 이동성 있는 기기의 위치정보가 게시물과 함께 저장됩니다.
2. 2.위치정보를 활용한 검색결과 제공 서비스: 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과 및 주변결과(맛집, 주변업체, 교통수단 등)를 제시합니다.
3. 3.위치정보를 활용한 친구찾기 및 친구맺기: 현재 위치를 활용하여 친구를 찾아주거나 친구를 추천하여 줍니다.
4. 4.연락처 교환하기: 위치정보를 활용하여 친구와 연락처를 교환할 수 있습니다.
5. 5.이용자 위치를 활용한 광고정보 제공: 검색결과 또는 기타 서비스 이용 과정에서 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 광고소재를 제시합니다.
6. 6.이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을 차단합니다.
7. 7.위치정보 공유: 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 안심귀가 등을 목적으로 지인 또는 개인위치정보주체가 지정한 제3자에게 공유합니다.
8. 8.길 안내 등 생활편의 서비스 제공: 교통정보와 길 안내 등 최적의 경로를 지도로 제공하며, 주변 시설물 찾기, 뉴스/날씨 등 생활정보, 긴급구조 서비스 등 다양한 운전 및 생활 편의 서비스를 제공합니다.

②제1항 위치기반서비스의 이용요금은 무료입니다.
제 4 조 (개인위치정보주체의 권리)
1. ①개인위치정보주체는 개인위치정보 수집 범위 및 이용약관의 내용 중 일부 또는 개인위치정보의 이용ㆍ제공 목적, 제공받는 자의 범위 및위치기반서비스의 일부에 대하여 동의를 유보할 수 있습니다.
2. ②개인위치정보주체는 개인위치정보의 수집ㆍ이용ㆍ제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다.
3. ③개인위치정보주체는 언제든지 개인위치정보의 수집ㆍ이용ㆍ제공의 일시적인 중지를 요구할 수 있습니다.이 경우 회사는 요구를 거절하지 아니하며, 이를 위한 기술적 수단을 갖추고 있습니다
4. ④개인위치정보주체는 회사에 대하여 아래 자료의 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다.이 경우 회사는 정당한 이유 없이 요구를 거절하지 아니합니다.
1. 1.개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료
2. 2.개인위치정보주체의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법령의 규정에 의하여 제3자에게 제공된 이유 및 내용
⑤회사는 개인위치정보주체가 동의의 전부 또는 일부를 철회한 경우에는 지체 없이 수집된 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 파기합니다.단, 동의의 일부를 철회하는 경우에는 철회하는 부분의 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료에 한합니다.
⑥개인위치정보주체는 제1항 내지 제4항의 권리행사를 위하여 이 약관 제13조의 연락처를 이용하여 회사에 요구할 수 있습니다.
제 5 조 (법정대리인의 권리)
1. ①회사는 만14세 미만 아동으로부터 개인위치정보를 수집ㆍ이용 또는 제공하고자 하는 경우에는 만14세 미만 아동과 그 법정대리인의 동의를 받아야 합니다.
2. ②법정대리인은 만14세 미만 아동의 개인위치정보를 수집ㆍ이용ㆍ제공에 동의하는 경우 동의유보권, 동의철회권 및 일시중지권, 열람ㆍ고지요구권을행사할 수 있습니다.
제 6 조 (위치정보 이용ㆍ제공사실 확인자료 보유근거 및 보유기간)
회사는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 위치정보시스템에자동으로 기록하며, 6개월 이상 보관합니다.
제 7 조 (서비스의 변경 및 중지)
1. ①회사는 위치정보사업자의 정책변경 등과 같이 회사의 제반 사정 또는 법률상의 장애 등으로 서비스를 유지할 수 없는 경우, 서비스의 전부 또는 일부를제한, 변경하거나 중지할 수 있습니다.
2. ②제1항에 의한 서비스 중단의 경우에는 회사는 사전에 인터넷 등에 공지하거나 개인위치정보주체에게 통지합니다.
제 8 조 (개인위치정보 제3자 제공시 즉시 통보)
1. ①회사는 개인위치정보주체의 동의 없이 당해 개인위치정보주체의 개인위치정보를 제3자에게 제공하지 아니하며, 제3자 제공 서비스를 제공하는 경우에는제공 받는 자 및 제공목적을 사전에 개인위치정보주체에게 고지하고 동의를 받습니다.
2. ②회사는 개인위치정보를 개인위치정보주체가 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신단말장치로 매회 개인위치정보주체에게제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다.
3. ③다만, 아래에 해당하는 경우에는 개인위치정보주체가 미리 특정하여 지정한 통신단말장치 또는 전자우편주소 등으로 통보합니다.
1. 1.개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우
2. 2.개인위치정보주체가 개인위치정보를 수집한 당해 통신단말장치 외의 통신단말장치 또는 전자우편주소 등으로 통보할 것을 미리 요청한 경우
제 9 조 (8세 이하의 아동 등의 보호의무자의 권리)
1. ①회사는 아래의 경우에 해당하는 자(이하 “8세 이하의 아동”등이라 한다)의 보호의무자가 8세 이하의 아동 등의 생명 또는 신체보호를 위하여 개인위치정보의 이용 또는 제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다.
1. 1.8세 이하의 아동
2. 2.금치산자
3. 3.장애인복지법제2조제2항제2호의 규정에 의한 정신적 장애를 가진 자로서 장애인고용촉진및직업재활법 제2조제2호의 규정에 의한 중증장애인에 해당하는 자(장애인복지법 제29조의 규정에 의하여 장애인등록을 한 자에 한한다)
②8세 이하의 아동 등의 생명 또는 신체의 보호를 위하여 개인위치정보의 이용 또는 제공에 동의를 하고자 하는 보호의무자는 서면동의서에 보호의무자임을 증명하는 서면을 첨부하여 회사에 제출하여야 합니다.
③보호의무자는 8세 이하의 아동 등의 개인위치정보 이용 또는 제공에 동의하는 경우 개인위치정보주체 권리의 전부를 행사할 수 있습니다.
제 10 조 (손해배상)
개인위치정보주체는 회사의 위치정보의 보호 및 이용 등에 관한 법률 제15조 내지 26조의 규정을 위반한 행위로 손해를 입은 경우에 회사에 대하여 손해배상을 청구할 수 있습니다. 이 경우 회사는 고의 또는 과실이 없음을 입증하지 아니하면 책임을 면할 수 없습니다.
제 11 조 (분쟁의 조정)
1. ①회사는 위치정보와 관련된 분쟁에 대하여 개인위치정보주체와 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 방송통신위원회에 재정을 신청할 수 있습니다.
2. ②회사 또는 개인위치정보주체는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 개인정보보호법에 따라 개인정보분쟁조정위원회에 조정을 신청할 수 있습니다.
제 12 조 (사업자 정보)
회사의 상호, 주소, 전화번호 그 밖의 연락처는 다음과 같습니다.상호: Travelego 주식회사주소: 서울특별시 영등포구 선유동2로 57 (이레빌딩) [양평동4가 2] 전화번호: 1588-0000ㄴ 이메일 주소: Travelego@naver.com
부칙
제 1 조 시행일
2015년 6월 2일부터 시행되던 종전의 약관은 본 약관으로 대체하며, 본 약관은 2015년 11월 26일부터 적용됩니다.제 2 조 위치정보관리 책임자 정보
회사는 다음과 같이 위치정보 관리책임자를 지정하여 이용자들이 서비스 이용과정에서 발생한 민원사항 처리를 비롯하여 개인위치정보주체의 권리 보호를 위해 힘쓰고 있습니다.
위치정보 관리책임자 : (개인)정보보호 담당 부서 임원(개인정보 보호책임자 겸직)전화번호 : 1588-3820이메일 주소 : privacy@naver.com
       </textarea>
					</div>
					<div class="checkBox check04">
						<div class="clearfix">
							<div class="checkBtn">
								<input type="checkbox" name="chk">
							</div>
							<div>이벤트 등 프로모션 알림 메일 수신(선택)</div>
						</div>
						<div id="result"></div>
					</div>
					<div class="status">
						회원 상태(필수) : <label for="member">일반회원<input type="radio"
							name="status" id="member" value="member"></label> <label
							for="company">법인회원</label> <input type="radio" name="status"
							id="company" value="company">
					</div>
					<br>
					<div class="footBtwrap clearfix">
						<div>
							<button type="reset" id="fpmgBt1" value="취소"
								onclick="location.href='/index.jsp';">취 소</button>
						</div>
						<div>
							<button type="submit" value="동의" id="fpmgBt2"
								onclick="return checkstatus(); ">동 의</button>
						</div>
					</div>

				</div>


			</form>

		</div>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>