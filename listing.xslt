<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

    <!-- EM PRODUCAO, TIRAR O COMENTARIO DA LINHA ABAIXO  -->
    <!-- <xsl:output method="xhtml" encoding="iso-8859-1" indent="no"/> -->

    <xsl:template match="listing">
        <html>
            <head>
                <title>
                    Arquivos do diretório
                    <xsl:value-of select="@directory"/>
                </title>
                <meta content="width=device-width, initial-scale=1" name="viewport"/>
                <link rel="stylesheet" href="{@contextPath}/statics/classe.css"/>
                <link rel="shortcut icon" href="{@contextPath}/favicon.ico" />
            </head>
            <body>
                <div class="titulo">
                    <div class="logo">
                        <img class="logo" src="{@contextPath}/statics/logo.png"></img>
                    </div>
                    <div class="texto">
                        Arquivos públicos - asousas@live.com
                    </div>
                </div>
                <div class="barra">
                    <div>
                        Retornar para:
                    </div>
                    <div class="breadcrumb">
                        <a href="{@contextPath}{@directory}../">
                            <xsl:value-of select="@directory"/>
                        </a>
                    </div>
                </div>
                <table class="arquivos">
                    <xsl:apply-templates select="entries">
                        <xsl:with-param name="contextPath" select="@contextPath"/>
                    </xsl:apply-templates>
                </table>
                <div>
                    <xsl:apply-templates select="readme"/>
                </div>
            </body>
            <footer>
                <div class="footer">
                    <a href="http://github.com/arannasousa/">Arannã Sousa</a></div>
            </footer>
        </html>
    </xsl:template>

    <xsl:template match="entries">
        <xsl:param name="contextPath"></xsl:param>
        <xsl:apply-templates select="entry">
            <xsl:with-param name="contextPath" select="$contextPath"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="readme">
        <pre class="readme">
            <xsl:apply-templates/>
        </pre>
    </xsl:template>

    <xsl:template match="entry">
        <xsl:param name="contextPath"></xsl:param>
        <xsl:variable name="urlPath" select="@urlPath"/>
        <tr>
            <td>
                <!-- ICONES -->
                <a href="{$urlPath}">
                    <xsl:choose>
                        <xsl:when test="@type = 'dir'">
                            <img src="{$contextPath}/statics/img/filetypes/generic-folder-48.png"></img>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <!-- textos -->
                                <xsl:when test="substring(., (string-length(.) - string-length('.txt')) + 1) = '.txt'">
                                    <img src="{$contextPath}/statics/img/filetypes/txt-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.sh')) + 1) = '.sh'">
                                    <img src="{$contextPath}/statics/img/filetypes/txt-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.bat')) + 1) = '.bat'">
                                    <img src="{$contextPath}/statics/img/filetypes/txt-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.rtf')) + 1) = '.rtf'">
                                    <img src="{$contextPath}/statics/img/filetypes/rtf-file-48.png"></img>
                                </xsl:when>
                                <!-- documentos MS OFFICE -->
                                <xsl:when test="substring(., (string-length(.) - string-length('.doc')) + 1) = '.doc'">
                                    <img src="{$contextPath}/statics/img/filetypes/doc-file-48.png"></img>
                                </xsl:when>
                                <xsl:when
                                        test="substring(., (string-length(.) - string-length('.docx')) + 1) = '.docx'">
                                    <img src="{$contextPath}/statics/img/filetypes/docx-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.xls')) + 1) = '.xls'">
                                    <img src="{$contextPath}/statics/img/filetypes/xls-file-48.png"></img>
                                </xsl:when>
                                <xsl:when
                                        test="substring(., (string-length(.) - string-length('.xlsx')) + 1) = '.xlsx'">
                                    <img src="{$contextPath}/statics/img/filetypes/xlsx-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.ppt')) + 1) = '.ppt'">
                                    <img src="{$contextPath}/statics/img/filetypes/ppt-file-48.png"></img>
                                </xsl:when>
                                <xsl:when
                                        test="substring(., (string-length(.) - string-length('.pptx')) + 1) = '.pptx'">
                                    <img src="{$contextPath}/statics/img/filetypes/pptx-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.pps')) + 1) = '.pps'">
                                    <img src="{$contextPath}/statics/img/filetypes/pps-file-48.png"></img>
                                </xsl:when>
                                <!-- documentos BR OFFICE -->
                                <xsl:when test="substring(., (string-length(.) - string-length('.odg')) + 1) = '.odg'">
                                    <img src="{$contextPath}/statics/img/filetypes/odg-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.odp')) + 1) = '.odp'">
                                    <img src="{$contextPath}/statics/img/filetypes/odp-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.ods')) + 1) = '.ods'">
                                    <img src="{$contextPath}/statics/img/filetypes/ods-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.odt')) + 1) = '.odt'">
                                    <img src="{$contextPath}/statics/img/filetypes/odt-file-48.png"></img>
                                </xsl:when>
                                <!-- imagens -->
                                <xsl:when test="substring(., (string-length(.) - string-length('.bmp')) + 1) = '.bmp'">
                                    <img src="{$contextPath}/statics/img/filetypes/bmp-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.gif')) + 1) = '.gif'">
                                    <img src="{$contextPath}/statics/img/filetypes/gif-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.jpg')) + 1) = '.jpg'">
                                    <img src="{$contextPath}/statics/img/filetypes/jpg-file-48.png"></img>
                                </xsl:when>
                                <xsl:when
                                        test="substring(., (string-length(.) - string-length('.jpeg')) + 1) = '.jpeg'">
                                    <img src="{$contextPath}/statics/img/filetypes/jpeg-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.png')) + 1) = '.png'">
                                    <img src="{$contextPath}/statics/img/filetypes/png-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.tif')) + 1) = '.tif'">
                                    <img src="{$contextPath}/statics/img/filetypes/tif-file-48.png"></img>
                                </xsl:when>
                                <xsl:when
                                        test="substring(., (string-length(.) - string-length('.tiff')) + 1) = '.tiff'">
                                    <img src="{$contextPath}/statics/img/filetypes/tiff-file-48.png"></img>
                                </xsl:when>
                                <!-- video/som -->
                                <xsl:when test="substring(., (string-length(.) - string-length('.aep')) + 1) = '.aep'">
                                    <img src="{$contextPath}/statics/img/filetypes/aep-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.ai')) + 1) = '.ai'">
                                    <img src="{$contextPath}/statics/img/filetypes/ai-file-48.png"></img>
                                </xsl:when>
                                <xsl:when
                                        test="substring(., (string-length(.) - string-length('.aiff')) + 1) = '.aiff'">
                                    <img src="{$contextPath}/statics/img/filetypes/aiff-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.asf')) + 1) = '.asf'">
                                    <img src="{$contextPath}/statics/img/filetypes/asf-file-48.png"></img>
                                </xsl:when>
                                <xsl:when
                                        test="substring(., (string-length(.) - string-length('.asnd')) + 1) = '.asnd'">
                                    <img src="{$contextPath}/statics/img/filetypes/asnd-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.asx')) + 1) = '.asx'">
                                    <img src="{$contextPath}/statics/img/filetypes/asx-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.au')) + 1) = '.au'">
                                    <img src="{$contextPath}/statics/img/filetypes/au-file-48.png"></img>
                                </xsl:when>
                                <xsl:when
                                        test="substring(., (string-length(.) - string-length('.audio')) + 1) = '.audio'">
                                    <img src="{$contextPath}/statics/img/filetypes/audio-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.avi')) + 1) = '.avi'">
                                    <img src="{$contextPath}/statics/img/filetypes/avi-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.avx')) + 1) = '.avx'">
                                    <img src="{$contextPath}/statics/img/filetypes/avx-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.eps')) + 1) = '.eps'">
                                    <img src="{$contextPath}/statics/img/filetypes/eps-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.fla')) + 1) = '.fla'">
                                    <img src="{$contextPath}/statics/img/filetypes/fla-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.flv')) + 1) = '.flv'">
                                    <img src="{$contextPath}/statics/img/filetypes/flv-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.fxp')) + 1) = '.fxp'">
                                    <img src="{$contextPath}/statics/img/filetypes/fxp-file-48.png"></img>
                                </xsl:when>
                                <xsl:when
                                        test="substring(., (string-length(.) - string-length('.indd')) + 1) = '.indd'">
                                    <img src="{$contextPath}/statics/img/filetypes/indd-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.m4v')) + 1) = '.m4v'">
                                    <img src="{$contextPath}/statics/img/filetypes/m4v-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.mov')) + 1) = '.mov'">
                                    <img src="{$contextPath}/statics/img/filetypes/mov-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.mp3')) + 1) = '.mp3'">
                                    <img src="{$contextPath}/statics/img/filetypes/mp3-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.mp4')) + 1) = '.mp4'">
                                    <img src="{$contextPath}/statics/img/filetypes/mp4-file-48.png"></img>
                                </xsl:when>
                                <xsl:when
                                        test="substring(., (string-length(.) - string-length('.mpeg2')) + 1) = '.mpeg2'">
                                    <img src="{$contextPath}/statics/img/filetypes/mpeg2-file-48.png"></img>
                                </xsl:when>
                                <xsl:when
                                        test="substring(., (string-length(.) - string-length('.mpeg')) + 1) = '.mpeg'">
                                    <img src="{$contextPath}/statics/img/filetypes/mpeg-file-48.png"></img>
                                </xsl:when>
                                <xsl:when
                                        test="substring(., (string-length(.) - string-length('.mpv2')) + 1) = '.mpv2'">
                                    <img src="{$contextPath}/statics/img/filetypes/mpv2-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.svg')) + 1) = '.svg'">
                                    <img src="{$contextPath}/statics/img/filetypes/svg-file-48.png"></img>
                                </xsl:when>
                                <xsl:when
                                        test="substring(., (string-length(.) - string-length('.video')) + 1) = '.video'">
                                    <img src="{$contextPath}/statics/img/filetypes/video-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.wav')) + 1) = '.wav'">
                                    <img src="{$contextPath}/statics/img/filetypes/wav-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.wma')) + 1) = '.wma'">
                                    <img src="{$contextPath}/statics/img/filetypes/wma-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.wmv')) + 1) = '.wmv'">
                                    <img src="{$contextPath}/statics/img/filetypes/wmv-file-48.png"></img>
                                </xsl:when>
                                <!-- arquivos -->
                                <xsl:when test="substring(., (string-length(.) - string-length('.zip')) + 1) = '.zip'">
                                    <img src="{$contextPath}/statics/img/filetypes/zip-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.rar')) + 1) = '.rar'">
                                    <img src="{$contextPath}/statics/img/filetypes/zip-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.pdf')) + 1) = '.pdf'">
                                    <img src="{$contextPath}/statics/img/filetypes/pdf-file-48.png"></img>
                                </xsl:when>
                                <xsl:when
                                        test="substring(., (string-length(.) - string-length('.wmcssv')) + 1) = '.css'">
                                    <img src="{$contextPath}/statics/img/filetypes/css-file-48.png"></img>
                                </xsl:when>
                                <xsl:when test="substring(., (string-length(.) - string-length('.xml')) + 1) = '.xml'">
                                    <img src="{$contextPath}/statics/img/filetypes/xml-file-48.png"></img>
                                </xsl:when>
                                <xsl:when
                                        test="substring(., (string-length(.) - string-length('.html')) + 1) = '.html'">
                                    <img src="{$contextPath}/statics/img/filetypes/html-file-48.png"></img>
                                </xsl:when>
                                <!-- OUTROS -->
                                <xsl:otherwise>
                                    <img src="{$contextPath}/statics/img/filetypes/generic-file-48.png"></img>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                </a>
            </td>
            <td>
                <a href="{$urlPath}">
                    <ul>
                        <li class="nome-arquivo">
                            <xsl:apply-templates/>
                        </li>
                        <li class="detalhes-arquivo">
                            <span class="posicao">
                                <xsl:value-of select="position()" />
                            </span>
                            <span class="data">
                                <xsl:value-of select="@date"/>
                            </span>
                            <span class="tamanho">
                                <xsl:value-of select="@size"/>
                            </span>
                        </li>
                    </ul>
                </a>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
