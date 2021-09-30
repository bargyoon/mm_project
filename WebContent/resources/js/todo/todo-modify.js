/**
 * 
 */



document.addEventListener('DOMContentLoaded', function() {
	
		
	var start = window.opener.document.getElementById("todo_start").value;
	var end = window.opener.document.getElementById("todo_end").value;
	var title = window.opener.document.getElementById("todo_title").value;
	var todoIdx = window.opener.document.getElementById("todo_idx").value;
	
	document.getElementById("startInput").value = start;
	document.getElementById("endInput").value = end;
	document.getElementById("titleInput").value = title;
	document.getElementById("todoIdx").value = todoIdx;

	
});

function todoModify(){
	
	let todoIdxInput = document.getElementById("todoIdx");	
	let titleInput = document.getElementById("titleInput");	//일정제목
	let	startInput = document.getElementById("startInput");
	let	endInput = document.getElementById("endInput");
	let	colorInput = document.getElementById("colorInput");		
	let	modifyButton = document.getElementById("modifyButton");
	let	deleteButton = document.getElementById("deleteButton");
	
	let titleValue = titleInput.value;
	
	
	
	let todoIdxValue = todoIdxInput.value; 
	
	if(!titleValue){
		alert('제목을 입력해주세요');
		return;
	}
	
	let startValue = startInput.value;
			
	//startValue = new Date().toISOString().substring(0, 10);
	//console.log(startValue);
	
	if(!startValue){
		alert('날짜를 입력해주세요');
		return;
	}			
	
	let endValue = endInput.value;
	if(!endValue){
		alert('날짜를 입력해주세요');
		return;
	}			
	
	if( Number(startValue.replace(/-/gi,"")) > Number(endValue.replace(/-/gi,"")) ){
	alert("시작일이 종료일보다 클 수 없습니다.");
     	return;
	}
	
	let colorValue = colorInput.value;
	
	
	var event = {
		todoIdx	: todoIdxValue,
		title	: titleValue,
		start	: startValue,
		end		: endValue,
		color	: colorValue
	};
	
	console.log(event);
	
	setDate(event);
	
	// opener.document.location.reload();

//	alert('일정이 수정되었습니다.');
//	close();
}

//function close(){
//	self.close();
//}

function deleteEntry(){
	alert('일정을 삭제할까요?');
	opener.document.location.reload();
	close();
}


function setDate(event) {
	
	$.ajax({
	    url		:	'/todo/modify', //request 보낼 서버의 경로
	    type	:	'post', // 메소드(get, post, put 등)
	    data:{	
				todoIdx		: event.todoIdx,
				title		: event.title,
				startDate	: event.start,
				endDate		: event.end,
				color		: event.color,
		}, //보낼 데이터
	    success: function(data) {
			window.opener.document.location.reload();
			alert("수정 성공!!");
			close();
	    },
	    error: function(err) {
	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행

	    }
	});

}	



