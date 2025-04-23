
# Decoders Snort en OSSEC
Permite detectar que los eventos detectados por Snort sean procesados y gestionados por OSSEC

```xml
<decoder name="snort">
  <program_name_pcre2>^snort</program_name_pcre2>
</decoder>

<decoder name="snort">
  <type>ids</type>
  <prematch_pcre2>^\[\*\*\] \[\d+:\d+:\d+\] </prematch_pcre2>
</decoder>

<decoder name="snort2">
   <parent>snort</parent>
   <type>ids</type>
   <prematch_pcre2>^\[\*\*\] \[|^\[Drop\] \[\*\*\] \[|^\[</prematch_pcre2>
   <pcre2 offset="after_prematch">(\d+:\d+:\d+)\] .+ (\S+?):?\d* -> ([^:]+)</pcre2>
   <order>id,srcip,dstip</order>
   <fts>name,id,srcip,dstip</fts>
</decoder>
```