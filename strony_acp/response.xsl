<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
<xsl:output omit-xml-declaration="no" method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />
<xsl:template match = "/iceresponse" >
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
	<h2>Icecast Odpowiedż Serwera</h2>
	<xsl:for-each select="/iceresponse">
		<div class="roundbox">
			<h3>Odpowiedż</h3>
			<p>Wiadomość: <xsl:value-of select="message" /></p>
			<p>Kod powrotny: <xsl:value-of select="return" /></p>
		</div>
	</xsl:for-each>
	<div id="footer">
		Support icecast development at <a href="http://www.icecast.org">www.icecast.org</a>
	</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
