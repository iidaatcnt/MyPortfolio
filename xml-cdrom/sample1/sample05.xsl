<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title><xsl:value-of select="全体/題名" /></title>
<style type="text/css">
.midashi{width:200;background-color:silver;}
</style>
</head>
<body><xsl:apply-templates select="全体" /></body>
</html>
</xsl:template>
<xsl:template match="全体">
	<xsl:for-each select="本文">
		<xsl:if test="見出し[.='']">
			<h2 class="midashi">見出し未設定</h2>
		</xsl:if>
		<xsl:if test="見出し[not(.='')]">
			<h2><xsl:value-of select="見出し" /></h2>
		</xsl:if>
		<p><xsl:value-of select="段落" /></p>
	</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
