<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xml:lang="ja">
<xsl:template match="/">
<html lang="ja">
<head>
<title><xsl:value-of select="全体/題名" /></title>
<style type="text/css">
table{border:solid 1pt black;}
th{border:solid 1pt gray;padding:2;}
td{border:solid 1pt gray;padding:2;}
</style>
<script type="text/vbscript">
<xsl:comment>
<![CDATA[
	option explicit
	dim source
	dim sortfield
	dim stylesheet
sub window_onload()
	set source=document.XMLDocument
	set stylesheet=document.XSLDocument
	
	'order-by属性を含むテンプレートにアクセスする。

	set sortfield=stylesheet.selectSingleNode("//@order-by")
end sub

'valueプロパティを使ってソート対象要素を指定する。
'昇順なら要素名の前に+（プラス）、降順なら-（マイナス）を付加する。
'要素の内容が数値の場合はnumberを使用する。

sub kinngakuSort()
	select case button1.value
		case "金額ソート"
			sortfield.value="-number(お買い上げ金額)"
			myTable.innerHTML=source.documentElement.transformNode(stylesheet)
			button1.value="元に戻す"
		case "元に戻す"
			sortfield.value="+number(お客様番号)"
			myTable.innerHTML=source.documentElement.transformNode(stylesheet)
			button1.value="金額ソート"
		case else
			exit sub
	end select
end sub

sub namaeSort()
	select case button2.value
		case "名前ソート"
			sortfield.value="+氏名"
			myTable.innerHTML=source.documentElement.transformNode(stylesheet)
			button2.value="元に戻す"
		case "元に戻す"
			sortfield.value="+number(お客様番号)"
			myTable.innerHTML=source.documentElement.transformNode(stylesheet)
			button2.value="名前ソート"
		case else
			exit sub
	end select
end sub

]]>
</xsl:comment>
</script>

</head>
<body>
<button id="button1" onclick="kinngakuSort()">金額ソート</button>
<button id="button2" onclick="namaeSort()">名前ソート</button>
<table>
<tr>
	<td>
	<div id="myTable"><xsl:apply-templates select="全体" /></div>
	</td>
</tr>
</table>
</body>
</html>
</xsl:template>

<xsl:template match="全体">
<table>
<tr>
	<th>番号</th><th>氏名</th><th>都道府県</th><th>住所</th>
	<th>電話</th><th>お買上げ金額</th>
</tr>
	<xsl:for-each select="顧客情報" order-by="dont-match-anything">
<tr>
	<td style="text-align:right"><xsl:value-of select="お客様番号" /></td>
	<td><xsl:value-of select="氏名" /></td>
	<td><xsl:value-of select="住所/@都道府県" /></td>
	<td><xsl:value-of select="住所" /></td>
	<td><xsl:value-of select="電話" /></td>
	<td style="text-align:right">
	<xsl:apply-templates select="お買い上げ金額" /></td>
</tr>
	</xsl:for-each>
	</table>
</xsl:template>
<xsl:template match="お買い上げ金額">
	<!--formatNumber関数で、金額を三桁区切りの表示にする-->
	<xsl:eval>formatNumber(this.nodeTypedValue,"#,###")</xsl:eval>
</xsl:template>
</xsl:stylesheet>
