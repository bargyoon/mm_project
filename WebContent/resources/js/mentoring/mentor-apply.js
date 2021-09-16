(() => {
	let today = new Date();
	
	let year = today.getFullYear();
	let month = today.getMonth()+1;
	
	document.querySelector(".calender-header").innerHTML = `${year}년 ${month}월`;
	document.querySelector(".view_month").innerHTML = `${month}월`;
	
	//지난달 마지막 날짜 기준으로 Date객체 생성
	let prevLast = new Date(year, month - 1, 0);
	//이번달 마지막 날짜 기준으로 Date객체 생성
	let thisLast = new Date(year, month, 0);
	
	//지난달 마지막날
	let plDate = prevLast.getDate();
	//이번달 마지막날
	let tlDate = thisLast.getDate();
	
	//지난달 마지막 요일
	let plDay = prevLast.getDay();
	//이번달 마지막 요일
	let tlDay = thisLast.getDay();
	
	let prevDates = [];
	let thisDates = [];
	let nextDates = [];
	
	if(plDay !== 6){
		for(let i = 0; i < plDay + 1; i++){
			prevDates.unshift(plDate - i);
		}
	}
	
	for(let i = 1; i < tlDate; i ++){
		thisDates.push(i);
	}
	
	for (let i = 1; i < 7 - tlDay; i++) {
  		nextDates.push(i);
	}
	
	let dates = prevDates.concat(thisDates, nextDates);
	
	dates.forEach((date, i) => {
  		dates[i] = `<div class="date">${date}</div>`;
	})
	
	document.querySelector('.calender-content').innerHTML = dates.join('');
	
})();