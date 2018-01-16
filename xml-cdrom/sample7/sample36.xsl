<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title><xsl:value-of select="全体/題名" /></title>

<script type="text/vbscript">
<xsl:comment>
<![CDATA[
option explicit
	dim xmldoc,selnode,i
	dim namae,no,patternstring
	dim nagasa,searchname

sub window_onload()
	set xmldoc=createObject("Microsoft.XMLDom")
	xmldoc.async=false
	xmldoc.load("sample36.xml")
	set selnode=xmldoc.getElementsByTagName("氏名")
	nagasa=selnode.length-1
	if selnode.length>0 then
		for i=0 to nagasa
			namae=namae & "<button id='xmlname" & i & "'" & " onclick='search(" & i & ")'>" & selnode(i).text & "</button>" & "<br />"
		next
	else
		exit sub
	end if
			'氏名を表示する．
			personal_namae.innerHTML=namae
end sub

sub search(no)
	searchname=document.all("xmlname" & no).innerText
	patternstring="全体/顧客情報[氏名='" & searchname & "'" & "]/住所"
	set selnode=xmldoc.selectNodes(patternstring)
	address.innerHTML=selnode(0).text
end sub
]]>
</xsl:comment>
</script>
</head>
<body>
<div id="address" style="position:absolute;margin-left:100;margin-top:50;"></div>
<div id="personal_namae"></div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
