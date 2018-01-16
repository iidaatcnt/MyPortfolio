<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title>Sample44</title>
<style type="text/css">
td{font-family:"ＭＳ Ｐ明朝",serif;font-size:12pt;}
button{font-family:"ＭＳ Ｐゴシック",sans-serif;font-size:10pt;}
</style>
</head>

<script type="text/vbscript">
<xsl:comment>
<![CDATA[
option explicit

	dim xmldoc,selnode
	dim i,kyssx,kyssy
	dim no2,no,search_no
	dim patternstring,iro,timer1
	dim markichi,selnode2,age
	dim kyssno,kyssyomi,kyssnamae
	dim kysstanntou,kysssyashinn
	dim kyssnenntukihi,kyssdennwa
	dim no3,ichi,ichix,ichiy

sub window_onload()
	kyssx=0
	kyssy=0
	iro=0
	syainn_no.value=""
	no=0
'DOMオブジェクトを使えるようにする．
	set xmldoc=CreateObject("Microsoft.XMLDom")
	xmldoc.async=false
	xmldoc.load("sample44.xml")

	set ichi=xmldoc.getElementsByTagName("社員情報")
	redim ichix(ichi.length)
	redim ichiy(ichi.length)
	
	'XML文書中の「社員情報」要素が持つ属性「位置x」と「位置y」
	'の値をgetAttributeで取得する．
	for i=0 to ichi.length-1
		ichix(i)=ichi(i).getAttribute("位置x")
		ichiy(i)=ichi(i).getAttribute("位置y")
	next 
	call search()
end sub

'登録されている社員情報の個数を調べる．
sub search()
    set selnode=xmldoc.getElementsByTagName("社員番号")
	message.innerHTML=selnode.length & "名のデータがあります．1～" & selnode.length & "の番号を入力して下さい."
	no2=selnode.length
end sub

sub go()
	mark.style.visibility="visible"
	block.style.visibility="visible"
	no3=0
	nextdata.style.visibility="visible"
	search_no=0
	search_no=eval(syainn_no.value)
	no3=search_no

	'登録されている社員番号と入力された数値が一致しているかどうかの判別．
	if search_no>no2 or search_no<=0 then
		msgbox "社員番号が不正です．"
		syainn_no.value=""
		exit sub
	end if

	'入力された社員番号の値（search_no）に一致する，それぞれの要素の内容を取得して表示．

	patternstring="関西営業所/社員情報[社員番号='" & search_no & "']/社員番号"
	set selnode=xmldoc.selectNodes(patternstring)
	banngou.innerHTML=selnode(0).text

	patternstring="関西営業所/社員情報[社員番号='" & search_no & "']/ふりがな"
	set selnode=xmldoc.selectNodes(patternstring)
	yomi.innerHTML=selnode(0).text

	patternstring="関西営業所/社員情報[社員番号='" & search_no & "']/氏名"
	set selnode=xmldoc.selectNodes(patternstring)
	namae.innerHTML=selnode(0).text

	patternstring="関西営業所/社員情報[社員番号='" & search_no & "']/担当"
	set selnode=xmldoc.selectNodes(patternstring)
	tanntou.innerHTML=selnode(0).text

	patternstring="関西営業所/社員情報[社員番号='" & search_no & "']/写真"
	set selnode=xmldoc.selectNodes(patternstring)
	image1.src=selnode(0).text

	patternstring="関西営業所/社員情報[社員番号='" & search_no & "']/生年月日"
	set selnode=xmldoc.selectNodes(patternstring)
	birth.innerHTML=selnode(0).text

	patternstring="関西営業所/社員情報[社員番号='" & search_no & "']/電話"
	set selnode=xmldoc.selectNodes(patternstring)
	dennwa.innerHTML=selnode(0).text


	set selnode2=xmldoc.getElementsByTagName("社員番号")
	redim kyssno(selnode2.length)
	for i=0 to selnode2.length-1
		kyssno(i)=selnode2(i).text
	next

	set selnode2=xmldoc.getElementsByTagName("ふりがな")
	redim kyssyomi(selnode2.length)
	for i=0 to selnode2.length-1
		kyssyomi(i)=selnode2(i).text
	next

	set selnode2=xmldoc.getElementsByTagName("氏名")
	redim kyssnamae(selnode2.length)
	for i=0 to selnode2.length-1
		kyssnamae(i)=selnode2(i).text
	next

	set selnode2=xmldoc.getElementsByTagName("担当")
	redim kysstanntou(selnode2.length)
	for i=0 to selnode2.length-1
		kysstanntou(i)=selnode2(i).text
	next

	set selnode2=xmldoc.getElementsByTagName("写真")
	redim kysssyashinn(selnode2.length)
	for i=0 to selnode2.length-1
		kysssyashinn(i)=selnode2(i).text
	next

	set selnode2=xmldoc.getElementsByTagName("生年月日")
	redim kyssnenntukihi(selnode2.length)
	for i=0 to selnode2.length-1
		kyssnenntukihi(i)=selnode2(i).text
	next

	set selnode2=xmldoc.getElementsByTagName("電話")
	redim kyssdennwa(selnode2.length)
	for i=0 to selnode2.length-1
		kyssdennwa(i)=selnode2(i).text
	next

	call markmove()
end sub

'画面配置図上で★マークが移動する処理
sub markmove()
	markichi=banngou.innerText
	mark.style.marginleft=ichix(markichi-1)
	mark.style.margintop=ichiy(markichi-1)
	window.clearinterval(timer1)
	timer1=window.setinterval("blink()",30)
end sub

'社員配置図上で★が点滅する処理．
sub blink()
	select case iro
		case 1
			mark.style.color="blue"
			mark.innerHTML="★"
		case 2
			mark.style.color="red"
			'datediff()関数を使って年齢を自動的に計算させている．
			age=datediff("yyyy",birth.innerText,now)
			mark.innerHTML="<span style='font-size:12pt'>" & age & "才" & "</span>"
		case else
			iro=0
	end select
			iro=iro+1
end sub

'「次社員」「前社員」ボタンと連動して表示させる社員データの処理．
sub naiyouhyouji()
	banngou.innerHTML=kyssno(no3)
	yomi.innerHTML=kyssyomi(no3)
	namae.innerHTML=kyssnamae(no3)
	tanntou.innerHTML=kysstanntou(no3)
	image1.src=kysssyashinn(no3)
	birth.innerHTML=kyssnenntukihi(no3)
	dennwa.innerHTML=kyssdennwa(no3)
	syainn_no.value=banngou.innerText
	call markmove()
end sub

'「次社員」ボタンをクリックしたときの処理．
sub tugi()
	if no3>=no2 then
		msgbox "最後のデータです！"
		exit sub
	else
		call naiyouhyouji()
		no3=no3+1
	end if
end sub	

'「前社員」ボタンをクリックしたときの処理．
sub mae()
	if no3<=0 then
		msgbox "最上位のデータです．"
		exit sub
	else
		no3	=no3-1
		call naiyouhyouji()
		
	end if
end sub	

]]>
</xsl:comment>
</script>
<body>

<div id="mark" style="visibility:hidden;position:absolute;margin-top:0;margin-left:0;color:red;font-size:14pt;font-weight:bold">★</div>

<img src="floor.gif" width="295" height="410" alt="フロア図"/>

<span style="position:absolute;font-family:ＭＳ Ｐゴシック;font-size:30pt;margin-left:10;width:300;filter:shadow(color=black,direction=135);color:aquamarine;letter-spacing:0.2em">社員配置図</span>

<div id="message" style="margin-top:60;color:red;position:absolute;margin-left:10;font-family:ＭＳ Ｐゴシック;font-size:12pt"></div>
<div style="position:absolute;margin-left:10;margin-top:80;font-family:ＭＳ Ｐゴシック;font-size:11pt">
社員番号：<input style="text-align:center" type="text" name="syainn_no" size="5" />
<button onclick="go()">実行</button>
</div>

<div id="block" style="visibility:hidden;position:absolute;margin-left:5;margin-top:105">
<table>
<tr>
	<td>
	<div>
	<xsl:apply-templates select="関西営業所" />
	</div>
	</td>
	</tr>
</table>
</div>

<div style="visibility:hidden;position:absolute;margin-top:320;margin-left:10" id="nextdata">
<button onclick="tugi()">次社員</button>
<button onclick="mae()">前社員</button>
</div>
</body>
</html>
</xsl:template>

<xsl:template match="関西営業所">
<table border="1" style="border-width:2;border-color:black">
	<tr>
	<td style="background-color:snow">社員番号</td>
	<td><span id="banngou"></span></td>
	<td rowspan="4"><img id="image1"></img></td>
	</tr>
	<tr>
	<td style="background-color:snow">ふりがな</td>
	<td><span id="yomi"></span></td>
	</tr>
	<tr>
	<td style="background-color:snow">氏名</td>
	<td><span id="namae"></span></td>
	</tr>
	<tr>
	<td style="background-color:snow">担当</td>
	<td><span id="tanntou"></span></td>
	</tr>
	<tr>
	<td  style="background-color:snow">生年月日</td>
	<td colspan="2"><span id="birth"></span></td>
	</tr>
	<tr>
	<td style="background-color:snow">電話</td>
	<td colspan="2"><span id="dennwa"></span></td>
	</tr>
	</table>
</xsl:template>
</xsl:stylesheet>
