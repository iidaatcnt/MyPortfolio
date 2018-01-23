<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/hello-world">
    <HTML>
      <HEAD>
        <TITLE>こんにちは</TITLE>
      </HEAD>
      <BODY>
        <H1>
          <xsl:value-of select="doc-title"/>
        </H1>
        <xsl:apply-templates select="doc-body"/>
      </BODY>
    </HTML>
  </xsl:template>
  <xsl:template match="doc-body">
    <DIV>from <I><xsl:value-of select="greeter"/></I></DIV>
    <DIV>Say <I><xsl:value-of select="greeting"/></I></DIV>
<!-- 
    <xsl:for-each select="doc-body">
			<p><xsl:value-of select="greeting" /></p>
		</xsl:for-each>
     -->
  </xsl:template>
</xsl:stylesheet>
