var YYYY = document.getElementById("YYYY");
var fullYear = new Date().getFullYear();
var month=new Date().getMonth()+1;
var data=new Date().getDate();
var flag=0;
MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
function YYYYDD(){
    for(var i=fullYear-119;i<fullYear+1;i++){
//					console.log(infos[i].code+"--"+infos[i].name);
        YYYY.innerHTML+="<option value='"+i+"'>"+i+"</option>";
    };
};
var MM = document.getElementById("MM");
function MMDD(t){
    flag=IsRunYear(t.value);
    var YYYY_ID = t.value;
    if(flag)
        MonHead[1]=29;
    if (YYYY_ID==fullYear)
        var n=month;
    else
        var n=12;
    MM.innerHTML="<option>请选择 月</option>";
    DD.innerHTML="<option>请选择 日</option>";
    for(var i=1;i<n+1;i++){
        MM.innerHTML+="<option value='"+i+"'>"+i+"</option>";
    };
}
var DD = document.getElementById("DD");
function getDD(t){
    var MM_ID = t.value;
    if (MM_ID==month)
        var n=data;
    else
        n=MonHead[MM_ID-1];

    DD.innerHTML="<option>请选择 日</option>";
    for(var j=0;j<n+1;j++){
                DD.innerHTML+="<option value='"+j+"'>"+j+"</option>";
    };
}

function IsRunYear(year)//判断是否闰平年
{     return((0 == year%4 && year%100 !=0 )|| year%400 == 0);}

