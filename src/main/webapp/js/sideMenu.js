document.addEventListener("DOMContentLoaded",() => {
    const lists = document.getElementsByClassName("list");
    // const contents = document.getElementsByClassName("content");
    const arrayLists = Array.from(lists);
    // const arrayContents = Array.from(contents);
    arrayLists.forEach((list) => {
      list.addEventListener("click", (e) => changeTab(e));
    });
  
      function changeTab(e) {
        console.log("e: ", e.target.value);
        const listIndex = Number(e.target.value);
        // console.log(arrayContents);
        const beforeList = document.getElementsByClassName("active")[0];
        beforeList.classList.remove("active");
        // const beforeContent = document.getElementsByClassName("is-display")[0];
        // beforeContent.classList.remove("is-display");
  
        // const index2 = arrayContents.indexOf(this);
        // console.log("index2", index2);
        arrayTabs[listIndex].classList.add("active");
        // arrayContents[contentIndex].classList.add("is-display");
      }
    },
    false
  );
  