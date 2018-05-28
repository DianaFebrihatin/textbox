<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt">
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <sch:pattern>
        <sch:let name="keywords-file" value="document('keywords.xml')"/>
        <sch:let name="cat-author" value="$keywords-file//tei:category[@xml:id='author']" />
        <sch:let name="cat-text" value="$keywords-file//tei:category[@xml:id='text']" />
        <sch:rule context="tei:keywords">
            <!-- ### author ### -->
            
            <sch:assert test="tei:term[@type='author.continent'] = $cat-author/tei:category[@xml:id='author.continent']/tei:category/tei:catDesc">Metadata error: author.continent</sch:assert>
            <sch:assert test="tei:term[@type='author.country'] = $cat-author/tei:category[@xml:id='author.country']/tei:category/tei:catDesc">Metadata error: author.country</sch:assert>
            <sch:assert test="tei:term[@type='author.gender'] = $cat-author/tei:category[@xml:id='author.gender']/tei:category/tei:catDesc">Metadata error: author.gender</sch:assert>
         
            <!-- ### text ### -->
            <sch:let name="cat-text" value="$keywords-file//tei:category[@xml:id='text']" />
            <sch:assert test="tei:term[@type='text.language'] = $cat-text/tei:category[@xml:id='text.language']/tei:category/tei:catDesc">Metadata error: text.language</sch:assert>
            <sch:assert test="tei:term[@type='text.form'] = $cat-text/tei:category[@xml:id='text.form']/tei:category/tei:catDesc">Metadata error: text.form</sch:assert>
            <sch:assert test="tei:term[@type='text.genre'] = $cat-text/tei:category[@xml:id='text.genre']/tei:category/tei:catDesc">Metadata error: text.genre</sch:assert>
            <sch:assert test="tei:term[@type='text.genre.supergenre'] = $cat-text//tei:category[@xml:id='text.genre.supergenre']/tei:category/tei:catDesc">Metadata error: text.genre.supergenre</sch:assert>
            <sch:assert test="tei:term[@type='text.narration.narrator'] = $cat-text//tei:category[@xml:id='text.narration.narrator']/tei:category/tei:catDesc or tei:term[@type='text.narration.narrator'] = ''">Metadata error: text.narration.narrator</sch:assert>
            <sch:assert test="tei:term[@type='text.setting.settlement.type'] = $cat-text//tei:category[@xml:id='text.setting.settlement.type']/tei:category/tei:catDesc or tei:term[@type='text.setting.settlement.type'] = ''">Metadata error: text.setting.settlement.type</sch:assert>
        </sch:rule>
        <!-- ### subgenre ### -->
        <sch:rule context="tei:keywords/tei:term[@type='text.genre.subgenre']">
            <sch:assert test=". = $cat-text//tei:category[@xml:id='text.genre.subgenre']/tei:category/tei:catDesc">Metadata error: text.genre.subgenre</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>