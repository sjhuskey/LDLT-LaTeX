<?xml version=  "1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
    xmlns:rng="http://relaxng.org/ns/structure/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:teix="http://www.tei-c.org/ns/Examples" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    exclude-result-prefixes="a rng tei teix" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:output method="text" encoding="utf8"/>
    <xsl:param name="outputTarget">latex</xsl:param>
    <xsl:template match="tei:fileDesc">
        <!-- Preamble -->
        <xsl:text>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Formal Book Title Page
% LaTeX Template
% Version 2.0 (23/7/17)
%
% This template was downloaded from:
% http://www.LaTeXTemplates.com
%
% Original author:
% Peter Wilson (herries.press@earthlink.net) with modifications by:
% Vel (vel@latextemplates.com)
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\documentclass[a4paper, 11pt, oneside]{book} % A4 paper size, default 11pt font size and oneside for equal margins

\usepackage{xltxtra,fontspec,xunicode}

\usepackage[T1]{fontenc}

\usepackage[lmargin=1in,rmargin=1in,tmargin=1in,bmargin=1in,marginparwidth=0.75in]{geometry}

\usepackage{graphicx} % Insert images
\graphicspath{ {./images/} }

</xsl:text>

        <xsl:text>
\begin{document} 
\begin{titlepage} % Suppresses headers and footers on the title page
\centering % Centre everything on the title page
\scshape % Use small caps for all text on the title page

%------------------------------------------------
%	Title
%------------------------------------------------
\vspace*{\baselineskip} % White space at the top of the page

\rule{\textwidth}{1.6pt}\vspace*{-\baselineskip}\vspace*{2pt} % Thick horizontal rule
\rule{\textwidth}{0.4pt} % Thin horizontal rule

\vspace{1\baselineskip} % Whitespace above the title

\textsc{\Huge </xsl:text>
        <xsl:value-of select="tei:titleStmt/tei:title"/>
        <xsl:text>} % Title

\vspace{2.25\baselineskip} % Whitespace below the title 

%------------------------------------------------
%	Editor(s)
%------------------------------------------------

Edited By

\vspace{0.5\baselineskip} % Whitespace before the editors

{\scshape\LARGE </xsl:text>
        <xsl:value-of select="tei:titleStmt/tei:editor"/>
        <xsl:text>} % Editor list
        
\vspace{0.5\baselineskip} % Whitespace below the editor list
\rule{\textwidth}{0.4pt}\vspace*{-\baselineskip}\vspace{3.2pt} % Thin horizontal rule
\rule{\textwidth}{1.6pt} % Thick horizontal rule

\vspace{12\baselineskip} % Whitespace below the title and editor block

%------------------------------------------------
%	Series
%------------------------------------------------

{\scshape\Large </xsl:text>
        <xsl:value-of select="tei:titleStmt/tei:sponsor"/>
        <xsl:text>}\\
\medskip % Whitespace
{\scshape\Large </xsl:text>
        <xsl:value-of select="tei:seriesStmt/tei:title"/>
        <xsl:text>}\\
\vspace{2\baselineskip} % Whitespace

{\large Volume </xsl:text>
        <xsl:value-of select="tei:seriesStmt/tei:biblScope"/>
        <xsl:text>}\\
\vfill % Whitespace between editor names and publisher logo
        
%------------------------------------------------
%	Publisher
%------------------------------------------------

\begin{figure}[h] % Position the logo here on the page.
\includegraphics[scale=0.60]{DLL} % Logo of DLL
\centering % Center the logo.
\end{figure}

{\normalsize </xsl:text>
        <xsl:value-of select="tei:publicationStmt/tei:date"/>
        <xsl:text>}        
\end{titlepage}
%----------------------------------------------------------------------------------------
\end{document}</xsl:text>
    </xsl:template>
    <xsl:template match="tei:text"/>
</xsl:stylesheet>