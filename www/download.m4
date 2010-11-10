m4_dnl # index.m4: GNU m4 source for index.html.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # [その他に make 時点で依存を参照するファイル]
m4_dnl # jm_www.m4: 各種 M4 マクロ定義ファイル
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_include(jm_www.m4)
_EDIT_WARNING(index)
_HEADER(`マニュアルアーカイブのダウンロード')

m4_dnl _MIRROR_LIST(download.html)

<P>
 roff ページのアーカイブです。
 今後は定期的に更新の予定です。
</P>

<H2>全体のアーカイブ</H2>
<UL>
 <LI>m4_esyscmd(./bin/link-whole-archive.perl _DATE)</LI>
 <LI>アーカイブの _LINK(README.html,README ファイル)</LI>
 <LI>アーカイブの _LINK(INSTALL.html,INSTALL ファイル)</LI>
</UL>

<H2>RPM ファイル</H2>
 m4_esyscmd(./bin/link-rpms.perl _DATE ./)
<P>
 上記アーカイブをもとにして作成した RPM パッケージです。
 パッケージに関する説明は
 _LINK(rpm/index.html,JM RPM/SRPM パッケージ)
 をご覧になってください。
</P>
 
<H2>パッケージ別アーカイブ</H2>
 m4_esyscmd(./bin/link-partial-archives.perl _DATE)

_CREDITS

_BACK_TO_HOME

</BODY>
</HTML>

