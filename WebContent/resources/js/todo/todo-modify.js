/**
 * 
 */
todoModify();

function todoModify(){
	let titleInput, 
		startInput, 
		endInput,
		colorInput, 
		modifyButton,
		deleteButton;	
	
	getElements();
	addListeners();

	
		function getElements(){
		titleInput = document.getElementById("titleInput");	//일정제목
		startInput = document.getElementById("startInput");
		endInput = document.getElementById("endInput");
		colorInput = document.getElementById("colorInput");		
		modifyButton = document.getElementById("modifyButton");
		deleteButton = document.getElementById("deleteButton");
		}
}
	
	
function addListeners(){
		modifyButton.addEventListener("click", modifyEntry);	//클릭시 일정수정
		deleteButton.addEventListener("click", deleteEntry);	//클릭시 일정삭제
}
	
function modifyEntry(event){
		let titleValue = titleInput.value;
	
		if(!titleValue){
			alert('제목을 입력해주세요');
			return;
		}
		
		let startValue = startInput.value;
		/*		
		startValue = new Date().toISOString().substring(0, 10);
		console.log(startValue);
		*/
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

		alert('일정이 수정되었습니다.');
		
		//일정등록시 인풋창 초기화
		titleInput = "";
		startValue = "";
		endValue = "";
		colorValue = "";

		// 등록 끝
		opener.document.location.reload();
}



function deleteEntry(){
	alert('일정을 삭제할까요?');
	opener.document.location.reload();
}

