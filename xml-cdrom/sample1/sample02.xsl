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
				<h1><xsl:value-of select="見出し" /></h1>
			<xsl:for-each select="段落">
				<p><xsl:value-of /></p>
			</xsl:for-each>
		</xsl:template>
</xsl:stylesheet>
