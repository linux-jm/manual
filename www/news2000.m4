m4_dnl # news.m4: GNU m4 source for news.html.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_include(jm_www.m4)
_EDIT_WARNING(index)
_HEADER(`JM 新着情報 (2000 年分)')

 <DIV CLASS="copyright">
  m4_esyscmd(`date')
 </DIV>

m4_dnl _PKGDIR マクロ (" " と "_" を置換するだけ)
m4_dnl
m4_define(`_PKGDIR', `m4_patsubst($1, ` ', `_')')

m4_dnl _PAGELINK マクロの定義
m4_dnl
m4_define(`_SECDIR', `m4_regexp($1, `^.*\([1-9]\)$', `man\1')')
m4_define(`_PAGEURL', `html/_PKGDIR($1)/_SECDIR($2)/$2.html')
m4_define(`_PAGELINK', `_LINK(_PAGEURL($1,$2),$2)')

m4_define(`_UPD_PAGE',`<FONT COLOR="green">[UPD]</FONT> _PAGELINK($1,$2)')
m4_define(`_NEW_PAGE',`<FONT COLOR="red">[NEW]</FONT> _PAGELINK($1,$2)')

m4_dnl _PODLINK マクロの定義
m4_dnl
m4_define(`_PODURL', `html/_PKGDIR($1)/$2.html')
m4_define(`_PODLINK', `_LINK(_PODURL($1,$2),$2)')

m4_define(`_UPD_POD',`<FONT COLOR="green">[UPD]</FONT> _PODLINK($1,$2)')
m4_define(`_NEW_POD',`<FONT COLOR="red">[NEW]</FONT> _PODLINK($1,$2)')

<UL>
 <LI>_LINK(news.html,最新の新着情報) 
 <LI>_LINK(news.html#OLDNEWS,他の年の新着情報) 
</UL>

m4_dnl This is an anchor for ml2cvs. DON'T REMOVE.
m4_dnl ML2CVS ADD HERE
 <H2>2000/12/26</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>bzip2</DT>
  <DD>
   _NEW_PAGE(bzip2, bzip2.1)
  </DD>
  <DT>netkit</DT>
  <DD>
   _UPD_PAGE(netkit, setproctitle.3)
   _UPD_PAGE(netkit, vis.3)
   _UPD_PAGE(netkit, ftpusers.5)
   _UPD_PAGE(netkit, comsat.8)
   _NEW_PAGE(netkit, ftpd.8)
   _NEW_PAGE(netkit, fingerd.8)
   _UPD_PAGE(netkit, finger.1)
  </DD>
  <DT>fetchmail</DT>
  <DD>
   _UPD_PAGE(fetchmail, fetchmail.1)
  </DD>
 </DL>

 <H2>2000/12/20</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>expect</DT>
  <DD>
   _NEW_PAGE(expect, autoexpect.1)
  </DD>
 </DL>

 <H2>2000/12/15</H2>
 <P>
  新アーカイブ man-pages-ja-20001215.tar.gz と
  対応する RPM アーカイブを
  _LINK(download.html,ダウンロードのページ)
  から取得できるようにしました。
 </P>

 <H2>2000/12/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>netkit</DT>
  <DD>
   _NEW_PAGE(netkit, err.3)
   _NEW_PAGE(netkit, login.3)
   _NEW_PAGE(netkit, setproctitle.3)
   _NEW_PAGE(netkit, vis.3)
   _NEW_PAGE(netkit, bootparams.5)
   _NEW_PAGE(netkit, ftpusers.5)
   _NEW_PAGE(netkit, issue.net.5)
   _NEW_PAGE(netkit, netrc.5)
   _NEW_PAGE(netkit, bootparamd.8)
   _NEW_PAGE(netkit, comsat.8)
  </DD>
 </DL>

 <H2>2000/12/11</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, shells.5)
  </DD>
 </DL>

 <H2>2000/12/05</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU bash</DT>
  <DD>
   _NEW_PAGE(GNU bash, rbash.1)
  </DD>
 </DL>

 <H2>2000/12/04</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU texinfo</DT>
  <DD>
   _NEW_PAGE(GNU texinfo, texi2dvi.1)
  </DD>
 </DL>

 <H2>2000/12/03</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>util-linux</DT>
  <DD>
   _NEW_PAGE(util-linux, kill.1)
  </DD>
 </DL>

 <H2>2000/11/29</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>cron</DT>
  <DD>
   _NEW_PAGE(cron, crontab.5)
  </DD>
 </DL>

 <H2>2000/11/27</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>netkit</DT>
  <DD>
   _UPD_PAGE(netkit, telnet.1)
  </DD>
 </DL>

 <H2>2000/11/22</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>man</DT>
  <DD>
   _UPD_PAGE(man, man.1)
  </DD>
  <DT>GNU less</DT>
  <DD>
   _UPD_PAGE(GNU less, less.1)
   _UPD_PAGE(GNU less, lesskey.1)
  </DD>
  <DT>netkit</DT>
  <DD>
   _UPD_PAGE(netkit, rpcgen.1)
   _UPD_PAGE(netkit, rsh.1)
   _UPD_PAGE(netkit, tftp.1)
   _NEW_PAGE(netkit, write.1)
  </DD>
 </DL>

 <H2>2000/11/16</H2>
 <P>
  11/15 リリースのバグフィックス版
  man-pages-ja-20001116.tar.gz と
  対応する RPM アーカイブを
  _LINK(download.html,ダウンロードのページ)
  から取得できるようにしました。
 </P>

 <H2>2000/11/15</H2>
 <P>
  新アーカイブ man-pages-ja-20001115.tar.gz と
  対応する RPM アーカイブを
  _LINK(download.html,ダウンロードのページ)
  から取得できるようにしました。
 </P>

 <H2>2000/11/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>procps</DT>
  <DD>
   _NEW_PAGE(procps, kill.1)
   _UPD_PAGE(procps, oldps.1)
   _NEW_PAGE(procps, pgrep.1)
   _NEW_PAGE(procps, ps.1)
   _NEW_PAGE(procps, skill.1)
   _NEW_PAGE(procps, tload.1)
   _NEW_PAGE(procps, top.1)
   _UPD_PAGE(procps, uptime.1)
   _NEW_PAGE(procps, watch.1)
   _NEW_PAGE(procps, sysctl.conf.5)
   _NEW_PAGE(procps, sysctl.8)
   _NEW_PAGE(procps, vmstat.8)
  </DD>
  <DT>netkit</DT>
  <DD>
   _UPD_PAGE(netkit, ftp.1)
   _UPD_PAGE(netkit, rcp.1)
   _NEW_PAGE(netkit, rexec.1)
   _UPD_PAGE(netkit, rlogin.1)
   _NEW_PAGE(netkit, rup.1)
  </DD>
  <DT>sendmail</DT>
  <DD>
   _NEW_PAGE(sendmail, qtool.8)
  </DD>
  <DT>tcpdump</DT>
  <DD>
   _UPD_PAGE(tcpdump, tcpdump.1)
  </DD>
 </DL>

 <H2>2000/11/10</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>shadow</DT>
  <DD>
   _NEW_PAGE(shadow, id.1)
  </DD>
 </DL>

 <H2>2000/11/09</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>sysklogd</DT>
  <DD>
   _UPD_PAGE(sysklogd, klogd.8)
  </DD>
  <DT>eject</DT>
  <DD>
   _NEW_PAGE(eject, eject.1)
  </DD>
 </DL>

 <H2>2000/11/02</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>netkit</DT>
  <DD>
   _UPD_PAGE(netkit, finger.1)
   _UPD_PAGE(netkit, ruptime.1)
   _UPD_PAGE(netkit, rusers.1)
   _UPD_PAGE(netkit, rwall.1)
   _UPD_PAGE(netkit, rwho.1)
   _UPD_PAGE(netkit, talk.1)
   _NEW_PAGE(netkit, rpc.rusersd.8)
   _NEW_PAGE(netkit, rpc.rwalld.8)
   _NEW_PAGE(netkit, rwhod.8)
   _NEW_PAGE(netkit, talkd.8)
  </DD>
  <DT>quota</DT>
  <DD>
   _NEW_PAGE(quota, quota.1)
   _NEW_PAGE(quota, edquota.8)
   _NEW_PAGE(quota, quotacheck.8)
   _NEW_PAGE(quota, quotaon.8)
   _NEW_PAGE(quota, repquota.8)
   _NEW_PAGE(quota, setquota.8)
  </DD>
 </DL>

 <H2>2000/10/28</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>cdrecord</DT>
  <DD>
   _NEW_PAGE(cdrecord, isoinfo.8)
  </DD>
 </DL>

 <H2>2000/10/27</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU binutils</DT>
  <DD>
   _UPD_PAGE(GNU binutils, ar.1)
   _UPD_PAGE(GNU binutils, as.1)
   _UPD_PAGE(GNU binutils, gprof.1)
   _UPD_PAGE(GNU binutils, ld.1)
   _UPD_PAGE(GNU binutils, objcopy.1)
   _UPD_PAGE(GNU binutils, ranlib.1)
  </DD>
 </DL>

 <H2>2000/10/26</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU sh-utils</DT>
  <DD>
   _NEW_PAGE(GNU sh-utils, hostid.1)
  </DD>
 </DL>

 <H2>2000/10/20</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>netkit</DT>
  <DD>
   _NEW_PAGE(netkit, daemon.3)
  </DD>
  <DT>shadow</DT>
  <DD>
   _NEW_PAGE(shadow, newusers.8)
   _NEW_PAGE(shadow, useradd.8)
  </DD>
 </DL>

 <H2>2000/10/15</H2>
 <P>
  新アーカイブ man-pages-ja-20001015.tar.gz と
  対応する RPM アーカイブを
  _LINK(download.html,ダウンロードのページ)
  から取得できるようにしました。
 </P>

 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, hier.7)
  </DD>
 </DL>

 <H2>2000/10/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, strftime.3)
  </DD>
  <DT>sudo</DT>
  <DD>
   _NEW_PAGE(sudo, sudoers.5)
  </DD>
 </DL>

 <H2>2000/10/13</H2>
 <P>
  以下のファイルを
  _LINK(http://www.jp.freebsd.org/man-jp/,FreeBSD jpman project)
  から寄贈していただきました。
 </P>
 <DL>
  <DT>GNU gcc</DT>
  <DD>
   _UPD_PAGE(GNU gcc, gcc.1)
  </DD>
  <DT>sendmail</DT>
  <DD>
   _UPD_PAGE(sendmail, mailq.1)
   _UPD_PAGE(sendmail, newaliases.1)
   _UPD_PAGE(sendmail, aliases.5)
   _UPD_PAGE(sendmail, mail.local.8)
   _UPD_PAGE(sendmail, mailstats.8)
   _UPD_PAGE(sendmail, makemap.8)
   _UPD_PAGE(sendmail, praliases.8)
   _UPD_PAGE(sendmail, rmail.8)
   _UPD_PAGE(sendmail, sendmail.8)
   _UPD_PAGE(sendmail, smrsh.8)
  </DD>
 </DL>

 <H2>2000/10/12</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>cron</DT>
  <DD>
   _NEW_PAGE(cron, crontab.1)
  </DD>
 </DL>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, accept.2)
   _UPD_PAGE(LDP man-pages, mmap.2)
   _UPD_PAGE(LDP man-pages, recv.2)
   _UPD_PAGE(LDP man-pages, gethostbyname.3)
   _UPD_PAGE(LDP man-pages, tempnam.3)
   _NEW_PAGE(LDP man-pages, termcap.5)
  </DD>
  <DT>modutils</DT>
  <DD>
   _NEW_PAGE(modutils, kernelversion.1)
   _NEW_PAGE(modutils, modules.conf.5)
   _UPD_PAGE(modutils, depmod.8)
   _UPD_PAGE(modutils, insmod.8)
   _NEW_PAGE(modutils, kallsyms.8)
   _NEW_PAGE(modutils, kdstat.8)
   _NEW_PAGE(modutils, modprobe.8)
  </DD>
 </DL>

 <H2>2000/10/10</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, strptime.3)
  </DD>
  <DT>GNU less</DT>
  <DD>
   _UPD_PAGE(GNU less, less.1)
   _UPD_PAGE(GNU less, lesskey.1)
  </DD>
  <DT>sudo</DT>
  <DD>
   _NEW_PAGE(sudo, sudo.8)
   _NEW_PAGE(sudo, visudo.8)
  </DD>
 </DL>

 <H2>2000/10/06</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, setlocale.3)
   _UPD_PAGE(LDP man-pages, stat.2)
   _UPD_PAGE(LDP man-pages, assert.3)
   _UPD_PAGE(LDP man-pages, exec.3)
   _UPD_PAGE(LDP man-pages, fclose.3)
   _UPD_PAGE(LDP man-pages, printf.3)
   _UPD_PAGE(LDP man-pages, rand.3)
  </DD>
 </DL>

 <H2>2000/10/05</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>gnumaniak</DT>
  <DD>
   _UPD_PAGE(gnumaniak, gasp.1)
  </DD>
 </DL>

 <H2>2000/10/03</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, getdomainname.2)
   _UPD_PAGE(LDP man-pages, gethostname.2)
  </DD>
 </DL>

 <H2>2000/09/27</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>gnumaniak</DT>
  <DD>
   _NEW_PAGE(gnumaniak, gasp.1)
  </DD>
 </DL>

 <H2>2000/09/25</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, host.conf.5)
   _NEW_PAGE(LDP man-pages, hosts.5)
   _NEW_PAGE(LDP man-pages, resolver.5)
   _NEW_PAGE(LDP man-pages, encrypt.3)
   _NEW_PAGE(LDP man-pages, bindresvport.3)
  </DD>
 </DL>

 <H2>2000/09/21</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, strtok.3)
   _UPD_PAGE(LDP man-pages, fflush.3)
  </DD>
 </DL>

 <H2>2000/09/20</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, __setfpucw.3)
   _NEW_PAGE(LDP man-pages, fenv.3)
  </DD>
 </DL>
 <P>
  以下のファイルを
  _LINK(http://www.jp.freebsd.org/man-jp/,FreeBSD jpman project)
  から寄贈していただきました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, mdoc.samples.7)
  </DD>
 </DL>
  
 <H2>2000/09/19</H2>
 <P>
  9/15 リリースのバグフィックス版
  man-pages-ja-20000919.tar.gz と
  対応する RPM アーカイブを
  _LINK(download.html,ダウンロードのページ)
  から取得できるようにしました。
 </P>

 <H2>2000/09/15</H2>
 <P>
  新アーカイブ man-pages-ja-20000915.tar.gz と
  対応する RPM アーカイブを
  _LINK(download.html,ダウンロードのページ)
  から取得できるようにしました。
 </P>

 <H2>2000/09/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, dircolors.1)
   _UPD_PAGE(LDP man-pages, mkdir.2)
   _UPD_PAGE(LDP man-pages, getmntent.3)
   _UPD_PAGE(LDP man-pages, tzset.3)
  </DD>
  <DT>sysklogd</DT>
  <DD>
   _UPD_PAGE(sysklogd, klogd.8)
  </DD>
 </DL>

 <H2>2000/09/05</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, unlink.2)
   _UPD_PAGE(LDP man-pages, fts.3)
  </DD>
 </DL>

 <H2>2000/09/02</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU less</DT>
  <DD>
   _UPD_PAGE(GNU less, less.1)
   _UPD_PAGE(GNU less, lesskey.1)
  </DD>
 </DL>

 <H2>2000/08/30</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU gdbm</DT>
  <DD>
   _UPD_PAGE(GNU gdbm, gdbm.3)
  </DD>
 </DL>

 <H2>2000/08/25</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU gdbm</DT>
  <DD>
   _NEW_PAGE(GNU gdbm, gdbm.3)
  </DD>
 </DL>

 <H2>2000/08/23</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, bzero.3)
   _UPD_PAGE(LDP man-pages, malloc.3)
  </DD>
 </DL>

 <H2>2000/08/19</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>pcmcia-cs</DT>
  <DD>
   _NEW_PAGE(pcmcia-cs, i82365.4)
  </DD>
 </DL>

 <H2>2000/08/15</H2>
 <P>
  新アーカイブ man-pages-ja-20000815.tar.gz と
  対応する RPM アーカイブを
  _LINK(download.html,ダウンロードのページ)
  から取得できるようにしました。
 </P>

 <H2>2000/08/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>sysklogd</DT>
  <DD>
   _UPD_PAGE(sysklogd, syslog.conf.5)
   _UPD_PAGE(sysklogd, sysklogd.8)
  </DD>
 </DL>

 <H2>2000/08/12</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>lpr-linux</DT>
  <DD>
   _NEW_PAGE(lpr-linux, printcap.5)
  </DD>
 </DL>

 <H2>2000/08/09</H2>
 <P>
  以下のファイルを
  _LINK(http://www.jp.freebsd.org/man-jp/,FreeBSD jpman project)
  から寄贈していただきました。
 </P>
 <DL>
  <DT>GNU bc</DT>
  <DD>
   _NEW_PAGE(GNU bc, bc.1)
   _NEW_PAGE(GNU bc, dc.1)
  </DD>
  <DT>GNU gawk</DT>
  <DD>
   _NEW_PAGE(GNU gawk, gawk.1)
  </DD>
  <DT>GNU gcc</DT>
  <DD>
   _NEW_PAGE(GNU gcc, cccp.1)
   _UPD_PAGE(GNU gcc, g77.1)
  </DD>
  <DT>GNU gdb</DT>
  <DD>
   _UPD_PAGE(GNU gdb, gdb.1)
   _NEW_PAGE(GNU gdb, gdbserver.1)
  </DD>
  <DT>GNU grep</DT>
  <DD>
   _UPD_PAGE(GNU grep, grep.1)
  </DD>
  <DT>GNU groff</DT>
  <DD>
   _UPD_PAGE(GNU groff, addftinfo.1)
   _UPD_PAGE(GNU groff, eqn.1)
   _UPD_PAGE(GNU groff, grodvi.1)
   _UPD_PAGE(GNU groff, groff.1)
   _NEW_PAGE(GNU groff, grog.1)
   _NEW_PAGE(GNU groff, grohtml.1)
   _NEW_PAGE(GNU groff, grolj4.1)
   _UPD_PAGE(GNU groff, grops.1)
   _UPD_PAGE(GNU groff, grotty.1)
   _UPD_PAGE(GNU groff, indxbib.1)
   _UPD_PAGE(GNU groff, lkbib.1)
   _UPD_PAGE(GNU groff, lookbib.1)
   _NEW_PAGE(GNU groff, nroff.1)
   _UPD_PAGE(GNU groff, pfbtops.1)
   _UPD_PAGE(GNU groff, pic.1)
   _UPD_PAGE(GNU groff, refer.1)
   _UPD_PAGE(GNU groff, soelim.1)
   _UPD_PAGE(GNU groff, tbl.1)
   _UPD_PAGE(GNU groff, tfmtodit.1)
   _UPD_PAGE(GNU groff, troff.1)
   _NEW_PAGE(GNU groff, groff_font.5)
   _NEW_PAGE(GNU groff, groff_out.5)
   _NEW_PAGE(GNU groff, groff_char.7)
   _NEW_PAGE(GNU groff, groff_me.7)
   _NEW_PAGE(GNU groff, groff_mm.7)
   _NEW_PAGE(GNU groff, groff_mmse.7)
   _NEW_PAGE(GNU groff, groff_ms.7)
   _NEW_PAGE(GNU groff, groff_msafer.7)
  </DD>
  <DT>GNU patch</DT>
  <DD>
   _UPD_PAGE(GNU patch, patch.1)
  </DD>
  <DT>GNU texinfo</DT>
  <DD>
   _NEW_PAGE(GNU texinfo, info.1)
   _NEW_PAGE(GNU texinfo, install-info.1)
   _NEW_PAGE(GNU texinfo, makeinfo.1)
   _NEW_PAGE(GNU texinfo, texindex.1)
   _NEW_PAGE(GNU texinfo, info.5)
   _NEW_PAGE(GNU texinfo, texinfo.5)
  </DD>
 </DL>

 <H2>2000/08/05</H2>
 <P>
  以下のファイルを
  _LINK(http://www.jp.freebsd.org/man-jp/,FreeBSD jpman project)
  から寄贈していただきました。
 </P>
 <DL>
  <DT>bs</DT>
  <DD>
   _NEW_PAGE(bs, bs.6)
  </DD>
  <DT>bsd-games-non-free</DT>
  <DD>
   _NEW_PAGE(bsd-games-non-free, rogue.6)
  </DD>
  <DT>bsd-games</DT>
  <DD>
   _NEW_PAGE(bsd-games, dm.conf.5)
   _NEW_PAGE(bsd-games, adventure.6)
   _NEW_PAGE(bsd-games, arithmetic.6)
   _NEW_PAGE(bsd-games, atc.6)
   _NEW_PAGE(bsd-games, backgammon.6)
   _UPD_PAGE(bsd-games, banner.6)
   _NEW_PAGE(bsd-games, battlestar.6)
   _UPD_PAGE(bsd-games, bcd.6)
   _UPD_PAGE(bsd-games, caesar.6)
   _NEW_PAGE(bsd-games, canfield.6)
   _NEW_PAGE(bsd-games, cribbage.6)
   _UPD_PAGE(bsd-games, factor.6)
   _NEW_PAGE(bsd-games, fish.6)
   _UPD_PAGE(bsd-games, fortune.6)
   _NEW_PAGE(bsd-games, hack.6)
   _NEW_PAGE(bsd-games, hangman.6)
   _NEW_PAGE(bsd-games, mille.6)
   _UPD_PAGE(bsd-games, number.6)
   _NEW_PAGE(bsd-games, phantasia.6)
   _NEW_PAGE(bsd-games, piano.6)
   _NEW_PAGE(bsd-games, pig.6)
   _UPD_PAGE(bsd-games, pom.6)
   _NEW_PAGE(bsd-games, quiz.6)
   _UPD_PAGE(bsd-games, rain.6)
   _NEW_PAGE(bsd-games, random.6)
   _UPD_PAGE(bsd-games, robots.6)
   _NEW_PAGE(bsd-games, sail.6)
   _NEW_PAGE(bsd-games, snake.6)
   _UPD_PAGE(bsd-games, trek.6)
   _NEW_PAGE(bsd-games, wargames.6)
   _UPD_PAGE(bsd-games, worm.6)
   _NEW_PAGE(bsd-games, worms.6)
   _NEW_PAGE(bsd-games, wump.6)
   _NEW_PAGE(bsd-games, dm.8)
   _NEW_PAGE(bsd-games, strfile.8)
  </DD>
  <DT>flex</DT>
  <DD>
   _UPD_PAGE(flex, flex.1)
  </DD>
  <DT>sendmail</DT>
  <DD>
   _NEW_PAGE(sendmail, mailq.1)
   _NEW_PAGE(sendmail, newaliases.1)
   _NEW_PAGE(sendmail, vacation.1)
   _UPD_PAGE(sendmail, aliases.5)
   _NEW_PAGE(sendmail, mail.local.8)
   _NEW_PAGE(sendmail, mailstats.8)
   _NEW_PAGE(sendmail, makemap.8)
   _NEW_PAGE(sendmail, praliases.8)
   _NEW_PAGE(sendmail, rmail.8)
   _NEW_PAGE(sendmail, sendmail.8)
   _NEW_PAGE(sendmail, smrsh.8)
  </DD>
 </DL>

 <H2>2000/08/02</H2>
 <P>
  以下のファイルを
  _LINK(http://www.jp.freebsd.org/man-jp/,FreeBSD jpman project)
  から寄贈していただきました。
 </P>
 <DL>
  <DT>GNU rcs</DT>
  <DD>
   _UPD_PAGE(GNU rcs, ci.1)
   _UPD_PAGE(GNU rcs, co.1)
   _UPD_PAGE(GNU rcs, ident.1)
   _UPD_PAGE(GNU rcs, merge.1)
   _UPD_PAGE(GNU rcs, rcs.1)
   _UPD_PAGE(GNU rcs, rcsclean.1)
   _UPD_PAGE(GNU rcs, rcsdiff.1)
   _UPD_PAGE(GNU rcs, rcsfreeze.1)
   _UPD_PAGE(GNU rcs, rcsintro.1)
   _UPD_PAGE(GNU rcs, rcsmerge.1)
   _UPD_PAGE(GNU rcs, rlog.1)
   _UPD_PAGE(GNU rcs, rcsfile.5)
  </DD>
  <DT>ppp</DT>
  <DD>
   _NEW_PAGE(ppp, chat.8)
   _NEW_PAGE(ppp, pppd.8)
   _NEW_PAGE(ppp, pppstats.8)
  </DD>
 </DL>

 <P>
  POD 形式マニュアルの翻訳・配布をはじめました
  (_LINK(guidance/pod.html, podマニュアル翻訳の手引き))。
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>zebedee</DT>
  <DD>
   _NEW_POD(zebedee, zebedee.pod)
  </DD>
 </DL>

 <H2>2000/07/15</H2>
 <P>
  新アーカイブ man-pages-ja-20000715.tar.gz と
  対応する RPM アーカイブを
  _LINK(download.html,ダウンロードのページ)
  から取得できるようにしました。
 </P>

 <H2>2000/07/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>lpr-linux</DT>
  <DD>
   _NEW_PAGE(lpr-linux, lpd.8)
  </DD>
 </DL>

 <H2>2000/07/12</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, fts.3)
   _NEW_PAGE(LDP man-pages, iconv.3)
   _NEW_PAGE(LDP man-pages, iconv_close.3)
   _NEW_PAGE(LDP man-pages, iconv_open.3)
   _NEW_PAGE(LDP man-pages, lockf.3)
   _NEW_PAGE(LDP man-pages, acct.5)
   _NEW_PAGE(LDP man-pages, dir_colors.5)
   _NEW_PAGE(LDP man-pages, dsp56k.4)
  </DD>
 </DL>

 <H2>2000/07/11</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>linux-man9</DT>
  <DD>
   _UPD_PAGE(linux-man9, MAJOR.9)
  </DD>
 </DL>

 <H2>2000/06/28</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, daemon.3)
   _NEW_PAGE(LDP man-pages, fcloseall.3)
  </DD>
 </DL>

 <H2>2000/06/21</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU sharutils</DT>
  <DD>
   _UPD_PAGE(GNU sharutils, uuencode.1)
   _NEW_PAGE(GNU sharutils, uuencode.5)
   _NEW_PAGE(GNU sharutils, unshar.1)
   _NEW_PAGE(GNU sharutils, shar.1)
  </DD>
 </DL>

 <H2>2000/06/19</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, getw.3)
   _UPD_PAGE(LDP man-pages, printf.3)
   _UPD_PAGE(LDP man-pages, putenv.3)
  </DD>
  <DT>netkit</DT>
  <DD>
   _UPD_PAGE(netkit, biff.1)
  </DD>
  <DT>util-linux</DT>
  <DD>
   _UPD_PAGE(util-linux, logger.1)
  </DD>
 </DL>

 <H2>2000/06/15</H2>
 <P>
  新アーカイブ man-pages-ja-20000615.tar.gz と
  対応する RPM アーカイブを
  _LINK(download.html,ダウンロードのページ)
  から取得できるようにしました。
 </P>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>lpr-linux</DT>
  <DD>
   _NEW_PAGE(lpr-linux, lpc.8)
  </DD>
 </DL>

 <H2>2000/06/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>util-linux</DT>
  <DD>
   _UPD_PAGE(util-linux, fdisk.8)
   _UPD_PAGE(util-linux, fsck.minix.8)
   _UPD_PAGE(util-linux, hwclock.8)
   _UPD_PAGE(util-linux, mkswap.8)
   _UPD_PAGE(util-linux, mount.8)
   _NEW_PAGE(util-linux, pivot_root.8)
   _UPD_PAGE(util-linux, shutdown.8)
   _UPD_PAGE(util-linux, swapon.8)
  </DD>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, pivot_root.2)
  </DD>
 </DL>

 <H2>2000/06/13</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, sync.8)
  </DD>
 </DL>

 <H2>2000/06/10</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU gzip</DT>
  <DD>
   _UPD_PAGE(GNU gzip, gzexe.1)
   _UPD_PAGE(GNU gzip, gzip.1)
   _UPD_PAGE(GNU gzip, zdiff.1)
   _UPD_PAGE(GNU gzip, zforce.1)
   _UPD_PAGE(GNU gzip, zgrep.1)
   _UPD_PAGE(GNU gzip, zmore.1)
   _UPD_PAGE(GNU gzip, znew.1)
  </DD>
 </DL>

 <H2>2000/06/06</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU cpio</DT>
  <DD>
   _NEW_PAGE(GNU cpio, mt.1)
  </DD>
 </DL>

 <H2>2000/06/05</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>gnumaniak</DT>
  <DD>
   _NEW_PAGE(gnumaniak, libtool.1)
   _NEW_PAGE(gnumaniak, libtoolize.1)
  </DD>
 </DL>

 <H2>2000/05/29</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>apmd</DT>
  <DD>
   _UPD_PAGE(apmd, apm.1)
   _NEW_PAGE(apmd, apmsleep.1)
   _NEW_PAGE(apmd, tailf.1)
   _UPD_PAGE(apmd, xapm.1)
   _NEW_PAGE(apmd, apmd.8)
  </DD>
  <DT>psmisc</DT>
  <DD>
   _NEW_PAGE(psmisc, killall.1)
   _NEW_PAGE(psmisc, pidof.1)
   _NEW_PAGE(psmisc, pstree.1)
  </DD>
 </DL>

 <H2>2000/05/26</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>ypserv</DT>
  <DD>
   _NEW_PAGE(ypserv, yppasswd.1)
  </DD>
 </DL>

 <H2>2000/05/15</H2>
 <P>
  新アーカイブ man-pages-ja-20000515.tar.gz と
  対応する RPM アーカイブを
  _LINK(download.html,ダウンロードのページ)
  から取得できるようにしました。
 </P>

 <H2>2000/05/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, printf.3)
  </DD>
  <DT>SysVinit</DT>
  <DD>
   _UPD_PAGE(SysVinit, last.1)
   _UPD_PAGE(SysVinit, mesg.1)
   _UPD_PAGE(SysVinit, initscript.5)
   _UPD_PAGE(SysVinit, inittab.5)
   _UPD_PAGE(SysVinit, rc.boot.5)
   _UPD_PAGE(SysVinit, halt.8)
   _UPD_PAGE(SysVinit, init.8)
   _UPD_PAGE(SysVinit, pidof.8)
   _UPD_PAGE(SysVinit, powerd.8)
   _UPD_PAGE(SysVinit, runlevel.8)
   _UPD_PAGE(SysVinit, shutdown.8)
  </DD>
  <DT>procinfo</DT>
  <DD>
   _UPD_PAGE(procinfo, procinfo.8)
  </DD>
  <DT>procps</DT>
  <DD>
   _UPD_PAGE(procps, uptime.1)
   _UPD_PAGE(procps, w.1)
  </DD>
  <DT>psmisc</DT>
  <DD>
   _UPD_PAGE(psmisc, fuser.1)
  </DD>
  <DT>shadow</DT>
  <DD>
   _UPD_PAGE(shadow, su.1)
   _UPD_PAGE(shadow, login.defs.5)
   _UPD_PAGE(shadow, chpasswd.8)
  </DD>
  <DT>pcmcia-cs</DT>
  <DD>
   _NEW_PAGE(pcmcia-cs, cardinfo.1)
   _NEW_PAGE(pcmcia-cs, pcmcia_core.4)
   _NEW_PAGE(pcmcia-cs, pcmcia.5)
   _NEW_PAGE(pcmcia-cs, stab.5)
   _NEW_PAGE(pcmcia-cs, cardctl.8)
   _NEW_PAGE(pcmcia-cs, cardmgr.8)
   _NEW_PAGE(pcmcia-cs, dump_cis.8)
   _NEW_PAGE(pcmcia-cs, ftl_check.8)
   _NEW_PAGE(pcmcia-cs, ftl_format.8)
   _NEW_PAGE(pcmcia-cs, ide_info.8)
   _NEW_PAGE(pcmcia-cs, ifport.8)
   _NEW_PAGE(pcmcia-cs, ifuser.8)
   _NEW_PAGE(pcmcia-cs, lspnp.8)
   _NEW_PAGE(pcmcia-cs, pack_cis.8)
   _NEW_PAGE(pcmcia-cs, pcinitrd.8)
   _NEW_PAGE(pcmcia-cs, scsi_info.8)
   _NEW_PAGE(pcmcia-cs, setpnp.8)
  </DD>
  <DT>util-linux</DT>
  <DD>
   _NEW_PAGE(util-linux, raw.8)
  </DD>
 </DL>

 <H2>2000/04/20</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>glibc-linuxthreads</DT>
  <DD>
   _UPD_PAGE(glibc-linuxthreads, pthread_mutex_init.3)
  </DD>
 </DL>

 <H2>2000/04/15</H2>
 <P>
  新アーカイブ man-pages-ja-20000415.tar.gz と
  対応する RPM アーカイブを
  _LINK(download.html,ダウンロードのページ)
  から取得できるようにしました。
 </P>

 <H2>2000/04/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>glibc-linuxthreads</DT>
  <DD>
   _NEW_PAGE(glibc-linuxthreads, pthread_atfork.3)
   _NEW_PAGE(glibc-linuxthreads, pthread_cancel.3)
   _NEW_PAGE(glibc-linuxthreads, pthread_cond_init.3)
   _NEW_PAGE(glibc-linuxthreads, pthread_mutex_init.3)
  </DD>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, setup.2)
   _UPD_PAGE(LDP man-pages, strtok.3)
   _UPD_PAGE(LDP man-pages, tmpnam.3)
  </DD>
  <DT>util-linux</DT>
  <DD>
   _UPD_PAGE(util-linux, look.1)
   _UPD_PAGE(util-linux, rev.1)
   _UPD_PAGE(util-linux, ul.1)
   _UPD_PAGE(util-linux, kbdrate.8)
   _UPD_PAGE(util-linux, tunelp.8)
  </DD>
 </DL>

 <H2>2000/04/13</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, environ.5)
  </DD>
  <DT>e2fsprogs</DT>
  <DD>
   _NEW_PAGE(e2fsprogs, compile_et.1)
   _NEW_PAGE(e2fsprogs, com_err.3)
  </DD>
  <DT>net-tools</DT>
  <DD>
   _NEW_PAGE(net-tools, ethers.5)
   _NEW_PAGE(net-tools, plipconfig.8)
   _NEW_PAGE(net-tools, slattach.8)
  </DD>
 </DL>

 <H2>2000/04/11</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>cdrecord</DT>
  <DD>
   _NEW_PAGE(cdrecord, mkisofs.8)
  </DD>
 </DL>

 <H2>2000/04/08</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, hier.7)
  </DD>
 </DL>

 <H2>2000/04/03</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>pciutils</DT>
  <DD>
   _NEW_PAGE(pciutils, lspci.8)
  </DD>
 </DL>

 <H2>2000/03/18</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>util-linux</DT>
  <DD>
   _UPD_PAGE(util-linux, cal.1)
   _NEW_PAGE(util-linux, chkdupexe.1)
   _UPD_PAGE(util-linux, fdisk.8)
   _NEW_PAGE(util-linux, fsck.minix.8)
   _UPD_PAGE(util-linux, hwclock.8)
   _NEW_PAGE(util-linux, mkfs.bfs.8)
   _NEW_PAGE(util-linux, mkfs.minix.8)
   _UPD_PAGE(util-linux, mkswap.8)
   _UPD_PAGE(util-linux, mount.8)
  </DD>
 </DL>

 <H2>2000/03/15</H2>
 <P>
  新アーカイブ man-pages-ja-20000315.tar.gz を
  _LINK(download.html,ダウンロードのページ)
  から取得できるようにしました。
  今回から rpm の配布も開始しました。
 </P>

 <H2>2000/03/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>netkit</DT>
  <DD>
   _NEW_PAGE(netkit, ping.8)
  </DD>
 </DL>

 <H2>2000/03/12</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, st.4)
   _NEW_PAGE(LDP man-pages, hosts.equiv.5)
   _NEW_PAGE(LDP man-pages, uri.7)
  </DD>
  <DT>gnumaniak</DT>
  <DD>
   _NEW_PAGE(gnumaniak, basename.1)
   _NEW_PAGE(gnumaniak, cat.1)
   _NEW_PAGE(gnumaniak, chroot.1)
   _NEW_PAGE(gnumaniak, cksum.1)
   _NEW_PAGE(gnumaniak, comm.1)
   _NEW_PAGE(gnumaniak, csplit.1)
   _NEW_PAGE(gnumaniak, cut.1)
   _NEW_PAGE(gnumaniak, date.1)
   _UPD_PAGE(gnumaniak, diff.1)
   _UPD_PAGE(gnumaniak, diff3.1)
   _NEW_PAGE(gnumaniak, dirname.1)
   _NEW_PAGE(gnumaniak, echo.1)
   _NEW_PAGE(gnumaniak, env.1)
   _NEW_PAGE(gnumaniak, expand.1)
   _NEW_PAGE(gnumaniak, expr.1)
   _NEW_PAGE(gnumaniak, factor.1)
   _NEW_PAGE(gnumaniak, false.1)
   _NEW_PAGE(gnumaniak, fmt.1)
   _NEW_PAGE(gnumaniak, fold.1)
   _NEW_PAGE(gnumaniak, groups.1)
   _NEW_PAGE(gnumaniak, head.1)
   _NEW_PAGE(gnumaniak, hostname.1)
   _NEW_PAGE(gnumaniak, id.1)
   _NEW_PAGE(gnumaniak, join.1)
   _NEW_PAGE(gnumaniak, logname.1)
   _NEW_PAGE(gnumaniak, md5sum.1)
   _NEW_PAGE(gnumaniak, nice.1)
   _NEW_PAGE(gnumaniak, nl.1)
   _NEW_PAGE(gnumaniak, nohup.1)
   _NEW_PAGE(gnumaniak, od.1)
   _NEW_PAGE(gnumaniak, paste.1)
   _NEW_PAGE(gnumaniak, pathchk.1)
   _NEW_PAGE(gnumaniak, pinky.1)
   _NEW_PAGE(gnumaniak, pr.1)
   _NEW_PAGE(gnumaniak, printenv.1)
   _NEW_PAGE(gnumaniak, printf.1)
   _NEW_PAGE(gnumaniak, ptx.1)
   _NEW_PAGE(gnumaniak, pwd.1)
   _UPD_PAGE(gnumaniak, sdiff.1)
   _NEW_PAGE(gnumaniak, sleep.1)
   _NEW_PAGE(gnumaniak, sort.1)
   _NEW_PAGE(gnumaniak, split.1)
   _NEW_PAGE(gnumaniak, stty.1)
   _NEW_PAGE(gnumaniak, su.1)
   _NEW_PAGE(gnumaniak, sum.1)
   _NEW_PAGE(gnumaniak, tac.1)
   _NEW_PAGE(gnumaniak, tail.1)
   _NEW_PAGE(gnumaniak, tee.1)
   _NEW_PAGE(gnumaniak, test.1)
   _NEW_PAGE(gnumaniak, tr.1)
   _NEW_PAGE(gnumaniak, true.1)
   _NEW_PAGE(gnumaniak, tsort.1)
   _NEW_PAGE(gnumaniak, tty.1)
   _NEW_PAGE(gnumaniak, uname.1)
   _NEW_PAGE(gnumaniak, unexpand.1)
   _NEW_PAGE(gnumaniak, uniq.1)
   _NEW_PAGE(gnumaniak, users.1)
   _NEW_PAGE(gnumaniak, wc.1)
   _NEW_PAGE(gnumaniak, who.1)
   _NEW_PAGE(gnumaniak, whoami.1)
   _NEW_PAGE(gnumaniak, yes.1)
  </DD>
 </DL>

 <H2>2000/02/01</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>rdate</DT>
  <DD>
   _UPD_PAGE(rdate, rdate.1)
  </DD>
 </DL>

 <H2>2000/01/23</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>cvsup</DT>
  <DD>
   _NEW_PAGE(cvsup, cvsup.1)
   _NEW_PAGE(cvsup, cvpasswd.1)
   _NEW_PAGE(cvsup, cvsupd.8)
  </DD>
  <DT>fetchmail</DT>
  <DD>
   _UPD_PAGE(fetchmail, fetchmail.1)
  </DD>
  <DT>file</DT>
  <DD>
   _NEW_PAGE(file, magic.4)
  </DD>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, touch.1)
   _NEW_PAGE(LDP man-pages, chgrp.1)
  </DD>
 </DL>

 <H2>2000/01/15</H2>
 <P>
  新アーカイブ man-pages-ja-20000115.tar.gz を
  _LINK(download.html,ダウンロードのページ)
  から取得できるようにしました。
 </P>

 <H2>2000/01/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, rpc.3)
   _NEW_PAGE(LDP man-pages, xdr.3)
   _NEW_PAGE(LDP man-pages, fifo.4)
   _NEW_PAGE(LDP man-pages, iso_8859-2.7)
   _NEW_PAGE(LDP man-pages, iso_8859-7.7)
   _NEW_PAGE(LDP man-pages, iso_8859-15.7)
   _UPD_PAGE(LDP man-pages, iswxdigit.3)
   _UPD_PAGE(LDP man-pages, iswupper.3)
   _UPD_PAGE(LDP man-pages, iswspace.3)
   _UPD_PAGE(LDP man-pages, iswpunct.3)
   _UPD_PAGE(LDP man-pages, iswlower.3)
   _UPD_PAGE(LDP man-pages, iswgraph.3)
   _UPD_PAGE(LDP man-pages, iswdigit.3)
   _UPD_PAGE(LDP man-pages, iswblank.3)
   _UPD_PAGE(LDP man-pages, iswalpha.3)
   _UPD_PAGE(LDP man-pages, iswalnum.3)
   _UPD_PAGE(LDP man-pages, inet.3)
   _UPD_PAGE(LDP man-pages, glob.3)
   _UPD_PAGE(LDP man-pages, fputwc.3)
   _UPD_PAGE(LDP man-pages, fgetwc.3)
   _UPD_PAGE(LDP man-pages, ecvt.3)
   _UPD_PAGE(LDP man-pages, uselib.2)
   _UPD_PAGE(LDP man-pages, stat.2)
   _UPD_PAGE(LDP man-pages, socket.2)
   _UPD_PAGE(LDP man-pages, shutdown.2)
   _UPD_PAGE(LDP man-pages, send.2)
   _UPD_PAGE(LDP man-pages, listen.2)
   _UPD_PAGE(LDP man-pages, intro.2)
   _UPD_PAGE(LDP man-pages, idle.2)
   _UPD_PAGE(LDP man-pages, connect.2)
   _UPD_PAGE(LDP man-pages, intro.1)
   _UPD_PAGE(LDP man-pages, man.7)
   _NEW_PAGE(LDP man-pages, mdoc.7)
  </DD>
  <DT>net-tools</DT>
  <DD>
   _UPD_PAGE(net-tools, hostname.1)
   _UPD_PAGE(net-tools, arp.8)
   _UPD_PAGE(net-tools, netstat.8)
   _UPD_PAGE(net-tools, ifconfig.8)
  </DD>
 </DL>

 <H2>2000/01/11</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, fwide.3)
   _NEW_PAGE(LDP man-pages, getrpcent.3)
   _NEW_PAGE(LDP man-pages, getrpcport.3)
   _NEW_PAGE(LDP man-pages, getwchar.3)
   _NEW_PAGE(LDP man-pages, putwchar.3)
   _NEW_PAGE(LDP man-pages, mblen.3)
   _NEW_PAGE(LDP man-pages, mbrlen.3)
   _NEW_PAGE(LDP man-pages, mbrtowc.3)
   _NEW_PAGE(LDP man-pages, mbsinit.3)
   _NEW_PAGE(LDP man-pages, mbsnrtowcs.3)
   _NEW_PAGE(LDP man-pages, mbsrtowcs.3)
   _NEW_PAGE(LDP man-pages, mbstowcs.3)
   _NEW_PAGE(LDP man-pages, mbtowc.3)
   _UPD_PAGE(LDP man-pages, mbrtowc.3)
   _NEW_PAGE(LDP man-pages, stpncpy.3)
   _NEW_PAGE(LDP man-pages, strnlen.3)
   _NEW_PAGE(LDP man-pages, ungetwc.3)
   _NEW_PAGE(LDP man-pages, wcstombs.3)
   _NEW_PAGE(LDP man-pages, wctomb.3)
   _NEW_PAGE(LDP man-pages, wprintf.3)
   _NEW_PAGE(LDP man-pages, capget.2)
  </DD>
 </DL>

  _CREDITS

  _BACK_TO_HOME

</BODY>
</HTML>

