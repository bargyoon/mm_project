/**
 * 
 */

function todoModify(){
	let titleInput, 
		startInput, 
		endInput,
		colorInput, 
		modifyButton,
		deleteButton;	
	
		getElements();

	
		function getElements(){
		titleInput = document.getElementById("titleInput");	//일정제목
		startInput = document.getElementById("startInput");
		endInput = document.getElementById("endInput");
		colorInput = document.getElementById("colorInput");		
		modifyButton = document.getElementById("modifyButton");
		deleteButton = document.getElementById("deleteButton");
		
		}
		
		let titleValue = titleInput.value;
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
		
		opener.document.location.reload();

		alert('일정이 수정되었습니다.');
		close();
}

function close(){
	self.close();
}

function deleteEntry(){
	alert('일정을 삭제할까요?');
	opener.document.location.reload();
	close();
}


function setDate() {
	
	$.ajax({
	    url		:	'/todo/modify', //request 보낼 서버의 경로
	    type	:	'post', // 메소드(get, post, put 등)
	    data:{	
				
		}, //보낼 데이터
	    success: function(data) {
=			
	    },
	    error: function(err) {
	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행

	    }
	});

}	



