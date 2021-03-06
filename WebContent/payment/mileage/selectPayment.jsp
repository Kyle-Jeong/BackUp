<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<link href="../../css/user_payment.min.css" rel="stylesheet">

<script type="text/JavaScript">
function isMoney() {

	if (!$(':input:radio[name=amount]:checked').val()) {
		alert("돈을 선택해 주세요");
		exit;
	}else if($(':input:radio[id=amount5]:checked').val() && f.box.value==""){
		alert("가격 입력해주세요");
		document.f.box.focus();
		exit;
	}
}

function isTool() {

	if (!$(':input:radio[name=tool]:checked').val()) {
		alert("충전 방식을 선택해 주세요");
		exit;
	}
}
function btnChk() {

	if(isMoney()){
		return;
	}if(isTool()){
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
			마일리지
		</h1>
	</div><br><br>
	<div class="col-md-6 col-md-offset-3">
		<form name="f" action="select.payment" method="post" >
			<input type="hidden" name = "mnum" value="${param.mnum}">
			<input type="hidden" name = "bway" value="1">
			<div class="form-group" id ="amount" name = "amount" class="form-control">
				<label for="money">결재 상품 선택</label>
				<div class="btn-group input-group" data-toggle="buttons"  name = "amount">
					<label class="btn btn-success">
					<input type="radio"	id="amount1" name="amount" value = "1000" onClick="this.form.box.readOnly=true" />1000원</label>
					<label class="btn btn-success">
					<input type="radio"	id="amount2" name="amount" value = "5000" onClick="this.form.box.readOnly=true" />5000원</label>
					<label class="btn btn-success">
					<input type="radio"	id="amount3" name="amount" value = "10000" onClick="this.form.box.readOnly=true" />10000원</label>
					<label class="btn btn-success">
					<input type="radio"	id="amount4" name="amount" value = "30000" onClick="this.form.box.readOnly=true" />30000원</label>
					<label class="btn btn-success">
					<input type="radio"	id="amount5" name="amount" value = "amount" onClick="this.form.box.readOnly=false"/>직접입력</label>
					<input type="text" name="box" maxlength="10"  onclick="boxchk()"  onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" size="6" style="ime-mode: disabled;">
				</div>
			</div>
			<br>
			<div class="form-group" id="tool" name="tool" class="form-control">
				<label for="tool">결재 수단</label>
				<div class="btn-group input-group" name="tool" data-toggle="buttons">
					<label class="btn btn-success">
					<input type="radio"	id="tool1" name="tool" value = "1" />휴대전화 </label>
					<label class="btn btn-success">
					<input type="radio"	id="tool2" name="tool" value = "2" />신용카드 </label>
				</div>
			</div>
			<br>
			<br>
			<div class="form-group text-center">
				<button type="button" class="btn btn-info" onclick="btnChk()">	결재요청<i class="fa fa-check spaceLeft"></i></button>
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
