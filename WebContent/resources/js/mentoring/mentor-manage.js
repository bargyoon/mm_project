let renderApplying = () => {
	document.querySelector('#type_manage').innerHTML = "신청중인 멘토링";
	
	document.querySelector('#expiration-date').innerHTML = "* 신청일 기준 3일 내로 멘토의 수락이 없을 시 삭제됩니다."
}

let renderProceeding = () => {
	document.querySelector('#type_manage').innerHTML = "진행중인 멘토링";
	
	document.querySelector('#expiration-date').innerHTML = ""
}

let renderCompleted = () => {
	document.querySelector('#type_manage').innerHTML = "완료한 멘토링";
	
	document.querySelector('#expiration-date').innerHTML = ""
}