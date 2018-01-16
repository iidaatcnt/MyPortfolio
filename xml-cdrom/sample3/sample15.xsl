<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title><xsl:value-of select="全体/題名" /></title>
</head>
<body><xsl:apply-templates select="全体/本文" /></body>
</html>
</xsl:template>
<xsl:template match="全体/本文">
	<xsl:apply-templates />
</xsl:template>
<xsl:template match="イラスト">
	<img>
		<xsl:attribute name="src">
			<xsl:value-of />
		</xsl:attribute>
		<xsl:attribute name="alt">
			サンプル画像
		</xsl:attribute>
	</img>
</xsl:template>
<xsl:template match="text()">
	<div><xsl:value-of /></div>
</xsl:template>
</xsl:stylesheet>
