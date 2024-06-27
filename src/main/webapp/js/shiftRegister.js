import { DAYS } from "./const.js";
import { DAY_TEXTS } from "./const.js";

let dayElements = [];

const employeeCD = document.getElementById("employeeCD");
const shiftEl = document.getElementById("shift");
const selectWeekEl = document.getElementById("selectWeek");
const inputTimeGroupEl = document.getElementById("inputTimeGroup");

console.log("employeeCD", employeeCD.value);
const shift = JSON.parse(shiftEl.value);
console.log("shift: ", shift);

window.addEventListener("DOMContentLoaded", () => {
	console.log("DOMContentLoaded");
	dayElements = shift;
  	showDayElements();
});

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

    // const index = dayElements.findIndex((x) => x === selectValue);
    // if (index === -1) {
    //   dayElements.push(selectValue);
    // } else {
    //   dayElements.splice(index, 1);
    // }

    const index = dayElements.findIndex(
      ({ shift_day }) => shift_day === selectValue
    );
    if (index === -1) {
      dayElements.push({
        employeeCD: employeeCD.value,
        shift_day: selectValue,
        startTime: "",
        endTime: "",
      });
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
    const { shift_day, startTime, endTime } = dayElements[i];
    const dayTextEl = document.createElement("div");
    dayTextEl.id = `item_${shift_day}`;
    const dayTextPr = document.createElement("p");
    dayTextPr.innerText = DAY_TEXTS[shift_day];

    const startTimeBox = document.createElement("input");
    startTimeBox.value = startTime;
    startTimeBox.type = "time";
    startTimeBox.addEventListener("change", (event) => {
      console.log("e: ", event.target.value);
      const index = dayElements.findIndex((x) => x.shift_day === shift_day);
      if (index !== -1) {
        dayElements[index].startTime = event.target.value;
      }
    });
    startTimeBox.classList.add("startTime");
    const endTimeBox = document.createElement("input");
    endTimeBox.value = endTime;
    endTimeBox.type = "time";
    endTimeBox.classList.add("endTime");
    endTimeBox.addEventListener("change", (event) => {
      console.log("e: ", event.target.value);
      const index = dayElements.findIndex((x) => x.shift_day === shift_day);
      if (index !== -1) {
        dayElements[index].endTime = event.target.value;
      }
    });
    dayTextEl.appendChild(dayTextPr);
    dayTextEl.appendChild(startTimeBox);
    dayTextEl.appendChild(endTimeBox);

    inputTimeGroupEl.appendChild(dayTextEl);
  }
}

const btn = document.createElement("button");
btn.innerText = "送信";
btn.addEventListener("click", function (event) {
  console.log("送信しました");
  console.log(dayElements);
  if (
    dayElements.some(
      ({ startTime, endTime }) => startTime === "" || endTime === ""
    )
  ) {
    console.log("入力されていない項目があります。");
  } else {
    console.log("実行");
    fetch("/DateTime/ShiftRegisterServlet", {
      method: "POST",
      body: JSON.stringify(dayElements),
    });
  }
  //   n = inputTimeGroupEl.children;

  //   for (let i = 0; i < children.length; i++) {
  //     const id = children[i].id;
  //     console.log("id: ", id);
  //     const startTime = document.getElementById("item_1");
  //     console.log("startTime: ", startTime);
  //   }
  //   const childre
});
document.body.appendChild(btn);

const shiftDay = {};
