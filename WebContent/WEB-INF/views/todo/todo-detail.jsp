<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>TODO-DETAIL</title>

<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/todo/reset.css">
<link rel="stylesheet" href="/resources/css/todo/test.css">


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.css">
<script src='https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.9.0/main.min.js,
											npm/fullcalendar@5.9.0/locales-all.min.js'></script>

</head>


<body class="d-flex flex-column h-100">
    
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
 
<main class="flex-shrink-0">
            
<script>

      document.addEventListener('DOMContentLoaded', function() {
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
			     var result = confirm("일정을 추가할까요?");
			     var openWin;
			        if(result)
			        {
						window.name = "parentForm";
			            openWin = window.open("${contextPath}/todo/insert","childForm","width=500, height=500, left=0, top=0")
						console.log(openWin);
						
					}
			        else
			        {
			            return;
			        }
					
			  
			 	 },
			 	 
			 eventClick:  function(info) {
				 let title = info.event.title;
				 let start = new Date(info.event.start); 
				 //start = start.toISOString().slice(0,10);
			
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
			{}
          ]
        });

        
        
        calendar.render();
        
      });

    </script>


<div class="wrap-calendar"><div id='calendar' class="calendar"></div></div>


	<!-- Footer-->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/jsFiles.jsp" %>
</body>
</html>