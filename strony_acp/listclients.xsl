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
	<h2>Lista słuchaczy</h2>
	<xsl:for-each select="source">
		<div class="roundbox">
			<div class="mounthead">
				<h3>Punkt montowania <xsl:value-of select="@mount" /></h3>
				<div class="right">
					<xsl:choose>
						<xsl:when test="authenticator">
							<a class="auth" href="/auth.xsl">Login</a>
						</xsl:when>
						<xsl:otherwise>
							<ul class="mountlist">
								<li><a class="play" href="{@mount}.m3u">M3U</a></li>
								<li><a class="play" href="{@mount}.xspf">XSPF</a></li>
								<li><a class="play" href="{@mount}.vclt">VCLT</a></li>
							</ul>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</div>
			<div class="mountcont">
				<ul class="nav">
					<li class="active"><a href="listclients.xsl?mount={@mount}">Lista Klientów</a></li>
					<li><a href="moveclients.xsl?mount={@mount}">Przenieś słuchaczy</a></li>
					<li><a href="updatemetadata.xsl?mount={@mount}">Zaktualizuj Metadane</a></li>
					<xsl:if test="authenticator">
						<li><a href="manageauth.xsl?mount={@mount}">Zarządzaj autoryzacją</a></li>
					</xsl:if>
					<li><a href="killsource.xsl?mount={@mount}">Zabij żródło</a></li>
				</ul>
				<xsl:choose>
					<xsl:when test="listener">
						<div class="scrolltable">
							<table class="colortable">
								<thead>
									<tr>
										<td>IP</td>
										<td>Sekund. połączony</td>
										<td>Agent użytkownika</td>
										<td>Akcje</td>
									</tr>
								</thead>
								<tbody>
									<xsl:variable name = "themount"><xsl:value-of select="@mount" /></xsl:variable>
									<xsl:for-each select="listener">
										<tr>
											<td>
												<xsl:value-of select="IP" />
												<xsl:if test="username">
													(<xsl:value-of select="username" />)
												</xsl:if>
											</td>
											<td><xsl:value-of select="Connected" /></td>
											<td><xsl:value-of select="UserAgent" /></td>
											<td><a href="killclient.xsl?mount={$themount}&amp;id={ID}">Wyrzuć</a></td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<p>Nie ma połączonych słuchaczy :(</p>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
	</xsl:for-each>
	<div id="footer">
		Support icecast development at <a href="http://www.icecast.org">www.icecast.org</a>
	</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
