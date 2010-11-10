m4_dnl # jm-brs.pre.m4: GNU m4 source for jm-brs.html's first part.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # [その他に make 時点で依存を参照するファイル]
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_dnl # HTML 4.0/css は分からんので、tagging は適当(^^;
m4_dnl # jm-brs.post.m4 と漢字コードを揃えること
m4_dnl

m4_define(_SUB_ONE)
m4_include(../jm_www.m4)
_HEADER(`JM bug reporting system')
_EDIT_WARNING(index)

<FORM method="POST" ACTION="jm-brs.cgi">
_Start_Table

<TR>
  <TH ALIGN="RIGHT" NOWRAP>名前: </TH>
  <TD><INPUT NAME="name" SIZE="20" ></TD>
  <TH ALIGN="RIGHT" NOWRAP>E-mail: </TH>
  <TD><INPUT NAME="mail" SIZE="20"></TD>
</TR>
<TR>
  <TH ALIGN="RIGHT" NOWRAP>パッケージ: </TH>
  <TD>
