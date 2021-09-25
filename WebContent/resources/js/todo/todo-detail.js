/**
 * 
 */

todoList = [];

document.addEventListener('DOMContentLoaded', function() {	//document.ready

    	plugins: ['interaction', 'dayGrid', 'interactionPlugin'];
      
        var calendarEl = document.getElementById('calendar');


        var calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
          },
          
          //initialDate: '2020-09-12',

          initialView: 'dayGridMonth',
          locale: 'ko',	//한국
          navLinks: true, // can click day/week names to navigate views
          businessHours: true, // display business hours
          editable: true,
          selectable: true,

		  dateClick: function(info) {
		     var result = confirm("일정을 추가할까요?");
		     var openWin;
		        if(result)
		        {
					window.name = "parentForm";
		            openWin = window.open("${contextPath}/todo/modify","childForm","width=500, height=500, left=0, top=0")
					console.log(openWin);
					
				}
		        else
		        {
		            return;
		        }
				
		  
		 	 },
		 eventClick:  function(info) {
			 let start = new Date(info.event.start); 
			 start = start.toISOString().slice(0,10);
		
			 let title = info.event.title;
			 let time = info.event.time;
			
		     var result = confirm("일정을 수정/삭제할까요 ?");


			 document.getElementById("startValue").value = start;
			 document.getElementById("titleValue").value = title;
			 document.getElementById("timeValue").value = time;
			
		     var openWin;
		        if(result)
		        {
		            openWin = open("${contextPath}/todo/modify","popup","width=500, height=500, left=0, top=0");

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


		load(calendar);
        calendar.render();
        
      });



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

