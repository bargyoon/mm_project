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

		//날짜 클릭하면 일정추가 팝업
		dateClick: function(info) {
			let addSign = confirm("일정을 추가할까요?");
			let openAdd;
				if(addSign){
					window.name = "parentForm";
					openAdd = window.open("${contextPath}/todo/insert","childForm","width=500, height=500, left=0, top=0");
					//console.log(openAdd);
				}else{return false;}
			
			},
			
		//일정 클릭하면 일정수정/삭제 팝업	
		eventClick:  function(info) {
			
			let title = info.event.title;
			let start = new Date(info.event.start); 
				start = start.toISOString().slice(0,10);
			let time = info.event.time;
			let modifySign = confirm("일정을 수정/삭제할까요 ?");
			/*				 
				document.getElementById("startValue").value = start;
				document.getElementById("titleValue").value = title;
				document.getElementById("timeValue").value = time; 
			*/
			let openModify;
				if(modifySign){
					openWin = open("${contextPath}/todo/modify","popup","width=500, height=500, left=0, top=0");
				}else{return false;}
			},
/*			
			eventSources: [{
		events: function(info, successCallback, failureCallback) {
			$.ajax({
				url: '<c:url value="/test/selectEventList"/>',
				type: 'GET',
				dataType: 'json',
				data: {
					start : moment(info.startStr).format('YYYY-MM-DD'),
					end : moment(info.endStr).format('YYYY-MM-DD')
				},
				success: function(data) {
					successCallback(data);
				}
			});
		}
	}]
			*/
	
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

	
});





function setDate() {
	
	alert("aaa");
	
}	

