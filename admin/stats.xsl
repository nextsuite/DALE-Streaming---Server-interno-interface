<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" media-type="text/html" />
  <xsl:template match="/icestats">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
        <title>Interno laFRESCA · DALE Streaming</title>
        <meta name="description" content="Servidor interno de cadena de laFRESCA. Desarrollado por Iván Gómez" />
        <link rel="icon" type="image/png" sizes="512x512" href="/assets/img/dicon.png" />
        <link rel="icon" type="image/png" sizes="512x512" href="/assets/img/dicon.png" />
        <link rel="icon" type="image/png" sizes="512x512" href="/assets/img/dicon.png" />
        <link rel="icon" type="image/png" sizes="512x512" href="/assets/img/dicon.png" />
        <link rel="icon" type="image/png" sizes="512x512" href="/assets/img/dicon.png" />
        <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="/assets/bootstrap/css/remplazar.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&amp;display=swap" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
      </head>
      <body>
        <nav class="navbar navbar-dark navbar-expand-md sticky-top d-flex py-3" id="mainNav" style="display: flex;">
          <div class="container">
            <div style="display: flex;">
              <img class="img-fluid" src="/assets/img/iconD.png" style="height: 42px;margin-right: 12px;"></img>
              <a class="navbar-brand d-flex align-items-center" href="/">
                <span style="font-size: 22px;">Interno</span>
                <img class="img-fluid d-print-none d-sm-block d-md-block d-lg-none d-xl-none d-xxl-none d-block" src="/assets/img/logo-white.png" style="height: 18px;margin-right: 12px;margin-left: 5px;"></img>
              </a>
            </div>
            <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1">
              <span class="visually-hidden">Menú</span>
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navcol-1">
              <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                  <a class="nav-link active" href="status.xsl">Inicio</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="listmounts.xsl">Gestión de mounts</a>
                </li>
              </ul>
            </div>
            <img class="d-print-block d-sm-none d-md-none d-lg-block d-xl-block d-xxl-block d-none" src="/assets/img/logo-white.png" style="height: 25px;"></img>
          </div>
        </nav>
        <section></section>
        <section></section>
        <section class="py-5" style="background: rgb(39,38,46);">
          <div class="container" style="margin-bottom: 76px;">
            <div class="card" style="padding-right: 5px;padding-left: 5px;background: rgb(28,28,28);">
              <div class="card-body">
                <h1 class="display-6 card-title">Datos del servidor</h1>
                <p class="card-text">Aquí se muestras los datos generales del servidor y las estadísticas globales.</p>
                <div class="table-responsive">
                  <table class="table">
                    <tbody>
                      <xsl:for-each select="/icestats">
                        <xsl:for-each select="*">
                          <xsl:if test="name()!='source'">
                            <tr>
                              <td style="font-weight: bold;">
                                <xsl:value-of select="name()" />
                              </td>
                              <td>
                                <xsl:value-of select="." />
                              </td>
                            </tr>
                          </xsl:if>
                        </xsl:for-each>
                      </xsl:for-each>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

          <div class="container">
            <h5 class="display-6" style="margin-bottom: 24px;padding-left: 11px;">Mounts conectados</h5>
            <xsl:for-each select="source">
              <xsl:if test="listeners!=''">
                <div class="card" style="padding-right: 5px;padding-left: 5px;margin-bottom:30px;">
                  <div class="row g-0 align-items-center card-header">
                    <div class="col-auto col-md-6 align-items-center align-content-center align-self-center">
                      <h4 style="font-weight: bold;margin-top: 5px;">
                        <xsl:value-of select="@mount" />
                         <xsl:choose>
                         <xsl:when test="listenurl='http://interno.produccionesdale.com:9234/dexa'">
                             <span style="margin-left: 10px;font-size: 13px;" class="badge bg-secondary">Sistema DEXA</span>
                         </xsl:when>
                         <xsl:when test="listenurl='http://interno.produccionesdale.com:9234/enlace'">
                             <span style="margin-left: 10px;font-size: 13px;" class="badge bg-info">Cadena</span>
                         </xsl:when>
                        <xsl:otherwise></xsl:otherwise>
                      </xsl:choose>
                      </h4>
                    </div>
                    <div class="col" style="text-align: right;">
                      <xsl:choose>
                        <xsl:when test="authenticator">
                          <span class="text-warning"><i class="fa-solid fa-lock"></i> Protegido</span>
                        </xsl:when>
                        <xsl:otherwise></xsl:otherwise>
                      </xsl:choose>
                    </div>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table">
                        <tbody>
                            <xsl:if test="listeners">
								<tr>
									<td style="font-weight:bold;">Conexiones:</td> 
									<td><i style="margin-right:10px;" class="fa-solid fa-tower-broadcast"></i> <xsl:value-of select="listeners" /> ahora / <xsl:value-of select="listener_peak" /> pico</td>
								</tr>
							</xsl:if>

                            <xsl:if test="stream_start">
								<tr>
									<td style="font-weight:bold;">Inicio de emisión:</td>
									<td><xsl:value-of select="stream_start" /></td>
								</tr>
							</xsl:if>
							
							<xsl:if test="audio_info">
								<tr>
									<td style="font-weight:bold;">Calidad de emisión:</td>
									<td><i style="margin-right:10px;" class="fa-solid fa-volume-high"></i> <xsl:value-of select="audio_info" /> kpbs en <xsl:value-of select="server_type" /></td>
								</tr>
							</xsl:if>

                            <xsl:if test="user_agent">
								<tr>
									<td style="font-weight:bold;">User agent:</td>
									<td><xsl:value-of select="user_agent" /></td>
								</tr>
							</xsl:if>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </xsl:if>
            </xsl:for-each>
          </div>
        </section>
        <footer class="bg-dark" style="height: 97.594px;background: rgb(0,0,0);">
          <div class="container py-2 py-lg-3" style="height: 100%;">
            <hr></hr>
            <div class="row text-nowrap">
              <div class="col-auto col-md-6">
                <p class="mb-0" style="font-size: 14px;font-weight: bold;">© DALE Streaming by Iván Gómez</p>
              </div>
              <div class="col-md-6 text-end">
                <span class="text-end d-lg-flex justify-content-between justify-content-lg-end align-items-lg-center" style="font-size: 12px;">Basado en Icecast</span>
              </div>
            </div>
          </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="/assets/js/script.min.js"></script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>