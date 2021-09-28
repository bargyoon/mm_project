/**
 * 
 */

todoInsert();

function todoInsert(){
	
	let titleInput, 
		startInput, 
		endInput,
		colorInput,	
		addButton;
		
	getElements();
	addListeners();


	
	function getElements(){
		titleInput = document.getElementById("titleInput");	//일정제목
		startInput = document.getElementById("startInput");
		endInput = document.getElementById("endInput");
		colorInput = document.getElementById("colorInput");		
		addButton = document.getElementById("addButton");	//일정추가버튼
	}
	
	
	function addListeners(){
		addButton.addEventListener("click", addEntry);	//클릭시 일정등록
	}
	
	
		function addEntry(event){
			
			//let flag = true;
			
			let titleValue = titleInput.value;
			if(!titleValue){
				alert('제목을 입력해주세요');
				document.getElementById("titleInput").focus();
				return;
			}
			
			let startValue = startInput.value;
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

			
			alert('일정이 등록되었습니다.');
			
			//일정등록시 인풋창 초기화
			titleInput = "";
			startValue = "";
			endValue = "";
			colorValue = "";

			// 등록 끝
			opener.document.location.reload();
		}		

}