<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

    <xsl:template match="/">
        <goods>
            <xsl:comment> Всего элементов: <xsl:value-of select="count(items/element)"/> </xsl:comment>
            <xsl:for-each select="items/element">
                <xsl:element name="{@name}">
                    <xsl:value-of select="@value"/>
                </xsl:element>
            </xsl:for-each>
        </goods>
    </xsl:template>

</xsl:stylesheet>