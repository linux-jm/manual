m4_dnl # jm-brs.post.m4: GNU m4 source for jm-brs.html's last part.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # [その他に make 時点で依存を参照するファイル]
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_dnl # HTML 4.0/css は分からんので、tagging は適当(^^;
m4_dnl # jm-brs.pre.m4 と漢字コードを揃えること
m4_dnl


m4_define(_SUB_ONE)
m4_include(../jm_www.m4)

  </TD>
  <TH ALIGN="RIGHT" NOWRAP>ページ: </TH>
  <TD><INPUT NAME="page" SIZE="20"></TD>
</TR>
<TR>
  <TH ALIGN="RIGHT" NOWRAP>内容: </TH>
  <TD COLSPAN="3"><TEXTAREA NAME="text" COLS="70" ROWS="5" WRAP="SOFT"></TEXTAREA></TD>
</TR>
<TR>
  <TH></TH>
  <TD COLSPAN="3"><INPUT TYPE="SUBMIT" VALUE=" 投稿 "> <INPUT TYPE="RESET" VALUE=" リセット "></TD></TR>
</TABLE>
</FORM>

_CREDITS
_BACK_TO_HOME

</BODY>
</HTML>
