<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title><xsl:value-of select="全体/題名" /></title>
<style type="text/css">
th{padding:5;}
td{padding:5;}
</style>
</head>
<body><xsl:apply-templates select="全体/本文" /></body>
</html>
</xsl:template>
<xsl:template match="全体/本文">
<xsl:element name="table">
	<xsl:attribute name="border">
		1
	</xsl:attribute>
	<xsl:element name="tr">
		<xsl:element name="th">
			リンク
		</xsl:element>
		<xsl:element name="th">
			URL
		</xsl:element>
	</xsl:element>

	<xsl:for-each select="リンク">
	<xsl:element name="tr">
		<xsl:element name="td">
			<xsl:value-of select="リンク先" />
		</xsl:element>
		<xsl:element name="td">
			<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="リンク先/@url" />
			</xsl:attribute>
				<xsl:value-of select="リンク先/@url" />
			</xsl:element>
		</xsl:element>
	</xsl:element>
	</xsl:for-each>
</xsl:element>
</xsl:template>
</xsl:stylesheet>
