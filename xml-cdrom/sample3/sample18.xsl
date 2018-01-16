<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title><xsl:value-of select="全体/題名" /></title>
</head>
<body><xsl:apply-templates select="全体" /></body>
</html>
</xsl:template>
<xsl:template match="全体">
	<xsl:for-each select="図">	
	<xsl:choose>
	<xsl:when test="図番[.=1]">
		<h3>No.<xsl:value-of select="図番" />のイラスト</h3>
		<img>
		<xsl:attribute name="src">
			<xsl:value-of select="イラスト" />
		</xsl:attribute>
		</img>
		<hr />
	</xsl:when>	
	<xsl:otherwise>
		<h3>No.<xsl:value-of select="図番" />のイラストは準備中です．</h3>
		<hr />
	</xsl:otherwise>
	</xsl:choose>	
	</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
