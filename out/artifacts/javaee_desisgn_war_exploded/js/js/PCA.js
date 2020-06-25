var pro = document.getElementById("province");
function getPro(){
    for(var i=0;i<infos.length;i++){
//					console.log(infos[i].code+"--"+infos[i].name);
        pro.innerHTML+="<option value='"+infos[i].name+"'>"+infos[i].name+"</option>";
    };
};
var cities = [];
var city = document.getElementById("city");
function getCity(t){
    var proID = t.value;
    area.innerHTML="<option>请选择县区</option>";
    city.innerHTML="<option>请选择城市</option>";
    for(var i=0;i<infos.length;i++){
        if(proID==infos[i].name){
            cities = infos[i].city;
            //遍历city
            for(var j=0;j<cities.length;j++){
                city.innerHTML+="<option value='"+cities[j].name+"'>"+cities[j].name+"</option>";
            }
            break;
        }
    };
}
var area = document.getElementById("area");
function getArea(t){
    var areaID = t.value;
    area.innerHTML="<option>请选择县区</option>";
    for(var j=0;j<cities.length;j++){
        if (areaID==cities[j].name){
            for (var k=0;k<cities[j].area.length;k++){
                area.innerHTML+="<option value='"+cities[j].area[k].name+"'>"+cities[j].area[k].name+"</option>";
            }
            break;
        }
    };
}
