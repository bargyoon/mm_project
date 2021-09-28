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
		deleteButton,
		todoList = [];	
	
	getElements();
	addListeners();
	load();
	
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
		if(!startValue){
			alert('날짜를 입력해주세요');
			return;
		}			
		let endValue = endInput.value;
		if(!endValue){
			alert('날짜를 입력해주세요');
			return;
		}			
		
		if(startValue>endValue){
			alert('날짜를 다시 확인해주세요');
			return;
		}
		
		let colorValue = colorInput.value;
	
		let obj = {
			id : todoIdx,
			title : titleValue,
			start : startValue,
			end : endValue,
			done : false,
			color : colorValue
		}

		todoList.push(obj);
		console.log(obj);
		save();
		load();
		
		alert('일정이 수정되었습니다.');
		
		//일정등록시 인풋창 초기화
		titleInput = "";
		startValue = "";
		endValue = "";
		colorValue = "";

		// 등록 끝
		opener.document.location.reload();
}		
	
	
function save(){
	
		let stringified = JSON.stringify(todoList);	//todoList는 String타입이므로 배열의 메서드인 forEach 사용불가므로 
													//todoList 값들을 String으로 만들어 배열화함 
		localStorage.setItem("todoList", stringified);	
	}

function load(){
		//value값은 아직 String이므로
		let retrieved = localStorage.getItem("todoList");
		todoList = JSON.parse(retrieved)
		console.log(typeof todoList);	//오브젝트
		console.log(todoList); 
		if(todoList == null){
			todoList = [];
		}
		
		
		var title = opener.document.getElementById('titleInput').value;
		var start = opener.document.getElementById('startInput').value;
		var end = opener.document.getElementById('endInput').value;
		var color = opener.document.getElementById('colorInput').value;
		
		document.getElementById('titleInput').value = title;
		document.getElementById('startInput').value = start;
		document.getElementById('endInput').value = end;
		document.getElementById('colorInput').value = color;


}


function deleteEntry(){
	alert('일정을 삭제할까요?');
	
	
	opener.document.location.reload();
}

