// const DAYS = {
// 	SUNDAY: 1,
// 	MONDAY: 2,
// 	TUESDAY: 3,
// 	WEDNESDAY: 4,
// 	THURSDAY: 5,
// 	FRIDAY: 6,
// 	SATURDAY: 7
// }

// const DAY_TEXTS = {
// 	[DAYS.SUNDAY]: "日",
// 	[DAYS.MONDAY]: "月",
// 	[DAYS.TUESDAY]: "火",
// 	[DAYS.WEDNESDAY]: "水",
// 	[DAYS.THURSDAY]: "木",
// 	[DAYS.FRIDAY]: "金",
// 	[DAYS.SATURDAY]: "土",
// }

import { DAYS } from './const.js';
import { DAY_TEXTS } from './const.js';

const selectWeekEl = document.getElementById("selectWeek");
const inputTimeGroupEl = document.getElementById("inputTimeGroup");
console.log("a: ", inputTimeGroupEl)

for(const day of Object.values(DAYS)) {
	console.log("day: ", day)
	const div = document.createElement("div");
	div.innerText = DAY_TEXTS[day];
	div.value = day;
	selectWeekEl.appendChild(div);
	div.addEventListener("click", function(event){
		console.log(event.target.value);
		const selectValue = event.target.value;
		const dayTextEl = document.createElement("p");
		dayTextEl.innerText = DAY_TEXTS[selectValue];
		console.log(dayTextEl)
		inputTimeGroupEl.appendChild(dayTextEl)
		
		const input1 = document.createElement("input");
		input1.type = "text";
		const input2 = document.createElement("input");
		input2.type = "text";
		inputTimeGroupEl.appendChild(input1);
		inputTimeGroupEl.appendChild(input2);
	})
}

// DAYS.forEach((day) => {
// })