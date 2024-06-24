import { DAYS } from "./const.js";
import { DAY_TEXTS } from "./const.js";

const dayElements = [];

const selectWeekEl = document.getElementById("selectWeek");
const inputTimeGroupEl = document.getElementById("inputTimeGroup");

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

    const index = dayElements.findIndex(({ day }) => day === selectValue);
    if (index === -1) {
      dayElements.push({
        day: selectValue,
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
    const { day, startTime, endTime } = dayElements[i];
    const dayTextEl = document.createElement("div");
    dayTextEl.id = `item_${day}`;
    const dayTextPr = document.createElement("p");
    dayTextPr.innerText = DAY_TEXTS[day];

    const startTimeBox = document.createElement("input");
    startTimeBox.value = startTime;
    startTimeBox.type = "time";
    startTimeBox.addEventListener("change", (event) => {
      console.log("e: ", event.target.value);
      const index = dayElements.findIndex((x) => x.day === day);
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
      const index = dayElements.findIndex((x) => x.day === day);
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
