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
	<xsl:element name="a">
		<xsl:attribute name="href">
			<xsl:value-of select="リンク/url" />
		</xsl:attribute>
			<xsl:value-of select="リンク/リンク先" />
	</xsl:element>
</xsl:template>
</xsl:stylesheet>
