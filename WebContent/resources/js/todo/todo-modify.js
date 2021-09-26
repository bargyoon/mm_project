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
		todoList[];	
	
	
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
		modifyButton.addEventListener("click", modifyEntry);	//클릭시 일정등록
		deleteButton.addEventListener("click", deleteEntry);	//클릭시 일정정렬
}
	
function modifyEntry(event){
		
		//let flag = true;
		
		let titleValue = titleInput.value;
		titleInput.value = "";
		
		let startValue = startInput.value;
		startInput.value = "";
		
		let endValue = endInput.value;
		endInput.value = "";
		
		let colorValue = colorInput.value;
		colorInput.value = "";

		let obj = {
			id : id,
			title : titleValue,
			start : startValue,
			end : endValue,
			done : false,
			color : colorValue
		}
		
		todoList.push(obj);
		
		save();
		load();
		
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
		
		
		var title = opener.document.getElementById('titleValue').value;
		var start = opener.document.getElementById('startValue').value;
		var end = opener.document.getElementById('endValue').value;
		var color = opener.document.getElementById('colorValue').value;
		
		document.getElementById('titleInput').value = title;
		document.getElementById('startInput').value = start;
		document.getElementById('endInput').value = end;
		document.getElementById('colorInput').value = color;


}


function deleteItem(){
	trElem.remove();	//row 삭제
	
	for(let i = 1; i < todoList.length; i++){
		if(todoList[i].id == this.dataset.id){	//아이디가 delete id와같으면
			todoList.splice(i,1);	//i번쨰 인덱스에 있는 1개 지움
		}
	}
	save();	//sort한거 저장 
	
	opener.document.location.reload();
}

