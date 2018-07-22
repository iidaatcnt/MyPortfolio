<?xml version="1.0" encoding="shift_jis" ?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="article">
    <html><xsl:apply-templates/></html>
  </xsl:template>
  <xsl:template match="title">
    <h1><xsl:value-of select="."/></h1>
  </xsl:template>
  <xsl:template match="paragraph" >
    <p><xsl:value-of select="."/></p>
  </xsl:template>
</xsl:stylesheet>