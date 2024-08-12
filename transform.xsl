<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:gc="http://www.example.com/gamingCommunity">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Gaming Community Hub</title>
                <!-- Link to Tailwind CSS -->
                <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet"></link>
            </head>
            <body class="bg-gray-100 text-gray-900">
                <div class="container mx-auto p-4">
                    <h1 class="text-3xl font-bold mb-6">Gaming Community Members</h1>
                    <xsl:for-each select="//gc:member">
                        <div class="bg-white shadow-md rounded-lg p-6 mb-4">
                            <h2 class="text-2xl font-semibold">
                                <xsl:value-of select="gc:username"/>
                            </h2>
                            <p class="mt-2">Level: <span class="font-medium">
                                <xsl:value-of select="gc:level"/>
                            </span>
                        </p>
                        <p class="mt-2">Score: <span class="font-medium">
                            <xsl:value-of select="gc:score"/>
                        </span>
                    </p>
                    <p class="mt-2">Email: <span class="font-medium">
                        <xsl:value-of select="gc:email"/>
                    </span>
                </p>
                <xsl:if test="gc:profile">
                    <div class="mt-4">
                        <p class="font-medium">Bio:</p>
                        <p class="text-gray-700">
                            <xsl:value-of select="gc:profile/gc:bio"/>
                        </p>
                        <p class="mt-2">Avatar: <a class="text-blue-500 hover:underline" href="{gc:profile/gc:avatarUrl}">
                            <xsl:value-of select="gc:profile/gc:avatarUrl"/>
                        </a>
                    </p>
                </div>
            </xsl:if>
            <xsl:if test="gc:achievements">
                <div class="mt-4">
                    <h3 class="text-xl font-semibold">Achievements:</h3>
                    <ul class="list-disc pl-5">
                        <xsl:for-each select="gc:achievements/gc:achievement">
                            <li>
                                <xsl:value-of select="gc:title"/>
 (Points: <xsl:value-of select="@points"/>
, Date: <xsl:value-of select="gc:date"/>
)
                        </li>
                    </xsl:for-each>
                </ul>
            </div>
        </xsl:if>
    </div>
</xsl:for-each>
</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
