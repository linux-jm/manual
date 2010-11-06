m4_dnl # $Id: mail_error.m4,v 1.21 2004/05/24 16:36:29 tsekine Exp $
m4_dnl # mail_error.m4: GNU m4 source for index.html.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # [依存している datafile]
m4_dnl # なし
m4_dnl #
m4_dnl # [その他に make 時点で依存を参照するファイル]
m4_dnl # jm_www.m4: 各種 M4 マクロ定義ファイル
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_include(jm_www.m4)
m4_define(_ADDRESS, `<LI><TT>$1</TT> <SMALL>($2)</SMALL></LI>')
_EDIT_WARNING(index)
_HEADER(`問題のあるメールアドレス')

 <DIV CLASS="copyright">
  m4_esyscmd(date)
 </DIV>

 <P>
  JM ML で配送がエラーとなり、送信を停止したアドレスの一覧です。
  お手数ですが
  _LINK(guidance/index.html#subscribe-ML,JM-ML への参加方法)
  を参考の上、再度講読手続きを取ってください。
 </P>
 <P>
  以下の掲載リストからの削除を希望される方は、
  <TT>JM-admin@linux.or.jp</TT> あてにご連絡ください.
 </P>

<UL>
_ADDRESS(mkojima(at)tokai.or.jp,2004/05/25 削除)
_ADDRESS(ari(at)media.sumitomocorp.co.jp,2003/12/15 削除)
_ADDRESS(sun(at)cup.com,2003/10/11 削除)
_ADDRESS(songryul(at)nsvmj3.zaq.ne.jp,2003/09/11 削除)
_ADDRESS(tomoya(at)iijmio-mail.jp,2003/09/02 削除)
_ADDRESS(rfun(at)azusa.shinshu-u.ac.jp,2003/04/20 削除)
_ADDRESS(ami(at)ttmy.ne.jp,2003/04/17 削除)
_ADDRESS(aya(at)big.or.jp,2003/03/14 削除)
_ADDRESS(post(at)d-yama.org,2003/03/14 削除)
_ADDRESS(hiro(at)noa.sipeb.aoyama.ac.jp,2003/01/06 削除)
_ADDRESS(c-niji(at)geocities.co.jp,2002/11/16 削除)
_ADDRESS(okkakii(at)be.to,2002/10/09 削除)
_ADDRESS(osamuo(at)pa.airnet.ne.jp,2002/10/09 削除)
_ADDRESS(ogochan(at)riccia.nurs.or.jp,2002/09/25 削除)
_ADDRESS(crystal(at)labnet.or.jp,2002/09/25 削除)
_ADDRESS(shom(at)i.h.kyoto-u.ac.jp,2002/08/19 削除)
_ADDRESS(nachan(at)public.to,2002/08/19 削除)
_ADDRESS(bl202150(at)ms.kagoshima-u.ac.jp,2002/08/19 削除)
_ADDRESS(ysenda(at)pop01.odn.ne.jp,2002/08/19 削除)
_ADDRESS(aaa61920(at)pop06.odn.ne.jp,2001/12/22 削除)
_ADDRESS(aihana(at)turbolinux.co.jp,2001/12/22 削除)
_ADDRESS(asj(at)hde.co.jp,2001/12/22 削除)
_ADDRESS(dasen(at)typhoon.co.jp,2001/12/22 削除)
_ADDRESS(e9910308(at)naruto-u.ac.jp,2001/12/22 削除)
_ADDRESS(h-sakai(at)ma.kcom.ne.jp,2001/12/22 削除)
_ADDRESS(h-ueda(at)aud.mei.co.jp,2001/12/22 削除)
_ADDRESS(ikko-(at)pacific.rim.or.jp,2001/12/22 削除)
_ADDRESS(kuriyama(at)hitachi-mcs.co.jp,2001/12/22 削除)
_ADDRESS(mag(at)mc.neweb.ne.jp,2001/12/22 削除)
_ADDRESS(mingming(at)kt.rim.or.jp,2001/12/22 削除)
_ADDRESS(ogawaosm(at)bs.mmk.fst.pb.nttdata.co.jp,2001/12/22 削除)
_ADDRESS(rg5h-itu(at)asahi-net.or.jp,2001/12/22 削除)
_ADDRESS(s_mgr(at)netlaputa.ne.jp,2001/12/22 削除)
_ADDRESS(tanisako(at)osa.dec.com,2001/12/22 削除)
_ADDRESS(taru(at)sunicom.co.jp,2001/12/22 削除)
_ADDRESS(terushi(at)na.rim.or.jp,2001/12/22 削除)
_ADDRESS(tombo(at)mbox.media.nagoya-u.ac.jp,2001/12/22 削除)
_ADDRESS(tyoshino(at)cymbi.info.jcn.nihon-u.ac.jp,2001/12/22 削除)
</UL>

  _CREDITS

  _BACK_TO_HOME

 <DIV CLASS="copyright">
  $Id: mail_error.m4,v 1.21 2004/05/24 16:36:29 tsekine Exp $
 </DIV>

</BODY>
</HTML>

