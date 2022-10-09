<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Lab3</title>
            </head>
            <body>
                <xsl:for-each select="test/ex2">
                <xsl:variable name="span_carti">
                        <xsl:for-each select="carti"><!-- carte --> <!-- autori/autor) -->
                            <xsl:sort select="count(titlu)" order="descending" />
                            <xsl:if test="position() = 1">
                                <xsl:value-of select="count(titlu)" />
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:variable>
                    <table>
                        <caption>
                            Exercitiu 2
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
                <xsl:for-each select="test/ex7">
                <table>
                    <caption>
                        Exercitiu 7
                    </caption>
                    <tr>
                        <th>codf</th>
                        <th>denumire</th>
                    </tr>
                    <xsl:for-each select="filiala">
                        <tr>
                            <td>
                                <xsl:value-of select="codf" />
                            </td>
                            <td>
                                <xsl:value-of select="denumire" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                </xsl:for-each>
                <xsl:for-each select="test/ex12">
                    <table>
                        <caption>
                            Exercitiu 12
                        </caption>
                        <tr>
                            <th>codf</th>
                            <th>stoc</th>
                        </tr>
                        <xsl:for-each select="filiala">
                            <tr>
                                <td>
                                    <xsl:value-of select="codf" />
                                </td>
                                <td>
                                    <xsl:value-of select="stoc" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
                <xsl:for-each select="test/ex13">
                    <table>
                        <caption>
                            Exercitiu 13
                        </caption>
                        <tr>
                            <th>filiala</th>
                            <th>numarul</th>
                            <th>carti</th>
                        </tr>
                        <xsl:for-each select="carti/carte">
                            <tr>
                                <td>
                                    <xsl:value-of select="filiale" />
                                </td>
                                <td>
                                    <xsl:value-of select="numarul" />
                                </td>
                                <td>
                                    <xsl:value-of select="carti" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each><xsl:for-each select="test/ex15">

                <xsl:variable name="span_author">
                    <xsl:for-each select="carte">
                        <xsl:sort select="count(autori/autor)" order="descending" />
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="count(autori/autor)" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="filial_span">
                    <xsl:for-each select="carte">
                        <xsl:sort select="count(stocuri/filiala)" order="descending" />
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="count(stocuri/filiala)" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <table>
                    <caption>
                        Exercitiu &#x20;
                        <xsl:value-of select="substring(name(.), 3)" />
                    </caption>
                    <tr>
                        <th>codc</th>
                        <th>titlu</th>
                        <th>gen</th>
                        <th>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="$span_author" />
                            </xsl:attribute>
                            <span>autori</span>
                        </th>
                        <th>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="$filial_span" />
                            </xsl:attribute>
                            <span>stocuri</span>
                        </th>
                        <th>pret</th>
                    </tr>
                    <xsl:for-each select="carte">
                        <tr>
                            <td>
                                <xsl:value-of select="codc" />
                            </td>
                            <td>
                                <xsl:value-of select="titlu" />
                            </td>
                            <td>
                                <xsl:value-of select="@gen" />
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
                            <xsl:for-each select="stocuri/filiala">
                                <td>
                                    <xsl:if test="position() = last()">
                                        <xsl:attribute name="colspan">
                                            <xsl:value-of select="$filial_span - count(../filiala) + 1" />
                                        </xsl:attribute>
                                    </xsl:if>
                                    <span>codf:&#x20;</span>
                                    <xsl:value-of select="@codf" />
                                    <span>,</span>
                                    <span>&#x20;stoc:&#x20;</span>
                                    <xsl:value-of select="@stoc" />
                                </td>
                            </xsl:for-each>
                            <td>
                                <xsl:value-of select="pret" />
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