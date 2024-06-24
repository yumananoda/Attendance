import { DAYS } from "./const.js";
import { DAY_TEXTS } from "./const.js";

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

const dayElements = [];

const selectWeekEl = document.getElementById("selectWeek");
const inputTimeGroupEl = document.getElementById("inputTimeGroup");
// console.log("a: ", inputTimeGroupEl)

for (const day of Object.values(DAYS)) {
  console.log("day:", day);
  const div = document.createElement("div");
  const daybtn = document.createElement("button");
  daybtn.innerText = DAY_TEXTS[day];
  daybtn.value = day;
  div.appendChild(daybtn);
  selectWeekEl.appendChild(div);

  daybtn.addEventListener("click", function (event) {
    const selectValue = event.target.value;

    const index = dayElements.findIndex((x) => x === selectValue);
    if (index === -1) {
      dayElements.push(selectValue);
    } else {
      dayElements.splice(index, 1);
    }
    dayElements.sort(function (first, second) {
      if (first > second) {
        return 1;
      } else if (first < second) {
        return -1;
      } else {
        return 0;
      }
    });
    daybtn.classList.toggle("gray");
    showDayElements();
  });
}

function showDayElements() {
  while (inputTimeGroupEl.firstChild) {
    inputTimeGroupEl.removeChild(inputTimeGroupEl.firstChild);
  }
  for (let i = 0; i < dayElements.length; i++) {
    const selectValue = dayElements[i];
    const dayTextEl = document.createElement("div");
    dayTextEl.id = `item_${selectValue}`;
    const dayTextPr = document.createElement("p");
    dayTextPr.innerText = DAY_TEXTS[selectValue];
    console.log(dayTextEl);
    console.log("selectValue:", selectValue);

    const startTimeBox = document.createElement("input");
    startTimeBox.type = "time";
    startTimeBox.classList.add("startTime");
    const endTimeBox = document.createElement("input");
    endTimeBox.type = "time";
    endTimeBox.classList.add("endTime");
    dayTextEl.appendChild(dayTextPr);
    dayTextEl.appendChild(startTimeBox);
    dayTextEl.appendChild(endTimeBox);

    inputTimeGroupEl.appendChild(dayTextEl);
  }
}

const btn = document.createElement("button");
//btn.type = submit;
btn.innerText = "送信";
btn.addEventListener("click", function (event) {
  console.log("送信しました");
  const children = inputTimeGroupEl.children;

  for (let i = 0; i < children.length; i++) {
    const id = children[i].id;
    console.log("id: ", id);
    // const startTime = document.querySelector(`#1`);
    const startTime = document.getElementById("item_1");
    console.log("startTime: ", startTime);
  }
});
document.body.appendChild(btn);

const shiftDay = {};
