function doimau(){
    var count = 0;
    var a = document.getElementById("mau");
    if(count ==0){
        a.style.borderColor = "rgb(236, 53, 53)";
        count =1;
    }
    else{
        a.style.borderColor = "#000000";
        count =0;
    }
}