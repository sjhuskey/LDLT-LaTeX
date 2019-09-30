<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
    xmlns:rng="http://relaxng.org/ns/structure/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:teix="http://www.tei-c.org/ns/Examples" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    exclude-result-prefixes="a rng tei teix" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:output method="text" encoding="utf8"/>
    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="tei:front"/>
    <xsl:template match="tei:head"/>
    <xsl:template name="unclear" match="tei:unclear/text()">
        <xsl:text>\charopB \chariterate{</xsl:text>
        <xsl:for-each select="tokenize(., ' ')">
            <xsl:if test="position() != last()">
                <xsl:value-of select="."/>
                <xsl:text>\enspace </xsl:text>
            </xsl:if>
            <xsl:if test="position() = last()">
                <xsl:value-of select="."/>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template name="getExtent">
        <xsl:variable name="unit" select=".//@unit"/>
        <xsl:variable name="quantity" select=".//@quantity"/>
        <xsl:variable name="number">
            <xsl:choose>
                <xsl:when test="$quantity &gt; 1">plural</xsl:when>
                <xsl:otherwise>singular</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="$quantity"/>
        <xsl:text> </xsl:text>
    </xsl:template>

    <xsl:template match="tei:gap">
        <xsl:choose>
            <xsl:when test="not(@unit)">
                <xsl:if test="parent::tei:supplied">
                    <xsl:text>&lt;\lacuna&gt;</xsl:text>
                </xsl:if>
                <xsl:if test="not(parent::tei:supplied)">
                    <xsl:text>\lacuna{}</xsl:text>
                </xsl:if>
            </xsl:when>
            <xsl:when test="@quantity">
                <xsl:text>[\missing{</xsl:text>
                <xsl:value-of select="@quantity"/>
                <xsl:text>}{\charopB \chariterate{\enspace}}]</xsl:text>
            </xsl:when>
            <xsl:when test="@reason = 'unknown'">
                <xsl:text>[---]</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:supplied">
        <xsl:text>&lt;</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>&gt;</xsl:text>
    </xsl:template>
    <xsl:template match="tei:app/tei:lem"/>
    
    <xsl:template match="tei:app/tei:rdg/tei:del">
        <xsl:text>⟦</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>⟧</xsl:text>
    </xsl:template>

    <xsl:template match="tei:surplus">
        <xsl:text>\{</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>\}</xsl:text>
    </xsl:template>

    <xsl:template match="tei:sic">
        <xsl:text>\corruption{</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>}</xsl:text>
    </xsl:template>
</xsl:stylesheet>
