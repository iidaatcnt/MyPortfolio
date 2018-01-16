<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title><xsl:value-of select="全体/題名" /></title>
<style type="text/css">
span{color:dimgray}
table{border:solid 1pt black;}
th{border:solid 1pt gray;padding:2;}
td{border:solid 1pt gray;padding:2;}
</style>
</head>
<body>
<xsl:apply-templates select="全体/概要" />
<xsl:apply-templates select="全体/詳細" />
</body>
</html>
</xsl:template>
<xsl:template match="全体/概要">
	<div>
		<h1>
		<span><xsl:value-of select="タイトル/@年度" /></span>
		<xsl:value-of select="タイトル" />
		</h1>
	</div>
	<div>
		<h2><xsl:value-of select="コピー" /></h2>
		<p><xsl:value-of select="リード" /></p>
	</div>
	<div>
		<xsl:element name="img">
			<xsl:attribute name="src">
				<xsl:value-of select="図" />
			</xsl:attribute>
		</xsl:element>
	</div>
</xsl:template>
<xsl:template match="全体/詳細">
	<div><xsl:apply-templates select="新卒" /></div>
	<div><xsl:apply-templates select="経験者" /></div>
	<div><xsl:apply-templates select="リンク" /></div>
</xsl:template>
<xsl:template match="新卒">
	<h3><xsl:value-of select="小見出し" /></h3>
	<table>
		<xsl:for-each select="採用条件">
		<tr>
		<th><xsl:value-of select="条件" /></th>
		<td><xsl:value-of select="摘要" /></td>
		</tr>
		</xsl:for-each>
	</table>
</xsl:template>
<xsl:template match="経験者">
	<h3><xsl:value-of select="小見出し" /></h3>
	<ul>
		<xsl:for-each select="項目">
		<li><xsl:value-of /></li>
		</xsl:for-each>
	</ul>
</xsl:template>
<xsl:template match="リンク">
	<h3><xsl:value-of select="小見出し" /></h3>
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
