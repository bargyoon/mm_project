/**
 * 
 */

document.addEventListener('DOMContentLoaded', function() {
	
	todoList = [];
	plugins: ['interaction', 'dayGrid', 'interactionPlugin'];
      
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		headerToolbar: {
			left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
          },
          
          initialView: 'dayGridMonth',
          locale: 'ko',
          navLinks: true, // can click day/week names to navigate views
          businessHours: true, // display business hours
          editable: true,
          selectable: true,

		dateClick: function(info) {
			let addSign = confirm("일정을 추가할까요?");
			let openAdd;
				if(addSign){
					window.name = "parentForm";
					openAdd = window.open("${contextPath}/todo/insert","childForm","width=500, height=500, left=0, top=0");
					//console.log(openAdd);
				}else{return;}
			},
			
			
		eventClick:  function(info) {
			let title = info.event.title;
			let start = new Date(info.event.start); 
				 //start = start.toISOString().slice(0,10);
			let time = info.event.time;
			let modifySign = confirm("일정을 수정/삭제할까요 ?");
/*				 document.getElementById("startValue").value = start;
				 document.getElementById("titleValue").value = title;
				 document.getElementById("timeValue").value = time;*/
			let openModify;
				if(modifySign){
					openWin = open("${contextPath}/todo/modify","popup","width=500, height=500, left=0, top=0");
				}else{return;}
			},
			
			events: [{
				title: 'Meeting1',
				start: '2021-09-12',
				end: '2021-09-15'
				
			},{
				title: 'Meeting10',
				start: '2021-09-12',
				end: '2021-09-12'
			}
			
			]
			 	 
        });

	calendar.render();


	// localStorage 의 일정목록 불러오기
	function load(calendar) {
		// [{}, {}, {}] 
		// 객체 배열이나, 객체 리스트로
		let retrieved = localStorage.getItem("todoList");
		console.log(retrieved);
		
		
		todoList = JSON.parse(retrieved)
		console.log(todoList); 
		
	//	if( todoList == null ) return;
		
		todoList.forEach(todoObj =>{
			let dateObj = {};
	
			dateObj.title = todoObj.title;
			dateObj.start = todoObj.start;
			dateObj.end = todoObj.end;
			dateObj.color = todoObj.color;
			
			calendar.addEvent(dateObj);
		});
	}
	
	load();
	
});





function setDate() {
	
	alert("aaa");
	
}	

