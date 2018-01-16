<?xml version="1.0" encoding="Shift_Jis" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
	<head>
	<title>Sample48</title>
	<style>
	table{border:solid 1pt black;}
	th{border:solid 1pt gray;background-color:silver;padding:3;font-size:11pt;}
	td{border:solid 1pt gray;padding:3;font-size:11pt;}
	.hinichi{background-color:#333333;color:white;}
	</style>
	</head>
	<body>
		<xsl:apply-templates select="営業日報" />
	</body>
</html>
</xsl:template>

<xsl:template match="営業日報">
	<table>
	<xsl:for-each select="日報">
	<tr>
		<th>年月日</th><td colspan="3" class="hinichi"><xsl:value-of select="管理情報/年月日" /></td>
	</tr>
	<tr>
		<th>担当者</th><td colspan="3"><xsl:value-of select="管理情報/担当者" /></td>
	</tr>
	<tr>
		<th>本文</th><td style="width:150"><xsl:value-of select="内容/本文" /></td>
	</tr>

	</xsl:for-each>
	</table>
</xsl:template>
</xsl:stylesheet>