<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title><xsl:value-of select="全体/題名" /></title>
<style type="text/css">
table{border:solid 1pt black;}
td{border:solid 1pt black;padding:10;}
</style>
</head>
<body><xsl:apply-templates select="全体/商品" /></body>
</html>
</xsl:template>
<xsl:template match="全体/商品">
<table>
	<tr><th>番号</th><th>品名</th><th>価格</th></tr>
	<tr>
		<td><xsl:value-of select="番号" /></td>
		<td><xsl:value-of select="品名" /></td>
		<td><xsl:value-of select="価格" /></td>
	</tr>
</table>
</xsl:template>
</xsl:stylesheet>
