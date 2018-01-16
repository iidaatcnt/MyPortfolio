<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
	<html lang="ja">
	<head><title><xsl:value-of select="全体/題名" /></title></head>
	<body><xsl:apply-templates select="全体" /></body>
	</html>
	</xsl:template>
	<xsl:template match="全体">
		<xsl:for-each select="本文">
			<h2><xsl:value-of select="見出し" /></h2>
			<p><xsl:apply-templates select="段落" /></p>
		</xsl:for-each>
	</xsl:template>
		<xsl:template match="段落">
			<xsl:apply-templates />
		</xsl:template>
		<xsl:template match="強調">
			<strong><xsl:apply-templates /></strong>
		</xsl:template>
		<xsl:template match="text()">
			<xsl:value-of />
		</xsl:template>
</xsl:stylesheet>
