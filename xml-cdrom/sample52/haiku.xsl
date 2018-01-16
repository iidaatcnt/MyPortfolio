<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">

<xsl:template match="/">
<html lang="ja">
<head>
<title>絵手紙</title>
<style type="text/css">
body
{
	margin-top		:	0		;
	margin-left		:	0		;
}

</style>

<script type="text/vbscript">
<xsl:comment>
<![CDATA[ 

option explicit
dim xmldoc,stylesheet
dim selnode,gazouurl,banngou,timer1
dim i,kyssgazou,all_no,irono,j
dim nagasa,no,kisetu,kisetu_len,kisetumoji
dim allmoji,kyssseasonmoji,allgazou
sub window_onload()
	no=0
	banngou=0
	gonoku.value="思い出の"
	nananoku.value="母は老いたり"
	gonoku2.value="アケビの実"

	for i=0 to 7
		document.all("data" & i).value=document.all("kyss" & i).innerText
	next

	kyss5.innerHTML="Tel：" & data5.value

	allmoji=""

	set xmldoc=CreateObject("Microsoft.XMLDom")
	set stylesheet=CreateObject("Microsoft.XMLDom")
	xmldoc.async=false
	stylesheet.async=false

	xmldoc.load("haiku.xml")

	   set kisetu=xmldoc.getElementsByTagName("季節")
		kisetu_len=kisetu.length-1

		for j=0 to kisetu_len
		kisetumoji=kisetumoji & "<span style='cursor:hand' title='ｸﾘｯｸしてください' id='kysskisetu" & j & "'" & " onclick='kisetuChange(" & j & ")'" & ">" & kisetu(j).text & "</span>" & "<br>"
		
	next
		
		season.innerHTML=kisetumoji
		j=2
		document.all("kysskisetu" & j).style.backgroundcolor="aquamarine"

	select case j
		case 0
			set selnode=xmldoc.getElementsByTagName("春画像")
		case 1
			set selnode=xmldoc.getElementsByTagName("夏画像")
		case 2
			set selnode=xmldoc.getElementsByTagName("秋画像")
		case 3
			set selnode=xmldoc.getElementsByTagName("冬画像")
		case else
			exit sub
	end select
			
		redim gazouurl(selnode.length)
		nagasa=selnode.length-1
	for i=0 to nagasa
		kyssgazou=kyssgazou & "<span style='cursor:hand' title='ｸﾘｯｸしてください' id='gazou" & i & "'" & " onclick='colorChange(" & i & ")'" & ">" & selnode(i).text & "</span>" & "<br>"
		gazouurl(i)=selnode(i).getAttribute("url")
	next
		illust.src=gazouurl(0)
		seasongazou.innerHTML=kyssgazou
		document.all("gazou" & "0").style.backgroundcolor="aquamarine"
end sub

sub colorChange(all_no)
	for i=0 to nagasa
		document.all("gazou" & i).style.backgroundcolor="white"
	next
		document.all("gazou" & all_no).style.backgroundcolor="aquamarine"
		'illust.src=gazouurl(all_no)
		call filtergo(all_no)
end sub

sub kisetuChange(irono)
	for j=0 to kisetu_len
		document.all("kysskisetu" & j).style.backgroundcolor="white"
	next
		document.all("kysskisetu" & irono).style.backgroundcolor="aquamarine"
		kyssseasonmoji=document.all("kysskisetu" & irono).innerText
		call kisetugazou(kyssseasonmoji)
end sub


sub kisetugazou(kyssseasonmoji)
	select case kyssseasonmoji
		case "春","夏","冬"
			msgbox "秋に制作しましたので，秋の画像しか用意しておりません！"
				for j=0 to kisetu_len
					document.all("kysskisetu" & j).style.backgroundcolor="white"
				next
			       document.all("kysskisetu" & "2").style.backgroundcolor="aquamarine"
				exit sub
		case else
			exit sub
	end select
end sub


		
sub filtergo(all_no)
	randomize
	no=int(23*rnd)+1
	illust.filters.RevealTrans.Transition=no
	illust.filters(0).apply()
		illust.src=gazouurl(all_no)
	illust.filters(0).play()
end sub

sub haikugo()
	allmoji=gonoku.value & nananoku.value & gonoku2.value
	haikumoji.innerHTML=allmoji
	with haikumoji.style
			.fontsize="18pt"
			.fontweight="bold"
	end with
	haikumoji.style.visibility="hidden"
	call haikufilter()
end sub

sub printmoji()
	select case banngou
		case 1
			innsatu.style.color="yellow"
		case 2
			innsatu.style.color="red"
		case else
			banngou=0
	end select
			banngou=banngou+1
end sub

sub haikufilter()
	randomize
	no=int(23*rnd)+1
	haikumoji.filters.RevealTrans.Transition=no
	haikumoji.filters(0).apply()
		haikumoji.style.visibility="visible"
	haikumoji.filters(0).play()
end sub

sub haikucancel()
	gonoku.value=""
	nananoku.value=""
	gonoku2.value=""
	haikumoji.innerText=""
end sub

sub goreset()
	dim k
	for k=0 to 7
		document.all("data" & k).value=""
		document.all("kyss" & k).innerText=""
	next
end sub

sub gogo()
	dim k
	for k=0 to 7
		document.all("kyss" & k).innerHTML=document.all("data" & k).value
	next
		kyss5.innerHTML="Tel：" & data5.value
		timer1=window.setinterval("printmoji()",30)
end sub

sub go()
	dim mado
	select case innsatu.value
		case "印刷前確認と印刷の仕方"
			mado=showModelessDialog("howtoprint.htm",window,"status:false;dialogWidth:370px;dialogHeight:300px")
			gamenn.style.display="none"
			with letter.style
				.bordercolor="white"
				.borderstyle=""
			end with
			window.clearinterval(timer1)
			innsatu.style.color="crimson"
			innsatu.value="中止して枠線を表示する"
			hyouji.style.display=""
		case else
			exit sub
	end select
end sub

sub allhyouji()
	with letter.style
		.bordercolor="silver"
		.borderstyle="inset"
	end with
	innsatu.value="印刷前確認と印刷の仕方"
	hyouji.style.display="none"
	gamenn.style.display=""
end sub

]]>
</xsl:comment>
</script>

</head>
<body>

<div id="letter" style="position:absolute;border-width:2;border-color:silver;border-style:inset;width:9.0cm;height:13.8cm">


<div id="haikumoji" style="filter:RevealTrans(duration=3,transition=23);margin-top:30;margin-left:315;position:absolute;font-family:HG正楷書体-PRO;font-size:18pt;width:4;font-weight:bold">思い出の母は老いたりアケビの実</div>

<img id="illust" style="filter:RevealTrans(transition=23,duration=4);margin-left:30;margin-top:40" />

<div id="kyss0" style="letter-spacing:0.2em;margin-top:50;font-family:ＭＳ Ｐゴシック;font-size:12pt;width:200;margin-left:30;font-weight:bold">奈良・国安和尚</div>

<span id="kyss1" style="font-family:ＭＳ Ｐゴシック;font-size:11pt;line-height:13pt;width:100;margin-left:30">〒123-4567</span>

<div id="kyss2" style="font-family:ＭＳ Ｐゴシック;font-size:11pt;line-height:13pt;width:300;margin-left:30">愛媛県田舎郡田舎町</div>

<div id="kyss3" style="margin-left:30;font-family:ＭＳ Ｐゴシック;font-size:11pt;line-height:13pt;width:300">大字熊蜂1100</div>

<div id="kyss4" style="margin-top:5;letter-spacing:0.2em;margin-left:30;font-family:ＭＳ Ｐ明朝;font-size:11pt;line-height:13pt;width:380">薬師寺国安</div>

<div style="width:380;margin-left:30;margin-top:2">
<span id="kyss5" style="font-family:Times New Roman;font-size:10pt;line-height:13pt;font-weight:bold">0895-77-7777</span>
<span id="kyss6" style="text-indent:2em;font-family:Times New Roman;font-size:10pt;line-height:13pt;font-weight:bold">kyss@shikoku.ne.jp</span>
</div>

<div id="kyss7" style="margin-top:5;letter-spacing:0.2em;margin-left:30;font-family:ＭＳ Ｐ明朝;font-size:12pt;line-height:13pt;width:380;font-weight:bold">奈良俳句連合会</div>


</div>

<div id="gamenn">

<img src="haiku_title.gif" style="position:absolute;margin-left:450;margin-top:20" />


<!--メニュー-->
<div id="season" style="overflow:auto;padding:5;border-style:inset;text-align:left;border-width:2;border-color:silver;position:absolute;margin-left:450;margin-top:100;width:60;height:60"></div>

<div id="seasongazou" style="overflow:auto;padding:5;border-style:inset;border-width:2;border-color:silver;text-align:left;position:absolute;margin-left:520;margin-top:100;width:110;height:60"></div>

<div id="haiku" style="padding:5;border-style:inset;border-width:2;border-color:silver;position:absolute;margin-top:170;margin-left:450">

５の句：<input name="gonoku" type="text" style="ime-mode:active" size="20" /><br />
７の句：<input name="nananoku" type="text" style="ime-mode:active" size="30" /><br />
５の句：<input name="gonoku2" type="text" style="ime-mode:active" size="20" />
<button id="jikkou" style="background-color:beige;color:crimson;font-family:Arial Black;font-size:9pt" onclick="haikugo()">OK</button>
<button id="ng" style="background-color:beige;color:blue;font-family:Arial Black;font-size:9pt" onclick="haikucancel()">Cancel</button>

</div>

<div id="jyouhou" style="padding:5;border-style:inset;border-width:2;border-color:silver;position:absolute;margin-top:260;margin-left:450">
俳 号：<input name="data0" type="text" style="ime-mode:active" size="20" /><br />
〒：<input name="data1" type="text" style="margin-left:24;ime-mode:inactive" size="7" /><br />
住所1：<input name="data2" type="text" style="ime-mode:active" size="40" /><br />
住所2：<input name="data3" type="text" style="ime-mode:active" size="40" /><br />
名 前：<input name="data4" type="text" style="ime-mode:active" size="20" /><br />
電 話：<input name="data5" type="text" style="ime-mode:inactive" size="15" /><br />
e-mail：<input name="data6" type="text" style="ime-mode:inactive" size="30" /><br />
句 会：<input name="data7" type="text" style="ime-mode:active" size="20" /><br />
<div>
<button id="jikkou" style="background-color:beige;color:crimson;font-family:Arial Black;font-size:10pt" onclick="gogo()">OK</button>
<button id="reset" style="background-color:beige;color:blue;font-family:Arial Black;font-size:10pt" onclick="goreset()">Reset</button>
<button id="innsatu" onclick="go()" style="background-color:beige;color:crimson;padding:3;font-family:ＭＳ Ｐゴシック;font-weight:bold;font-size:10pt">印刷前確認と印刷の仕方</button>
</div>
</div>
<div style="margin-top:505;margin-left:450;font-family:ＭＳ Ｐゴシック;font-size:9pt;color:indianred">
XML制作・著作：PROJECT KySS
</div>
</div>

<button id="hyouji" style="display:none;position:absolute;margin-left:500;margin-top:20;font-weight:bold;font-family:ＭＳ Ｐゴシック;font-size:14pt;color:red;background-color:beige" onclick="allhyouji()">
全て表示
</button>

</body>
</html>
</xsl:template>
</xsl:stylesheet>
