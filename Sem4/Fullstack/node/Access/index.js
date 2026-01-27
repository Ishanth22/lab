const {censor, addCensoredWord, getCensoredWords}=require("censorify");

addCensoredWord("work");
addCensoredWord("job");
console.log(getCensoredWords());
console.log(censor("work"));
console.log(censor("job"));             
