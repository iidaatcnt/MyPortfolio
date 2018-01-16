<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title><xsl:value-of select="全体/題名" /></title>
<style type="text/css">
table{border:solid 1pt black;}
th{border:solid 1pt gray;padding:2;}
td{border:solid 1pt gray;padding:2;}
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
