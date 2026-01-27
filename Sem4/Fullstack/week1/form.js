const form= document.getElementById("form");
const names = document.getElementById("name");
const age= document.getElementById("age");
const year = document.getElementById("year");
const pass = document.getElementById("pass");
const submit = document.getElementById("submit");
const file = document.getElementById("file");

function onlo(){
    alert("page is loaded");
}
function focuse(){
    document.getElementById("email").style.backgroundColor="blue";
}
function changeco(){
    document.getElementById("name").style.background="yellow";
}

function unchangeco(){
    document.getElementById("name").style.background="white";
}
function changecolup(){
    document.getElementById("ph").style.background="yellow";
}

function changecoldown(){
    document.getElementById("ph").style.background="white";
}
function changecolpress(){
    document.getElementById("ph").style.background="blue";
}


year.addEventListener('change', (e) => {
    alert(`Year changed to: ${e.target.value}`);
});

submit.addEventListener('click', (event) => {
    alert("Do you want to submit the form?")  
});
