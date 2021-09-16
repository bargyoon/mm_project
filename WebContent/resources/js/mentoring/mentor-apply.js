
let renderDate = new Date();
	
let renderCalender = () => {
	
	let year = renderDate.getFullYear();
	let month = renderDate.getMonth()+1;
		
	document.querySelector(".year").innerHTML = `${year}년 `;
	document.querySelector(".today_month").innerHTML = `${month}월`;
	
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
	
	for(let i = 1; i < tlDate+1; i ++){
		thisDates.push(i);
	}
	
	for (let i = 1; i < 7 - tlDay; i++) {
  		nextDates.push(i);
	}
	
	let dates = prevDates.concat(thisDates, nextDates);
	
	let firstDateIndex = dates.indexOf(1);
	
  	let lastDateIndex = dates.lastIndexOf(tlDate);

	dates.forEach((date, i) => {
		let dateClass = i >= firstDateIndex && i < lastDateIndex + 1 ? 'now_month' : 'other_month';
		dates[i] = `<div class="date"><span class="${dateClass}">${date}</span></div>`;
	})
	
	document.querySelector('.dates').innerHTML = dates.join('');
}
	
renderCalender();

let prevMonth = () => {
	renderDate.setMonth(renderDate.getMonth()-1);
	renderCalender();
}
	
let todayMonth = () => {
	renderCalender();
}
	
let nextMonth = () => {
	renderDate.setMonth(renderDate.getMonth()+1);
	renderCalender();
}


let nextBtn = () => {
	
	
	
	
}