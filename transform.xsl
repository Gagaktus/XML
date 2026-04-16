<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <xsl:key name="children" match="item" use="@parentid"/>
    
    <xsl:template match="/items">
        <html>
            <head>
                <title>Обсуждение</title>
                <meta charset="UTF-8"/>
            </head>
            <body>
                <ul>
                    <xsl:apply-templates select="item[@parentid='0']"/>
                </ul>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="item">
        <li>
            <xsl:value-of select="@author"/>
            <xsl:text> пишет: </xsl:text>
            <xsl:value-of select="."/>
            
            <xsl:if test="key('children', @id)">
                <ul>
                    <xsl:apply-templates select="key('children', @id)"/>
                </ul>
            </xsl:if>
        </li>
    </xsl:template>
    
</xsl:stylesheet>