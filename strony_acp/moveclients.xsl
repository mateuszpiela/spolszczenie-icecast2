<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
<xsl:output omit-xml-declaration="no" method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />
<xsl:template match = "/icestats" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Icecast Serwer Strumieni Multimediów</title>
	<link rel="stylesheet" type="text/css" href="/style.css" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
</head>
<body>
	<h1>Icecast2 Admin</h1>
	<!--index header menu -->
	<div id="menu">
		<ul>
			<li><a href="stats.xsl">Strona Główna Admina</a></li>
			<li><a href="listmounts.xsl">Lista punktów montowania</a></li>
			<li><a href="/status.xsl">Publiczna Strona</a></li>
		</ul>
	</div>
	<!--end index header menu -->
	<xsl:variable name = "currentmount" ><xsl:value-of select="current_source" /></xsl:variable>
	<h2>Przenoszenie słuchaczy z <xsl:value-of select="current_source" /></h2>
	<div class="roundbox">
		<h3>Do którego punktu montowania przenieść ich?</h3>
		<xsl:for-each select="source">
			<p>
				Przenieś z <code><xsl:copy-of select="$currentmount" /></code> do <code><xsl:value-of select="@mount" /></code><br />
				<xsl:value-of select="listeners" /> słuchaczy<br />
				<a href="moveclients.xsl?mount={$currentmount}&amp;destination={@mount}">Przenieś klientów</a>
			</p>
		</xsl:for-each>
	</div>
	<div id="footer">
		Support icecast development at <a href="http://www.icecast.org">www.icecast.org</a>
	</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
