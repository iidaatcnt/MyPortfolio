<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title><xsl:value-of select="全体/題名" /></title>
<style type="text/css">
table{border:solid 1pt black;position:absolute;
margin-left:100;margin-top:20}
th{border:solid 1pt gray;}
td{border:solid 1pt gray;}
select{font-family:"ＭＳ Ｐ明朝",serif;font-size:14pt;
padding:3;position:absolute;}
.goukei{margin-left:250;width:300;padding:10;
border-width:thick;border-style:double;
font-family:"ＭＳ Ｐゴシック",sans-serif;
font-size:18pt;text-align:right;} 
.monthbox{position:absolute;margin-top:50;width:90;
padding:5;;border-width:thick;border-style:double;
font-family:"ＭＳ Ｐゴシック",sans-serif;font-size:14pt;
text-align:right}
</style>

<script type="text/vbscript">
<xsl:comment>
<![CDATA[
option explicit
dim myRow,myAddress,myAddress2(),i
dim myCell1,myCell2,myCell3,myCell4,myCell5,myCell6,myCell7
dim myNo(),myNo1,myName,myJyuusyo,myKen,myTel
dim myNumber,dennwa(),telNode,tel
dim noNode,shimeiNode,shimei,myShimeni()
dim addressNode,patternstring,selectAddress,address1()
dim myCell01,myCell02,myCell03,myCell04,myCell05,myCell06,myCell07
dim mykinngaku,myMoney
dim myTuki,myMonth
dim tableAddress,myAddress3
dim allNO,monthNo
dim kinngakuNode,kinngaku()
dim tuki,dummyTuki
dim tukiSelect,tukiNode,sum
sub window_onload()
	allNO=0
	sum=0
	'1月～12月までのボックスを作る
	for i=0 to 11
		dummyTuki=dummyTuki & "<div style='cursor:hand' id=" & "'" & "monthMenu" & i & "'" & "onclick='" & "monthGo(" & i & ")'" & ">" & i+1 & "月" & "</div>"
	next
		monthBox.innerHTML=dummyTuki
end sub

sub monthGo(monthNo)
	'月を選択した時背景の色を変える
	for i=0 to 11
		document.all("monthMenu" & i).style.backgroundcolor="white"
	next
		document.all("monthMenu" & monthNo).style.backgroundcolor="silver"

		'選択された月を変数tukiSelectに格納する。
		tukiSelect=document.all("monthMenu" & monthNo).innerText
		call go(tukiSelect)
end sub

sub go(tukiSelect)
	sum=0
	goukeiBox.innerHTML=sum

	'表が形成されているかどうかをallNOの値で判別している。
	'表が形成されていたら一度全ての行を削除する。
	if allNO=2525 then
		for i=0 to addressNode.length
			myTable.deleteRow(0)
		next
	end if

	'tableに新しい行（tr）を作成し、rowsコレクションに追加する。
	'-1 はinsertRowのデフォルト値で、trをcellsコレクションの最後に追加する。
	set myRow=myTable.insertRow(-1)
	selectAddress=mySelect.options.value

	'各タグの内容を予め全て動的な配列変数に格納しておく。
	'selectボックスで選択されたoption要素の内容を変数selectAddressに格納し
	'selectNodesメソッドを使ってselectAddressに合致する要素の内容と選択された月の値を
	'持っているtukiSelectに合致する要素の内容を検索している。
	'その検索結果の内容を動的配列変数に格納している。

	patternstring="全体/顧客情報[住所/@都道府県=" & "'" & selectAddress & "'" & "]" & "[お買い上げ金額/@月=" & "'" & tukiSelect & "'" & "]/住所"
	set addressNode=document.XMLDocument.selectNodes(patternstring)
	redim address1(addressNode.length)
	redim myAddress2(addressNode.length)
	for i=0 to addressNode.length-1
		address1(i)=addressNode(i).text
		myAddress2(i)=addressNode(i).getAttribute("都道府県")
	next

	patternstring="全体/顧客情報[住所/@都道府県=" & "'" & selectAddress & "'" & "]" & "[お買い上げ金額/@月=" & "'" & tukiSelect & "'" & "]/お客様番号"
	set noNode=document.XMLDocument.selectNodes(patternstring)
	redim myNo(noNode.length)
	for i=0 to noNode.length-1
		myNo(i)=noNode(i).text
	next

	patternstring="全体/顧客情報[住所/@都道府県=" & "'" & selectAddress & "'" & "]" & "[お買い上げ金額/@月=" & "'" & tukiSelect & "'" & "]/氏名"
	set shimeiNode=document.XMLDocument.selectNodes(patternstring)
	redim myShimei(shimeiNode.length)
	for i=0 to shimeiNode.length-1
		myShimei(i)=shimeiNode(i).text
	next
	
	patternstring="全体/顧客情報[住所/@都道府県=" & "'" & selectAddress & "'" & "]" & "[お買い上げ金額/@月=" & "'" & tukiSelect & "'" & "]/電話"
	set telNode=document.XMLDocument.selectNodes(patternstring)
	redim dennwa(telNode.length)
	for i=0 to telNode.length-1
		dennwa(i)=telNode(i).text
	next

	patternstring="全体/顧客情報[住所/@都道府県=" & "'" & selectAddress & "'" & "]" & "[お買い上げ金額/@月=" & "'" & tukiSelect & "'" & "]/お買い上げ金額"
	set kinngakuNode=document.XMLDocument.selectNodes(patternstring)
	redim kinngaku(kinngakuNode.length)
	redim tuki(kinngakuNode.length)
	for i=0 to kinngakuNode.length-1
		kinngaku(i)=formatNumber(kinngakuNode(i).text,0)
		sum=sum+kinngaku(i)
		tuki(i)=kinngakuNode(i).getAttribute("月")
	next
		
		'合計金額を三桁区切りで表示する。
		goukeiBox.innerHTML="合計=" & formatNumber(sum,0)

	'それぞれのtableに関する要素を生成し、またそのテキストノードを生成する。
	set myCell1=document.createElement("th")
	set myNumber=document.createTextNode("番号")

	set myCell2=document.createElement("th")
	set myName=document.createTextNode("氏名")

	set myCell3=document.createElement("th")
	set myKen=document.createTextNode("都道府県")

	set myCell4=document.createElement("th")
	set myJyuusyo=document.createTextNode("住所")

	set myCell5=document.createElement("th")
	set myTel=document.createTextNode("電話")

	set myCell6=document.createElement("th")
	set mykinngaku=document.createtextNode("お買い上げ金額")

	set myCell7=document.createElement("th")
	set myTuki=document.createtextNode("購入月")

	'生成した要素に、内容を追加する。
	myCell1.appendChild(myNumber)
	myCell2.appendChild(myName)
	myCell3.appendChild(myken)
	myCell4.appendChild(myJyuusyo)
	myCell5.appendChild(myTel)
	myCell6.appendChild(mykinngaku)
	myCell7.appendChild(myTuki)

	'それぞれの内容を追加した要素を、今度は行に追加する。
	myRow.appendChild(myCell1)
	myRow.appendChild(myCell2)
	myRow.appendChild(myCell3)
	myRow.appendChild(myCell4)
	myRow.appendChild(myCell5)
	myRow.appendChild(myCell6)
	myRow.appendChild(myCell7)
'----------------------ここまでは表組みのTable Headerを生成している。

		'ノードの個数分、td要素やその内容を生成し行に追加していく。	
	for i=0 to addressNode.length-1
		set myRow=myTable.insertRow(-1)
		set myCell01=document.createElement("td")
		set myNo1=document.createtextNode(myNo(i))
		myCell01.appendChild(myNo1)
		myRow.appendChild(myCell01)

		set myCell02=document.createElement("td")
		set shimei=document.createtextNode(myShimei(i))
		myCell02.appendChild(shimei)
		myRow.appendChild(myCell02)

		set myCell03=document.createElement("td")
		set tableAddress=document.createtextNode(myAddress2(i))
		myCell03.appendChild(tableAddress)
		myRow.appendChild(myCell03)

		set myCell04=document.createElement("td")
		set myAddress3=document.createtextNode(address1(i))
		myCell04.appendChild(myAddress3)
		myRow.appendChild(myCell04)

		set myCell05=document.createElement("td")
		set tel=document.createtextNode(dennwa(i))
		myCell05.appendChild(tel)
		myRow.appendChild(myCell05)

		set myCell06=document.createElement("td")
		set myMoney=document.createtextNode(kinngaku(i))
		myCell06.appendChild(myMoney)
		myRow.appendChild(myCell06)

		'文字位置を右寄せに設定する
		myCell06.style.textAlign="right"

		set myCell07=document.createElement("td")
		set myMonth=document.createtextNode(tuki(i))
		myCell07.appendChild(myMonth)
		myRow.appendChild(myCell07)
		myCell07.style.textAlign="right"
		
		
	next
				'この番号で画面上に表が生成されているかどうかを判別する。
				allNO=2525
end sub
]]>
</xsl:comment>
</script>
</head>
<body>

<div id="goukeiBox" class="goukei"></div>
<table id="myTable">
</table>

<select id="mySelect">
	<option value="愛媛県">愛媛県</option>
	<option value="大阪府">大阪府</option>
	<option value="兵庫県">兵庫県</option>
	<option value="東京都">東京都</option>
	<option value="大分県">大分県</option>
</select>

<div id="monthBox" class="monthbox"></div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
