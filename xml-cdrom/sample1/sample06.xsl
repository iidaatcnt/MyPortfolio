<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title><xsl:value-of select="全体/題名" /></title>
</head>
<body>
<xsl:apply-templates select="全体" />
</body>
</html>
</xsl:template>
<xsl:template match="全体">
<xsl:for-each select="本文">
	<xsl:choose>
		<xsl:when test="見出し[@色='silver']">
		<h2 style="color:silver"><xsl:value-of select="見出し" /></h2>
		</xsl:when>
		<xsl:when test="見出し[@色='gray']">
		<h2 style="color:dimgray"><xsl:value-of select="見出し" /></h2>
		</xsl:when>
		<xsl:otherwise>
		<h2 style="color:black"><xsl:value-of select="見出し" /></h2>
		</xsl:otherwise>
	</xsl:choose>
	<p><xsl:value-of select="段落" /></p>
	</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
