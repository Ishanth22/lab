let current='';
let operator='';
let previous='';
function appendnum(num){
    current+=num;
    document.getElementById('display').value=`${previous} ${operator} ${current}`;

}

function appendop(op){
    operator=op;
    previous=current;
    current='';
    document.getElementById('display').value=`${previous} ${operator} ${current}`;
}
function calculate(){
    let result;
    let prev=parseFloat(previous);
    let curr=parseFloat(current);

    switch(operator){
        case '+':
            result=prev+curr;
            break;
        case '-':
            result=prev-curr;
            break;
        case '*':
            result=prev*curr;
            break;
        case '/':
            result=prev/curr;
            break;
        default:
            return;
    }
    document.getElementById('display').value=`${result}`;
}

function clearall(){
    current='';
    operator='';
    previous='';
    document.getElementById('display').value='';
}