m4_dnl # $Id: news.m4,v 1.487 2010/04/25 03:02:17 jm Exp $
m4_dnl # news.m4: GNU m4 source for news.html.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_include(jm_www.m4)
_EDIT_WARNING(index)
_HEADER(JM 新着情報)

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

m4_dnl This is an anchor for ml2cvs. DON'T REMOVE.
m4_dnl ML2CVS ADD HERE
 <H2>2010/04/25</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, ld.so.8)
   _UPD_PAGE(LDP_man-pages, setreuid.2)
   _UPD_PAGE(LDP_man-pages, resolv.conf.5)
   _UPD_PAGE(LDP_man-pages, fmemopen.3)
   _UPD_PAGE(LDP_man-pages, strftime.3)
   _UPD_PAGE(LDP_man-pages, fork.2)
   _UPD_PAGE(LDP_man-pages, mount.2)
   _UPD_PAGE(LDP_man-pages, open.2)
   _UPD_PAGE(LDP_man-pages, sigaction.2)
   _UPD_PAGE(LDP_man-pages, sync_file_range.2)
   _UPD_PAGE(LDP_man-pages, fcntl.2)
  </DD>
 </DL>

 <H2>2009/11/25</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>sudo</DT>
  <DD>
   _UPD_PAGE(sudo, sudoers.5)
  </DD>
 </DL>

 <H2>2009/11/15</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>sudo</DT>
  <DD>
   _UPD_PAGE(sudo, sudo.8)
   _UPD_PAGE(sudo, visudo.8)
   _UPD_PAGE(sudo, sudoers.5)
   _NEW_PAGE(sudo, sudoers.ldap.5)
  </DD>
 </DL>

 <H2>2009/05/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, ecvt.3)
  </DD>
 </DL>

 <H2>2009/04/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, capget.2)
   _UPD_PAGE(LDP man-pages, clone.2)
   _UPD_PAGE(LDP man-pages, epoll_ctl.2)
   _UPD_PAGE(LDP man-pages, epoll_wait.2)
   _UPD_PAGE(LDP man-pages, select_tut.2)
   _UPD_PAGE(LDP man-pages, signalfd.2)
   _UPD_PAGE(LDP man-pages, dlopen.3)
   _UPD_PAGE(LDP man-pages, fexecve.3)
   _UPD_PAGE(LDP man-pages, longjmp.3)
   _UPD_PAGE(LDP man-pages, printf.3)
   _UPD_PAGE(LDP man-pages, sem_open.3)
   _UPD_PAGE(LDP man-pages, shm_open.3)
   _UPD_PAGE(LDP man-pages, proc.5)
   _UPD_PAGE(LDP man-pages, capabilities.7)
   _UPD_PAGE(LDP man-pages, epoll.7)
   _UPD_PAGE(LDP man-pages, mq_overview.7)
   _UPD_PAGE(LDP man-pages, sem_overview.7)
   _UPD_PAGE(LDP man-pages, tcp.7)
  </DD>
 </DL>

 <H2>2009/03/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, nscd.8)
   _UPD_PAGE(LDP man-pages, epoll_create.2)
  </DD>
 </DL>

 <H2>2009/03/05</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, netdevice.7)
   _UPD_PAGE(LDP man-pages, strsep.3)
   _UPD_PAGE(LDP man-pages, setjmp.3)
   _UPD_PAGE(LDP man-pages, getdents.2)
  </DD>
 </DL>

 <H2>2009/01/23</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>sudo</DT>
  <DD>
   _UPD_PAGE(sudo, sudo.8)
   _UPD_PAGE(sudo, visudo.8)
   _UPD_PAGE(sudo, sudoers.5)
  </DD>
 </DL>

 <H2>2009/01/15</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, getdomainname.2)
   _UPD_PAGE(LDP_man-pages, pthreads.7)
   _UPD_PAGE(LDP_man-pages, udp.7)
   _UPD_PAGE(LDP_man-pages, gethostname.2)
   _UPD_PAGE(LDP_man-pages, atexit.3)
   _UPD_PAGE(LDP_man-pages, on_exit.3)
   _UPD_PAGE(LDP_man-pages, getaddrinfo.3)
   _UPD_PAGE(LDP_man-pages, fopen.3)
   _UPD_PAGE(LDP_man-pages, arp.7)
   _UPD_PAGE(LDP_man-pages, icmp.7)
   _UPD_PAGE(LDP_man-pages, ip.7)
  </DD>
 </DL>

 <H2>2008/12/24</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, accept.2)
   _UPD_PAGE(LDP_man-pages, mmap.2)
   _UPD_PAGE(LDP_man-pages, open.2)
   _UPD_PAGE(LDP_man-pages, recv.2)
   _UPD_PAGE(LDP_man-pages, sched_setaffinity.2)
   _UPD_PAGE(LDP_man-pages, makecontext.3)
  </DD>
 </DL>

 <H2>2008/12/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _NEW_PAGE(LDP_man-pages, time.1)
   _UPD_PAGE(LDP_man-pages, clone.2)
   _NEW_PAGE(LDP_man-pages, eventfd.2)
   _UPD_PAGE(LDP_man-pages, get_mempolicy.2)
   _UPD_PAGE(LDP_man-pages, mbind.2)
   _NEW_PAGE(LDP_man-pages, move_pages.2)
   _UPD_PAGE(LDP_man-pages, pipe.2)
   _UPD_PAGE(LDP_man-pages, set_mempolicy.2)
   _NEW_PAGE(LDP_man-pages, signalfd.2)
   _UPD_PAGE(LDP_man-pages, socket.2)
   _NEW_PAGE(LDP_man-pages, timerfd_create.2)
   _UPD_PAGE(LDP_man-pages, fmemopen.3)
   _UPD_PAGE(LDP_man-pages, popen.3)
  </DD>
 </DL>

 <H2>2008/11/20</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, mount.2)
   _NEW_PAGE(LDP_man-pages, umount.2)
  </DD>
 </DL>

 <H2>2008/11/10</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, ctime.3)
   _UPD_PAGE(LDP_man-pages, vfork.2)
  </DD>
 </DL>

 <H2>2008/10/12</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, clock_nanosleep.2)
   _UPD_PAGE(LDP man-pages, fcntl.2)
   _UPD_PAGE(LDP man-pages, stat.2)
   _NEW_PAGE(LDP man-pages, end.3)
   _NEW_PAGE(LDP man-pages, erfc.3)
   _UPD_PAGE(LDP man-pages, getdate.3)
   _UPD_PAGE(LDP man-pages, getnetent.3)
   _UPD_PAGE(LDP man-pages, getprotoent.3)
   _UPD_PAGE(LDP man-pages, getrpcent.3)
   _UPD_PAGE(LDP man-pages, getservent.3)
   _NEW_PAGE(LDP man-pages, gnu_get_libc_version.3)
   _UPD_PAGE(LDP man-pages, hsearch.3)
   _NEW_PAGE(LDP man-pages, random_r.3)
   _NEW_PAGE(LDP man-pages, sched_getcpu.3)
   _NEW_PAGE(LDP man-pages, sigwait.3)
   _NEW_PAGE(LDP man-pages, y0.3)
   _UPD_PAGE(LDP man-pages, core.5)
   _UPD_PAGE(LDP man-pages, inotify.7)
   _NEW_PAGE(LDP man-pages, math_error.7)
   _NEW_PAGE(LDP man-pages, shm_overview.7)
   _NEW_PAGE(LDP man-pages, udplite.7)
  </DD>
 </DL>

 <H2>2008/10/08</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, console_codes.4)
   _UPD_PAGE(LDP man-pages, updwtmp.3)
   _UPD_PAGE(LDP man-pages, mkfifo.3)
   _UPD_PAGE(LDP man-pages, getpw.3)
   _UPD_PAGE(LDP man-pages, ftime.3)
   _UPD_PAGE(LDP man-pages, crypt.3)
   _UPD_PAGE(LDP man-pages, mkdir.2)
   _UPD_PAGE(LDP man-pages, getdents.2)
  </DD>
 </DL>

 <H2>2008/09/19</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, acos.3)
   _UPD_PAGE(LDP_man-pages, acosh.3)
   _UPD_PAGE(LDP_man-pages, asin.3)
   _UPD_PAGE(LDP_man-pages, asinh.3)
   _UPD_PAGE(LDP_man-pages, atan.3)
   _UPD_PAGE(LDP_man-pages, atan2.3)
   _UPD_PAGE(LDP_man-pages, atanh.3)
   _UPD_PAGE(LDP_man-pages, cbrt.3)
   _UPD_PAGE(LDP_man-pages, ceil.3)
   _UPD_PAGE(LDP_man-pages, copysign.3)
   _UPD_PAGE(LDP_man-pages, cos.3)
   _UPD_PAGE(LDP_man-pages, cosh.3)
   _UPD_PAGE(LDP_man-pages, erf.3)
   _UPD_PAGE(LDP_man-pages, exp.3)
   _UPD_PAGE(LDP_man-pages, exp10.3)
   _UPD_PAGE(LDP_man-pages, exp2.3)
   _UPD_PAGE(LDP_man-pages, expm1.3)
   _UPD_PAGE(LDP_man-pages, fabs.3)
   _UPD_PAGE(LDP_man-pages, fdim.3)
   _UPD_PAGE(LDP_man-pages, fenv.3)
   _UPD_PAGE(LDP_man-pages, finite.3)
   _UPD_PAGE(LDP_man-pages, floor.3)
   _UPD_PAGE(LDP_man-pages, fma.3)
   _UPD_PAGE(LDP_man-pages, fmax.3)
   _UPD_PAGE(LDP_man-pages, fmin.3)
   _UPD_PAGE(LDP_man-pages, fmod.3)
   _UPD_PAGE(LDP_man-pages, fpclassify.3)
   _UPD_PAGE(LDP_man-pages, frexp.3)
   _UPD_PAGE(LDP_man-pages, gamma.3)
   _UPD_PAGE(LDP_man-pages, gcvt.3)
   _UPD_PAGE(LDP_man-pages, getpwent_r.3)
   _UPD_PAGE(LDP_man-pages, hypot.3)
   _UPD_PAGE(LDP_man-pages, ilogb.3)
   _UPD_PAGE(LDP_man-pages, isgreater.3)
   _UPD_PAGE(LDP_man-pages, j0.3)
   _UPD_PAGE(LDP_man-pages, ldexp.3)
   _UPD_PAGE(LDP_man-pages, lgamma.3)
   _UPD_PAGE(LDP_man-pages, log.3)
   _UPD_PAGE(LDP_man-pages, log10.3)
   _UPD_PAGE(LDP_man-pages, log1p.3)
   _UPD_PAGE(LDP_man-pages, log2.3)
   _UPD_PAGE(LDP_man-pages, logb.3)
   _UPD_PAGE(LDP_man-pages, lrint.3)
   _UPD_PAGE(LDP_man-pages, lround.3)
   _UPD_PAGE(LDP_man-pages, modf.3)
   _UPD_PAGE(LDP_man-pages, nan.3)
   _UPD_PAGE(LDP_man-pages, nextafter.3)
   _UPD_PAGE(LDP_man-pages, pow.3)
   _UPD_PAGE(LDP_man-pages, remainder.3)
   _UPD_PAGE(LDP_man-pages, remquo.3)
   _UPD_PAGE(LDP_man-pages, rint.3)
   _UPD_PAGE(LDP_man-pages, round.3)
   _UPD_PAGE(LDP_man-pages, scalb.3)
   _UPD_PAGE(LDP_man-pages, signbit.3)
   _UPD_PAGE(LDP_man-pages, sin.3)
   _UPD_PAGE(LDP_man-pages, sincos.3)
   _UPD_PAGE(LDP_man-pages, sinh.3)
   _UPD_PAGE(LDP_man-pages, sqrt.3)
   _UPD_PAGE(LDP_man-pages, tan.3)
   _UPD_PAGE(LDP_man-pages, tanh.3)
   _UPD_PAGE(LDP_man-pages, tgamma.3)
   _UPD_PAGE(LDP_man-pages, trunc.3)
  </DD>
 </DL>

 <H2>2008/09/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _NEW_PAGE(LDP_man-pages, release/man7/credentials.7)
   _UPD_PAGE(LDP_man-pages, release/man2/capget.2)
   _UPD_PAGE(LDP_man-pages, release/man2/getrlimit.2)
   _UPD_PAGE(LDP_man-pages, release/man2/open.2)
   _UPD_PAGE(LDP_man-pages, release/man2/prctl.2)
   _UPD_PAGE(LDP_man-pages, release/man2/sched_setscheduler.2)
   _UPD_PAGE(LDP_man-pages, release/man3/getaddrinfo.3)
   _UPD_PAGE(LDP_man-pages, release/man3/getgrouplist.3)
   _UPD_PAGE(LDP_man-pages, release/man3/getopt.3)
   _UPD_PAGE(LDP_man-pages, release/man3/inet.3)
   _UPD_PAGE(LDP_man-pages, release/man3/inet_pton.3)
   _UPD_PAGE(LDP_man-pages, release/man3/mkstemp.3)
   _UPD_PAGE(LDP_man-pages, release/man3/readdir.3)
   _UPD_PAGE(LDP_man-pages, release/man4/random.4)
   _UPD_PAGE(LDP_man-pages, release/man5/acct.5)
   _UPD_PAGE(LDP_man-pages, release/man5/core.5)
   _UPD_PAGE(LDP_man-pages, release/man5/locale.5)
   _UPD_PAGE(LDP_man-pages, release/man5/utmp.5)
   _UPD_PAGE(LDP_man-pages, release/man7/signal.7)
   _UPD_PAGE(LDP_man-pages, release/man7/unix.7)
  </DD>
 </DL>

 <H2>2008/07/24</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, ttyname.3)
   _UPD_PAGE(LDP man-pages, syslog.3)
   _UPD_PAGE(LDP man-pages, swab.3)
   _UPD_PAGE(LDP man-pages, strstr.3)
   _UPD_PAGE(LDP man-pages, strsep.3)
   _UPD_PAGE(LDP man-pages, strdup.3)
   _UPD_PAGE(LDP man-pages, stdarg.3)
   _UPD_PAGE(LDP man-pages, remove.3)
   _UPD_PAGE(LDP man-pages, puts.3)
   _UPD_PAGE(LDP man-pages, putenv.3)
   _UPD_PAGE(LDP man-pages, mbrtowc.3)
   _UPD_PAGE(LDP man-pages, socket.2)
   _UPD_PAGE(LDP man-pages, setup.2)
   _UPD_PAGE(LDP man-pages, reboot.2)
   _UPD_PAGE(LDP man-pages, msync.2)
   _UPD_PAGE(LDP man-pages, getsockopt.2)
  </DD>
 </DL>

 <H2>2008/07/23</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, listen.2)
   _UPD_PAGE(LDP man-pages, ecvt.3)
   _UPD_PAGE(LDP man-pages, strcpy.3)
   _UPD_PAGE(LDP man-pages, setjmp.3)
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
   _UPD_PAGE(LDP man-pages, insque.3)
   _UPD_PAGE(LDP man-pages, glob.3)
   _UPD_PAGE(LDP man-pages, getwchar.3)
   _UPD_PAGE(LDP man-pages, getw.3)
   _UPD_PAGE(LDP man-pages, getipnodebyname.3)
   _UPD_PAGE(LDP man-pages, getcwd.3)
   _UPD_PAGE(LDP man-pages, fputws.3)
   _UPD_PAGE(LDP man-pages, ffs.3)
   _UPD_PAGE(LDP man-pages, ferror.3)
   _UPD_PAGE(LDP man-pages, bcopy.3)
   _UPD_PAGE(LDP man-pages, bcmp.3)
   _UPD_PAGE(LDP man-pages, assert.3)
   _UPD_PAGE(LDP man-pages, abs.3)
  </DD>
 </DL>

 <H2>2008/07/22</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, charmap.5)
   _UPD_PAGE(LDP man-pages, protocols.5)
   _UPD_PAGE(LDP man-pages, rpc.5)
   _UPD_PAGE(LDP man-pages, charsets.7)
   _UPD_PAGE(LDP man-pages, uri.7)
   _UPD_PAGE(LDP man-pages, protocols.5)
  </DD>
 </DL>

 <H2>2008/01/28</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _NEW_PAGE(LDP_man-pages, fallocate.2)
   _UPD_PAGE(LDP_man-pages, fsync.2)
   _UPD_PAGE(LDP_man-pages, getitimer.2)
   _UPD_PAGE(LDP_man-pages, open.2)
   _NEW_PAGE(LDP_man-pages, sgetmask.2)
   _NEW_PAGE(LDP_man-pages, spu_create.2)
   _NEW_PAGE(LDP_man-pages, spu_run.2)
   _NEW_PAGE(LDP_man-pages, backtrace.3)
   _UPD_PAGE(LDP_man-pages, longjmp.3)
   _UPD_PAGE(LDP_man-pages, malloc.3)
   _UPD_PAGE(LDP_man-pages, opendir.3)
   _UPD_PAGE(LDP_man-pages, readdir.3)
   _NEW_PAGE(LDP_man-pages, timeradd.3)
   _NEW_PAGE(LDP_man-pages, spufs.7)
  </DD>
 </DL>

 <H2>2007/12/22</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>e2fsprogs</DT>
  <DD>
   _UPD_PAGE(e2fsprogs, mke2fs.8)
   _UPD_PAGE(e2fsprogs, resize2fs.8)
   _UPD_PAGE(e2fsprogs, tune2fs.8)
  </DD>
 </DL>

 <H2>2007/10/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, close.2)
   _UPD_PAGE(LDP_man-pages, execve.2)
  </DD>
 </DL>

 <H2>2007/10/11</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, access.2)
   _UPD_PAGE(LDP_man-pages, mmap.2)
   _UPD_PAGE(LDP_man-pages, mmap2.2)
   _UPD_PAGE(LDP_man-pages, select.2)
   _UPD_PAGE(LDP_man-pages, setpgid.2)
   _UPD_PAGE(LDP_man-pages, sigqueue.2)
   _UPD_PAGE(LDP_man-pages, syscalls.2)
   _UPD_PAGE(LDP_man-pages, epoll.7)
   _UPD_PAGE(LDP_man-pages, feature_test_macros.7)
  </DD>
 </DL>

 <H2>2007/07/28</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, listen.2)
   _UPD_PAGE(LDP_man-pages, strcat.3)
   _UPD_PAGE(LDP_man-pages, strcpy.3)
   _UPD_PAGE(LDP_man-pages, proc.5)
   _UPD_PAGE(LDP_man-pages, man-pages.7)
  </DD>
 </DL>

 <H2>2007/07/03</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _NEW_PAGE(LDP_man-pages, man-pages.7)
   _UPD_PAGE(LDP_man-pages, alloc_hugepages.2)
   _UPD_PAGE(LDP_man-pages, bind.2)
   _UPD_PAGE(LDP_man-pages, clone.2)
   _UPD_PAGE(LDP_man-pages, modify_ldt.2)
   _UPD_PAGE(LDP_man-pages, mprotect.2)
   _UPD_PAGE(LDP_man-pages, signal.2)
   _UPD_PAGE(LDP_man-pages, bindresvport.3)
   _UPD_PAGE(LDP_man-pages, exit.3)
   _UPD_PAGE(LDP_man-pages, getaddrinfo.3)
   _UPD_PAGE(LDP_man-pages, gethostbyname.3)
   _UPD_PAGE(LDP_man-pages, memmove.3)
   _UPD_PAGE(LDP_man-pages, inotify.7)
   _UPD_PAGE(LDP_man-pages, man.7)
   _UPD_PAGE(LDP_man-pages, ld.so.8)
  </DD>
 </DL>

 <H2>2007/06/13</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, epoll_wait.2)
   _UPD_PAGE(LDP_man-pages, execve.2)
   _UPD_PAGE(LDP_man-pages, readv.2)
   _UPD_PAGE(LDP_man-pages, sched_rr_get_interval.2)
   _NEW_PAGE(LDP_man-pages, bsd_signal.3)
   _UPD_PAGE(LDP_man-pages, clock.3)
   _UPD_PAGE(LDP_man-pages, copysign.3)
   _NEW_PAGE(LDP_man-pages, euidaccess.3)
   _NEW_PAGE(LDP_man-pages, getsubopt.3)
   _UPD_PAGE(LDP_man-pages, iconv_open.3)
   _UPD_PAGE(LDP_man-pages, strcoll.3)
   _NEW_PAGE(LDP_man-pages, sysv_signal.3)
   _UPD_PAGE(LDP_man-pages, sk98lin.4)
   _UPD_PAGE(LDP_man-pages, ip.7)
   _UPD_PAGE(LDP_man-pages, signal.7)
  </DD>
 </DL>

 <H2>2007/05/04</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, access.2)
   _UPD_PAGE(LDP_man-pages, clone.2)
   _UPD_PAGE(LDP_man-pages, faccessat.2)
   _UPD_PAGE(LDP_man-pages, mincore.2)
   _UPD_PAGE(LDP_man-pages, mmap.2)
   _UPD_PAGE(LDP_man-pages, mount.2)
   _UPD_PAGE(LDP_man-pages, open.2)
   _UPD_PAGE(LDP_man-pages, ptrace.2)
   _UPD_PAGE(LDP_man-pages, rename.2)
   _UPD_PAGE(LDP_man-pages, semop.2)
   _UPD_PAGE(LDP_man-pages, write.2)
   _UPD_PAGE(LDP_man-pages, fcloseall.3)
   _UPD_PAGE(LDP_man-pages, getopt.3)
   _UPD_PAGE(LDP_man-pages, inet.3)
   _UPD_PAGE(LDP_man-pages, termios.3)
   _UPD_PAGE(LDP_man-pages, ualarm.3)
   _UPD_PAGE(LDP_man-pages, usleep.3)
   _UPD_PAGE(LDP_man-pages, feature_test_macros.7)
   _NEW_PAGE(LDP_man-pages, termio.7)
   _UPD_PAGE(LDP_man-pages, time.7)
  </DD>
 </DL>

 <H2>2007/05/04</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, bootparam.7)
  </DD>
 </DL>

 <H2>2007/05/03</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, isalpha.3)
   _UPD_PAGE(LDP_man-pages, basename.3)
  </DD>
 </DL>

 <H2>2007/02/10</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, linkat.2)
  </DD>
 </DL>

 <H2>2007/02/08</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, brk.2)
   _UPD_PAGE(LDP man-pages, faccessat.2)
   _UPD_PAGE(LDP man-pages, fork.2)
   _UPD_PAGE(LDP man-pages, futex.2)
   _UPD_PAGE(LDP man-pages, posix_fadvise.2)
   _UPD_PAGE(LDP man-pages, rtc.4)
  </DD>
 </DL>

 <H2>2007/02/04</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, splice.2)
   _NEW_PAGE(LDP man-pages, tee.2)
   _NEW_PAGE(LDP man-pages, vmsplice.2)
  </DD>
 </DL>

 <H2>2007/01/15</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, ioprio_set.2)
   _NEW_PAGE(LDP man-pages, sync_file_range.2)
   _UPD_PAGE(LDP man-pages, clone.2)
   _UPD_PAGE(LDP man-pages, execve.2)
   _UPD_PAGE(LDP man-pages, getpagesize.2)
   _UPD_PAGE(LDP man-pages, ioperm.2)
   _UPD_PAGE(LDP man-pages, madvise.2)
   _UPD_PAGE(LDP man-pages, mmap.2)
   _UPD_PAGE(LDP man-pages, mount.2)
   _UPD_PAGE(LDP man-pages, open.2)
   _UPD_PAGE(LDP man-pages, prctl.2)
   _UPD_PAGE(LDP man-pages, ptrace.2)
   _UPD_PAGE(LDP man-pages, set_mempolicy.2)
   _UPD_PAGE(LDP man-pages, vfork.2)
   _UPD_PAGE(LDP man-pages, clog10.3)
   _UPD_PAGE(LDP man-pages, clog2.3)
   _UPD_PAGE(LDP man-pages, getnameinfo.3)
   _UPD_PAGE(LDP man-pages, qsort.3)
   _UPD_PAGE(LDP man-pages, termios.3)
   _UPD_PAGE(LDP man-pages, tzset.3)
   _UPD_PAGE(LDP man-pages, core.5)
   _UPD_PAGE(LDP man-pages, proc.5)
   _UPD_PAGE(LDP man-pages, capabilities.7)
   _UPD_PAGE(LDP man-pages, ip.7)
   _UPD_PAGE(LDP man-pages, pthreads.7)
   _UPD_PAGE(LDP man-pages, raw.7)
   _UPD_PAGE(LDP man-pages, socket.7)
   _UPD_PAGE(LDP man-pages, udp.7)
  </DD>
 </DL>

 <H2>2007/01/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, getdtablesize.2)
   _UPD_PAGE(LDP man-pages, msync.2)
   _UPD_PAGE(LDP man-pages, crypt.3)
   _UPD_PAGE(LDP man-pages, getaddrinfo.3)
   _UPD_PAGE(LDP man-pages, getcwd.3)
   _UPD_PAGE(LDP man-pages, syslog.3)
  </DD>
 </DL>

 <H2><A NAME="OLDNEWS">過去の新着情報</A></H2>
 <UL>
  <LI>_LINK(news2006.html,2006年の新着情報)
  <LI>_LINK(news2005.html,2005年の新着情報)
  <LI>_LINK(news2004.html,2004年の新着情報)
  <LI>_LINK(news2003.html,2003年の新着情報)
  <LI>_LINK(news2002.html,2002年の新着情報)
  <LI>_LINK(news2001.html,2001年の新着情報)
  <LI>_LINK(news2000.html,2000年の新着情報)
  <LI>_LINK(news1999.html,1999年の新着情報)
 </UL>

  _CREDITS

  _BACK_TO_HOME

 <DIV CLASS="copyright">
  $Id: news.m4,v 1.487 2010/04/25 03:02:17 jm Exp $
 </DIV>

</BODY>
</HTML>
