/**
 * 
 */

todoInsert();

function todoInsert(){
	
	let titleInput, 
		startInput, 
		endInput,
		colorInput, 
		addButton,
		todoList = [];	
	
	getElements();
	addListeners();
	save();
//	load();
	
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
				id : todoIdx(),	
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
			
			alert('일정이 등록되었습니다.');
			
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
		var title = document.getElementById('titleInput').value;
		var start = document.getElementById('startInput').value;
		var end = document.getElementById('endInput').value;
		var color = document.getElementById('colorInput').value;
		
		document.getElementById('titleInput').value = title;
		document.getElementById('startInput').value = start;
		document.getElementById('endInput').value = end;
		document.getElementById('colorInput').value = color;
	}
		

	function todoIdx() {	//아이디 랜덤으로 만들기 
		const rand_0_10000000 = Math.floor(Math.random() * 10000001);
		return rand_0_10000000;
	}
}