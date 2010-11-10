m4_dnl # news.m4: GNU m4 source for news.html.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_include(jm_www.m4)
_EDIT_WARNING(index)
_HEADER(`JM 新着情報 (2004 年分)')

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
 <H2>2004/12/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU screen</DT>
  <DD>
   _UPD_PAGE(GNU screen, screen.1)
  </DD>
 </DL>

 <H2>2004/11/16</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, tty_ioctl.4)
   _NEW_PAGE(LDP man-pages, operator.7)
  </DD>
 </DL>

 <H2>2004/10/16</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, xcrypt.3)
   _NEW_PAGE(LDP man-pages, sk98lin.4)
  </DD>
 </DL>

 <H2>2004/09/29</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, wordexp.3)
  </DD>
 </DL>

 <H2>2004/09/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, getspnam.3)
   _NEW_PAGE(LDP man-pages, rtime.3)
   _NEW_PAGE(LDP man-pages, setaliasent.3)
   _NEW_PAGE(LDP man-pages, strtoimax.3)
   _NEW_PAGE(LDP man-pages, ttyslot.3)
   _NEW_PAGE(LDP man-pages, ualarm.3)
   _NEW_PAGE(LDP man-pages, wcstoimax.3)
   _NEW_PAGE(LDP man-pages, wordexp.3)
   _NEW_PAGE(LDP man-pages, getttyent.3)
   _NEW_PAGE(LDP man-pages, isgreater.3)
   _NEW_PAGE(LDP man-pages, log2.3)
   _NEW_PAGE(LDP man-pages, login.3)
   _NEW_PAGE(LDP man-pages, mempcpy.3)
   _NEW_PAGE(LDP man-pages, putgrent.3)
   _NEW_PAGE(LDP man-pages, queue.3)
   _NEW_PAGE(LDP man-pages, remainder.3)
  </DD>
 </DL>

 <H2>2004/08/15</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>procmail</DT>
  <DD>
   _NEW_PAGE(procmail, procmail.1)
  </DD>
 </DL>

 <H2>2004/08/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, cfree.3)
   _NEW_PAGE(LDP man-pages, getgrent_r.3)
   _NEW_PAGE(LDP man-pages, getgrouplist.3)
   _NEW_PAGE(LDP man-pages, getpwent_r.3)
   _NEW_PAGE(LDP man-pages, clock_getres.3)
   _NEW_PAGE(LDP man-pages, des_crypt.3)
   _NEW_PAGE(LDP man-pages, fdim.3)
   _NEW_PAGE(LDP man-pages, fma.3)
   _NEW_PAGE(LDP man-pages, fmax.3)
   _NEW_PAGE(LDP man-pages, fmin.3)
   _NEW_PAGE(LDP man-pages, fmtmsg.3)
   _NEW_PAGE(LDP man-pages, fpclassify.3)
  </DD>
 </DL>

 <H2>2004/07/19</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, remap_file_pages.2)
  </DD>
 </DL>

 <H2>2004/07/18</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, epoll.4)
   _NEW_PAGE(LDP man-pages, pciconfig_read.2)
   _NEW_PAGE(LDP man-pages, posix_fadvise.2)
   _NEW_PAGE(LDP man-pages, sstk.2)
   _NEW_PAGE(LDP man-pages, statvfs.2)
   _NEW_PAGE(LDP man-pages, addseverity.3)
   _NEW_PAGE(LDP man-pages, aio_write.3)
   _NEW_PAGE(LDP man-pages, aio_cancel.3)
   _UPD_PAGE(LDP man-pages, pciconfig_read.2)
   _UPD_PAGE(LDP man-pages, statvfs.2)
   _NEW_PAGE(LDP man-pages, aio_error.3)
   _NEW_PAGE(LDP man-pages, aio_fsync.3)
   _NEW_PAGE(LDP man-pages, aio_read.3)
   _NEW_PAGE(LDP man-pages, aio_return.3)
   _NEW_PAGE(LDP man-pages, aio_suspend.3)
  </DD>
 </DL>

 <H2>2004/07/15</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>gnumaniak</DT>
  <DD>
   _UPD_PAGE(gnumaniak, wc.1)
  </DD>
 </DL>

 <H2>2004/07/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, epoll_ctl.2)
   _NEW_PAGE(LDP man-pages, epoll_wait.2)
  </DD>
 </DL>

 <H2>2004/06/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, qsort.3)
   _UPD_PAGE(LDP man-pages, wcsdup.3)
   _UPD_PAGE(LDP man-pages, random.4)
  </DD>
  <DT>quota</DT>
  <DD>
   _UPD_PAGE(quota, setquota.8)
   _NEW_PAGE(quota, warnquota.8)
   _NEW_PAGE(quota, convertquota.8)
   _UPD_PAGE(quota, quotaon.8)
   _NEW_PAGE(quota, quot.8)
   _UPD_PAGE(quota, repquota.8)
   _UPD_PAGE(quota, rquotad.8)
  </DD>
 </DL>

 <H2>2004/06/13</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, alloc_hugepages.2)
   _UPD_PAGE(LDP man-pages, setresuid.2)
   _UPD_PAGE(LDP man-pages, setuid.2)
   _UPD_PAGE(LDP man-pages, ustat.2)
   _UPD_PAGE(LDP man-pages, vm86.2)
   _UPD_PAGE(LDP man-pages, atexit.3)
   _UPD_PAGE(LDP man-pages, div.3)
   _UPD_PAGE(LDP man-pages, getgrent.3)
   _UPD_PAGE(LDP man-pages, getgrnam.3)
   _UPD_PAGE(LDP man-pages, getpwnam.3)
   _UPD_PAGE(LDP man-pages, hypot.3)
   _NEW_PAGE(LDP man-pages, arch_prctl.2)
   _UPD_PAGE(LDP man-pages, ldexp.3)
   _UPD_PAGE(LDP man-pages, brk.2)
   _UPD_PAGE(LDP man-pages, dup.2)
   _NEW_PAGE(LDP man-pages, epoll_create.2)
   _UPD_PAGE(LDP man-pages, fdatasync.2)
   _UPD_PAGE(LDP man-pages, ioctl_list.2)
   _UPD_PAGE(LDP man-pages, mlockall.2)
   _UPD_PAGE(LDP man-pages, poll.2)
  </DD>
 </DL>

 <H2>2004/05/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU indent</DT>
  <DD>
   _UPD_PAGE(GNU indent, indent.1)
  </DD>
  <DT>GNU bash</DT>
  <DD>
   _UPD_PAGE(GNU bash, builtins.1)
  </DD>
  <DT>util-linux</DT>
  <DD>
   _UPD_PAGE(util-linux, readprofile.1)
   _UPD_PAGE(util-linux, script.1)
   _UPD_PAGE(util-linux, setterm.1)
   _UPD_PAGE(util-linux, fdisk.8)
   _UPD_PAGE(util-linux, losetup.8)
   _UPD_PAGE(util-linux, mkswap.8)
   _UPD_PAGE(util-linux, mount.8)
   _UPD_PAGE(util-linux, raw.8)
   _UPD_PAGE(util-linux, sfdisk.8)
   _UPD_PAGE(util-linux, swapon.8)
  </DD>
  <DT>reiserfsprogs</DT>
  <DD>
   _UPD_PAGE(reiserfsprogs, debugreiserfs.8)
   _UPD_PAGE(reiserfsprogs, mkreiserfs.8)
   _UPD_PAGE(reiserfsprogs, reiserfsck.8)
   _UPD_PAGE(reiserfsprogs, reiserfstune.8)
   _UPD_PAGE(reiserfsprogs, resize_reiserfs.8)
  </DD>
  <DT>quota</DT>
  <DD>
   _UPD_PAGE(quota, quota.1)
   _UPD_PAGE(quota, edquota.8)
   _UPD_PAGE(quota, quotacheck.8)
  </DD>
 </DL>

 <H2>2004/05/01</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>e2fsprogs</DT>
  <DD>
   _UPD_PAGE(e2fsprogs, chattr.1)
   _UPD_PAGE(e2fsprogs, lsattr.1)
   _UPD_PAGE(e2fsprogs, badblocks.8)
   _UPD_PAGE(e2fsprogs, debugfs.8)
   _UPD_PAGE(e2fsprogs, dumpe2fs.8)
   _UPD_PAGE(e2fsprogs, e2fsck.8)
   _UPD_PAGE(e2fsprogs, fsck.8)
   _UPD_PAGE(e2fsprogs, mke2fs.8)
   _UPD_PAGE(e2fsprogs, mklost+found.8)
   _UPD_PAGE(e2fsprogs, tune2fs.8)
   _NEW_PAGE(e2fsprogs, filefrag.8)
  </DD>
  <DT>util-linux</DT>
  <DD>
   _UPD_PAGE(util-linux, logger.1)
  </DD>
 </DL>

 <H2>2004/03/13</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>ypbind-mt</DT>
  <DD>
   _UPD_PAGE(ypbind-mt, yp.conf.5)
  </DD>
  <DT>ypserv</DT>
  <DD>
   _UPD_PAGE(ypserv, ypserv.conf.5)
   _UPD_PAGE(ypserv, yppush.8)
  </DD>
 </DL>

 <H2>2004/03/12</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, chown.2)
  </DD>
  <DT>dhcpcd</DT>
  <DD>
   _UPD_PAGE(dhcpcd, dhcpcd.8)
  </DD>
  <DT>e2fsprogs</DT>
  <DD>
   _NEW_PAGE(e2fsprogs, mk_cmds.1)
   _NEW_PAGE(e2fsprogs, libblkid.3)
   _NEW_PAGE(e2fsprogs, blkid.8)
   _NEW_PAGE(e2fsprogs, logsave.8)
   _UPD_PAGE(e2fsprogs, resize2fs.8)
  </DD>
  <DT>iptables</DT>
  <DD>
   _UPD_PAGE(iptables, ip6tables.8)
   _UPD_PAGE(iptables, iptables.8)
  </DD>
  <DT>netatalk</DT>
  <DD>
   _UPD_PAGE(netatalk, pap.1)
   _UPD_PAGE(netatalk, papd.conf.5)
   _UPD_PAGE(netatalk, afpd.8)
  </DD>
  <DT>pciutils</DT>
  <DD>
   _UPD_PAGE(pciutils, lspci.8)
   _NEW_PAGE(pciutils, setpci.8)
   _NEW_PAGE(pciutils, update-pciids.8)
  </DD>
  <DT>yp-tools</DT>
  <DD>
   _UPD_PAGE(yp-tools, ypcat.1)
   _NEW_PAGE(yp-tools, yptest.8)
  </DD>
 </DL>

 <H2>2004/02/11</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>file</DT>
  <DD>
   _UPD_PAGE(file, file.1)
   _UPD_PAGE(file, libmagic.3)
  </DD>
 </DL>

 <H2>2004/02/07</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, getrlimit.2)
   _UPD_PAGE(LDP man-pages, signal.2)
   _UPD_PAGE(LDP man-pages, encrypt.3)
   _UPD_PAGE(LDP man-pages, hsearch.3)
   _UPD_PAGE(LDP man-pages, stdio.3)
  </DD>
  <DT>reiserfsprogs</DT>
  <DD>
   _UPD_PAGE(reiserfsprogs, mkreiserfs.8)
   _UPD_PAGE(reiserfsprogs, reiserfsck.8)
  </DD>
  <DT>gnumaniak</DT>
  <DD>
   _UPD_PAGE(gnumaniak, chown.1)
   _UPD_PAGE(gnumaniak, chroot.1)
   _UPD_PAGE(gnumaniak, date.1)
   _UPD_PAGE(gnumaniak, diff.1)
   _UPD_PAGE(gnumaniak, expand.1)
   _UPD_PAGE(gnumaniak, expr.1)
   _UPD_PAGE(gnumaniak, false.1)
   _UPD_PAGE(gnumaniak, head.1)
   _UPD_PAGE(gnumaniak, ln.1)
   _UPD_PAGE(gnumaniak, logname.1)
   _UPD_PAGE(gnumaniak, mkdir.1)
   _UPD_PAGE(gnumaniak, od.1)
   _UPD_PAGE(gnumaniak, pr.1)
   _UPD_PAGE(gnumaniak, printf.1)
   _UPD_PAGE(gnumaniak, rmdir.1)
   _UPD_PAGE(gnumaniak, sdiff.1)
   _UPD_PAGE(gnumaniak, sleep.1)
   _UPD_PAGE(gnumaniak, split.1)
   _UPD_PAGE(gnumaniak, tail.1)
   _UPD_PAGE(gnumaniak, touch.1)
   _UPD_PAGE(gnumaniak, true.1)
   _UPD_PAGE(gnumaniak, unexpand.1)
   _UPD_PAGE(gnumaniak, uniq.1)
   _UPD_PAGE(gnumaniak, who.1)
  </DD>
 </DL>

 <H2>2004/01/17</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, open.2)
   _UPD_PAGE(LDP man-pages, a64l.3)
   _UPD_PAGE(LDP man-pages, gethostbyname.3)
   _UPD_PAGE(LDP man-pages, memchr.3)
   _UPD_PAGE(LDP man-pages, acct.5)
   _UPD_PAGE(LDP man-pages, proc.5)
  </DD>
 </DL>

  _CREDITS

  _BACK_TO_HOME

</BODY>
</HTML>
