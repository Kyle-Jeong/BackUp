<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<link href="../../css/user_payment.min.css" rel="stylesheet">
<script type="text/JavaScript">


function isCom() {

	if (!$(':input:radio[name=tel_company]:checked').val()) {
		alert("통신사를 선택해 주세요");
		exit;
	}
}

function isNum() {
	
	if (document.f.tel_num.value == "") {
		alert("휴대전화번호를 적어주세요");
		document.f.tel_num.focus();
		exit;
	}else if(f.tel_num.value.length !=11){
		alert("휴대전화 전화 번호는 최대 11자리 이상입니다.");
		f.tel_num.focus();
		exit
	}
	
	
	if (document.f.tel_cnum1.value == ""||
		document.f.tel_cnum2.value == "") {
		alert("주민 번호를 적어주세요");
		document.f.card_num.card_num1.focus();
		exit;
	}else if(f.tel_cnum1.value.length !=6){
		alert("주민 번호 앞자리는 6자리 입력 필수 입니다.");
		f.card_num1.focus();
		exit;
	}
	
	/* if(	exptext.test(document.f.tel_cnum1.value)==false||
		exptext.test(document.f.tel_cnum2.value)==false	){
		alert("주민 번호가 이상합니다!!");
		document.f.tel_cnum1.focus();
		exit;
	} */
	
	
}

function chkBoxCheck(intChkNumber) {

		if (eval("document.f.box[" + 0 + "].checked") == true) {
		for (j = 1; j < 4; j++) {
		document.f.box[j].checked = true;
			}
		}
}

function isBox() {

	for (j = 1; j < 4; j++) {
	if (eval("document.f.box[" + j + "].checked") != true) {
		alert("약관에 동의해 주세요!");
		exit;
		}
	}

}

function tel_chk() {

	if(isCom()){
		return;
	}if(isNum()){
		return;
	}if(isBox()){
		return;
	}
	document.f.submit();
	
}





</script>

<script type="text/javascript">

function onlyNumber(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
			|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

</script>

<body style="padding: 10px">
	<div class="page-header">
		<h1>
			휴대폰 충전
		</h1>
	</div>
	<div class="col-md-6 col-md-offset-3">
		<form name="f" action="purchasePro.payment" method="post">
			<input type="hidden" name = "mnum" value="${param.mnum}">
			<input type="hidden" name = "bway" value="${param.bway}">
			<input type="hidden" name = "amount" value="${amount}">
		<div class ="label">
		<label>결제 금액${amount}원</label>
		</div><br><br>
		<div class="form-group" id = "tel_company">
			<label for="tel_company">이동 통신사</label>
				<div class="btn-group input-group" data-toggle="buttons">
					<input type="radio" id = "tel_company1" name="tel_company" /><label>SKT</label>
					<input type="radio" id = "tel_company2" name="tel_company" /><label>KT</label>
					<input type="radio" id = "tel_company3" name="tel_company" /><label>LGU</label>
					<input type="radio" id = "tel_company4" name="tel_company" /><label>알뜰폰</label>
				</div>
		</div><br>
		<div>
		<label>휴대전화번호</label><br>
		<input type="text" id = "tel_num" name="tel_num" class="form-control" 

		onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="ime-mode: disabled;" maxlength="11"><br>
		</div><br>
		<label>주민등록번호</label><br>
		<div>
		<input type="text" id = "tel_cnum1" name="tel_cnum1" class="form-control"  size="6"
			onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="ime-mode: disabled;" maxlength="6"> - 
		<input type="text" id = "tel_cnum2" name="tel_cnum2" class="form-control"  size="1"
			onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="ime-mode: disabled;"maxlength="1">XXXXXX
		</div>
		<br>
		<div class="form-group">
				<h4>약관</h4>
				<input type="checkbox" id = "box1" name="box" onclick="chkBoxCheck(0)" > 전채 선택 <br><br>
				<input type="checkbox" id = "box2" name="box">
				<textarea class="form-control" rows="5" readonly="readonly">
임시약관 1

이 이용약관(이하 ‘약관’이라 합니다.)은 와이낫(이하 ‘회사’라 합니다.)가 제공하는 와이낫(WhyNot.com) 및 와이낫관련 제반 서비스(이하 ‘서비스’라 한다.)를 이용고객(이하 ‘회원’이라 합니다.)이 이용함에 있어 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 구체적으로 규정함을 목적으로 합니다.
제2조 [용어의 정의]

(1) 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
– 서비스 : 구현되는 단말기와 상관없이 “회원” 혹은 웹사이트 방문자가 이용할 수 있는 인프런 서비스를 의미합니다.
– 회원 : “회사”의 서비스에 접속하여 본 약관에 따라 회사와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 이용하는 고객을 말합니다.
– 이용계약 : 이 약관을 포함하여 서비스 이용과 관련하여 회사와 회원 간에 체결하는 모든 계약을 말합니다. – 아이디(ID) : 회원의 식별 및 서비스 이용을 위하여 회원의 신청에 따라 회사가 회원 별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.
– 이메일 : 회원가입이나 로그인 등에 사용되는 단일한 이메일 주소를 말합니다.
– 비밀번호(Password) : 아이디(ID)로 식별되는 회원의 본인 여부를 검증하기 위하여 회원이 설정하여 회사에 등록한 고유의 문자와 숫자의 조합을 말합니다.
– 유료서비스 : 회사가 유료로 제공하는 각종 온라인디지털콘텐츠(동영상 강좌, 프리미엄 교육 정보, 기타 유료 콘텐츠를 포함.) 및 제반 서비스를 의미합니다.
– 충전 : 회사가 지정한 지불수단을 이용하여 회원이 현금을 회사에 지불하면 회사가 이에 상응하는 수량의 ‘사이버머니’를 당해 회원에게 지급하는 것을 말합니다.
– 해지 : 회사 또는 회원이 이용계약을 해약하는 것을 말합니다.
(2) 이 약관에서 사용하는 용어 중 제1항에서 정하지 아니한 것은 관계 법령 및 서비스 별 안내에서 정하는 바에 따르며, 그 외에는 일반 관례에 따릅니다.
				</textarea>
				<input type="checkbox" id = "box3" name="box">
				<textarea class="form-control" rows="5" readonly="readonly">
임시약관 2

이 이용약관(이하 ‘약관’이라 합니다.)은 와이낫(이하 ‘회사’라 합니다.)가 제공하는 와이낫(WhyNot.com) 및 와이낫관련 제반 서비스(이하 ‘서비스’라 한다.)를 이용고객(이하 ‘회원’이라 합니다.)이 이용함에 있어 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 구체적으로 규정함을 목적으로 합니다.
제2조 [용어의 정의]

(1) 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
– 서비스 : 구현되는 단말기와 상관없이 “회원” 혹은 웹사이트 방문자가 이용할 수 있는 인프런 서비스를 의미합니다.
– 회원 : “회사”의 서비스에 접속하여 본 약관에 따라 회사와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 이용하는 고객을 말합니다.
– 이용계약 : 이 약관을 포함하여 서비스 이용과 관련하여 회사와 회원 간에 체결하는 모든 계약을 말합니다. – 아이디(ID) : 회원의 식별 및 서비스 이용을 위하여 회원의 신청에 따라 회사가 회원 별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.
– 이메일 : 회원가입이나 로그인 등에 사용되는 단일한 이메일 주소를 말합니다.
– 비밀번호(Password) : 아이디(ID)로 식별되는 회원의 본인 여부를 검증하기 위하여 회원이 설정하여 회사에 등록한 고유의 문자와 숫자의 조합을 말합니다.
– 유료서비스 : 회사가 유료로 제공하는 각종 온라인디지털콘텐츠(동영상 강좌, 프리미엄 교육 정보, 기타 유료 콘텐츠를 포함.) 및 제반 서비스를 의미합니다.
– 충전 : 회사가 지정한 지불수단을 이용하여 회원이 현금을 회사에 지불하면 회사가 이에 상응하는 수량의 ‘사이버머니’를 당해 회원에게 지급하는 것을 말합니다.
– 해지 : 회사 또는 회원이 이용계약을 해약하는 것을 말합니다.
(2) 이 약관에서 사용하는 용어 중 제1항에서 정하지 아니한 것은 관계 법령 및 서비스 별 안내에서 정하는 바에 따르며, 그 외에는 일반 관례에 따릅니다.
				</textarea>
				<input type="checkbox" id = "box4" name="box">
				<textarea class="form-control" rows="5" readonly="readonly">
임시약관 3

이 이용약관(이하 ‘약관’이라 합니다.)은 와이낫(이하 ‘회사’라 합니다.)가 제공하는 와이낫(WhyNot.com) 및 와이낫관련 제반 서비스(이하 ‘서비스’라 한다.)를 이용고객(이하 ‘회원’이라 합니다.)이 이용함에 있어 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 구체적으로 규정함을 목적으로 합니다.
제2조 [용어의 정의]

(1) 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
– 서비스 : 구현되는 단말기와 상관없이 “회원” 혹은 웹사이트 방문자가 이용할 수 있는 인프런 서비스를 의미합니다.
– 회원 : “회사”의 서비스에 접속하여 본 약관에 따라 회사와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 이용하는 고객을 말합니다.
– 이용계약 : 이 약관을 포함하여 서비스 이용과 관련하여 회사와 회원 간에 체결하는 모든 계약을 말합니다. – 아이디(ID) : 회원의 식별 및 서비스 이용을 위하여 회원의 신청에 따라 회사가 회원 별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.
– 이메일 : 회원가입이나 로그인 등에 사용되는 단일한 이메일 주소를 말합니다.
– 비밀번호(Password) : 아이디(ID)로 식별되는 회원의 본인 여부를 검증하기 위하여 회원이 설정하여 회사에 등록한 고유의 문자와 숫자의 조합을 말합니다.
– 유료서비스 : 회사가 유료로 제공하는 각종 온라인디지털콘텐츠(동영상 강좌, 프리미엄 교육 정보, 기타 유료 콘텐츠를 포함.) 및 제반 서비스를 의미합니다.
– 충전 : 회사가 지정한 지불수단을 이용하여 회원이 현금을 회사에 지불하면 회사가 이에 상응하는 수량의 ‘사이버머니’를 당해 회원에게 지급하는 것을 말합니다.
– 해지 : 회사 또는 회원이 이용계약을 해약하는 것을 말합니다.
(2) 이 약관에서 사용하는 용어 중 제1항에서 정하지 아니한 것은 관계 법령 및 서비스 별 안내에서 정하는 바에 따르며, 그 외에는 일반 관례에 따릅니다.
				</textarea>
			</div>
			<div class="form-group text-center">
		</div><br><br>
			<div class="form-group text-center">
				<button type="button" class="btn btn-info" onclick="tel_chk()">결재요청<i class="fa fa-check spaceLeft"></i></button>
				<button type="button" class="btn btn-warning" onclick="self.close()">취소<i class="fa fa-times spaceLeft"></i></button>
			</div>
	</form>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
