/**
 * 
 */

todoList = [];




// localStorage 의 일정목록 불러오기
function load(calendar) {
	// [{}, {}, {}] 
	// 객체 배열이나, 객체 리스트로
	let retrieved = localStorage.getItem("todoList");
	
	todoList = JSON.parse(retrieved)
	console.log(todoList); 
	
//	if( todoList == null ) return;
	
	todoList.forEach(todoObj =>{
		let dateObj = {};

		dateObj.title = todoObj.todo;
		dateObj.start = todoObj.date + 'T' + todoObj.time;
		dateObj.end = todoObj.date;
		dateObj.color = todoObj.color;
		
		calendar.addEvent(dateObj);
	});
}

function setDate() {
	
	alert("aaa");
	
}	

