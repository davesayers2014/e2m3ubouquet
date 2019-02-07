echo "E2m3u2bouquet Multi Config Generator"
echo $LINE
echo $LINE
read -p "Enter what you wnat to name your IPTV  : " name
echo $LINE
read -p "Enter the username for your IPTV  : " username
echo $LINE
read -p "Enter the password for your IPTV : " password
echo $LINE
read -p "Enter the host url your provider gave you for your IPTV  : " iptvhost
echo  "<!--
  E2m3u2bouquet supplier config file
  Add as many suppliers as required
  this config file will be used and the relevant bouquets set up for all suppliers entered
  0 = No/False
  1 = Yes/True
  For elements with <![CDATA[]] enter value between empty brackets e.g. <![CDATA[mypassword]]>
-->
<config>
  <supplier>
    <name>$name</name><!-- Supplier Name -->
    <enabled>1</enabled><!-- Enable or disable the supplier (0 or 1) -->
    <settingslevel>expert</settingslevel> 
    <m3uurl><![CDATA[$iptvhost/get.php?username=USERNAME&password=PASSWORD&type=m3u_plus&output=ts]]></m3uurl><!-- Extended M3U url --> 
    <epgurl><![CDATA[$iptvhost/xmltv.php?username=USERNAME&password=PASSWORD&next_days=7]]></epgurl><!-- XMLTV EPG url -->
    <username><![CDATA[$username]]></username><!-- (Optional) will replace USERNAME placeholder in urls -->
    <password><![CDATA[$password]]></password><!-- (Optional) will replace PASSWORD in urls -->
    <providerupdate><![CDATA[]]></providerupdate><!-- (Optional) Provider update url -->
    <iptvtypes>0</iptvtypes><!-- Change all TV streams to IPTV type (0 or 1) -->
    <streamtypetv></streamtypetv><!-- (Optional) Custom TV stream type (e.g. 1, 4097, 5001 or 5002 -->
    <streamtypevod>4097</streamtypevod><!-- (Optional) Custom VOD stream type (e.g. 4097, 5001 or 5002 -->
    <multivod>1</multivod><!-- Split VOD into seperate categories (0 or 1) -->
    <allbouquet>0</allbouquet><!-- Create all channels bouquet (0 or 1) -->
    <picons>0</picons><!-- Automatically download Picons (0 or 1) -->
    <xcludesref>1</xcludesref><!-- Disable service ref overriding from override.xml file (0 or 1) -->
    <bouqueturl><![CDATA[]]></bouqueturl><!-- (Optional) url to download providers bouquet - to map custom service references -->
    <bouquetdownload>0</bouquetdownload><!-- Download providers bouquet (uses default url) must have username and password set above - to map custom service references -->
    <bouquettop>0</bouquettop><!-- Place IPTV bouquets at top (0 or 1) -->
  </supplier>
</config>
" >> /etc/enigma2/e2m3u2bouquet/config.xml
