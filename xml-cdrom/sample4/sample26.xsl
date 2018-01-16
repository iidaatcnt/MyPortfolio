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
<p>価格が1000円から10万円未満が斜体，10万円より大きく20万円より小さい価格までが通常の書体，
それ以外は太字で表示されています．</p>
<xsl:apply-templates select="全体" />
</body>
</html>
</xsl:template>
<xsl:template match="全体">
<table>
	<tr><th>番号</th><th>品名</th><th>価格</th></tr>
<xsl:for-each select="商品">
	<xsl:choose>
	<xsl:when test="価格[.$gt$ 1000 and .$lt$ 99999]">
		<tr>
		<td><xsl:value-of select="番号" /></td>
		<td><xsl:value-of select="品名" /></td>
		<td style="text-align:right;font-style:italic"><xsl:value-of select="価格" /></td>
		</tr>
	</xsl:when>
	<xsl:when test="価格[.$gt$ 100000 and .$lt$ 200000]">
		<tr>
		<td><xsl:value-of select="番号" /></td>
		<td><xsl:value-of select="品名" /></td>
		<td style="text-align:right"><xsl:value-of select="価格" /></td>
		</tr>
	</xsl:when>
	<xsl:otherwise>
		<tr>
		<td><xsl:value-of select="番号" /></td>
		<td><xsl:value-of select="品名" /></td>
		<td style="text-align:right;font-weight:bold"><xsl:value-of select="価格" /></td>
		</tr>
	</xsl:otherwise>
	</xsl:choose>
</xsl:for-each>
</table>
</xsl:template>
</xsl:stylesheet>
