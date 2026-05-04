<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="no" encoding="utf-8" omit-xml-declaration="yes"/>

  <xsl:key name="city-group" match="item" use="@city"/>

  <xsl:key name="org-group" match="item" use="concat(@city, '|', @org)"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Города</title>
      </head>
      <body>
        <h1>Города и компании</h1>
        <ul>
          <xsl:for-each select="//item[generate-id() = generate-id(key('city-group', @city)[1])]">
            <li>
              <h3>
                <xsl:value-of select="@city"/>
              </h3>
              <p>Всего товаров: <xsl:value-of select="count(key('city-group', @city))"/></p>
              <xsl:for-each select="key('city-group', @city)
                [generate-id() = generate-id(key('org-group', concat(@city, '|', @org))[1])]">
                <ul>
                  <li>
                    <h4>
                      <xsl:value-of select="@org"/>
                    </h4>
                    <p>Всего товаров: <xsl:value-of select="count(key('org-group', concat(@city, '|', @org)))"/></p>
                    <ul>
                      <xsl:for-each select="key('org-group', concat(@city, '|', @org))">
                        <li>
                          <xsl:value-of select="@title"/>
                        </li>
                      </xsl:for-each>
                    </ul>
                  </li>
                </ul>
              </xsl:for-each>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
