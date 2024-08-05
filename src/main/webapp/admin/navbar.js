
 document.querySelector('.cross').style.display='none';
document.querySelector('.hamberger').addEventListener("click",()=>{
    document.querySelector('.aside').classList.toggle('sidebarGo')

    if(document.querySelector('.aside').classList.contains('sidebarGo')){
        document.querySelector('.ham').style.display='inline'
        document.querySelector('.cross').style.display='none'
    }
    else{
        document.querySelector('.ham').style.display='none'
        document.querySelector('.cross').style.display='inline'
    }
});



       


document.querySelector('.li').addEventListener("click",()=>{
    document.querySelector('.aside').classList.toggle('sidebarGo')

    if(document.querySelector('.aside').classList.contains('sidebarGo')){
        document.querySelector('.ham').style.display='inline'
        document.querySelector('.cross').style.display='none'
    }
    else{
        document.querySelector('.ham').style.display='none'
        document.querySelector('.cross').style.display='inline'
    }
});



   