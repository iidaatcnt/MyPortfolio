<?xml version="1.0" encoding="Shift_JIS" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title>Sample46</title>
<style type="text/css">
.frame1{position:absolute;font-size:11pt;border-width:thick;border-color:gray;border-style:double;height:100;width:360;overflow:auto;padding:3;margin-top:20;}
.frame2{position:absolute;font-size:11pt;border-width:thick;border-color:gray;border-style:double;height:100;width:360;overflow:auto;padding:3;margin-top:120;}
.frame3{position:absolute;font-size:13pt;border-width:thick;border-color:gray;border-style:double;height:100;width:470;overflow:auto;padding:3;margin-left:390;margin-top:20;}
</style>

<script type="text/vbscript">
<xsl:comment>
<![CDATA[
option explicit
dim xmldoc,i,allNo
dim headerNode,midashi
dim headerName
sub window_onload()
	'XML DOMオブジェクトを使えるようにする．(お約束) 
	set xmldoc=createObject("Microsoft.XMLDom")
	xmldoc.async=false
	xmldoc.load("sample46.xml")
	
	'「大見出し」の内容にアクセスする．
	set headerNode=xmldoc.getElementsByTagName("大見出し")

	'「大見出し」があれば，その内容を変数midashiに格納する．
	if headerNode.length>0 then
		for i=0 to headerNode.length-1
			midashi=midashi & "<div style='cursor:hand' id='headerID" & i & "'" & " onclick='headerGo(" & i & ")'>" & headerNode(i).text & "</div>"
		next
	else
		exit sub
	end if
			'大見出しを表示する．
			headerMenu.innerHTML=midashi
end sub

sub headerGo(allNo)
	'大見出しをクリックしたときの背景色の設定．
	for i=0 to headerNode.length-1
		document.all("headerID" & i).style.backgroundColor="white"
	next
		document.all("headerID" & allNo).style.backgroundColor="silver"

		'クリックした大見出しを変数headerNameに格納する．
		headerName=document.all("headerID" & allNo).innerText
		call headerSearch(headerName)
end sub

sub headerSearch(headerName)
	dim patternstring,honnbunnString
	dim selNode,komidashi,honnbunnNode,honnbunnNaiyou
	header2Menu.innerHTML=""
	honnbunn.innerHTML=""

	'大見出しを格納した変数headerNameを検索キーとして，それぞれの要素の内容を取り出す．
	honnbunnString="マニュアル/内容/章[大見出し='" & headerName & "'" & "]/本文"
	set honnbunnNode=xmldoc.selectNodes(honnbunnString)

	patternstring="マニュアル/内容/章[大見出し='" & headerName & "'" & "]/小見出し"
	set selNode=xmldoc.selectNodes(patternstring)

	if honnbunnNode.length>0 then 
		honnbunnNaiyou=honnbunnNode(0).text
	else
		exit sub
	end if

	'小見出しがない場合はメッセージを表示させる．
	if selNode.length>0 then 
			komidashi=selNode(0).text
	else
			komidashi="<b style='color:red'>" & "この章には小見出しありません．" & "</b>"
	end if
	
		honnbunn.innerHTML=honnbunnNaiyou
		header2Menu.innerHTML=komidashi
end sub

]]>
</xsl:comment>
</script>
</head>
<body>
<b style="position:absolute">▽大見出しが表示されています．クリックして下さい．</b>
<div class="frame1" id="headerMenu"></div>
<div class="frame2" id="header2Menu">小見出し表示されます．</div>
<div class="frame3" id="honnbunn">本文の内容が表示されます．</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
