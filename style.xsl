<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns="http://www.w3.org/1999/xhtml" >
    <xsl:output method="html" indent="yes" />
    
    <xsl:template match="/" >
        <html>
            <head>
                <!--titolo-->
                <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet" />
                <!--paragrafi-->
                <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet" />
                <link href="style.css" rel="stylesheet" type="text/css" />
                <meta charset="UTF-8" />
                <title> 
                    <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                    
                </title>
                
            </head>
            <body>
                <!-- parte introduttiva -->
                <header>
                    <h1 id="titolo">Diario di Artom</h1>
                    <nav>
                        <ul>
                            <li> <a href="#pagina138" > 138 </a> </li>
                            <li> <a href="#pagina139"> 139 </a> </li>
                            <li> <a href="#pagina140"> 140 </a></li>
                            <li> <a href="#crediti"> Crediti </a></li>
                        </ul>
                    </nav>
                    <div id="introduzione">   
                        <p>
                            Questo sito è stato realizzato per il progetto del corso di Codifica di Testi a.a. 2023/24 del corso di laurea in Informatica Umanistica. <br/>
                            Il corso è stato frequentato nell' a.a. 2021/22.
                            Le tre pagine qui riportate e presentate provengono dal <i> <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository"/> </i>, dei comuni di 
                            <i> <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement"/></i>.
                            <br/>
                            Le pagine sono state scritte durante la Seconda Guerra Mondiale e riguardano le pagine del Diario di Emanuele Artom. 
                            <br/>
                        </p>
                    </div>
                    
                </header>
                <section id="pagina138">
                    <div class="cont">
                        <xsl:apply-templates select="//tei:teiCorpus[@xml:id='pagina138']"/>
                    </div>
                </section>
                <section id="pagina139">
                    <div class="cont">
                        <xsl:apply-templates select="//tei:teiCorpus[@xml:id='pagina139']"/>
                    </div>
                </section>
                <section id="pagina140">
                    <div class="cont">
                        <xsl:apply-templates select="//tei:teiCorpus[@xml:id='pagina140']"/>
                    </div>
                </section> 
                <section id="crediti">
                    <div class="cont">
                        <xsl:apply-templates select="//tei:teiCorpus/tei:teiHeader[@xml:id='main']"/>
                    </div>
                </section>
            </body>
        </html>
    </xsl:template>
    
    <!-- template informazioni -->
    <xsl:template match="tei:teiCorpus[@xml:id='pagina138' or @xml:id='pagina139' or @xml:id='pagina140']/tei:teiHeader/tei:fileDesc">
        <div class="info">
            <div class="informazioni">
                <h2> <xsl:value-of select="tei:titleStmt/tei:title"/> </h2>
                <p>
                    <xsl:for-each select="tei:notesStmt/tei:note">
                        <xsl:value-of select="."/>
                    </xsl:for-each>
                </p>
                <h4><xsl:value-of select="tei:sourceDesc/tei:bibl/tei:title[@type='custom']"/></h4>
                <p>
                    Scritto da <i><xsl:value-of select="tei:sourceDesc/tei:bibl/tei:author"/></i>, nel <xsl:value-of select="tei:sourceDesc/tei:bibl/tei:date"/>.
                </p>
                <p> 
                    <b> Codice identificativo: </b>
                    <xsl:value-of select="tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno"/>
                </p>
                <p> 
                    <b> Condizione: </b>
                    <xsl:value-of select="tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:condition"/>
                </p>
            </div>
            <xsl:apply-templates select="tei:sourceDesc/tei:listPerson"/>
            <xsl:apply-templates select="tei:sourceDesc/tei:listPlace"/>
        </div>
    </xsl:template>
    
    <!-- PERSONE -->
    <xsl:template match="tei:listPerson">
        <div class="persone">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:person">
        <div class="persona">
            <p> <b>Nome: </b> <xsl:value-of select="tei:persName/tei:forename"/></p>
            <p> <b>Cognome: </b> <xsl:value-of select="tei:persName/tei:surname"/></p>
            <p> <b>Sesso: </b> <xsl:value-of select="tei:sex"/></p>
        </div>
    </xsl:template>
    
    <!-- TIPOLOGIA -->
    <xsl:template match="tei:textClass">
        <div class="descr">
            <p>
                <b>Tipologia: </b> <xsl:value-of select="tei:keywords/tei:term[@type='descr1']"/>
                - <xsl:value-of select="tei:keywords/tei:term[@type='descr2']"/>
            </p>
        </div>
    </xsl:template>
    
    <!-- LINGUA -->
    <xsl:template match="tei:langUsage">
        <div class="lingua">
            <p><b>Lingua: </b> <xsl:apply-templates/> </p>
        </div>
    </xsl:template>
    
    <!-- immagine -->
    <xsl:template match="tei:facsimile">
        <div class="immagine">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
       
    <!-- template testo -->
    <xsl:template match="tei:text">
        <div class="corpo">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- descrizione della pagina + note -->
    
    <xsl:template match="tei:figure">
        <div class="fronte">
            <p> <xsl:value-of select="tei:figDesc"/>
                <xsl:for-each select="tei:note">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </p>
            
        </div>
    </xsl:template>
    
    <!-- codifica del testo -->
    
    <xsl:template match="tei:div[@type='message']">
        <div class="testo">
            <p>
                <xsl:apply-templates/> 
            </p> 
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div[@xml:id='part1' and @xml:id='part2' and @xml:id='part3']">
        <div class="testofronte">
            <p>
                <xsl:apply-templates/>
            </p>
        </div>
    </xsl:template>
  
    <xsl:template match="tei:lb">
        <br />
    </xsl:template>
    
    <xsl:template match="tei:choice">
        <i>
            <xsl:for-each select="abbr">
                <xsl:value-of select="tei:expan"/>
            </xsl:for-each>
            <xsl:value-of select="tei:corr"/>
        </i>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='codice']">
        <div class="archivio">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- FOOTER -->
    <xsl:template match="tei:title">
        <h1> <xsl:value-of select="."/> </h1>
    </xsl:template>
    <xsl:template match="tei:respStmt">
        <div>
            <p> <b> <xsl:value-of select="tei:resp"/>: </b> </p>
            <p> <xsl:for-each select="tei:name">
                <xsl:value-of select="."/>
            </xsl:for-each>
            </p>
        </div>
    </xsl:template>
    <!-- edizione -->
    <xsl:template match="tei:edition">
        <div>
            <p> 
                <i>
                    <xsl:value-of select="."/> - anno 
                    <xsl:value-of select="tei:date"/>
                </i>
            </p>
        </div>
    </xsl:template>
    <xsl:template match="tei:publicationStmt">
        <div>
            <p>
                <i>
                    Pubblicazione <xsl:value-of select="tei:publisher"/> 
                    (<xsl:value-of select="tei:pubPlace"/>) - 
                    <xsl:value-of select="tei:availability/tei:p"/>
                </i> 
            </p>
        </div>
    </xsl:template>
    <xsl:template match="tei:sourceDesc">
        <div>
            <p>
                <i>
                    <xsl:value-of select="tei:msDesc/tei:msIdentifier/tei:country"/> - 
                    <xsl:value-of select="tei:msDesc/tei:msIdentifier/tei:settlement"/> <br/>
                    <xsl:value-of select="tei:msDesc/tei:msIdentifier/tei:repository"/>
                </i>
            </p>
        </div>
    </xsl:template>
</xsl:stylesheet>