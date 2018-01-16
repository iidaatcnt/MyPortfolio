<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title><xsl:value-of select="全体/題名" /></title>
<style type="text/css">
table{border:solid 1pt black;}
th{border:solid 1pt black;background-color:silver;padding:5;}
td{border:solid 1pt black;padding:10;}
</style>
</head>
<body><xsl:apply-templates select="全体" /></body>
</html>
</xsl:template>
<xsl:template match="全体">
<table>
	<tr><th>番号</th><th>品名</th><th>価格</th></tr>
<xsl:for-each select="商品">
	<tr>
	<td><xsl:value-of select="番号" /></td>
	<td><xsl:value-of select="品名" /></td>
	<td style="text-align:right"><xsl:value-of select="価格" /></td>
	</tr>
</xsl:for-each>
</table>
</xsl:template>
</xsl:stylesheet>
