/**
 * 
 */

let $ = (selector,text) =>{
	if(text){
		document.querySelector(selector).innerHTML += `${text}<br>` ;
	}
 	return document.querySelector(selector);
}




document.addEventListener('DOMContentLoaded', function() {	//document.ready
    	plugins: ['interaction', 'dayGrid', 'interactionPlugin'];
      
        var calendarEl = document.getElementById('calendar');
        var calendarEl = document.getElementById('calendar');
    	



        var calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'

          },
          
          initialDate: '2020-09-12',

          initialView: 'dayGridMonth',
          locale: 'ko',	//한국
          navLinks: true, // can click day/week names to navigate views
          businessHours: true, // display business hours
          editable: true,
          selectable: true,

		  dateClick: function(info) {
		     var result = confirm("일정을 추가할까요?");
		        
		        if(result)
		        {
		            open("${contextPath}/todo/modify","popup","width=500, height=500, left=0, top=0")
		        }
		        else
		        {
		            return;
		        }
		  
		 	 },
		 eventClick:  function(info) {
		     var result = confirm("일정을 수정/삭제할까요 ?");
		        
		        if(result)
		        {
		            open("${contextPath}/todo/modify","popup","width=500, height=500, left=0, top=0")
		        }
		        else
		        {
		            return;
		        }
		  
		 	 },

          events: [
        	  
        	  
            {
              title: 'Business Lunch',
              start: '2020-09-03T13:00:00',
              constraint: 'businessHours'
            },
            {
              title: 'Meeting',
              start: '2020-09-13T11:00:00',
              constraint: 'availableForMeeting', // defined below
              color: '#257e4a'
            },
            {
              title: 'Conference',
              start: '2020-09-18',
              end: '2020-09-20'
            },
            {
              title: 'Party',
              start: '2020-09-29T20:00:00'
            },

            // areas where "Meeting" must be dropped
            {
              groupId: 'availableForMeeting',
              start: '2020-09-11T10:00:00',
              end: '2020-09-11T16:00:00',
              display: 'background'
            },
            {
              groupId: 'availableForMeeting',
              start: '2020-09-13T10:00:00',
              end: '2020-09-13T16:00:00',
              display: 'background'
            },

            // red areas where no events can be dropped
            {
              start: '2020-09-24',
              end: '2020-09-28',
              overlap: false,
              display: 'background',
              color: '#ff9f89'
            },
            {
              start: '2020-09-06',
              end: '2020-09-08',
              overlap: false,
              display: 'background',
              color: '#ff9f89'
            }
          ]
        });

        
        
        calendar.render();
        
      });






todoMain();

function todoMain(){
	let inputElem, inputElem2, button, ulElem;
	
	getElements();
	addListeners();
	
	
	function getElements(){
		inputElem = document.getElementsByTagName("input")[0];
		inputElem2 = document.getElementsByTagName("input")[1];
		button = document.getElementById("addBtn");
		ulElem = document.getElementsByTagName("ul")[0];
		
	}
	
	
	function addListeners(){
		button.addEventListener("click", addEntry)
	}
	
	
	
	function addEntry(event){
		
		let flag = true;
		
		let inputValue = inputElem.value;
		inputElem.value = "";

		let inputValue2 = inputElem2.value;
		inputElem2.value = "";
	
		//add a new row
		let table = document.getElementById("todoTable");
		let trElem = document.createElement("tr");
		table.appendChile(trElem);
		
		
		
		//checkbox cell
		let checkboxElem = document.createElement("input");
		checkboxElem.type = "checkbox";
		let tdElem1 = document.createElement("td");
		tdElem1.appendchild(checkboxElem);
		trElem.appendchild(tdElem1);
		
		//to-do cell
		let tdElem2 = document.createElement("td");
		tdElem2.innerText = inputValue;
		trElem.appendchild(tdElem2);
		
		//category cell
		let tdElem3 = document.createElement("td");
		tdElem3.innerText = inputValue2;
		trElem.appendchild(tdElem3);
		//delete cell
	
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
		
		
		function deleteItem(){
			liElem.remove();
		}

		function onClick(){
			if(flag){
				//this.style.textDecoration = "line-through";
				this.classList.add("strike");	//<li>에 class strike 생성해서 css적용됨
				flag = !flag;
			}else{
				//this.style.textDecoration = "none";
				this.classList.remove("strike");
				flag = !flag;

			}
			
		}
				

		

	}
	
}








