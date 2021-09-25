/**
 * 
 */


todoModify();



function todoModify(){
	let inputElem, 
		dateInput, 
		timeInput, 
		addButton, 
		sortButton, 
		ulElem, 
		todoList = [];
	
	getElements();
	addListeners();
	load();
	renderRows();
	
	function getElements(){
		inputElem = document.getElementsByTagName("input")[0];	//일정제목
		dateInput = document.getElementById("dateInput");
		timeInput = document.getElementById("timeInput");
		addButton = document.getElementById("addBtn");	//일정추가버튼
		sortButton = document.getElementById("sortBtn");	//일정정렬버튼 
	}
	
	
	function addListeners(){
		addButton.addEventListener("click", addEntry);	//클릭시 일정등록
		sortButton.addEventListener("click", sortEntry);	//클릭시 일정정렬
	}
	
	function addEntry(event){
		
		//let flag = true;
		
		let inputValue = inputElem.value;
		inputElem.value = "";
		
		let dateValue = dateInput.value;
		dateInput.value = "";
		
		let timeValue = timeInput.value;
		timeInput.value = "";
		
		let colorValue = colorInput.value;
		colorInput.value = "";

		let obj = {
			id : _uuid(),	//체크박스의 데이터 아이디 
			todo : inputValue,
			date : dateValue,
			time : timeValue,
			done : false,
			color : colorValue
		}
		renderRow(obj);
		
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
			
			var date = opener.document.getElementById('startValue').value;
			var title = opener.document.getElementById('titleValue').value;
			var time = opener.document.getElementById('timeValue').value;
			
			document.getElementById('dateInput').value = date;
			document.getElementById('titleInput').value = title;
			document.getElementById('timeInput').value = time;
		}
		
		
		function renderRows(){
			todoList.forEach(todoObj =>{
			//	let todoEntry = todoObj["todo"];
				renderRow(todoObj);
			})
			
		}
		
		function renderRow({id, todo : inputValue, date, time, done} = obj){
/*			
		let inputValue = obj.todo;
		let {todo : inputValue} = obj;
*/		
		
		//add a new row
		let table = document.getElementById("todoTable");
		let trElem = document.createElement("tr");
		table.appendChild(trElem);
		
		//checkbox cell
		let checkboxElem = document.createElement("input");
		checkboxElem.type = "checkbox";
		checkboxElem.addEventListener("click", checkboxClickCallback);	//체크박스 누르면 글씨에 줄침
		checkboxElem.dataset.id = id;
		let tdElem1 = document.createElement("td");
		tdElem1.appendChild(checkboxElem);
		trElem.appendChild(tdElem1);

		//to-do cell
		let tdElem2 = document.createElement("td");
		tdElem2.innerText = inputValue;
		trElem.appendChild(tdElem2);

		//date cell
		let dateElem = document.createElement("td");
		dateElem.innerText = date;
		trElem.appendChild(dateElem);		
		
		//time cell
		let timeElem = document.createElement("td");
		timeElem.innerText = time;
		trElem.appendChild(timeElem);
		
		//delete cell
		let spanElem = document.createElement("span");	//삭제 span태그로 감쌈
		spanElem.innerText = " 삭제";
		spanElem.addEventListener("click", deleteItem);	
		spanElem.dataset.id = id;
		
		let tdElem4 = document.createElement("td");  
		tdElem4.appendChild(spanElem);
		trElem.appendChild(tdElem4);
		
		checkboxElem.type = "checkbox";
		checkboxElem.checked = done;
		if(done){
			trElem.classList.add("strike");	//체크시 글씨에 줄긋기
		}else{
			trElem.classList.remove("strike");	//미체크시 글씨에 줄그은거 지움		
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

		function checkboxClickCallback(){
			trElem.classList.toggle("strike");
			//todo Array에서 done 요소를 찾아 체크박스 선택될시 this.checked true로 
			//data식별 어떻게? 
			for(let i = 1; i < todoList.length; i++){
				if(todoList[i].id == this.dataset.id){
					todoList[i]["done"] = this.checked;	//체크박스 체크시 done속성 true로 변경 
				}
			}
			save();	//로컬스토리지에 todoList 저장
		}	
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


	function sortEntry() {	 
		todoList.sort((a,b) => {
			let aDate = Date.parse(a.date);	//밀리세컨으로 파싱
			let bDate = Date.parse(b.date);
			return aDate - bDate;
		});	//date 오름차순으로 일정 정렬
		
	save();	//sort한거 저장 
	
	
	
	let table = document.getElementById("todoTable");
	table.innerHTML = `
		<tr>
		<td></td>
		<td>Date</td>
		<td>Time</td>
		<td>to-do</td>
		<td>delete</td>
	</tr>`;
	renderRows();

	}			
}



			
/*			
			if(flag){
				//this.style.textDecoration = "line-through";
				this.classList.add("strike");	//<li>에 class strike 생성해서 css적용됨
				flag = !flag;
			}else{
				//this.style.textDecoration = "none";
				this.classList.remove("strike");
				flag = !flag;
			}		
		*/
		
		
		
		
/*		
		let liElem = document.createElement("li");
		
		//체크박스 추가
		let checkboxElem = document.createElement("input");
		checkboxElem.type = "checkbox";
		liElem.appendChild(checkboxElem);
		
		let textElem = document.createElement("span");
		textElem.innerText = inputValue + "-" + inputValue2;
		liElem.appendChild(textElem);
		//liElem.innerText = inputValue;	//<li>태그 안에 input에 적은 값 넣기, innerText사용하면 checkbox 못읽어옴
		//liElem.addEventListener("click", onClick);
		
				
		let spanElem = document.createElement("span");	//삭제 span태그로 감쌈
		spanElem.innerText = " 삭제";
		spanElem.addEventListener("click", deleteItem);
		
		ulElem.appendChild(liElem);	//ul>li
		//ulElem.innerHTML += `<li>${inputValue}</li>`;
		liElem.appendChild(spanElem);	//li>span

		*/
		






