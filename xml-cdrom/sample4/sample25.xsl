<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title><xsl:value-of select="全体/題名" /></title>
<style type="text/css">
table{border:solid 1pt black;}
th{background-color:silver;padding:5;}
td{border:solid 1pt black;padding:10;}
</style>
</head>
<body>
<div>価格が15万未満については斜体で表示</div>
<div><xsl:apply-templates select="全体" /></div>
</body>
</html>
</xsl:template>
<xsl:template match="全体">
<table>
	<tr><th>番号</th><th>品名</th><th>価格</th></tr>
<xsl:for-each select="商品">
	<xsl:if test="価格[.$gt$ 150000]">
		<tr>
		<td><xsl:value-of select="番号" /></td>
		<td><xsl:value-of select="品名" /></td>
		<td style="text-align:right"><xsl:value-of select="価格" /></td>
		</tr>
	</xsl:if>
	<xsl:if test="価格[.$lt$ 150000]">
		<tr>
		<td><xsl:value-of select="番号" /></td>
		<td><xsl:value-of select="品名" /></td>
		<td style="text-align:right;font-style:italic"><xsl:value-of select="価格" /></td>
		</tr>
	</xsl:if>
</xsl:for-each>
</table>
</xsl:template>
</xsl:stylesheet>
