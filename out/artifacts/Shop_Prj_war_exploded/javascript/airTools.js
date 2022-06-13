let btn=document.getElementById("btn01")
btn.style.bottom=window.innerHeight*0.25+'px';
btn.style.left=window.innerWidth-100+'px';
window.addEventListener("resize", function (){
    console.log("窗口变了");
    var clientX = window.innerWidth;
    var clientY = window.innerHeight;
    console.log(clientY+'clientY',clientX+'clientX');
    btn.style.left=clientX-80+'px';
    btn.style.bottom=0.25*clientY+'px';
})