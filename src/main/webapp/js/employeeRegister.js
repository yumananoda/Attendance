// import { POSITION_NAME } from "./const";

const POSITION_NAME = {
  1: "正社員",
  2: "アルバイト",
};
const info = [];
const removeUsers = [];

// let empForm = document.getElementById("employeeForm");
// const func = () => {
//   const div = document.createElement("div");
//   div.className = "input-group";
//   const label = document.createElement("label");
//   label.htmlFor = "employeeName";
//     label.setAttribute("for", "employeeName");
//   const input = document.createElement("input");
//   input.htmlFor = "employeeName";
//   const div2 = document.createElement("/div");

//   const div3 = document.createElement("div");
//   appendChild;
// };

// function func2() {}

// const obj = {
//   name: "",
//   email: "",
//   position: 1,
//   hire_date: "",
// };

//追加ボタン押下
let form = document.getElementById("employeeForm");
let id = 1;
form.addEventListener("submit", async function (event) {
  event.preventDefault(); //普通の動きを止める
  // const inputContent = document.getElementById("employeeForm");
  let inputname = form.name.value;
  let inputemail = form.email.value;
  let inputradio = form.position.value;
  let inputdate = form.hire_date.value;
  console.log(inputname, inputemail, inputradio, inputdate);
  info.push({
    id: id,
    name: inputname,
    email: inputemail,
    position: inputradio,
    hire_date: inputdate,
  });
  console.log(info);
  form.reset();
  registerShow();
  console.log(id);
  id++;
});


  //関数registerShow定義
let registerUser = document.getElementById("registerUser");
const registerShow = () => {
  while (registerUser.firstChild) {
    registerUser.removeChild(registerUser.firstChild);
  }

  //チェックボックス生成
  for (let i = 0; i < info.length; i++) {
    let div4 = document.createElement("div");
    let check = document.createElement("input");
    check.setAttribute("type", "checkbox");
    check.setAttribute("name", "remove");
    check.setAttribute("value", info[i].id);
    //チェックボックス処理
    check.addEventListener("change", (e) => {
      if (removeUsers.some((x) => x === e.target.value)) { //チェックボックスが既チェック
        const index = removeUsers.findIndex((y) => y === e.target.value);
        removeUsers.splice(index, 1);
        console.log("removeUsersから削除");
      } else { //チェックボックスが未チェック
        removeUsers.push(e.target.value);
        console.log("removeUsersに追加");
      }
      console.log(removeUsers);
    })

    //入力済みのユーザを表示
    div4.appendChild(check);
    let p1 = document.createElement("p");
    let p2 = document.createElement("p");
    let p3 = document.createElement("p");
    let p4 = document.createElement("p");
    p1.innerText = info[i].name;
    p2.innerText = info[i].email;
    p3.innerText = POSITION_NAME[Number(info[i].position)];
    p4.innerText = info[i].hire_date;
    div4.appendChild(p1);
    div4.appendChild(p2);
    div4.appendChild(p3);
    div4.appendChild(p4);
    registerUser.appendChild(div4);
  }

  //削除ボタン追加&押下
  if (registerShow !== 0) {
    let removebtn = document.createElement("button");
    removebtn.textContent = "削除する";
    registerUser.appendChild(removebtn);
    removebtn.id = "removebtn";
    removebtn.addEventListener("click", function () {
      removeSelectedUsers();
      registerShow(); // 画面表示を更新
      alert("削除しました");
    });
  }
}
const removeSelectedUsers = () => {
  // removeUsersに含まれるIDをinfoから削除
  for (const userId of removeUsers) {
    const index = info.findIndex(user => user.id === parseInt(userId, 10));
    if (index !== -1) {
      info.splice(index, 1);
    }
  }
  // removeUsersをクリア
  removeUsers.length = 0;
};s

//登録ボタン押下
const registerbtn = document.getElementById("register");
registerbtn.addEventListener("click", function () {
  console.log("aaa");
  fetch("/DateTime/EmployeeRegisterServlet", {
    method: "POST",
    body: JSON.stringify(info),
  })
    .then((res) => console.log("success", res))
    .then((data) => console.log(data));
});


// let register = document.getElementById("register");
// register.href = "/DateTime/EmployeeRegisterServlet?name=aaa";

// const pEl = ce("p");
// const ce = (el) => document.createElement(el);
// const gebi = (id) => document.getElementById(id);
// const qs = (query) => document.querySelector(query);
// const ac = (child, parent) => parent.appendChild(child);
// const rlc = (parentEl) => parentEl.removeChild(parentEl.lastElementChild);
// const addClasses = (el, classNames) => {
//   classNames.forEach((className) => {
//     el.classList.add(className);
//   });
// };
// const removeClass = (el, className) => el.classList.remove(className);
