let renderApplying = () => {
	document.querySelector('#type_manage').innerHTML = "신청중인 멘토링";
	
	document.querySelector('#expiration-date').innerHTML = "* 신청일 기준 3일 내로 멘토의 수락이 없을 시 삭제됩니다."
	
	document.getElementById("apply-mentoring").style.display = 'flex';
	document.getElementById("process-mentoring").style.display ="none";	
	document.getElementById("finish-mentoring").style.display ="none";
}

let renderProceeding = () => {
	document.querySelector('#type_manage').innerHTML = "진행중인 멘토링";
	
	document.querySelector('#expiration-date').innerHTML = ""
	
	document.getElementById("apply-mentoring").style.display = 'none';
	document.getElementById("process-mentoring").style.display ="flex";	
	document.getElementById("finish-mentoring").style.display ="none";
}

let renderCompleted = () => {
	document.querySelector('#type_manage').innerHTML = "완료한 멘토링";
	
	document.querySelector('#expiration-date').innerHTML = ""
	
	document.getElementById("apply-mentoring").style.display = 'none';
	document.getElementById("process-mentoring").style.display ="none";	
	document.getElementById("finish-mentoring").style.display ="flex";
}

let reapply = (aIdx, reapplyCnt) => {
	if(reapplyCnt == 2){
		alert("재신청은 최대 2회까지 가능합니다.");
		return;
	} else {
		location.href=`/mentoring/reapply-complete?a_idx=${aIdx}`;
	}
}

let registApply = (userIdx, mentorIdx, mentorName) => {
	location.href=`/mentoring/regist-apply?user_idx=${userIdx}&mentor_idx=${mentorIdx}&mentor_name=${mentorName}`;
}