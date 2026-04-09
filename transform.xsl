<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:key name="course-by-teacher" match="course" use="teachers/teacher" />
  <xsl:key name="course-by-keyword" match="course" use="keywords/keyword" />

  <xsl:output method="html" encoding="UTF-8" indent="yes" />

  <xsl:template match="/">
    <html>
      <head>
        <title>Наши курсы</title>
        <meta charset="UTF-8" />
      </head>
      <body>
        <h1>Наши курсы</h1>

        <h3>Курсы, которые читает Борисов И.О.</h3>
        <ul>
          <xsl:for-each select="key('course-by-teacher', 'Борисов И.О.')">
            <li><xsl:value-of select="title" /></li>
          </xsl:for-each>
        </ul>

        <h3>Курсы, которые используют XML</h3>
        <ul>
          <xsl:for-each select="key('course-by-keyword', 'XML')">
            <li><xsl:value-of select="title" /></li>
          </xsl:for-each>
        </ul>

        <h3>Курсы, которые читает Борисов И.О. и в которых есть тема XSLT</h3>
        <ul>
          <xsl:for-each select="key('course-by-teacher', 'Борисов И.О.')[keywords/keyword='XSLT']">
            <li><xsl:value-of select="title" /></li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>