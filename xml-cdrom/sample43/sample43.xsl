<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title>Sample43</title>
<style type="text/css">
table{border:solid 1pt black;}
th{border:solid 1pt gray;}
td{border:solid 1pt gray;font-family:"ＭＳ Ｐ明朝",serif;
font-size:18pt;font-weight:bold;}
</style>
</head>

<script type="text/vbscript">
<xsl:comment>
<![CDATA[
option explicit
	dim xmldoc,selnode,i
	dim namae,no,patternstring
	dim nagasa,searchname

sub window_onload()
	'DOM オブジェクトを使えるようにする(お約束）．
	set xmldoc=createObject("Microsoft.XMLDom")
	'同期を許可するかどうかを設定する．デフォルトはtrue
	xmldoc.async=false
	'XMLファイルを読み込む．
	xmldoc.load("sample43.xml")
	'読み込んだXML文書の「氏名」要素にアクセスする．
	set selnode=xmldoc.getElementsByTagName("氏名")
	nagasa=selnode.length-1
	'要素「氏名」の内容を、その個数分取り出し，変数namaeにタグ付きのまま格納する．
	if selnode.length>0 then
		for i=0 to nagasa
			namae=namae & "<div id='xmlname" & i & "'" & "style='padding:10;border-width:4;border-color:blue;border-style:inset;width:300;cursor:hand' onclick='search(" & i & ")'>" & selnode(i).text & "</div>"
		next
	else
		exit sub
	end if
			'氏名を表示する．
			personal_namae.innerHTML=namae
end sub

'選択された氏名に従って，関連する内容を抽出表示するサブルーチン．
sub search(no)
'選択された氏名の背景色を変える処理．
	for i=0 to nagasa
		document.all("xmlname" & i).style.backgroundcolor="white"
	next
	document.all("xmlname" & no).style.backgroundcolor="aquamarine"

	hyou.style.visibility="visible"

	searchname=document.all("xmlname" & no).innerText

	'選択された氏名を変数searchnameに格納し，searchnameに一致するそれぞれの内容を表示する．

	patternstring="田舎村被保険者/被保険者証情報/世帯主[氏名='" & searchname & "'" & "]/ふりがな"
	set selnode=xmldoc.selectNodes(patternstring)
	yomi.innerHTML=selnode(0).text

	patternstring="田舎村被保険者/被保険者証情報/世帯主[氏名='" & searchname & "'" & "]/性別"
	set selnode=xmldoc.selectNodes(patternstring)
	sex.innerHTML=selnode(0).text

	patternstring="田舎村被保険者/被保険者証情報/世帯主[氏名='" & searchname & "'" & "]/住所"
	set selnode=xmldoc.selectNodes(patternstring)
	address.innerHTML=selnode(0).text

	patternstring="田舎村被保険者/被保険者証情報/世帯主[氏名='" & searchname & "'" & "]/画像"
	set selnode=xmldoc.selectNodes(patternstring)
	image1.src=selnode(0).text

	patternstring="田舎村被保険者/被保険者証情報[世帯主/氏名='" & searchname & "'" & "]/証書/有効期限"
	set selnode=xmldoc.selectNodes(patternstring)
	kigenn.innerHTML=selnode(0).text

	patternstring="田舎村被保険者/被保険者証情報[世帯主/氏名='" & searchname & "'" & "]/証書/記号番号"
	set selnode=xmldoc.selectNodes(patternstring)
	banngou.innerHTML=selnode(0).text
end sub
]]>
</xsl:comment>
</script>
<body>
<div style="margin-left:10;margin-top:100;font-family:ＭＳ Ｐゴシック;font-size:32pt;margin-top:30" id="personal_namae"></div>

<div id="hyou" style="position:absolute;visibility:hidden;margin-left:330;margin-top:-350">
<table>
<tr>
	<td>
	<xsl:apply-templates select="田舎村被保険者" />
	</td>
</tr>
</table>
<img style="margin-left:100;margin-top:20" id="image1"></img>
</div>

</body>
</html>
</xsl:template>

<xsl:template match="田舎村被保険者">
<table>
	<tr>
	<td style="background-color:silver" rowspan="3">世帯主</td>
	<td style="background-color:snow"><span id="change">ふりがな</span></td>
	<td><span id="yomi"></span></td>
	</tr>
	<tr>
	<td style="background-color:snow">性別</td>
	<td><span id="sex"></span></td>
	</tr>		
	<tr>
	<td style="background-color:snow">住所</td>
	<td><span id="address"></span></td>
	</tr>
	<tr>
	<td style="background-color:silver" rowspan="2">証書</td>
	<td style="background-color:snow">有効期限</td>
	<td><span id="kigenn"></span></td>
	</tr>
	<tr><td style="background-color:snow">記号番号</td>
	<td><span id="banngou"></span></td>
	</tr>
</table>
</xsl:template>
</xsl:stylesheet>
