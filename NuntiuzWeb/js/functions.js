/*==============================================================
=  ====  =============================  =====  ===============
=  ====  =============================  =====  ===============
=  ====  =============================  =====  ===============
=  ====  ===   ===  =   ===  ===   ===  =====  ===   ====   ==
=   ==   ==  =  ==    =  ======  =  ==    ===  ==  =  ==  =  =
==  ==  ======  ==  =======  =====  ==  =  ==  ==     ===  ===
==  ==  ====    ==  =======  ===    ==  =  ==  ==  =======  ==
===    ====  =  ==  =======  ==  =  ==  =  ==  ==  =  ==  =  =
====  ======    ==  =======  ===    ==    ===  ===   ====   ==
==============================================================*/
var urlServer = 'http://localhost/Nuntiuz/APIs/';
var x = new XMLHttpRequest();
var check = true;
var latitude;
var longitude;
if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(function(position) {
      latitude = position.coords.latitude;
      longitude = position.coords.longitude;
      console.log(latitude);
      console.log(longitude);
  });
}


/*
===============================
=       =====    ====  =====  =
=  ====  ===  ==  ===   ===   =
=  ====  ==  ====  ==  =   =  =
=  ====  ==  ====  ==  == ==  =
=  ====  ==  ====  ==  =====  =
=  ====  ==  ====  ==  =====  =
=  ====  ==  ====  ==  =====  =
=  ====  ===  ==  ===  =====  =
=       =====    ====  =====  =
===============================
*/

function allPromotions(){
  window.location = 'index.html';
  getAllPromotions();
}

function nearPromotions(){
  if(window.innerWidth < 769){
    checkMenu();
  }
  var container = document.getElementById('container');
  var container1 = document.getElementById('container-1');
  var container2 = document.getElementById('container-2');
  var container3 = document.getElementById('container-3');
  var divLoader = document.createElement('div');
  var imgLoader = document.createElement('img');
  var delay = 3000;
  var distance = document.createElement('input');
  var txtDistance = document.createElement('div');
  var nmbDistance = document.createElement('div');

  container.removeChild(container1);
  container.removeChild(container2);
  container.removeChild(container3);

  divLoader.className = 'loader';
  divLoader.style.height = window.innerHeight-400+'px';
  console.log(window.innerWidth);

  imgLoader.src = 'images/gps.gif';

  txtDistance.innerHTML = 'Distance:';

  txtDistance.setAttribute('id','txtDistance');
  nmbDistance.setAttribute('id','nmbDistance');
  distance.setAttribute('type', 'range');
  distance.setAttribute('id','distance');
  distance.setAttribute('min', '50');
  distance.setAttribute('max','500');
  distance.setAttribute('step','50');
  distance.setAttribute('value','50');
  distance.setAttribute('onchange', 'showDistanceRange();');
  divLoader.appendChild(imgLoader);
  container.appendChild(divLoader);
  nmbDistance.innerHTML = distance.value + 'mts';



  setTimeout(function() {
    container.removeChild(divLoader);
    container.appendChild(txtDistance);
    container.appendChild(distance);
    container.appendChild(nmbDistance);
    getNearPromotions(latitude, longitude, distance.value);
  }, delay);
}

function signUp(){
  if(window.innerWidth < 769){
    checkMenu();
  }
  var container = document.getElementById('container');
  var container1 = document.getElementById('container-1');
  var container2 = document.getElementById('container-2');
  var container3 = document.getElementById('container-3');

  while (container.firstChild) {
    container.removeChild(container.firstChild);
  }

  var form = document.createElement('form');
  var lblFirstName = document.createElement('label');
  var txtFirstName = document.createElement('input');
  var lblLastName = document.createElement('label');
  var txtLastName = document.createElement('input');
  var lblDate = document.createElement('label');
  var txtDate = document.createElement('input');
  var lblEmail = document.createElement('label');
  var txtEmail = document.createElement('input');
  var lblPassword = document.createElement('label');
  var txtPassword = document.createElement('input');
  var btnSubmit = document.createElement('button');

  lblFirstName.innerHTML = 'First Name:';
  lblLastName.innerHTML = 'Last Name:';
  lblDate.innerHTML = 'Date of Birth:';
  lblEmail.innerHTML = 'Email:';
  lblPassword.innerHTML = 'Password:';
  btnSubmit.innerHTML = 'Sign Up';

  form.setAttribute('id','signUp');
  form.setAttribute('action','javascript:gg();')
  txtFirstName.setAttribute('id','txtFirstName');
  txtFirstName.setAttribute('type','text');
  txtLastName.setAttribute('id','txtLastName');
  txtLastName.setAttribute('type','text');
  txtDate.setAttribute('id','txtDate');
  txtDate.setAttribute('type','date');
  txtEmail.setAttribute('id','txtEmail');
  txtEmail.setAttribute('type','email');
  txtPassword.setAttribute('id','txtPassword');
  txtPassword.setAttribute('type','password');

  txtFirstName.required = true;
  txtFirstName.required = true;
  txtLastName.required = true;
  txtLastName.required = true;
  txtDate.required = true;
  txtDate.required = true;
  txtEmail.required = true;
  txtEmail.required = true;
  txtPassword.required = true;

  form.appendChild(lblFirstName);
  form.appendChild(txtFirstName);
  form.appendChild(lblLastName);
  form.appendChild(lblLastName);
  form.appendChild(txtLastName);
  form.appendChild(lblDate);
  form.appendChild(txtDate);
  form.appendChild(lblEmail);
  form.appendChild(txtEmail);
  form.appendChild(lblPassword);
  form.appendChild(txtPassword);
  form.appendChild(btnSubmit);

  container.appendChild(form);

}

function gg(){
  alert('a huevo');
}

function showDistanceRange(){
  var distance = document.getElementById('distance');
  var number = document.getElementById('nmbDistance');
  var promotions = document.getElementsByClassName('promotion');
  var container1 = document.getElementById('container-1');
  var container2 = document.getElementById('container-2');
  var container3 = document.getElementById('container-3');
  container1.remove();
  container2.remove();
  container3.remove();
  number.innerHTML = ''+distance.value+' mts';
  getNearPromotions(latitude, longitude, distance.value);
}

function checkMenu(){
  if(check == true){
    openMenu();
    check = false;
  }
  else{
    closeMenu();
    check = true;
  }
}
function openMenu(){
  var sidemenu = document.getElementById('sidemenu');
  var container = document.getElementById('container');
  container.style.display = 'none';
  sidemenu.style.display = 'block';
}
function closeMenu(){
  var sidemenu = document.getElementById('sidemenu');
  var container = document.getElementById('container');
  container.style.display = 'inline';
  sidemenu.style.display = 'none';
}



/*====================================
====  =====       ===    ===      ==
===    ====  ====  ===  ===  ====  =
==  ==  ===  ====  ===  ===  ====  =
=  ====  ==  ====  ===  ====  ======
=  ====  ==       ====  ======  ====
=        ==  =========  ========  ==
=  ====  ==  =========  ===  ====  =
=  ====  ==  =========  ===  ====  =
=  ====  ==  ========    ===      ==
====================================*/

function getAllPromotions(){
  x.open('GET', urlServer + 'getAllPromotions.php', true);
  x.send();
  x.onreadystatechange = function(){
    if(x.status == 200 & x.readyState == 4){
      parsePromotions(x.responseText);
    }
  }
}

function parsePromotions(data){
  var jsonData = JSON.parse(data);
  if(jsonData.status == 0){
    showPromotions(jsonData);
  }
  else{
    console.log('Bad JSON');
  }
}

function showPromotions(data){
  var promotions = data.promotions;
  var container = document.getElementById('container');
  var container1 = document.createElement('div');
  var container2 = document.createElement('div');
  var container3 = document.createElement('div');
  var contador = 0;

  container1.setAttribute('id','container-1');
  container2.setAttribute('id','container-2');
  container3.setAttribute('id','container-3');

  container.appendChild(container1);
  container.appendChild(container2);
  container.appendChild(container3);

  for(var i = 0; i < promotions.length; i++){
    var promotion = promotions[i];
    var franchise = promotions[i].franchise;
    var divPromotion = document.createElement('div');
    var divLogoPromotion = document.createElement('div');
    var imgLogoPromotion = document.createElement('img');
    var divTitlePromotion = document.createElement('div');
    var divDescriptionPromotion = document.createElement('div');
    var divHourLogo = document.createElement('div');
    var imgHourLogo = document.createElement('img');
    var divBeginHourTxt = document.createElement('div');
    var divBeginHourNumber = document.createElement('div');
    var divEndHourTxt = document.createElement('div');
    var divEndHourNumber = document.createElement('div');
    var divTimeLogo = document.createElement('div');
    var imgTimeLogo = document.createElement('img');
    var divStartDateTxt = document.createElement('div');
    var divStartDateDate = document.createElement('div');
    var divEndDateTxt = document.createElement('div');
    var divEndDateDate = document.createElement('div');
    var divFranchiseLogo = document.createElement('div');
    var imgFranchiseLogo = document.createElement('img');
    var divFranchiseText = document.createElement('div');
    var divFranchiseName = document.createElement('div');

    divPromotion.className = 'promotion';
    divLogoPromotion.className = 'logo-promotion';
    divTitlePromotion.className = 'title-promotion';
    divDescriptionPromotion.className = 'description-promotion';
    divHourLogo.className = 'hour-logo';
    divBeginHourTxt.className = 'beginHour-promotion-text';
    divBeginHourNumber.className = 'beginHour-promotion-hour';
    divEndHourTxt.className = 'endHour-promotion-text';
    divEndHourNumber.className = 'endHour-promotion-hour';
    divTimeLogo.className = 'time-logo';
    divStartDateTxt.className = 'start-date-text';
    divStartDateDate.className = 'start-date-date';
    divEndDateTxt.className = 'end-date-text';
    divEndDateDate.className = 'end-date-date';
    divFranchiseLogo.className = 'franchise-logo';
    divFranchiseText.className = 'franchise-text';
    divFranchiseName.className = 'franchise-name';

    imgLogoPromotion.src = 'http://seeklogo.com/images/C/Carl_s_Jr_-logo-2443A114F7-seeklogo.com.gif';
    imgHourLogo.src = 'images/clock.png';
    imgTimeLogo.src = 'images/time.png';
    imgFranchiseLogo.src = 'images/web.png';

    divTitlePromotion.innerHTML = promotion.title;
    divDescriptionPromotion.innerHTML = promotion.description;
    divBeginHourTxt.innerHTML = 'Start Hour:';
    divBeginHourNumber.innerHTML = promotion.beginHour;
    divEndHourTxt.innerHTML = 'End Hour:';
    divEndHourNumber.innerHTML = promotion.endHour;
    divStartDateTxt.innerHTML = 'Start Date:';
    divStartDateDate.innerHTML = promotion.beginDate;
    divEndDateTxt.innerHTML = 'End Date:';
    divEndDateDate.innerHTML = promotion.endDate;
    divFranchiseName.innerHTML = franchise.name;

    divLogoPromotion.appendChild(imgLogoPromotion);
    divPromotion.appendChild(divLogoPromotion);
    divPromotion.appendChild(divTitlePromotion);
    divPromotion.appendChild(divDescriptionPromotion);
    divHourLogo.appendChild(imgHourLogo);
    divPromotion.appendChild(divHourLogo);
    divPromotion.appendChild(divBeginHourTxt);
    divPromotion.appendChild(divBeginHourNumber);
    divPromotion.appendChild(divEndHourTxt);
    divPromotion.appendChild(divEndHourNumber);
    divTimeLogo.appendChild(imgTimeLogo);
    divPromotion.appendChild(divTimeLogo);
    divPromotion.appendChild(divStartDateTxt);
    divPromotion.appendChild(divStartDateDate);
    divPromotion.appendChild(divEndDateTxt);
    divPromotion.appendChild(divEndDateDate);
    divFranchiseLogo.appendChild(imgFranchiseLogo);
    divPromotion.appendChild(divFranchiseLogo);
    divPromotion.appendChild(divFranchiseName);

    switch (contador) {
      case 0:
        container1.appendChild(divPromotion);
        contador++;
      break;
      case 1:
        container2.appendChild(divPromotion);
        contador++;
      break;
      case 2:
        container3.appendChild(divPromotion);
        contador = 0;
      break;

    }
  }
}




function getNearPromotions(lati, longi, distan){
  x.open('GET', urlServer + 'getNearPromotions.php?lat='+lati+'&lng='+longi+'&dist='+distan, true);
  x.send();
  x.onreadystatechange = function(){
    if(x.status == 200 & x.readyState == 4){
      parseNearPromotions(x.responseText);
    }
  }
}

function parseNearPromotions(data){
  var jsonData = JSON.parse(data);
  if(jsonData.status == 0){
    showNearPromotions(jsonData);
  }
  else{
    console.log('Bad JSON');
  }
}

function showNearPromotions(data){
  var promotions = data.promotions;
  console.log(promotions.length);
  var container = document.getElementById('container');
  var container1 = document.createElement('div');
  var container2 = document.createElement('div');
  var container3 = document.createElement('div');
  var contador = 0;

  container1.setAttribute('id','container-1');
  container2.setAttribute('id','container-2');
  container3.setAttribute('id','container-3');

  container.appendChild(container1);
  container.appendChild(container2);
  container.appendChild(container3);

  for(var i = 0; i < promotions.length; i++){
    var promotion = promotions[i];
    var places = promotion.places;
    if(places.length > 0){
      for(var j=0; j < places.length; j++){
        var place = places[i];
        var divPromotion = document.createElement('div');
        var divLogoPromotion = document.createElement('div');
        var imgLogoPromotion = document.createElement('img');
        var divTitlePromotion = document.createElement('div');
        var divDescriptionPromotion = document.createElement('div');
        var divHourLogo = document.createElement('div');
        var imgHourLogo = document.createElement('img');
        var divBeginHourTxt = document.createElement('div');
        var divBeginHourNumber = document.createElement('div');
        var divEndHourTxt = document.createElement('div');
        var divEndHourNumber = document.createElement('div');
        var divTimeLogo = document.createElement('div');
        var imgTimeLogo = document.createElement('img');
        var divStartDateTxt = document.createElement('div');
        var divStartDateDate = document.createElement('div');
        var divEndDateTxt = document.createElement('div');
        var divEndDateDate = document.createElement('div');

        divPromotion.className = 'promotion';
        divLogoPromotion.className = 'logo-promotion';
        divTitlePromotion.className = 'title-promotion';
        divDescriptionPromotion.className = 'description-promotion';
        divHourLogo.className = 'hour-logo';
        divBeginHourTxt.className = 'beginHour-promotion-text';
        divBeginHourNumber.className = 'beginHour-promotion-hour';
        divEndHourTxt.className = 'endHour-promotion-text';
        divEndHourNumber.className = 'endHour-promotion-hour';
        divTimeLogo.className = 'time-logo';
        divStartDateTxt.className = 'start-date-text';
        divStartDateDate.className = 'start-date-date';
        divEndDateTxt.className = 'end-date-text';
        divEndDateDate.className = 'end-date-date';

        imgLogoPromotion.src = 'http://seeklogo.com/images/C/Carl_s_Jr_-logo-2443A114F7-seeklogo.com.gif';
        imgHourLogo.src = 'images/clock.png';
        imgTimeLogo.src = 'images/time.png';

        divTitlePromotion.innerHTML = promotion.title;
        divDescriptionPromotion.innerHTML = promotion.description;
        divBeginHourTxt.innerHTML = 'Start Hour:';
        divBeginHourNumber.innerHTML = promotion.beginHour;
        divEndHourTxt.innerHTML = 'End Hour:';
        divEndHourNumber.innerHTML = promotion.endHour;
        divStartDateTxt.innerHTML = 'Start Date:';
        divStartDateDate.innerHTML = promotion.beginDate;
        divEndDateTxt.innerHTML = 'End Date:';
        divEndDateDate.innerHTML = promotion.endDate;

        divLogoPromotion.appendChild(imgLogoPromotion);
        divPromotion.appendChild(divLogoPromotion);
        divPromotion.appendChild(divTitlePromotion);
        divPromotion.appendChild(divDescriptionPromotion);
        divHourLogo.appendChild(imgHourLogo);
        divPromotion.appendChild(divHourLogo);
        divPromotion.appendChild(divBeginHourTxt);
        divPromotion.appendChild(divBeginHourNumber);
        divPromotion.appendChild(divEndHourTxt);
        divPromotion.appendChild(divEndHourNumber);
        divTimeLogo.appendChild(imgTimeLogo);
        divPromotion.appendChild(divTimeLogo);
        divPromotion.appendChild(divStartDateTxt);
        divPromotion.appendChild(divStartDateDate);
        divPromotion.appendChild(divEndDateTxt);
        divPromotion.appendChild(divEndDateDate);
        for(var k = 0; k < places.length; k++){
          var place = places[j];
          console.log(place.name);
          var divFranchiseLogo = document.createElement('div');
          var imgFranchiseLogo = document.createElement('img');
          var divFranchiseText = document.createElement('div');
          var divFranchiseName = document.createElement('div');

          divFranchiseLogo.className = 'franchise-logo';
          divFranchiseText.className = 'franchise-text';
          divFranchiseName.className = 'franchise-name';


          imgFranchiseLogo.src = 'images/web.png';
          divFranchiseName.innerHTML = place.name;

          divFranchiseLogo.appendChild(imgFranchiseLogo);
          divPromotion.appendChild(divFranchiseLogo);
          divPromotion.appendChild(divFranchiseName);
        }


        switch (contador) {
          case 0:
            container1.appendChild(divPromotion);
            contador++;
          break;
          case 1:
            container2.appendChild(divPromotion);
            contador++;
          break;
          case 2:
            container3.appendChild(divPromotion);
            contador = 0;
          break;

        }
      }
    }
  }
}
