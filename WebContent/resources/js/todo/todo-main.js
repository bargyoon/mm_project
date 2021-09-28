/**
 * 
 */

submit();

function submit(){
	
/*
<label for ="cbox">체크박스</label>
<input type="checkbox" id="cbox" name="cbox">
<button id="btn">체크하기</button>
*/

let todoIdxs = "<c:out value=”${todo.todoIdx}” />"; 
console.log(todoIdxs);
//let idxList = document.getElementsById('#todoIdxs');

}
/*

let todoIdx = "<c: out value='${todo.todoIdx}'>";
while(false){
	cbox += document.getElementsById("todoIdx");
}

let save = document.getElementById("save");

save.addEventListener('click', function(){
		//checked 제어
	 	cbox.checked = true;
	console.log(save);
});

}

*/