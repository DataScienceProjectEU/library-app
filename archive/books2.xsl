<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Library</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                    }
                    h1 {
                        color: #333;
                    }
                    .book {
                        border: 1px solid #ddd;
                        margin: 10px 0;
                        padding: 10px;
                        border-radius: 5px;
                        background-color: #f9f9f9;
                    }
                    .book h2 {
                        margin: 0;
                        font-size: 1.2em;
                        color: #333;
                    }
                    .book .author,
                    .book .year,
                    .book .genre {
                        font-style: italic;
                        color: #666;
                    }
                    .book .summary {
                        margin-top: 10px;
                    }
                </style>
            </head>
            <body>
                <h1>Library</h1>
                <xsl:apply-templates select="library/book"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="book">
        <div class="book">
            <h2><xsl:value-of select="title"/></h2>
            <div class="author">Author: <xsl:value-of select="author"/></div>
            <div class="year">Year: <xsl:value-of select="year"/></div>
            <div class="genre">Genre: <xsl:value-of select="genre"/></div>
            <div class="summary"><xsl:value-of select="summary"/></div>
        </div>
    </xsl:template>
</xsl:stylesheet>
