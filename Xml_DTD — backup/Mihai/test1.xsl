<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA</title>
            </head>
            <body>
                <xsl:for-each select="test/ex16">
                    <table>
                        <caption>
                            Exercitiul 16
                        </caption>
                        <tr>
                            <th>denumire</th>
                            <th>value</th>
                    
                        </tr>
                        <xsl:for-each select="filiala">
                            <tr>
                                <td>
                                    <xsl:value-of select="denumire" />
                                </td>
                                <td>
                                    <xsl:value-of select="value" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
                <xsl:for-each select="test/ex14">
                    <xsl:variable name="span_author">
                        <xsl:for-each select="filiala/carti/carte">
                            <xsl:sort select="count(autori/autor)" order="descending" />
                            <xsl:if test="position() = 1">
                                <xsl:value-of select="count(autori/autor)" />
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:variable>
                    <table>
                        <caption>
                            Exercitiu 14
                        </caption>
                        <tr>
                            <th>titlu</th>
                            <th>gen</th>
                            <th>
                                <xsl:attribute name="colspan">
                                    <xsl:value-of select="$span_author" />
                                </xsl:attribute>
                                <span>autori</span>
                            </th>
                            <th>pret</th>
                        </tr>
                        <xsl:for-each select="filiala/carti/carte">
                            <tr>
                                <td>
                                    <xsl:value-of select="titlu" />
                                </td>
                                <td>
                                    <xsl:value-of select="gen/@gen" />
                                </td>

                                <xsl:for-each select="autori/autor">
                                    <td>
                                        <xsl:if test="position() = last()">
                                            <xsl:attribute name="colspan">
                                                <xsl:value-of select="$span_author - count(../autor) + 1" />
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="." />
                                    </td>
                                </xsl:for-each>
                                <td>
                                    <xsl:value-of select="pret" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
                <xsl:for-each select="test/ex9">
                <xsl:variable name="span_carti">
                        <xsl:for-each select="carti">
                            <xsl:sort select="count(titlu)" order="descending" />
                            <xsl:if test="position() = 1">
                                <xsl:value-of select="count(titlu)" />
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:variable>
                    <table>
                        <caption>
                            Exercitiu 9
                        </caption>
                        <tr>
                            <th>
                                <xsl:attribute name="colspan">
                                    <xsl:value-of select="$span_carti" />
                                </xsl:attribute>
                                <span>titlu</span>
                            </th>
                        </tr>
                        <xsl:for-each select="carti">
                            <tr>
                                <xsl:for-each select="titlu">
                                    <tr>
                                        <td>
                                            <xsl:if test="position() = last()">
                                                <xsl:attribute name="colspan">
                                                    <xsl:value-of select="$span_carti - count(titlu) + 1" />
                                                </xsl:attribute>
                                            </xsl:if>
                                            <xsl:value-of select="." />
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
                <xsl:for-each select="test/ex6">
                <table>
                    <caption>
                        Exercitiu 6
                    </caption>
                    <tr>
                        <th>denumire</th>
                        <th>carti</th>
                    </tr>
                    <xsl:for-each select="filiala">
                        <tr>
                            <td>
                                <xsl:value-of select="denumire" />
                            </td>
                            <td>
                                <xsl:value-of select="carti" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                </xsl:for-each>
                <xsl:for-each select="test/ex5">
                <xsl:variable name="span_title">
                    <xsl:for-each select="filiala">
                        <xsl:sort select="count(carti/titlu)" order="descending" />
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="count(carti/titlu)" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <table>
                    <caption>
                        Exercitiu 5
                    </caption>
                    <tr>
                        <th>denumire</th>
                        <th>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="$span_title" />
                            </xsl:attribute>
                            <span>carti</span>
                        </th>
                    </tr>
                    <xsl:for-each select="filiala">
                        <tr>
                            <td>
                                <xsl:value-of select="denumire" />
                                    </td>
                                        <td>
                                            <xsl:for-each select="carti">
                                                <tr>
                                                    <xsl:for-each select="titlu">
                                                        <td>
                                                            <xsl:if test="position() = last()">
                                                                <xsl:attribute name="colspan">
                                                                    <xsl:value-of select="$span_title - count(titlu) + 1" />
                                                                </xsl:attribute>
                                                            </xsl:if>
                                                            <xsl:value-of select="." />
                                                        </td>
                                                    </xsl:for-each>
                                                </tr>
                                            </xsl:for-each>
                                        </td>
                        </tr>
                    </xsl:for-each>
                </table>
                </xsl:for-each>
                <style>
                    body {
                        text-align: center;
                    }
                    table {
                        margin-top: 25px;
                        border-collapse: collapse;
                    }
                    td, th {
                        border: solid 2px black;
                        padding: 5px;
                    }</style>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>