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
			
			if(endValue>startValue){
				alert('틀림');
				return;
			}
			let colorValue = colorInput.value;
		
			
			let obj = {
				id : _uuid(),	//체크박스의 데이터 아이디 
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
		var title = document.getElementById('titleValue').value;
		var start = document.getElementById('startValue').value;
		var end = document.getElementById('endValue').value;
		var color = document.getElementById('colorValue').value;
		
		document.getElementById('titleInput').value = title;
		document.getElementById('startInput').value = start;
		document.getElementById('endInput').value = end;
		document.getElementById('colorInput').value = color;
	}
		

	function _uuid() {	//아이디 랜덤으로 만들기 
	  var d = Date.now();
	  if (typeof performance !== 'undefined' && typeof performance.now === 'function'){
	    d += performance.now(); //use high-precision timer if available
	  }
	  return 'xxxxxxxx'.replace(/[xy]/g, function (c) {
	    var r = (d + Math.random() * 16) % 16 | 0;
	    d = Math.floor(d / 16);
	      return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
	  });
	}
}