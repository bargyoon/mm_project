(()=>{
	
	let today = new Date();
	
	let month = today.getMonth();
	
	document.querySelector(".mentor-of-month").innerHTML = `${month}월의 우수 멘토`;
	
})();