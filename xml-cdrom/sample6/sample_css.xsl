<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title><xsl:value-of select="全体/題名" /></title>
<style type="text/css">
body{background:url(xml_icon.gif) fixed no-repeat bottom right white;
margin-top:25;margin-left:15%;margin-right:25%;
font-family:"ＭＳ Ｐ明朝",serif;
font-size:11pt;line-height:16pt;color:dimgray;}

h1{font-family:"ＭＳ Ｐゴシック",sans-serif;color:black;
width:100%;filter:shadow(color=gainsboro,direction=135);
line-height:30pt;}

span{color:crimson;}

h2{font-family:"ＭＳ Ｐゴシック",sans-serif;font-weight:bold;
margin-top:30;padding:0.2em;
color:white;background:royalblue;width:540;}

h3{font-family:"ＭＳ Ｐゴシック",sans-serif;
margin-top:20;border-bottom:solid 1pt cornflowerblue;
width:540;color:mediumblue;}

p{text-indent:1em;}

table{border:solid 1pt navy;width:540;margin-top:20;}

th{background-color:#dff2ff;padding:3;}

td{background-color:gainsboro;padding:3;}

ul{list-style-image:url(ul_mark.gif);}

a:link{color:cornflowerblue;}

a:hover{color:tomato;}

a:visited{color:mediumblue;}


</style>
</head>
<body>
<xsl:apply-templates select="全体/概要" />
<xsl:apply-templates select="全体/企業情報" />
</body>
</html>
</xsl:template>
<xsl:template match="全体/概要">
	<div>
		<xsl:element name="img">
			<xsl:attribute name="src">
				<xsl:value-of select="ロゴ" />
			</xsl:attribute>
		</xsl:element>
	</div>
	<div>
		<h1>
		<xsl:value-of select="タイトル" />
		<xsl:value-of select="タイトル/@分類" />
		</h1>
	</div>
	<div>
		<h2><xsl:value-of select="コピー" /></h2>
		<p><xsl:value-of select="リード" /></p>
	</div>
</xsl:template>
<xsl:template match="全体/企業情報">
	<div><xsl:apply-templates select="会社概要" /></div>
	<div><xsl:apply-templates select="事業内容" /></div>
	<div><xsl:apply-templates select="リンク" /></div>
</xsl:template>
<xsl:template match="会社概要">
	<h3><xsl:value-of select="小見出し" /></h3>
	<table>
		<xsl:for-each select="データ">
		<tr>
		<th><xsl:value-of select="項目" /></th>
		<td><xsl:value-of select="摘要" /></td>
		</tr>
		</xsl:for-each>
	</table>
</xsl:template>
<xsl:template match="事業内容">
	<h3><xsl:value-of select="小見出し" /></h3>
	<ul>
		<xsl:for-each select="項目">
		<li><xsl:value-of /></li>
		</xsl:for-each>
	</ul>
</xsl:template>
<xsl:template match="リンク">
	<xsl:for-each select="リンク先">
		<div>
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="@url" />
			</xsl:attribute>
				<xsl:value-of />
		</xsl:element>
		</div>
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
