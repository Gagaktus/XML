
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" id="stylesheet">
<xsl:output method="html" encoding="UTF-8"/>

<xsl:template match="/">
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Список оборудования</title>
    <style>
        table {
            border-collapse: collapse;
            width: 400px;
            font-family: Arial, sans-serif;
        }
        th, td {
            border: 1px solid #333;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>

<table>
    <thead>
        <tr>
            <th colspan = "2">Всего элементов: <xsl:value-of select="count(items/element)"/></th>
        </tr>
        <tr>
            <th>Тип</th>
            <th>Наименование</th>
        </tr>
    </thead>
    <tbody>
        <xsl:for-each select="items/element">
            <tr>
                <xsl:if test="position() mod 2 = 0">
                    <xsl:attribute name="style">background-color:gray</xsl:attribute>
                </xsl:if>
                <td>
                    <xsl:value-of select="@name"/>
                </td>
                <td>
                    <xsl:value-of select="@value"/>
                </td>
            </tr>
        </xsl:for-each>
    </tbody>
</table>

</body>
</html>
</xsl:template>
</xsl:stylesheet>