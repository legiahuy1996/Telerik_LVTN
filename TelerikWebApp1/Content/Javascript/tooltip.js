﻿var offsetfromcursorX=1,offsetfromcursorY=0,offsetdivfrompointerX=0,offsetdivfrompointerY=2;document.write('<div id="dhtmltooltip" class="dhtmltooltip" style="width:500px;" ></div>');document.write('<img id="dhtmlpointer" class="dhtmlpointer" style="display:none;" src="image/arrow.gif">');var ie=document.all,ns6=document.getElementById&&!document.all,enabletip=false;if(ie||ns6)var tipobj=document.all?document.all.dhtmltooltip:document.getElementById?document.getElementById("dhtmltooltip"):"";var pointerobj=document.all?document.all.dhtmlpointer:document.getElementById?document.getElementById("dhtmlpointer"):"";function ietruebody(){return document.compatMode&&document.compatMode!="BackCompat"?document.documentElement:document.body}function ddrivetip(d,c,a){var b="undefined";if(ns6||ie){if(typeof c!=b)tipobj.style.width=c+"px";if(typeof a!=b&&a!="")tipobj.style.backgroundColor=a;tipobj.innerHTML=d;enabletip=true;return false}}function positiontip(c){var a="px";if(enabletip){var d=false,b=ns6?c.pageX:event.clientX+ietruebody().scrollLeft,e=ns6?c.pageY:event.clientY+ietruebody().scrollTop,g=ie&&!window.opera?ietruebody().clientWidth:window.innerWidth-20,f=ie&&!window.opera?ietruebody().clientHeight:window.innerHeight-20,i=ie&&!window.opera?g-event.clientX-offsetfromcursorX:g-c.clientX-offsetfromcursorX,h=ie&&!window.opera?f-event.clientY-offsetfromcursorY:f-c.clientY-offsetfromcursorY,j=offsetfromcursorX<0?offsetfromcursorX*-1:-1e3;if(i<tipobj.offsetWidth){tipobj.style.left=b-tipobj.offsetWidth+a;d=true}else if(b<j)tipobj.style.left="5px";else{tipobj.style.left=b+offsetfromcursorX-offsetdivfrompointerX+a;pointerobj.style.left=b+offsetfromcursorX+a}if(h<tipobj.offsetHeight){tipobj.style.top=e-tipobj.offsetHeight-offsetfromcursorY+a;d=true}else{tipobj.style.top=e+offsetfromcursorY+offsetdivfrompointerY+a;pointerobj.style.top=e+offsetfromcursorY+a}tipobj.style.visibility="visible";if(!d)pointerobj.style.visibility="visible";else pointerobj.style.visibility="hidden"}}function hideddrivetip(){if(ns6||ie){enabletip=false;tipobj.style.visibility="hidden";pointerobj.style.visibility="hidden";tipobj.style.left="-1000px";tipobj.style.backgroundColor="";tipobj.style.width=""}}document.onmousemove=positiontip;