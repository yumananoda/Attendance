import { DAYS } from './const.js';
import { DAY_TEXTS } from './const.js';

// export const DAYS = {
// 	SUNDAY: 1,
// 	MONDAY: 2,
// 	TUESDAY: 3,
// 	WEDNESDAY: 4,
// 	THURSDAY: 5,
// 	FRIDAY: 6,
// 	SATURDAY: 7
// }

// export const DAY_TEXTS = {
// 	[DAYS.SUNDAY]: "日",
// 	[DAYS.MONDAY]: "月",
// 	[DAYS.TUESDAY]: "火",
// 	[DAYS.WEDNESDAY]: "水",
// 	[DAYS.THURSDAY]: "木",
// 	[DAYS.FRIDAY]: "金",
// 	[DAYS.SATURDAY]: "土",
// }

const dayElements = {};

const selectWeekEl = document.getElementById("selectWeek");
const inputTimeGroupEl = document.getElementById("inputTimeGroup");
// console.log("a: ", inputTimeGroupEl)

for(const day of Object.values(DAYS)) {
	console.log("day:", day)
	const div = document.createElement("div");
	const daybtn = document.createElement("button");
	daybtn.innerText = DAY_TEXTS[day];
	daybtn.value = day;
	div.appendChild(daybtn);
	selectWeekEl.appendChild(div);

	daybtn.addEventListener("click", function(event){
		const selectValue = event.target.value;
		if(document.getElementById(selectValue) !== null){
			const remove_div = document.getElementById(selectValue);
			// daybtn.classList.remove("gray");
			remove_div.remove();
		}else{
			const dayTextEl = document.createElement("div");
			dayTextEl.id = selectValue;
			const dayTextPr = document.createElement("p");
			dayTextPr.innerText = DAY_TEXTS[selectValue];
			console.log(dayTextEl);
			console.log("selectValue:",selectValue);

			const startTime = document.createElement("input");
			startTime.type = "text";
			const endTime = document.createElement("input");
			endTime.type = "text";
			dayTextEl.appendChild(dayTextPr);
			dayTextEl.appendChild(startTime);
			dayTextEl.appendChild(endTime);
			
			
			inputTimeGroupEl.appendChild(dayTextEl);
			// daybtn.classList.add("gray");
		}
		daybtn.classList.toggle("gray");
	})

	
}

// DAYS.forEach((day) => {
// })