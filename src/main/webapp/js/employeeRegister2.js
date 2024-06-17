var i = 1 ;
function addForm() {
    let div1 = document.createElement('div'); 
    let label_name = document.createElement('label'); 
    label_name.setAttribute("for", "employeeName");
    label_name.appendChild(document.createTextNode("名前:"));
    let input_name = document.createElement('input');    
    input_name.setAttribute("type", "text");
    input_name.setAttribute("id", "employeeName");
    input_name.setAttribute("name", "employeeName");

    let div2 = document.createElement('div'); 
    let label_email = document.createElement('label'); 
    label_email.setAttribute("for", "email");
    label_email.appendChild(document.createTextNode("メールアドレス:"));
    let input_email = document.createElement('input');
    input_name.setAttribute("type", "email");
    input_name.setAttribute("id", "email");
    input_name.setAttribute("name", "email");
    var parent = document.getElementById('employeeForm');
    parent.appendChild(div1);
    parent.appendChild(label_name);
    parent.appendChild(input_name);
    parent.appendChild(div2);
    parent.appendChild(label_email);
    parent.appendChild(input_email);
    i++ ;
}