const currentTime = new Date();
let currentYear = currentTime.getFullYear();
let currentMonth = currentTime.getMonth() + 1;

const weeks = ["日", "月", "火", "水", "木", "金", "土"];
//  曜日を指定します。
const date = new Date();
// 任意の日付を設定する方法は、引数の中に数字をいれます ex:new Data(2020.11.11)
// date = new Date();のnewはオブジェクトを初期化するキーワードです。

const year = date.getFullYear();
// dateオブジェクトが持つ値から、年の値を取得します。

const month = date.getMonth() + 1;
// 0 が年の最初の月を示すので、+1を記載します。+1を記載しないと今日が11月だった場合、10月と表示されてしまいます。

let endDate = new Date(currentYear, currentMonth, 0);
// 月の最後の日を取得します。
// 何をやっているのかというと、日付に0を設定し、該当月のの0日（つまり、前月末）にしてます。

const calender = document.querySelector("#calendar");
//calender.innerText="AA"

document.querySelector("#year").innerHTML = currentYear;
document.querySelector("#month").innerHTML = currentMonth;

//前の月へボタンを押したとき
document.querySelector(".prev").addEventListener("click", function () {
  if (currentMonth === 1) {
    currentMonth = 12;
    currentYear--;
  } else {
    currentMonth--;
  }
  document.querySelector("#year").innerHTML = currentYear;
  document.querySelector("#month").innerHTML = currentMonth;
  endDate = new Date(currentYear, currentMonth, 0);
  getDateAndDay();
});

//次の月へボタンを押したとき
document.querySelector(".next").addEventListener("click", function () {
  if (currentMonth === 12) {
    currentMonth = 1;
    currentYear++;
  } else {
    currentMonth++;
  }
  document.querySelector("#year").innerHTML = currentYear;
  document.querySelector("#month").innerHTML = currentMonth;
  endDate = new Date(currentYear, currentMonth, 0);
  getDateAndDay();
});

//jspからtimerecordsを取得
let jsValue = document.getElementById("dataHolder").value;
console.log(document.getElementById("dataHolder"));
jsValue = JSON.parse(jsValue);
console.log("jsValue:", jsValue);
for (let i = 0; i < jsValue.length; i++) {
  let clockIn = jsValue[i].clockInTime;
  let clockOut = jsValue[i].clockOutTime;
  // console.log(clockIn);
  let clockIn_dateTime = new Date(clockIn / 1000);
  let clockOut_dateTime = new Date(clockOut / 1000);
  // clockIn.innnerText = clockIn_dateTime;
  // clockOut.innnerText = clockOut_dateTime;
  console.log(clockIn_dateTime, clockOut_dateTime);
  console.log(clockIn_dateTime.getFullYear());

  console.log(clockIn_dateTime.getDate);
}
// console.log(dateTime.getFullYear(), dateTime.getMonth(), dateTime.getDate())
// console.log(dateTime.toLocaleDateString());

//ひと月の日付と曜日データを取得する関数
function getDateAndDay() {
  //前に表示されていたデータを削除
  while (calender.firstChild) {
    calender.removeChild(calender.firstChild);
  }
  //console.log(endDate);
  const trEl = document.createElement("tr");
  const th1 = document.createElement("th");
  const th2 = document.createElement("th");
  const th3 = document.createElement("th");
  const th4 = document.createElement("th");
  const th5 = document.createElement("th");
  const th6 = document.createElement("th");
  th1.innerText = "日";
  th2.innerText = "曜日";
  th3.innerText = "出勤時間";
  th4.innerText = "退勤時間";
  th5.innerText = "稼働時間";
  th6.innerText = "休憩時間";
  trEl.appendChild(th1);
  trEl.appendChild(th2);
  trEl.appendChild(th3);
  trEl.appendChild(th4);
  trEl.appendChild(th5);
  trEl.appendChild(th6);
  calender.appendChild(trEl);
  for (let i = 1; i <= endDate.getDate(); i++) {
    const col = document.createElement("tr");
    //console.log(i);
    const date = document.createElement("td");
    const week = document.createElement("td");
    // const detail = document.createElement("a");
    const clockIn = document.createElement("td");
    const clockOut = document.createElement("td");
    const clock = document.createElement("td");
    const breakTime = document.createElement("td");

    const day = new Date(currentYear, currentMonth - 1, i).getDay();
    console.log(weeks[day]);
    date.innerText = `${i}日`;
    week.innerText = weeks[day];

    const startDate = new Date(currentYear, currentMonth - 1, i, 0, 0, 0);
    const endDate = new Date(currentYear, currentMonth - 1, i, 23, 59, 59);
    // const startUnixTime = Math.floor(startDate.getTime() / 1000);
    // const endUnixTime = Math.floor(endDate.getTime() / 1000);
    // console.log(startUnixTime,endUnixTime);
    const result = jsValue.find(
      ({ clockInTime }) =>
        startDate.getTime() <= clockInTime && endDate.getTime() >= clockInTime
    );
    console.log(result);

    if (result !== undefined) {
      // a = result.clockInTime/1000;
      // b = result.clockOutTime/1000;
      const now = new Date(result.clockInTime);
      const now1 = new Date(result.clockOutTime);
      console.log(
        "now: ",
        result.clockInTime / 1000,
        now.getHours(),
        now.getMinutes(),
        now.getSeconds()
      );
      console.log(now.toLocaleTimeString());

      let diff = now1 - now; // ミリ秒の差
      let hoursWorked = diff / (1000 * 60 * 60); // ミリ秒を時間に変換
      // 表示のフォーマット
      let totalHours = Math.floor(hoursWorked); // 時間部分
      let totalMinutes = Math.floor((hoursWorked - totalHours) * 60);

      clock.innerText = totalHours + "時間" + totalMinutes + "分";

      clockIn.innerText = now.toLocaleTimeString();
      if (result.clockOutTime !== null) {
        clockOut.innerText = now1.toLocaleTimeString();
      }
    }

    // detail.innerText = "詳細へ";
    // const dateText = currentYear + "-" + String(currentMonth).padStart(2,"0") + "-" + String(i).padStart(2,"0");

    col.appendChild(date);
    col.appendChild(week);
    col.appendChild(clockIn);
    col.appendChild(clockOut);
    col.appendChild(clock);
    // col.appendChild(detail);
    calender.appendChild(col);
  }
}

getDateAndDay();

// const POSITION = {
//   FULL_TIME: 1,
//   PART: 2,
// };
// POSITION[FULL_TIME];
