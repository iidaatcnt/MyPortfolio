<?xml version="1.0" encoding="UTF-8" ?>

<!-- XSLTスタイルシート宣言-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ms="urn:schemas-microsoft-com:xslt"
  xmlns:dt="urn:schemas-microsoft-com:datatypes">

<xsl:output method="html" encoding="UTF-8" />

<!-- ルートノード用テンプレート -->
<xsl:template match="PackageInsert">

  <html>

    <head>
      <meta charset="UTF-8"/>
      <title>添付文書XMLサンプル</title>

      <style type="text/css">

        *{
          margin: 0;
          padding: 0;
        }

        body{
          box-sizing: border-box;
          width: 500px ;
          height: 300px;
          border: 1px solid #000;
          margin: 10px;
          padding: 10px;
        }

        .name{
          text-align: center;
        }

        .Date{
          text-align: right;
        }

        .Warning{
          margin-top: 10px;
          padding: 3px;
          border: 2px solid red;
          color: red;
        }

        .Title{
          font-weight: bold;
        }

        .Dosage{
          margin-top: 10px;
        }

        .Manufacture{
          margin-top: 50px;
          text-align: center;
        }

      </style>

    </head>

    <body>
      <h1 class="Name">
        <xsl:apply-templates select="Name"/>
      </h1>

      <div class="Date">
        <xsl:apply-templates select="RevisionDate"/>
      </div>

      <!-- 警告 -->
      <div class="Warning">
        <p class="Title">【警告】</p>
        <xsl:apply-templates select="Warning" />
      </div>

      <div class="Dosage">
        <p class="Title">【用法・用量】</p>
        <xsl:apply-templates select="Dosage" />
      </div>

      <div class="Manufacture">
        <p class="Title">【製造販売】</p>
        <xsl:apply-templates select="ManufactureAndSale"/>
      </div>

    </body>
  </html>

</xsl:template>

</xsl:stylesheet>
