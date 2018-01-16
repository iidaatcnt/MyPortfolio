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
	<xsl:if test="@表示[.='true']">
		<div>
		<span><xsl:value-of select="注釈" /></span>
		<img>
			<xsl:attribute name="src">
				<xsl:value-of select="イラスト" />
			</xsl:attribute>
		</img>
		</div>
	</xsl:if>
	</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
