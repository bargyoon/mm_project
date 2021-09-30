/**
 * 
 */

document.addEventListener('DOMContentLoaded', function() {
	
	
	/*  캘린더   */
	todoList = [];
	plugins: ['interaction', 'dayGrid', 'interactionPlugin'];
      
	var calendarEl = document.getElementById('calendar');
	calendar = new FullCalendar.Calendar(calendarEl, {
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

		//날짜 클릭하면 일정추가 팝업
		dateClick: function(info) {
			//alert('Clicked on: ' + info.dateStr); 클릭한 날짜
			
			localStorage.setItem("dateStr", info.dateStr);	
			window.name = "parentForm";
			openAdd = window.open("${contextPath}/todo/insert","childForm","width=500, height=500, left=0, top=0");
			//console.log(openAdd);
			window.close();
			},
			
		//일정 클릭하면 일정수정/삭제 팝업	
		eventClick: function(info){

			localStorage.setItem("startStr", info.event.startStr);	//클릭한 일정 시작일 
			localStorage.setItem("endStr", info.event.endStr);	
			localStorage.setItem("title", info.event.title);	
			window.name = "parentForm";
			openModify = window.open("${contextPath}/todo/modify","popup","width=500, height=500, left=0, top=0");
			}


  /*  alert('Event: ' + info.event.title);
    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
    alert('View: ' + info.view.type);*/
		 	
        });

	// 일정 가져오기
	setDate();
	calendar.render();
	/*  캘린더   */
	
});


/* 일정 가져오기 */
function setDate() {
	
	$.ajax({
	    url		:	'/todo/eventList', //request 보낼 서버의 경로
	    type	:	'get', // 메소드(get, post, put 등)
	    data:{	
				
		}, //보낼 데이터
	    success: function(data) {
	        //서버로부터 정상적으로 응답이 왔을 때 실행
			console.log(data);
			console.log(typeof data);
			
			var list = JSON.parse(data);
			
			console.log(list);
			console.log(typeof list);
			
			for( var i = 0 ; i < list.length ; i++ ) {
				console.log("start : " + list[i].start);
				console.log("end : " + list[i].end);
				console.log("title : " + list[i].title);
				
				calendar.addEvent(list[i]);
			}
	    },
	    error: function(err) {
	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행

	    }
	});

}	

