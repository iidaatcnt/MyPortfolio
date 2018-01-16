<?xml version="1.0" encoding="shift_jis"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
<xsl:template match="/">
<html lang="ja" xmlns:v="urn:schemas-microsoft-com:vml">
<head>
<object id="VMLRender" classid="CLSID:10072CEC-8CC1-11D1-986E-00A0C955B42E">
</object>
<title><xsl:value-of select="vml/題名" /></title>
<style>
v\:* { behavior: url(#VMLRender); }
</style>
</head>
<body>
	<v:rect>
		<xsl:apply-templates select="vml/rect" />
		<v:fill>
			<xsl:apply-templates select="vml/fill" />
		</v:fill>
	</v:rect>
</body>
</html>
</xsl:template>
<xsl:template match="vml/rect">
	<xsl:attribute name="style">
		width:<xsl:value-of select="width" />;
		height:<xsl:value-of select="height" />
	</xsl:attribute>
	<xsl:attribute name="fillcolor">
		<xsl:value-of select="fillcolor" />
	</xsl:attribute>
	<xsl:attribute name="strokecolor">
		<xsl:value-of select="strokecolor" />
	</xsl:attribute>
	<xsl:attribute name="strokeweight">
		<xsl:value-of select="strokeweight" />
	</xsl:attribute>
</xsl:template>
<xsl:template match="vml/fill">
	<xsl:attribute name="type">
		<xsl:value-of select="type" />
	</xsl:attribute>
	<xsl:attribute name="src">
		<xsl:value-of select="src" />
	</xsl:attribute>
</xsl:template>
</xsl:stylesheet>
