<%@ page import="com.ly.cloud.SaveDoraemonServlet" %>
<%@ page import="com.ly.cloud.testServlet" %>
<%@ page import="com.ly.cloud.GetCreditServlet" %>
<%@ page import="com.ly.cloud.LoginServlet" %>
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<html>
<head>

<title> Save Doraemon </title>
<script type="text/javascript">
<% testServlet servlet = new testServlet(); %>
<% LoginServlet loginServlet = new LoginServlet();%>


function randomColor() {
	var arrHex = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];
	var strHex = "#";
	var index;
	for(var i = 0; i < 6; i++) {
		index = Math.round(Math.random() * 15);
		strHex += arrHex[index];
	}
	return strHex;
}

function applyColor(){
	var bgColor = randomColor();
	var content = document.getElementById("content");
    var content1 = document.getElementById("content1");
	content.style.backgroundColor = bgColor;
    content1.style.backgroundColor = bgColor;
}


function applyColorGRE(){
	var bgColorGRE = "#B5DA94";
	var contentGRE = document.getElementById("content");
    var content1GRE = document.getElementById("content1");
	contentGRE.style.backgroundColor = bgColorGRE;
    content1GRE.style.backgroundColor = bgColorGRE;
}

function applyColorTOFEL(){
	var bgColorTOFEL = "#ECB467";
	var contentTOFEL = document.getElementById("content");
    var content1TOFEL = document.getElementById("content1");
	contentTOFEL.style.backgroundColor = bgColorTOFEL;
    content1TOFEL.style.backgroundColor = bgColorTOFEL;
}


var state = true;

var words = new Array
("ABACUS", "ABANDON", "ABASE", "ABASH", "ABATE");
<% %>

var words2 = new Array
("ABANDON", "ABASHED", "ABATE", "ABDICATE", "ABDUCT");

var targetWord = "";
var wordShow = "";
var letterPicked = "";
var wrongCnt = 0;
var cntCorrect=<%=testServlet.correctnumN %>;           <!-- *****************-->
var cntWord=<%=testServlet.totalnumN %>;
var count = "";
var flag;
var testing = "<%=servlet.generatedGREWord %>";

var credit = <%=testServlet.creditN %>;

var flagA1 = 0;
var flagA2 = 0;
var flagA3 = 0;
var flagA4 = 0;
var flagA5 = 0;
var flagA6 = 0;
var flagA7 = 0;
var flagB = 0;
var flagC1 = 0;
var flagC2 = 0;
var flagD = 0;
var flagE = 0;
var flagGRE = 0;
var flagTOEFL = 0;


function disableButton() {
    document.getElementById('buttonPass').disabled=true; 
    document.getElementById('buttonA').disabled=true;
    document.getElementById('buttonB').disabled=true;
    document.getElementById('buttonC').disabled=true;
    document.getElementById('buttonD').disabled=true;
    document.getElementById('buttonE').disabled=true;
    document.getElementById('buttonF').disabled=true;
    document.getElementById('buttonG').disabled=true;
    document.getElementById('buttonH').disabled=true;
    document.getElementById('buttonI').disabled=true;
    document.getElementById('buttonJ').disabled=true;
    document.getElementById('buttonK').disabled=true;
    document.getElementById('buttonL').disabled=true;
    document.getElementById('buttonM').disabled=true;
    document.getElementById('buttonN').disabled=true;
    document.getElementById('buttonO').disabled=true;
    document.getElementById('buttonP').disabled=true;
    document.getElementById('buttonQ').disabled=true;
    document.getElementById('buttonR').disabled=true;
    document.getElementById('buttonS').disabled=true;
    document.getElementById('buttonT').disabled=true;
    document.getElementById('buttonU').disabled=true;
    document.getElementById('buttonV').disabled=true;
    document.getElementById('buttonW').disabled=true;
    document.getElementById('buttonX').disabled=true;
    document.getElementById('buttonY').disabled=true;
    document.getElementById('buttonZ').disabled=true;
    document.getElementById('BOMB').disabled=true;
}

function enableButton() {
    document.getElementById('buttonPass').disabled=false; 
    document.getElementById('buttonA').disabled=false;
    document.getElementById('buttonB').disabled=false;
    document.getElementById('buttonC').disabled=false;
    document.getElementById('buttonD').disabled=false;
    document.getElementById('buttonE').disabled=false;
    document.getElementById('buttonF').disabled=false;
    document.getElementById('buttonG').disabled=false;
    document.getElementById('buttonH').disabled=false;
    document.getElementById('buttonI').disabled=false;
    document.getElementById('buttonJ').disabled=false;
    document.getElementById('buttonK').disabled=false;
    document.getElementById('buttonL').disabled=false;
    document.getElementById('buttonM').disabled=false;
    document.getElementById('buttonN').disabled=false;
    document.getElementById('buttonO').disabled=false;
    document.getElementById('buttonP').disabled=false;
    document.getElementById('buttonQ').disabled=false;
    document.getElementById('buttonR').disabled=false;
    document.getElementById('buttonS').disabled=false;
    document.getElementById('buttonT').disabled=false;
    document.getElementById('buttonU').disabled=false;
    document.getElementById('buttonV').disabled=false;
    document.getElementById('buttonW').disabled=false;
    document.getElementById('buttonX').disabled=false;
    document.getElementById('buttonY').disabled=false;
    document.getElementById('buttonZ').disabled=false;
    document.getElementById('BOMB').disabled=false;
}

function bomb() {
    var bomb = "";
    while(letterPicked.indexOf(bomb) != -1) {
        pos = Math.round(Math.random() * (testing.length - 1));
        bomb = testing.charAt(pos);
    }
    credit-=6;
    alert("  '" + bomb + "'  was cleared");
    selectLetter(bomb);
}

function selectLetter(l) {
    
    if (state == false) {        
        return;
    }
    
    if (letterPicked.indexOf(l) != -1) {
        return;
    }
	
    letterPicked = letterPicked + l;
    if (testing.indexOf(l) != -1){credit+=1}
    else {credit -= 2};
    document.game.usedLetters.value = letterPicked;
    document.game.credits.value = credit;
    
    if (testing.indexOf(l) != -1) {
        
        pos = 0;
        tempMask = wordShow;
        
        
        while (testing.indexOf(l, pos) != -1) {
            pos = testing.indexOf(l, pos);			
            end = pos + 1;
            
            startText = tempMask.substring(0, pos);
            endText = tempMask.substring(end, tempMask.length);
            
            tempMask = startText + l + endText;
            pos = end;
        }
        
        wordShow = tempMask;
        document.game.displayWord.value = wordShow;		
        if (wordShow.indexOf("*") == -1) {

            credit += 15;
            document.game.credits.value = credit;
            
            
            
            init();
            state = false;
            disableButton();
            cntCorrect +=1;
            cntWord += 1; 
            document.game.totalword.value = cntWord;
            document.game.correctword.value = cntCorrect;
            alert("You get the correct answer '" + testing+ "'  . You can click Collect to add the word to your word list.And you can click Next to go on.");
            
            if (cntCorrect == 5 && flagA1 == 0){eval("document.badge1.src=\"http://www.columbia.edu/~zz2220/a4.png\"");alert("Congratulations, you unlock Dora-Brain Badge(Lv.1)!"); flagA1 = 1;}
            if (cntCorrect == 7 && credit >=80 && flagA2 == 0){eval("document.badge1.src=\"http://www.columbia.edu/~zz2220/a2.png\"");alert("Congratulations, you update Dora-Brain Badge to Lv.2!"); flagA2 = 1;}
            if (cntCorrect == 9 && credit >=100 && flagA3 == 0){eval("document.badge1.src=\"http://www.columbia.edu/~zz2220/a5.png\"");alert("Congratulations, you update Dora-Brain Badge to Lv.3!"); flagA3 = 1;}
            if (credit >=150 && flagA4 == 0){eval("document.badge1.src=\"http://www.columbia.edu/~zz2220/a7.png\"");alert("Congratulations, you update Dora-Brain Badge to Lv.4!"); flagA4 = 1;}
            if (credit >=300 && flagA5 == 0){eval("document.badge1.src=\"http://www.columbia.edu/~zz2220/a1.png\"");alert("Congratulations, you update Dora-Brain Badge to Lv.5!"); flagA5 = 1;}
            if (credit >=500 && flagA6 == 0){eval("document.badge1.src=\"http://www.columbia.edu/~zz2220/a3.png\"");alert("Congratulations, you update Dora-Brain Badge to Lv.6!"); flagA6 = 1;}
            if (credit >=1000 && flagA7 == 0){eval("document.badge1.src=\"http://www.columbia.edu/~zz2220/a6.png\"");alert("Congratulations, you update Dora-Brain Badge to Lv.7!"); flagA7 = 1;}            
            if (cntCorrect/cntWord >= 0.75 && credit >= 120 && flagB == 0){eval("document.badge2.src=\"http://www.columbia.edu/~zz2220/b1.png\"");alert("Congratulations, you unlock Dora-Music Badge!"); flagB = 1;}            
            if ( Math.floor((credit - 50)/15) >= cntWord && flagD == 0 && flagA2 == 1){eval("document.badge4.src=\"http://www.columbia.edu/~zz2220/d1.png\"");alert("Congratulations, you unlock Dora-Love Badge!"); flagD = 1;}            
            if (flag == 2 && credit >= 200) {flagGRE = 1};
            if (flag == 1 && credit >= 200) {flagTOEFL = 1};
            if (flagGRE ==1 && flagTOEFL==1 && flagE == 0){eval("document.badge5.src=\"http://www.columbia.edu/~zz2220/e1.png\"");alert("Congratulations, you unlock Dora-Dream Badge!"); flagE = 1;}           
            document.game.dictionaryWord.value = testing;
            //timer = setTimeout("reset();",4000);
            init();
        }
    }
    else {

        wrongCnt += 1;
        eval("document.img.src=\"http://www.columbia.edu/~zz2220/img" + wrongCnt + ".jpg\"");		
        if (wrongCnt == 8) {
            credit -= 5; 
            cntWord += 1;
            document.game.credits.value = credit;
            document.game.correctword.value = cntCorrect;
            document.game.totalword.value = cntWord;
            init();      
            state = false;
            document.all.pickBomb.style.display = "none";
            disableButton();
            
            alert("You missed this word.  '" + testing+ "'  .Click Next button to try another one! Good Luck! ");
            if (flagC1 == 0&& cntCorrect >= 5){eval("document.badge3.src=\"http://www.columbia.edu/~zz2220/c2.png\"");alert("Oops, you unlock Dora-Storm Badge(Lv.1)!"); flagC1 = 1;}
            if (credit <= 0) {
                alert("You ran out your credits! Game will be restarted."); 
                if (credit <= 0 && cntCorrect >= 7 && flagC2 == 0){eval("document.badge3.src=\"http://www.columbia.edu/~zz2220/c1.png\"");alert("Oops, you ungrade Dora-Storm Badge to Lv.2!"); flagC2 = 1;};
                cntCorrect = 0; cntWord = 0; credit = 50;
            }          
            document.game.dictionaryWord.value = testing;
            timer = setTimeout("reset();",4000);
            init();       
        }
    }
    
}



function letterPickedSort() {
    document.game.usedLetters.value = document.game.usedLetters.value.split("").sort().toString().replace(/,/gi,"");
    letterPicked = letterPicked.split("").sort().toString().replace(/,/gi,"");
}


function initialize() {
    disableButton();
    timer = setTimeout("reset();",3000);
    document.all.pickLevel2.style.display = "block";
    document.all.pickLevel1.style.display = "none";
    document.getElementById('Level1ID').disabled=false; 
    document.getElementById('Level2ID').disabled=true;
    flag = 2;        
}



function reset() {
    
    init();
    document.game.credits.value = credit;
    document.game.correctword.value = cntCorrect;
    document.game.totalword.value = cntWord;
    //cntWord += 1;      
    selectWord();   
    document.game.usedLetters.value = "";
    letterPicked = "";
    wrongCnt = 0;
    
    document.img.src="http://www.columbia.edu/~zz2220/img0.png";
    document.all.pickA.style.display = "inline-block";
    document.all.pickB.style.display = "inline-block";
    document.all.pickC.style.display = "inline-block";
    document.all.pickD.style.display = "inline-block";
    document.all.pickE.style.display = "inline-block";
    document.all.pickF.style.display = "inline-block";
    document.all.pickG.style.display = "inline-block";
    document.all.pickH.style.display = "inline-block";
    document.all.pickI.style.display = "inline-block";
    document.all.pickJ.style.display = "inline-block";
    document.all.pickK.style.display = "inline-block";
    document.all.pickL.style.display = "inline-block";
    document.all.pickM.style.display = "inline-block";
    document.all.pickN.style.display = "inline-block";
    document.all.pickO.style.display = "inline-block";
    document.all.pickP.style.display = "inline-block";
    document.all.pickQ.style.display = "inline-block";
    document.all.pickR.style.display = "inline-block";
    document.all.pickS.style.display = "inline-block";
    document.all.pickT.style.display = "inline-block";
    document.all.pickU.style.display = "inline-block";
    document.all.pickV.style.display = "inline-block";
    document.all.pickW.style.display = "inline-block";
    document.all.pickX.style.display = "inline-block";
    document.all.pickY.style.display = "inline-block";
    document.all.pickZ.style.display = "inline-block";
    document.all.pickBomb.style.display = "inline-block";
    enableButton();
   
}



function resetWhenGiveUp() {
    cntCorrect = 0;
    cntWord = 0;
    credit = 50;
    document.game.credits.value = credit;
    document.game.correctword.value = cntCorrect;
    document.game.totalword.value = cntWord;
    
    cntWord += 1;
    selectWord();  
    document.game.usedLetters.value = "";
    letterPicked = "";
    wrongCnt = 0;
    
    document.img.src="http://www.columbia.edu/~zz2220/img0.jpg";
    document.all.pickA.style.display = "inline-block";
    document.all.pickB.style.display = "inline-block";
    document.all.pickC.style.display = "inline-block";
    document.all.pickD.style.display = "inline-block";
    document.all.pickE.style.display = "inline-block";
    document.all.pickF.style.display = "inline-block";
    document.all.pickG.style.display = "inline-block";
    document.all.pickH.style.display = "inline-block";
    document.all.pickI.style.display = "inline-block";
    document.all.pickJ.style.display = "inline-block";
    document.all.pickK.style.display = "inline-block";
    document.all.pickL.style.display = "inline-block";
    document.all.pickM.style.display = "inline-block";
    document.all.pickN.style.display = "inline-block";
    document.all.pickO.style.display = "inline-block";
    document.all.pickP.style.display = "inline-block";
    document.all.pickQ.style.display = "inline-block";
    document.all.pickR.style.display = "inline-block";
    document.all.pickS.style.display = "inline-block";
    document.all.pickT.style.display = "inline-block";
    document.all.pickU.style.display = "inline-block";
    document.all.pickV.style.display = "inline-block";
    document.all.pickW.style.display = "inline-block";
    document.all.pickX.style.display = "inline-block";
    document.all.pickY.style.display = "inline-block";
    document.all.pickZ.style.display = "inline-block";
    document.all.pickBomb.style.display = "inline-block";
    enableButton();
    applyColor();    
}

function pass() {
    credit-=10;
    cntWord += 1; 
    document.game.credits.value = credit;
    document.game.correctword.value = cntCorrect;
    document.game.totalword.value = cntWord;
    if (credit <= 0) {alert("You ran out your credits! Game will be restarted."); cntCorrect = 0; cntWord = 0; credit = 50;} 
    document.game.dictionaryWord.value = testing;
    reset();
}

function selectWord() {
    state = true;
    
    switch(flag){
        case 1:
        	
            random_number = Math.round(Math.random() * (words2.length - 1));
            testing = testing;   

            break;
            
        case 2:
        	
            random_number = Math.round(Math.random() * (words.length - 1));
            testing = testing;
  
            break;
            
        default:
        	
            random_number = Math.round(Math.random() * (words.length - 1));
            testing = testing;

            break;
    }
    
    letterMasked = createMask(testing);
    document.game.displayWord.value = letterMasked;
    wordShow = letterMasked;
}

function createMask(m) {
    mask = "";
    wordLenght = m.length;
    
    for (i = 0; i < wordLenght; i ++) {
        mask = mask + "*";
    }
    return mask;
}


function blinkI() {	
    badge1.style.height = 120;
    badge1.style.width = 105;
    badge1.style.left = 35;
    badge1.style.top= 30;
}
function blink() {	

    document.all.sound.src = "http://www.columbia.edu/~zz2220/dora.mp3";
    badge1.style.height = 150;
    badge1.style.width = 133;
    badge1.style.top = 10;
    badge1.style.left = 22;

    setTimeout("blinkI()", 500);	
}

function blink2I() {	
    badge2.style.height = 120;
    badge2.style.width = 105;
    badge2.style.top= 30;
    badge2.style.left = 145;            
}
function blink2() {	

    document.all.sound.src = "http://www.columbia.edu/~zz2220/dora.mp3";
    badge2.style.height = 150;
    badge2.style.width = 133;
    badge2.style.left = 132;
    badge2.style.top = 10;

    setTimeout("blink2I()", 500);	
}

function blink3I() {	
    badge3.style.height = 120;
    badge3.style.width = 105;
    badge3.style.top= 30;
    badge3.style.left = 255;            
}
function blink3() {	

    document.all.sound.src = "http://www.columbia.edu/~zz2220/dora.mp3";
    badge3.style.height = 150;
    badge3.style.width = 133;
    badge3.style.left = 242;
    badge3.style.top = 10;

    setTimeout("blink3I()", 500);	
}

function blink4I() {	
    badge4.style.height = 120;
    badge4.style.width = 105;
    badge4.style.top= 30;
    badge4.style.left = 365;            
}
function blink4() {	

    document.all.sound.src = "http://www.columbia.edu/~zz2220/dora.mp3";
    badge4.style.height = 150;
    badge4.style.width = 133;
    badge4.style.left = 352;
    badge4.style.top = 10;

    setTimeout("blink4I()", 500);	
}

function blink5I() {	
    badge5.style.height = 120;
    badge5.style.width = 105;
    badge5.style.top= 30;
    badge5.style.left = 475;            
}
function blink5() {	

    document.all.sound.src = "http://www.columbia.edu/~zz2220/dora.mp3";
    badge5.style.height = 150;
    badge5.style.width = 133;
    badge5.style.left = 462;
    badge5.style.top = 10;
    setTimeout("blink5I()", 500);	
}
</script>
</head>



<body onLoad="initialize();  return false;" >
<body background="http://www.columbia.edu/~zz2220/doraBad.jpg" class="bgimg" >
<bgsound id="sound">

<!-- *******************************************************ADDED ACCESS CONTROL*********************************************************** -->
<%if(session.getAttribute("loginName")!=null){ %>
   
   <br>
   
   <table border = "1">
   <% if(session.getAttribute("loginName").equals("admin")){  %>
   <tr>    
   <td><%=servlet.generatedGREWord %></td>   
   <td><%=loginServlet.creditN %></td>
   <td><%=loginServlet.correctnumN %></td>
   <td><%=loginServlet.totalnumN %>  
   <td><%=loginServlet.queryName %>
   <td><%=loginServlet.count %></td>
   </tr><!-- 
   <tr><form action="/add" method="post">
        
        <p><input type="submit" name="submit" value="Collect" class="" style="background-color:rgb(185,240,229);CURSOR: hand"/>
        <input type="hidden" name="playerName" value="<%=session.getAttribute("loginName") %>"/>
        <input type="hidden" name="word" value="<%=servlet.generatedGREWord %>"/></p>
  </form></tr> -->
  <%} %>
   </table>
   
   
<style type="text/css">

.baseBoard{
align:center;
position: absolute;
left:220;
top:-30;
height:300;
}		
.bgimg {
filter:Alpha(opacity=50);
    
position: absolute;
top:-20;
left:0;
}
input   {

    font-size: 20px;
filter:Alpha(style=1,opacity=100,finishOpacity=0);
}
.img{
position: absolute;
top: -60;
    left: 30;}
.buttonLetter{ 
filter:Alpha(style=1,opacity=100,finishOpacity=0);
width:40px; 
height:40px;
CURSOR: hand;            
} 
.buttonOper{ 
filter:Alpha(style=1,opacity=100,finishOpacity=0);
width:70px; 
height:40px; 
CURSOR: hand;
} 
.buttonReset{ 
filter:Alpha(style=1,opacity=100,finishOpacity=0);
position: absolute;
top: 137;
left: 475; 
width:50px; 
height:65px;
CURSOR: hand;                 
} 
.testing{
height:30px;
}
.usedLetters{
    
height:30px;
color:rgb(0,0,139);            
}

.main{
width: 972px;
height: 450px;
position: absolute;
top: 50;
left: 0;
}
.controlPad{
position: absolute;
top: 110;
left: 30;
    font-size:16;
}
.wordPad{
position: absolute;
top: 50;
left: 470;
}
.wordPadTitle{
color:rgb(157,132,91);
    font-size:22;
}
.toolPad{
position: absolute;
top: 260;
left: 470;
}
.toolPadTitle{
color:rgb(157,132,91);
    font-size:20;
}
.scoreBoard{
position: absolute;
top: 220;
    left: 380;}
.mailTo{
    font-size:13;
position: absolute;
top: 293;
left: 227;
}
.mailTo2{
    font-size:13;
position: absolute;
top: 395;
left: 269;
}
.bomb{
position: absolute;
top: 59;
left: 90;
width:50px; 
height:50px;
filter:Alpha(style=2,opacity=50,finishOpacity=10);
color:black; 			         
}
.score{
position: absolute;
top: 60;
left: 205;
width:50px; 
height:50px;
filter:Alpha(style=2,opacity=50,finishOpacity=10);
color:black;          
}
.level1{
position: absolute;
top: 65;
left: 310;
width:70px; 
height:40px;
filter:Alpha(style=2,opacity=50,finishOpacity=10);
color:black;          
}
.level2{
position: absolute;
top: 60;
left: 310;
width:50px; 
height:50px;
filter:Alpha(style=2,opacity=50,finishOpacity=10);
color:black;          
}
.clock{
position: absolute;
top: 695;
left: -58;
filter:Alpha(style=2,opacity=50,finishOpacity=10);
color:black;                     
}
.version{
position: absolute;
top: 660;
left: 1270;
}
.backtohome{
position: absolute;
top: 660;
left: 1190;
}
.stat{
position: absolute;
top: 22;
left: 4;
}
.credits{
position: absolute;
width: 60;
height: 40;
top: 95;
left: 45;
}
.correctword{
position: absolute;
width: 40;
height: 40;
top: 180;
left: 25;            
}
.totalword{
position: absolute;
width: 40;
height: 40;
top: 180;
left: 80;
}        
.scoreBoard{
color:black;
position: absolute;
top: 0;
left: -220;
}
.scoreBoardTitle{
color:rgb(157,132,91);
    font-size:20;
align:center;
}
.scoretitle{
left:20;
align:center;
position: absolute;
}
.dictionary{
color:black;
position: absolute;
top: 370;
left: -20;
}
.dictionaryword{
color:rgb(157,132,91);
    font-size:18;
align:center;
}
.dictionarytext {
color:black;
align:center;
}
.badge{
color:black;
position: absolute;
top: 460;
left: 365;
}
.badge1{ 
position: absolute;
top: 30;
left: 35;
}
.badge2{            
position: absolute;
top: 30;
left: 145;
}
.badge3{            
position: absolute;
top: 30;
left: 255;
}
.badge4{            
position: absolute;
top: 30;
left: 365;
}
.badge5{            
position: absolute;
top: 30;
left: 475;
}
.badgeHr{
position: absolute;
top: 7;
}
.badgeWord{
color:rgb(157,132,91);
position: absolute;
top: -5;
left: 250;
align:center;
    font-size:18;
}      
.help{
color:rgb(157,132,91);
position: absolute;
top: -240;
left: -1020;
    font-size:18;
}      
.logout{
position: absolute;
top:10;
left:600;
}
</style> 

<div class=baseBoard>   

<div id=content class=main   style="background-color:rgb(181,218,148);filter:Alpha(opacity=50);">
<!-- <p>Your are logged in as <%=session.getAttribute("loginName") %>
       
    you can <a href=<%=basePath+"pages/Logout.jsp" %>>log out!</a></p> -->
    <p><pre style="font-size:18px"> Hi! <b><%=session.getAttribute("loginName") %></b>,  Welcome to Save Doraemon, he needs you! </pre></p>
<div id=content1 class=controlPad   width="300"  style="background-color:rgb(181,218,148);filter:Alpha(opacity=50);">    
<p><img class="img" src="http://www.columbia.edu/~zz2220/img0.png" height="240" width="320" name="img"></p>
<br>
<br>
<br>
<br>
<br>
<br>
<br> 
<br>
<br>    
<form name="game" action="/test" method="post">
<p>Target Word: <input type="text" class="testing" name="displayWord" DISABLED >
<input id=buttonPass alt="Get a New Word" title="Get a New Word" border="0" onclick="javascript:funPass()" name=refresh class="buttonOper" type=hidden value=Pass name=refresh style="background-color:rgb(179,238,38);CURSOR: hand"><br>

<script language=javascript>
function funPass() {
	//document.getElementById("cv").value=credit;
	//document.getElementById("cn").value=cntCorrect;
	//document.getElementById("tn").value=cntWord;
    if (confirm("Pass this word and get a new one? (passing this word will lose 10 credits)")) { 
        pass();
    }
}
</script>
 <input id='cv1' type="hidden" name="creditval" />
  <input id='cn1' type="hidden" name="correctnum" />
   <input id='tn1' type="hidden" name="totalnum" />
Used Letters:  <input type="text" class="usedLetters" name="usedLetters" DISABLED>

<input type="submit" name="submit" value="NEXT" onclick="javascript:next()" class="" style="background-color:rgb(185,240,229);CURSOR: hand"/></p>     
<script language=javascript>
function next() {
	document.getElementById("cv1").value=credit;
	document.getElementById("cn1").value=cntCorrect;
	document.getElementById("tn1").value=cntWord;   
}
</script>


<hr>
<br>
<a alt="Mail to author" title="Mail to Author" href= "mailto:zz2220@columbia.edu " class="mailTo"> Contact Team Dreamer</a>

<table  class="scoreBoard" width="150" height="250" border="2" style="background-color:rgb(181,218,148);filter:Alpha(opacity=50);">
<td align=center id="scoreBoard" class=scoreBoardTitle height="120"  style="display:inline-inline-block">      
<form class="scoretitle"><p> Score Board </p></form>
<hr>
<form><p> Credits: </p></form>
<input type="text"   class="credits" name="credits" DISABLED>
<br>
<form><p> Correct/Total: </p></form>
<input type="text"  class="correctword" name="correctword" DISABLED><input type="text"  class="totalword" name="totalword" DISABLED>
<br>
<br>
<form name="postcredit" action="/postcredit"  method="post">
<input type="hidden" value="Record High Credit" onclick="javascript:postCredit()" class="" style="background-color:rgb(185,240,229);CURSOR: hand;font-size:60%"/>
 <input id='cv' type="hidden" name="creditval" />
  <input id='cn' type="hidden" name="correctnum" />
   <input id='tn' type="hidden" name="totalnum" />
</form>
<form name="getcredit" action="/getcredit" method="post">
<input type="hidden" value="Get High Credit" onclick="javascript:getCredit()"class="" style="background-color:rgb(185,240,229);CURSOR: hand;font-size:60%"/>
</form>

<script type="text/javascript">
function postCredit()
{
	document.getElementById("cv").value=credit;
	document.getElementById("cn").value=cntCorrect;
	document.getElementById("tn").value=cntWord;
}
</script>


<script type="text/javascript">
function getCredit()
{
	credit=<%=testServlet.creditN %>;            <!--  ****************** -->
	cntCorrect=<%=testServlet.correctnumN %>;
	cntWord=<%=testServlet.totalnumN %>;
	//document.game.credits.value = 22;

}
</script>         
</p>
</td>
</tr>
</table> 
   

<table  class="dictionary" alt="This is an entry in the dictionary of the LAST Target Word you guessed" title="This is an entry in the dictionary of the LAST Target Word you guessed" width="100" height="100" border="2" style="background-color:rgb(181,218,148);filter:Alpha(opacity=50);">
<td align=center id="dictionary" class=dictionaryTitle height="40"  style="display:inline-inline-block">  
<form class="dictionaryword"><p> Dictionary </p></form>
<hr>
<form><p> </p></form>
<a onClick="window.open('http://en.wiktionary.org/wiki/<%=servlet.generatedGREWord.toLowerCase() %>','','height=500,width=611,scrollbars=yes,status =no')"><input type="text"   style="CURSOR: hand;" class=dictionarytext alt="Click to look up this word in Wiktionary" title="Click to look up this word in Wiktionary" onclick="funOpen" width="100" height="45" class="dictionaryWord"  name="dictionaryWord" DISABLED></a>        
</p>
</td>
</tr>
</table>    
</form>    
</div>

<table class="addButton" width="600">
<br><br><br><br><br><br>
<br><br><br><br><br><br><br>
<br><br><br>
<tr>
  <td align = "center">
  <form action="/add" method="post">
        <br><br><br><br><br><br><br>    
        <input id='cv8' type="hidden" name="creditval" />
  		<input id='cn8' type="hidden" name="correctnum" />
   		<input id='tn8' type="hidden" name="totalnum" />  	
        <p><input type="submit" name="submit" value="Collect" onclick="javascript:add()" class="" style="background-color:rgb(185,240,229);CURSOR: hand"/>
        <input type="hidden" name="playerName" value="<%=session.getAttribute("loginName") %>"/>
        <input type="hidden" name="word" value="<%=servlet.generatedGREWord %>"/></p>
  </form></td></tr>
<script language=javascript>
function add() {
	document.getElementById("cv8").value=credit;
	document.getElementById("cn8").value=cntCorrect;
	document.getElementById("tn8").value=cntWord;   
}
</script>  
<script language=javascript>
function collect() {
	document.getElementById("cv2").value=credit;
	document.getElementById("cn2").value=cntCorrect;
	document.getElementById("tn2").value=cntWord;   
}
</script>
  <tr><td align = "center">
  <form action="/view" method="post">  
         <input id='cv3' type="hidden" name="creditval" />
  		<input id='cn3' type="hidden" name="correctnum" />
   		<input id='tn3' type="hidden" name="totalnum" />      
        <p><input type="submit" name="submit" value="VIEW" onclick="javascript:view()" class="" style="background-color:rgb(185,240,229);CURSOR: hand"/>
        <input type="hidden" name="playerName" value="<%=session.getAttribute("loginName") %>"/></p>
  </form>
  <form action="/logout" method="post"><p>
        <input id='cv2' type="hidden" name="creditval" />
  		<input id='cn2' type="hidden" name="correctnum" />
   		<input id='tn2' type="hidden" name="totalnum" />
   		<input type="hidden" name="playerName" value="<%=session.getAttribute("loginName") %>"/>
   		<input type="submit" name="submit" value="Save&Logout" onclick="javascript:collect()" class="logout" style="background-color:rgb(185,240,229);CURSOR: hand"/></p></form>
  </td></tr>
  <script language=javascript>
function view() {
	document.getElementById("cv3").value=credit;
	document.getElementById("cn3").value=cntCorrect;
	document.getElementById("tn3").value=cntWord;   
}
</script>
</table>



<table  class="badge" alt="Unclock and update your badges" title="Unclock and update your badges" width="600" height="180" border="2" style="background-color:rgb(181,218,148);filter:Alpha(opacity=50);">
<td align=center id="badge" class=badgeTitle height="40" >  
<form class="badgeWord"><p> Badge Gallery</p></form>
<hr class="badgeHr">
<div>
<img 
onclick="javascript:blink()"  id='badge1' style="CURSOR: hand;" alt="Dora-Brain" title="Dora-Brain" class="badge1" src="http://www.columbia.edu/~zz2220/a0.png" height="120" width="105" name="badge1"><img  onclick="javascript:blink2()" id='badge2' style="CURSOR: hand;" alt="Dora-Music" title="Dora-Music" class="badge2" src="http://www.columbia.edu/~zz2220/b0.png" height="120" width="105" name="badge2"><img  onclick="javascript:blink3()" id='badge3' style="CURSOR: hand;" alt="Dora-Storm" title="Dora-Storm" class="badge3" src="http://www.columbia.edu/~zz2220/c0.png" height="120" width="105" name="badge3"><img  onclick="javascript:blink4()" id='badge4' style="CURSOR: hand;" alt="Dora-Love"  title="Dora-Love"  class="badge4" src="http://www.columbia.edu/~zz2220/d0.png" height="120" width="105" name="badge4"><img  onclick="javascript:blink5()" id='badge5' style="CURSOR: hand;" alt="Dora-Dream" title="Dora-Dream" class="badge5" src="http://www.columbia.edu/~zz2220/e0.png" height="120" width="105"  name="badge5">
</div>
</p>
</td>
</tr>
</table>

<table class="toolPad" width="450" border="5" cellspacing="0" cellpadding="5" style="background-color:rgb(241,237,160);"> 

<td align=center id="tooldPad" class=toolPadTitle height="120"  style="display:inline-inline-block">  

<form><p> Tool   Kit </p></form>
<hr>
<br>   
<p><img alt="Reset Game" title="Reset Game" border="0" name=restart src="http://www.columbia.edu/~zz2220/restart4.gif" type = button onclick="funReset()" class="buttonReset" type=button style="CURSOR: hand;"></p>
<script language=javascript>
function funReset() {
    if (confirm("Reset the game? (resetting the game will reset your Score Board and change the background color)")) { 
        resetWhenGiveUp();
    }
}
</script>

<p><img  alt="Switch from TOEFL to GRE" title="Switch from TOEFL to GRE" border="0" name=pickLevel1 src="http://www.columbia.edu/~zz2220/tofel.gif"  type = button   onclick="funLevel1()"  id='Level1ID' class="level1" style="CURSOR: hand;"></p>
<script language=javascript>
function funLevel1() {
    if (confirm("Switch to GRE wordlist? (switching wordlist will reset your Score Board)")) {
        document.all.pickLevel1.style.display = "none";
        document.all.pickLevel2.style.display = "block";
        document.getElementById('Level1ID').disabled=false; 
        document.getElementById('Level2ID').disabled=true;
        flag = 2;
        //cntCorrect = 0;
        //cntWord = 0;
        //credit = 50;

        reset();} 	     
}
</script>

<p><img  alt="Switch from GRE to TOEFL" title="Switch from GRE to TOEFL" border="0" name=pickLevel2 src="http://www.columbia.edu/~zz2220/gre.gif"  type = button   onclick="funLevel2()" id='Level2ID' class="level2" style="CURSOR: hand;"></p>
<script language=javascript>
function funLevel2() {
    if (confirm("Switch to TOEFL wordlist? (switching wordlist will reset your Score Board)")) {
        document.all.pickLevel2.style.display = "none";
        document.all.pickLevel1.style.display = "block";
        document.getElementById('Level2ID').disabled=false; 
        document.getElementById('Level1ID').disabled=true;
        flag = 1;
        //cntCorrect = 0;
        //cntWord = 0;
        //credit = 50;
        reset();}
}
</script>

<p><img  alt="Use Bomb" title="Use Bomb" border="0" name=pickBomb src="http://www.columbia.edu/~zz2220/bomb.gif"  type = button   onclick="funBomb()" id='BOMB' class="bomb" style="CURSOR: hand;"></p>
<script language=javascript>
function funBomb() {
    document.all.pickBomb.style.display = "none";
    bomb();
}
</script>

<p><img  alt="Show Rules" title="Show Rules" border="0" name=showScore src="http://www.columbia.edu/~zz2220/score.gif"  type = button   onclick="funRules()" id='scoreID' class="score" style="CURSOR: hand;"></p>
<script language=javascript>
function funRules() {
    alert("<-- Using Google Chrome with Mac will get a better user experience --> Choose letters from Letter Pad to guess words. You can switch wordlist between GRE and TOEFL. For each word, you can use one BOMB in Tool Kit to clear one letter for you. You can PASS the word, or SORT used letters. Your initial credits are 50, each wrong choose of letter costs 2 credits, each correct choose of letter earns 1 credit, using BOMB costs 5 credits; guessing one word correctly earns a bonus of 15 credits, passing one word will lose 10 credits, failing to guess one word will lose 5 credits. You can RESET the game, but switching wordlist or resetting game will initialize your Score Board. When you satisfy certain criteria (for example, earn 50 credits), you will be awarded badges, you can Unlock and Upgrade badges, badges are exhibited in Badge Gallery. Your last Target Word will be shown in Dictionay, click on the word, you can find definition of the word in Wiktionary. To see detailed information about How To Play the game, please click HELP on the left.")	        	    
}
</script>

<br>
</td>
</tr>
</table>

<table class=wordPad width="450" border="5" cellspacing="0" cellpadding="4" style="background-color:rgb(241,237,170);"> 
<tr>
<td align=center id="wordPad" class=wordPadTitle height="200"  style="display:inline-inline-block">        
<form><p> Letter   Pad </p></form>
<hr>

<input id='buttonA' type=button name=pickA value="A" class="buttonLetter" onclick="funA();" style="background-color:rgb(248,160,248);CURSOR: hand">
<script language=javascript>
function funA() {
    document.all.pickA.style.display = "none";
    selectLetter('A');
}
</script>

<input id='buttonB' type=button name=pickB value="B" class="buttonLetter" onclick="funB();" style="background-color:rgb(215,250,249);CURSOR: hand">
<script language=javascript>
function funB() {
    document.all.pickB.style.display = "none";
    selectLetter('B');
}
</script>

<input id='buttonC' type=button name=pickC value="C" class="buttonLetter" onclick="funC();" style="background-color:rgb(190,255,210);CURSOR: hand">
<script language=javascript>
function funC() {
    document.all.pickC.style.display = "none";
    selectLetter('C');
}
</script>

<input id='buttonD' type=button name=pickD value="D" class="buttonLetter" onclick="funD();" style="background-color:rgb(190,255,210);CURSOR: hand">
<script language=javascript>
function funD() {
    document.all.pickD.style.display = "none";
    selectLetter('D');
}
</script>

<input id='buttonE' type=button name=pickE value="E" class="buttonLetter" onclick="funE();" style="background-color:rgb(255,120,100);CURSOR: hand">
<script language=javascript>
function funE() {
    document.all.pickE.style.display = "none";
    selectLetter('E');
}
</script>

<input id='buttonF' type=button name=pickF value="F" class="buttonLetter" onclick="funF();" style="background-color:rgb(215,250,249);CURSOR: hand">
<script language=javascript>
function funF() {
    document.all.pickF.style.display = "none";
    selectLetter('F');
}
</script>

<input id='buttonG' type=button name=pickG value="G" class="buttonLetter" onclick="funG();" style="background-color:rgb(215,250,249);CURSOR: hand">
<script language=javascript>
function funG() {
    document.all.pickG.style.display = "none";
    selectLetter('G');
}
</script>

<input id='buttonH' type=button name=pickH value="H" class="buttonLetter" onclick="funH();" style="background-color:rgb(210,255,80);CURSOR: hand">
<script language=javascript>
function funH() {
    document.all.pickH.style.display = "none";
    selectLetter('H');
}
</script>

<input id='buttonI' type=button name=pickI value="I" class="buttonLetter" onclick="funI();" style="background-color:rgb(255,255,0);CURSOR: hand">
<script language=javascript>
function funI() {
    document.all.pickI.style.display = "none";
    selectLetter('I');
}
</script>
<br>
<input id='buttonJ' type=button name=pickJ value="J" class="buttonLetter" onclick="funJ();" style="background-color:rgb(241,241,241);CURSOR: hand">
<script language=javascript>
function funJ() {
    document.all.pickJ.style.display = "none";
    selectLetter('J');
}
</script>

<input id='buttonK' type=button name=pickK value="K" class="buttonLetter" onclick="funK();" style="background-color:rgb(241,241,241);CURSOR: hand">
<script language=javascript>
function funK() {
    document.all.pickK.style.display = "none";
    selectLetter('K');
}
</script>

<input id='buttonL' type=button name=pickL value="L" class="buttonLetter" onclick="funL();" style="background-color:rgb(190,255,210);CURSOR: hand">
<script language=javascript>
function funL() {
    document.all.pickL.style.display = "none";
    selectLetter('L')
}
</script>

<input id='buttonM' type=button name=pickM value="M" class="buttonLetter" onclick="funM();" style="background-color:rgb(190,255,210);CURSOR: hand">
<script language=javascript>
function funM() {
    document.all.pickM.style.display = "none";
    selectLetter('M');
}
</script>

<input id='buttonN' type=button name=pickN value="N" class="buttonLetter" onclick="funN();" style="background-color:rgb(210,255,80);CURSOR: hand">
<script language=javascript>
function funN() {
    document.all.pickN.style.display = "none";
    selectLetter('N');
}
</script>

<input id='buttonO' type=button name=pickO value="O" class="buttonLetter" onclick="funO();" style="background-color:rgb(255,194,138);CURSOR: hand">
<script language=javascript>
function funO() {
    document.all.pickO.style.display = "none";
    selectLetter('O');
}
</script>

<input id='buttonP' type=button name=pickP value="P" class="buttonLetter" onclick="funP();" style="background-color:rgb(215,250,249);CURSOR: hand">
<script language=javascript>
function funP() {
    document.all.pickP.style.display = "none";
    selectLetter('P');
}
</script>

<input id='buttonQ' type=button name=pickQ value="Q" class="buttonLetter" onclick="funQ();" style="background-color:rgb(241,241,241);CURSOR: hand">
<script language=javascript>
function funQ() {
    document.all.pickQ.style.display = "none";
    selectLetter('Q');
}
</script>

<input id='buttonR' type=button name=pickR value="R" class="buttonLetter" onclick="funR();" style="background-color:rgb(210,255,80);CURSOR: hand">
<script language=javascript>
function funR() {
    document.all.pickR.style.display = "none";
    selectLetter('R');
}
</script>
<br>
<input id='buttonS' type=button name=pickS value="S" class="buttonLetter"onclick="funS();" style="background-color:rgb(210,255,80);CURSOR: hand">
<script language=javascript>
function funS() {
    document.all.pickS.style.display = "none";
    selectLetter('S');
}
</script>

<input id='buttonT' type=button name=pickT value="T" class="buttonLetter" onclick="funT();" style="background-color:rgb(210,255,80);CURSOR: hand">
<script language=javascript>
function funT() {
    document.all.pickT.style.display = "none";
    selectLetter('T');
}
</script>

<input id='buttonU' type=button name=pickU value="U" class="buttonLetter" onclick="funU();" style="background-color:rgb(255,194,138);CURSOR: hand">
<script language=javascript>
function funU() {
    document.all.pickU.style.display = "none";
    selectLetter('U');
}
</script>

<input id='buttonV' type=button name=pickV value="V" class="buttonLetter" onclick="funV();" style="background-color:rgb(241,241,241);CURSOR: hand">
<script language=javascript>
function funV() {
    document.all.pickV.style.display = "none";
    selectLetter('V');
}
</script>

<input id='buttonW' type=button name=pickW value="W" class="buttonLetter" onclick="funW();" style="background-color:rgb(215,250,249);CURSOR: hand">
<script language=javascript>
function funW() {
    document.all.pickW.style.display = "none";
    selectLetter('W');
}
</script>

<input id='buttonX' type=button name=pickX value="X" class="buttonLetter" onclick="funX();" style="background-color:rgb(241,241,241);CURSOR: hand">
<script language=javascript>
function funX() {
    document.all.pickX.style.display = "none";
    selectLetter('X');
}
</script>

<input id='buttonY' type=button name=pickY value="Y" class="buttonLetter" onclick="funY();" style="background-color:rgb(215,250,249);CURSOR: hand">
<script language=javascript>
function funY() {
    document.all.pickY.style.display = "none";
    selectLetter('Y');
}
</script>    

<input id='buttonZ' type=button name=pickZ value="Z" class="buttonLetter" onclick="funZ();" style="background-color:rgb(241,241,241);CURSOR: hand">
<script language=javascript>
function funZ() {
    document.all.pickZ.style.display = "none";
    selectLetter('Z');
}
</script>
<br>
</td>
</tr>
</table>
</div>

<div alt="Clock" title="Clock" class="clock">
<script  language=javascript>
var  cellwidth=9;                                 
var  cellheight=9;                                    
var  fontsize=8;                                    
var  fontcolor="darkblue";                        
var  fontstyle="bold";                        
var  oncolor="green";                                
var  offcolor="lightgrey";            

var  NS4  =  (navigator.appName.indexOf("Netscape")>=0  &&  parseFloat(navigator.appVersion)  >=  4  &&  parseFloat(navigator.appVersion)  <  5)?  true  :  false;
var  IE4  =  (document.all)?  true  :  false;
var  NS6  =  (parseFloat(navigator.appVersion)  >=  5  &&  navigator.appName.indexOf("Netscape")>=0  )?  true:  false;
var  binclk,  now;
var  t='<table  cellspacing="1"  cellpadding="0"  border="0"><tr><td  align="center">  </td>';

for(i=0;i<=58;i+=2)t+='<td  align="left"  colspan="2"><font  style="font-size:'+fontsize+'px;  font-weight:'+fontstyle+';  color:  '+fontcolor+'">'+i+'<br></font></td>';
t+='<td>  </td></tr><tr><td  align="center"><font  style="font-size:'+fontsize+'px;  font-weight:'+fontstyle+';  color:  '+fontcolor+'"> Hour:  </font></td>';

for(i=0;i<=23;i++){
    t+='<td>';
    t+=(NS4)?  '<ilayer  name="hrs'+i+'"  height="'+cellheight+'"  width="'+cellwidth+'"  bgcolor="'+offcolor+'"></ilayer>'  :  '<div  id="hrs'+i+'"  style="position:relative;  width:'+cellwidth+'px;  font-size:1px;  height:'+cellheight+'px;  background-color:'+offcolor+'"></div>';
    t+='</td>';
}
t+='<td  colspan="36"><td>  </td></tr><tr><td  align="center"><font  style="font-size:'+fontsize+'px;  font-weight:'+fontstyle+';  color:  '+fontcolor+'"> Minute:  </font></td>';

for(i=0;i<=59;i++){
    t+='<td>';
    t+=(NS4)?  '<ilayer  name="min'+i+'"  width="'+cellwidth+'"  height="'+cellheight+'"  bgcolor="'+offcolor+'"></ilayer>'  :  '<div  id="min'+i+'"  style="position:relative;  width:'+cellwidth+'px;  font-size:1px;  height:'+cellheight+'px;  background-color:'+offcolor+'"></div>';
    t+='</td>';
}
t+='<td>  </td></tr><tr><td  align="center"><font  style="font-size:'+fontsize+'px;  font-weight:'+fontstyle+';  color:  '+fontcolor+'">            Second:  </font></td>';

for(i=0;i<=59;i++) {
    t+='<td>';
    t+=(NS4)?  '<ilayer  name="sec'+i+'"  width="'+cellwidth+'"  height="'+cellheight+'"  bgcolor="'+offcolor+'"></ilayer>'  :  '<div  id="sec'+i+'"  style="position:relative;  width:'+cellwidth+'px;  font-size:1px;  height:'+cellheight+'px;  background-color:'+offcolor+'"></div>';
    t+='</td>';
}
t+='<td>  </td></tr><tr><td>  </td><td>  </td>';
for(i=1;i<=59;i+=2)t+='<td  align="left"  colspan="2"><font  style="font-size:'+fontsize+'px;  font-weight:'+fontstyle+';  color:  '+fontcolor+'">'+i+'</font></td>';
t+='</tr></table>';
document.write(t);

function  init(){
    getvals();
    for(i=0;i<=now.h;i++)setbgcolor('hrs'+i,  oncolor);
    for(i=0;i<=now.m;i++)setbgcolor('min'+i,  oncolor);
    for(i=0;i<=now.s;i++)setbgcolor('sec'+i,  oncolor);
    setInterval('setclock()',  100);
}

function  getvals(){
    now=new  Date();
    now.s=now.getSeconds();
    now.h=now.getHours();
    now.m=now.getMinutes();
}

function  setclock(){
    getvals();
    if((now.h==0)&&(now.m==0))  for(i=1;i<=23;i++)setbgcolor('hrs'+i,  offcolor);
    if((now.s==0)&&(now.m==0))  for  (i=1;i<=59;i++)setbgcolor('min'+i,  offcolor);
    if(now.s==0)  for(i=1;i<=59;i++)setbgcolor('sec'+i,  offcolor);
    setbgcolor('hrs'+now.h,  oncolor);
    setbgcolor('min'+now.m,  oncolor);
    setbgcolor('sec'+now.s,  oncolor);
}

function  resize(){
    if(NS4)history.go(0);
}

function  setbgcolor(idstr,  color){
    if(IE4)document.all[idstr].style.backgroundColor=color;
    if(NS4)document.layers[idstr].bgColor=color;
    if(NS6)document.getElementById(idstr).style.backgroundColor=color;
}

window.onresize=resize;
</script>
</div>

<script language="javascript">  
var sound1="http://www.columbia.edu/~zz2220/mDora1.m3u" 
var sound2="http://www.columbia.edu/~zz2220/mDora2.m3u" 
var sound3="http://www.columbia.edu/~zz2220/mDora3.m3u" 
var sound4="http://www.columbia.edu/~zz2220/mDora4.m3u" 
var sound5="http://www.columbia.edu/~zz2220/mDora5.m3u" 
var sound6="http://www.columbia.edu/~zz2220/mDora6.m3u" 
var x=Math.round(Math.random()*5) 
if (x==0) x=sound1 
else if (x==1) x=sound2 
else if (x==2) x=sound3
else if (x==3) x=sound4 
else if (x==4) x=sound5 
else x=sound6
document.write('<embed src='+'"'+x+'"'+'hidden="true" border="0" width="20" height="20" autostart="true" l>');
</script> 
 
</div>
<!-- 
<p><a alt="Back to HomePage" title="Back to HomePage" class="backtohome" href="http://www.columbia.edu/~zz2220/index.html">HomePage</a></p>
<h11 alt="Version Info. V1.02(this version: badge gallery; next version: collaboration model)" title="Version Info. V1.02(this version: badge gallery; next version: collaboration model)" class="version">version:1.02(Apr.10)<h11>
<div style="CURSOR:hand" alt="Click to see Visitor Statistics" title="Click to see Visitor Statistics" class="stat">
<a onMouseOut="window.close" onClick="window.open('http://www.columbia.edu/~zz2220/stat.html','','resizable=no,menubar=no,toolbar=no,location=no,scrollbars=no,status =no,height=50,width=150,top=580,left=1280')"><img src= "http://www.columbia.edu/~zz2220/stat.png"></a>
</div>

-->

<div style="CURSOR:hand" alt="Click to see Help" title="Click to see Help" class="help">
<a onClick="funHelp()"> Help </a>
<script language=javascript>
function funHelp() {
    alert("<-- Using Google Chrome with Mac will get a better user experience --> This is a Hangman game made by JavaScript & HTML. Target Word is masked by symbols of '*'. You should pick letters from Letter Pad to guess the word, letter by letter, before Doraemon being hanged. That is to say, if you always pick letters correctly, Doraemon will be OK; however, if you pick too many letters that do not belong to the Target Word, Doraemon will be hanged after several times of wrong-picking. Once you pick a letter that belongs to the Target Word, that letter will be unmasked. This will turn to be a clue for you to pick more letters correctly, untill you can guess the whole word. You can choose the wordlist, to be either GRE or TOEFL, to generate Target Word randomly from the wordlist. You will surely get used to this game after several times of trials. Do not forget to use Tool Kit and Dictionary. You may memorize words by fun in this game. If you performs well, you will be awarded badges, which will be exhibited in Badge Gallery. Your performance will be judged by several measures, mainly the Credits. Your initial credits are 50. You can earn credits by guessing words correctly. To see detailed Rules of the game and the interface, please click the second item (Show Rules) in Tool Kit.")
}
</script>
</div>

<%}else {%>
   <p>you need to log in first! <a href=<%=basePath+"/pages/Login.jsp" %>>Log in</a>
   </p><%} %>


</body>
</html>

