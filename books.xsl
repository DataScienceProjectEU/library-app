
<!-- Element <xsl:stylesheet> jest głównym elementem każdego dokumentu XSLT. Definiuje on, że dokument jest arkuszem stylów XSLT i zawiera wszystkie reguły przekształcenia, które mają być zastosowane do dokumentu XML. -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!-- Definiowanie formatu wyjściowego -->
    <xsl:output method="html" indent="yes"/>

    <!-- Główny szablon dla całego dokumentu -->
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="css/styles.css"/>
            </head>

            <body>

                <div id="bookList" class="book-list">
                    <xsl:apply-templates select="library/book"/>
                </div>

            </body>
        </html>
    </xsl:template>

    <!-- Szablon dla elementów <book> -->

    <!-- Definiuje szablon, który będzie stosowany do każdego elementu <book> w dokumencie XML. -->
    <xsl:template match="book">

                <!-- Każdy element XML <book> zostanie przekształcony w <div> o klasie book. I tę klasę definiujemy w CSS -->
                <div class="book">


                    <!-- Wstawia tytuł książki jako nagłówek drugiego poziomu (<h2>). -->
                    <h2><xsl:value-of select="title"/></h2>
                    
                        <!-- Kontener dla informacji o książce, zawierający obrazek i szczegóły. -->
                        <div class="book-info">
                        
                        <!-- Kontener dla obrazka książki, gdzie src jest ustawiane na wartość {image}, a alt na {title}. -->
                        <div class="book-image">
                            <img src="{image}" alt="{title}"/>
                        </div>

                        <!-- Kontener dla szczegółowych informacji o książce. -->
                        <div class="book-details">
                            
                            <!-- Wstawia autora książki. -->
                            <p><strong>Author:</strong> <xsl:value-of select="author"/></p>

                            <!-- Wstawia rok wydania książki. -->
                            <p><strong>Year:</strong> <xsl:value-of select="year"/></p>

                            <!-- Wstawia gatunek książki. -->
                            <p><strong>Genre:</strong> <xsl:value-of select="genre"/></p>

                            <!-- Wstawia podsumowanie książki. -->
                            <p class="summary"><xsl:value-of select="summary"/></p>

                            
                        </div>
                    </div>
                </div>
    </xsl:template>


</xsl:stylesheet>
