<?xml version="1.0" encoding="Shift_JIS"?>
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
	<v:oval>
		<xsl:apply-templates select="vml/oval[index()='0']" />
		<v:fill type="gradient" />
		<v:textbox>
			VMLで作った<br />ふきだしです！
		</v:textbox>
	</v:oval>
	<v:oval>
		<xsl:apply-templates select="vml/oval[index()='1']" />
	</v:oval>
	<v:oval>
		<xsl:apply-templates select="vml/oval[index()='2']" />
	</v:oval>
	<v:oval>
		<xsl:apply-templates select="vml/oval[index()='3']" />
	</v:oval>
</body>
</html>
</xsl:template>
<xsl:template match="vml/oval[index()='0']">
	<xsl:attribute name="style">
		width:<xsl:value-of select="width" />;
		height:<xsl:value-of select="height" />;
		margin-top:<xsl:value-of select="marginTop" />;
		margin-left:<xsl:value-of select="marginTop" />;
		position:<xsl:value-of select="position" />
	</xsl:attribute>
	<xsl:attribute name="fillcolor">
		<xsl:value-of select="fillcolor" />
	</xsl:attribute>
</xsl:template>
<xsl:template match="vml/oval[index()='1']">
	<xsl:attribute name="style">
		width:<xsl:value-of select="width" />;
		height:<xsl:value-of select="height" />;
		margin-top:<xsl:value-of select="marginTop" />;
		margin-left:<xsl:value-of select="marginLeft" />;
		position:<xsl:value-of select="position" />
	</xsl:attribute>
	<xsl:attribute name="fillcolor">
		<xsl:value-of select="fillcolor" />
	</xsl:attribute>
</xsl:template>

<xsl:template match="vml/oval[index()='2']">
	<xsl:attribute name="style">
		width:<xsl:value-of select="width" />;
		height:<xsl:value-of select="height" />;
		margin-top:<xsl:value-of select="marginTop" />;
		margin-left:<xsl:value-of select="marginLeft" />;
		position:<xsl:value-of select="position" />
	</xsl:attribute>
	<xsl:attribute name="fillcolor">
		<xsl:value-of select="fillcolor" />
	</xsl:attribute>
</xsl:template>
<xsl:template match="vml/oval[index()='3']">
	<xsl:attribute name="style">
		width:<xsl:value-of select="width" />;
		height:<xsl:value-of select="height" />;
		margin-top:<xsl:value-of select="marginTop" />;
		margin-left:<xsl:value-of select="marginLeft" />;
		position:<xsl:value-of select="position" />
	</xsl:attribute>
	<xsl:attribute name="fillcolor">
		<xsl:value-of select="fillcolor" />
	</xsl:attribute>
</xsl:template>
</xsl:stylesheet>
