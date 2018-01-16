<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl"
xmlns:html="http://www.w3.org/Profiles/XHTML-transitional" xmlns:kyss="http://user.shikoku.ne.jp/kyss/" xml:lang="ja">

<xsl:template match="/">
<html lang="ja" xmlns:v="urn:schemas-microsoft-com:vml">
<head>
<title><xsl:value-of select="html/head/kyss:管理情報/kyss:コンテンツタイトル" /><xsl:value-of select="html/head/kyss:管理情報/kyss:コーナタイトル" /></title>
<!--
<meta http-equiv="contnt-type" content="text/html; charset=utf-8" />
-->

<object id="VMLRender" classid="CLSID:10072CEC-8CC1-11D1-986E-00A0C955B42E">
</object>
<style type="text/css">

v\:* { behavior: url(#VMLRender); }

body
	{
	background	:	black;
	margin-top	:	200;
	margin-left	:	0;
	}

.目次
	{
	margin-top	:	16;
	margin-right	:	90;
	font-size	:	13pt;
	font-family	:	"ＭＳ Ｐ明朝",serif;
	font-style	:	italic;
	line-height	:	18pt;
	}

A:link
	{color		:	lavender;}
A:hover
	{color		:	blueviolet;
	text-decoration	:	none;}
A:active
	{color		:	yellow;
	text-decoration	:	none;}
A:visited
	{color		:	gainsboro;
	text-decoration	:	none;}

</style>

<script type="text/vbscript">
<xsl:comment>
<![CDATA[
option explicit
dim no,timer,selnode,patternstring

sub window_onload()
	
	patternstring="html/body/kyss:背景/kyss:フィル/kyss:タイプ"
	set selnode=document.XMLDocument.selectNodes(patternstring)
	kyss.type=selnode(0).text
	no=0
	timer=window.setinterval("go()",30)
end sub

sub go()
	on error resume next
	if no>=360 then	
		no=360
		window.clearinterval(timer)
		menu1.style.display=""
		exit sub
	else
		kyss.angle=no
		no=no+5
	end if
end sub

]]>
</xsl:comment>
</script>
</head>

<body>

<div align="right">
<v:rect style='width:1000px;height:86px' fillcolor="#eeeeee">
<div align="center">
<img src="nostitle.gif" width="1000" height="86" border="0" alt="" />
</div>
<v:fill id="kyss" angle="0" color2="black" type="" />
</v:rect>
</div>

<div align="right">
<div id="menu1" style="display:none">
<xsl:apply-templates select="html/body/kyss:テクスト"/>
</div>
</div>

</body>
</html>
</xsl:template>

<xsl:template match="html/body/kyss:テクスト">
	<p class="目次">
			<a><xsl:attribute name="href">hotaru2000.xml</xsl:attribute><xsl:value-of select="div/p[index()='0']" /></a>
	</p>
</xsl:template>

</xsl:stylesheet>
