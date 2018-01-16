<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title><xsl:value-of select="全体/題名" /></title>
<style type="text/css">
strong{color:red}
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
	<xsl:value-of select="タイトル/@サブタイトル" />
	<h1><xsl:value-of select="タイトル" /></h1>
	<img>
		<xsl:attribute name="src">
		<xsl:value-of select="図" />
		</xsl:attribute>
	</img>
	<xsl:apply-templates />
</xsl:template>
<xsl:template match="コピー">
	<h2><xsl:apply-templates /></h2>
</xsl:template>
<xsl:template match="強調">
	<strong><xsl:value-of /></strong>
</xsl:template>
<xsl:template match="リード">
	<p><xsl:apply-templates /></p>
</xsl:template>

<xsl:template match="全体/詳細">
	<xsl:element name="div">
		<xsl:apply-templates />
	</xsl:element>
</xsl:template>
<xsl:template match="全体/詳細/仕様">
<table>
	<tr>
		<th>価格</th>
		<td><xsl:value-of select="価格" />円
		(税<xsl:value-of select="価格/@税" />)</td>
	</tr>
	<tr>
		<th>発売日</th>
		<td><xsl:value-of select="発売日" /></td>
	</tr>
	<tr>
		<th>サイズ</th>
		<td><xsl:value-of select="サイズ" /></td>
	</tr>
	<tr>
		<th>ページ数</th>
		<td><xsl:value-of select="ページ数" /></td>
	</tr>
	<tr>
		<th>著者</th>
		<td><xsl:value-of select="著者" /></td>
	</tr>
	<tr>
		<th>NO</th>
		<td><xsl:value-of select="NO" /></td>
	</tr>
	<tr>
		<th>初版発行</th>
		<td><xsl:value-of select="初版発行" /></td>
	</tr>
</table>
</xsl:template>
<xsl:template match="全体/詳細/目次">
	<h3>目次</h3>	
	<ol>
	<xsl:for-each select="項目">
		<li><xsl:value-of /></li>
	</xsl:for-each>
	</ol>
</xsl:template>
<xsl:template match="全体/詳細/リンク">
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
<xsl:template match="text()">
	<xsl:value-of />
</xsl:template>	
</xsl:stylesheet>
