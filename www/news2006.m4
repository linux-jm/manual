m4_dnl # news.m4: GNU m4 source for news.html.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_include(jm_www.m4)
_EDIT_WARNING(index)
_HEADER(`JM 新着情報 (2006 年分)')

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
 <H2>2006/12/28</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, faccessat.2)
   _NEW_PAGE(LDP man-pages, fchownat.2)
   _NEW_PAGE(LDP man-pages, fchmodat.2)
   _NEW_PAGE(LDP man-pages, fstatat.2)
   _NEW_PAGE(LDP man-pages, get_mempolicy.2)
   _NEW_PAGE(LDP man-pages, inotify_add_watch.2)
   _NEW_PAGE(LDP man-pages, inotify_init.2)
   _NEW_PAGE(LDP man-pages, inotify_rm_watch.2)
   _NEW_PAGE(LDP man-pages, mbind.2)
   _NEW_PAGE(LDP man-pages, set_mempolicy.2)
   _NEW_PAGE(LDP man-pages, standards.7)
  </DD>
  <DT>eject</DT>
  <DD>
   _UPD_PAGE(eject, eject.1)
   _UPD_PAGE(eject, volname.1)
  </DD>
  <DT>e2fsprogs</DT>
  <DD>
   _UPD_PAGE(e2fsprogs, chattr.1)
   _UPD_PAGE(e2fsprogs, debugfs.8)
   _UPD_PAGE(e2fsprogs, e2fsck.8)
  </DD>
 </DL>

 <H2>2006/10/13</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, futimesat.2)
   _NEW_PAGE(LDP man-pages, linkat.2)
   _NEW_PAGE(LDP man-pages, mkdirat.2)
   _NEW_PAGE(LDP man-pages, mknodat.2)
   _NEW_PAGE(LDP man-pages, openat.2)
   _NEW_PAGE(LDP man-pages, readlinkat.2)
   _NEW_PAGE(LDP man-pages, renameat.2)
   _NEW_PAGE(LDP man-pages, symlinkat.2)
   _NEW_PAGE(LDP man-pages, unlinkat.2)
  </DD>
 </DL>

 <H2>2006/08/19</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, unshare.2)
   _NEW_PAGE(LDP man-pages, error.3)
   _NEW_PAGE(LDP man-pages, mkfifoat.3)
   _NEW_PAGE(LDP man-pages, posix_fallocate.3)
   _NEW_PAGE(LDP man-pages, sockatmark.3)
   _NEW_PAGE(LDP man-pages, rtc.4)
   _NEW_PAGE(LDP man-pages, time.7)
   _UPD_PAGE(LDP man-pages, inotify.7)
  </DD>
 </DL>

 <H2>2006/08/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, fsync.2)
   _UPD_PAGE(LDP man-pages, getitimer.2)
   _UPD_PAGE(LDP man-pages, console_codes.4)
  </DD>
 </DL>

 <H2>2006/08/12</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _NEW_PAGE(LDP_man-pages, create_module.2)
   _NEW_PAGE(LDP_man-pages, delete_module.2)
   _NEW_PAGE(LDP_man-pages, get_kernel_syms.2)
   _NEW_PAGE(LDP_man-pages, init_module.2)
   _NEW_PAGE(LDP_man-pages, mq_getsetattr.2)
   _NEW_PAGE(LDP_man-pages, query_module.2)
   _NEW_PAGE(LDP_man-pages, adjtime.3)
   _NEW_PAGE(LDP_man-pages, fexecve.3)
   _NEW_PAGE(LDP_man-pages, futimes.3)
   _NEW_PAGE(LDP_man-pages, mq_notify.3)
   _NEW_PAGE(LDP_man-pages, offsetof.3)
   _NEW_PAGE(LDP_man-pages, program_invocation_name.3)
   _NEW_PAGE(LDP_man-pages, rpmatch.3)
   _NEW_PAGE(LDP_man-pages, feature_test_macros.7)
   _UPD_PAGE(LDP_man-pages, adjtimex.2)
   _UPD_PAGE(LDP_man-pages, bind.2)
   _UPD_PAGE(LDP_man-pages, capget.2)
   _UPD_PAGE(LDP_man-pages, epoll_ctl.2)
   _UPD_PAGE(LDP_man-pages, execve.2)
   _UPD_PAGE(LDP_man-pages, gettimeofday.2)
   _UPD_PAGE(LDP_man-pages, intro.2)
   _UPD_PAGE(LDP_man-pages, mmap.2)
   _UPD_PAGE(LDP_man-pages, mount.2)
   _UPD_PAGE(LDP_man-pages, nanosleep.2)
   _UPD_PAGE(LDP_man-pages, poll.2)
   _UPD_PAGE(LDP_man-pages, ptrace.2)
   _UPD_PAGE(LDP_man-pages, readlink.2)
   _UPD_PAGE(LDP_man-pages, rmdir.2)
   _UPD_PAGE(LDP_man-pages, sched_setaffinity.2)
   _UPD_PAGE(LDP_man-pages, sched_setscheduler.2)
   _UPD_PAGE(LDP_man-pages, select.2)
   _UPD_PAGE(LDP_man-pages, select_tut.2)
   _UPD_PAGE(LDP_man-pages, semget.2)
   _UPD_PAGE(LDP_man-pages, sendfile.2)
   _UPD_PAGE(LDP_man-pages, shmctl.2)
   _UPD_PAGE(LDP_man-pages, shmget.2)
   _UPD_PAGE(LDP_man-pages, sigwaitinfo.2)
   _UPD_PAGE(LDP_man-pages, stat.2)
   _UPD_PAGE(LDP_man-pages, statfs.2)
   _UPD_PAGE(LDP_man-pages, truncate.2)
   _UPD_PAGE(LDP_man-pages, umask.2)
   _UPD_PAGE(LDP_man-pages, utime.2)
   _UPD_PAGE(LDP_man-pages, confstr.3)
   _UPD_PAGE(LDP_man-pages, errno.3)
   _UPD_PAGE(LDP_man-pages, fmemopen.3)
   _UPD_PAGE(LDP_man-pages, fopen.3)
   _UPD_PAGE(LDP_man-pages, ftw.3)
   _UPD_PAGE(LDP_man-pages, getline.3)
   _UPD_PAGE(LDP_man-pages, strchr.3)
   _UPD_PAGE(LDP_man-pages, strtod.3)
   _UPD_PAGE(LDP_man-pages, strtol.3)
   _UPD_PAGE(LDP_man-pages, tempnam.3)
   _UPD_PAGE(LDP_man-pages, termios.3)
   _UPD_PAGE(LDP_man-pages, tmpnam.3)
   _UPD_PAGE(LDP_man-pages, core.5)
   _UPD_PAGE(LDP_man-pages, nscd.conf.5)
   _UPD_PAGE(LDP_man-pages, passwd.5)
   _UPD_PAGE(LDP_man-pages, capabilities.7)
   _UPD_PAGE(LDP_man-pages, signal.7)
   _UPD_PAGE(LDP_man-pages, tcp.7)
  </DD>
 </DL>

 <H2>2006/07/20</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, mq_overview.7)
   _UPD_PAGE(LDP_man-pages, capabilities.7)
   _UPD_PAGE(LDP_man-pages, strtoul.3)
   _UPD_PAGE(LDP_man-pages, difftime.3)
   _UPD_PAGE(LDP_man-pages, scandir.3)
   _UPD_PAGE(LDP_man-pages, printf.3)
   _UPD_PAGE(LDP_man-pages, full.4)
  </DD>
 </DL>

 <H2>2006/07/13</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, accept.2)
   _UPD_PAGE(LDP man-pages, fcntl.2)
   _UPD_PAGE(LDP man-pages, getrlimit.2)
   _UPD_PAGE(LDP man-pages, intro.2)
   _UPD_PAGE(LDP man-pages, mremap.2)
   _UPD_PAGE(LDP man-pages, open.2)
   _UPD_PAGE(LDP man-pages, poll.2)
   _UPD_PAGE(LDP man-pages, recv.2)
   _UPD_PAGE(LDP man-pages, sched_setscheduler.2)
   _UPD_PAGE(LDP man-pages, select.2)
   _UPD_PAGE(LDP man-pages, send.2)
   _UPD_PAGE(LDP man-pages, shmop.2)
   _NEW_PAGE(LDP man-pages, mq_close.3)
   _NEW_PAGE(LDP man-pages, mq_getattr.3)
   _NEW_PAGE(LDP man-pages, mq_open.3)
   _NEW_PAGE(LDP man-pages, mq_receive.3)
   _NEW_PAGE(LDP man-pages, mq_send.3)
   _NEW_PAGE(LDP man-pages, mq_unlink.3)
   _NEW_PAGE(LDP man-pages, sem_close.3)
   _NEW_PAGE(LDP man-pages, sem_destroy.3)
   _NEW_PAGE(LDP man-pages, sem_getvalue.3)
   _NEW_PAGE(LDP man-pages, sem_init.3)
   _NEW_PAGE(LDP man-pages, sem_open.3)
   _NEW_PAGE(LDP man-pages, sem_post.3)
   _NEW_PAGE(LDP man-pages, sem_unlink.3)
   _NEW_PAGE(LDP man-pages, sem_wait.3)
   _UPD_PAGE(LDP man-pages, tempnam.3)
   _NEW_PAGE(LDP man-pages, core.5)
   _UPD_PAGE(LDP man-pages, proc.5)
   _UPD_PAGE(LDP man-pages, capabilities.7)
   _NEW_PAGE(LDP man-pages, mq_overview.7)
   _NEW_PAGE(LDP man-pages, sem_overview.7)
  </DD>
 </DL>

 <H2>2006/07/12</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>nfs-utils</DT>
  <DD>
   _NEW_PAGE(nfs-utils, nfsd.7)
   _NEW_PAGE(nfs-utils, nhfsstone.8)
  </DD>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, inotify.7)
   _UPD_PAGE(LDP man-pages, netlink.7)
  </DD>
 </DL>

 <H2>2006/05/29</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>microcode_ctl</DT>
  <DD>
   _NEW_PAGE(microcode_ctl, microcode_ctl.8)
  </DD>
 </DL>

 <H2>2006/05/27</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>nfs-utils</DT>
  <DD>
   _UPD_PAGE(nfs-utils, exports.5)
   _UPD_PAGE(nfs-utils, statd.8)
  </DD>
 </DL>

 <H2>2006/04/16</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, socket.7)
   _UPD_PAGE(LDP_man-pages, unlink.2)
  </DD>
 </DL>

 <H2>2006/04/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, clone.2)
   _UPD_PAGE(LDP man-pages, lseek.2)
   _UPD_PAGE(LDP man-pages, msgop.2)
   _UPD_PAGE(LDP man-pages, fnmatch.3)
   _UPD_PAGE(LDP man-pages, proc.5)
  </DD>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, ascii.7)
   _UPD_PAGE(LDP_man-pages, sched_get_priority_max.2)
   _UPD_PAGE(LDP_man-pages, sched_setparam.2)
  </DD>
 </DL>

 <H2>2006/03/05</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, clone.2)
   _UPD_PAGE(LDP man-pages, fcntl.2)
   _UPD_PAGE(LDP man-pages, mlock.2)
   _UPD_PAGE(LDP man-pages, mmap.2)
   _UPD_PAGE(LDP man-pages, open.2)
   _UPD_PAGE(LDP man-pages, getopt.3)
   _UPD_PAGE(LDP man-pages, openpty.3)
   _UPD_PAGE(LDP man-pages, proc.5)
   _UPD_PAGE(LDP man-pages, locale.7)
  </DD>
 </DL>

 <H2>2006/02/11</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, bind.2)
   _UPD_PAGE(LDP man-pages, capget.2)
   _UPD_PAGE(LDP man-pages, gethostname.2)
   _UPD_PAGE(LDP man-pages, mmap2.2)
   _UPD_PAGE(LDP man-pages, open.2)
   _UPD_PAGE(LDP man-pages, sigaltstack.2)
   _UPD_PAGE(LDP man-pages, dlopen.3)
   _UPD_PAGE(LDP man-pages, fmemopen.3)
   _UPD_PAGE(LDP man-pages, fopen.3)
   _UPD_PAGE(LDP man-pages, fseeko.3)
   _UPD_PAGE(LDP man-pages, gethostbyname.3)
   _UPD_PAGE(LDP man-pages, getopt.3)
   _UPD_PAGE(LDP man-pages, qsort.3)
   _UPD_PAGE(LDP man-pages, proc.5)
  </DD>
 </DL>

 <H2>2006/02/10</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>util-linux</DT>
  <DD>
   _NEW_PAGE(util-linux, tailf.1)
  </DD>
 </DL>

 <H2>2006/02/08</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>procps</DT>
  <DD>
   _UPD_PAGE(procps, top.1)
  </DD>
 </DL>

 <H2>2006/01/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, pipe.2)
   _UPD_PAGE(LDP man-pages, ipv6.7)
  </DD>
  <DT>e2fsprogs</DT>
  <DD>
   _UPD_PAGE(e2fsprogs, blkid.8)
   _UPD_PAGE(e2fsprogs, e2fsck.8)
   _UPD_PAGE(e2fsprogs, e2image.8)
  </DD>
  <DT>nfs-utils</DT>
  <DD>
   _UPD_PAGE(nfs-utils, exportfs.8)
   _UPD_PAGE(nfs-utils, mountd.8)
   _NEW_PAGE(nfs-utils, nhfsgraph.8)
   _NEW_PAGE(nfs-utils, nhfsnums.8)
   _NEW_PAGE(nfs-utils, nhfsrun.8)
  </DD>
 </DL>

 <H2>2006/01/12</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, send.2)
   _UPD_PAGE(LDP man-pages, wait.2)
   _NEW_PAGE(LDP man-pages, fmemopen.3)
   _UPD_PAGE(LDP man-pages, inet.3)
   _NEW_PAGE(LDP man-pages, rexec.3)
   _NEW_PAGE(LDP man-pages, sigpause.3)
   _NEW_PAGE(LDP man-pages, sigset.3)
   _NEW_PAGE(LDP man-pages, sigvec.3)
   _UPD_PAGE(LDP man-pages, strerror.3)
   _UPD_PAGE(LDP man-pages, pipe.7)
   _UPD_PAGE(LDP man-pages, socket.7)
   _UPD_PAGE(LDP man-pages, tcp.7)
   _UPD_PAGE(LDP man-pages, udp.7)
   _UPD_PAGE(LDP man-pages, unix.7)
  </DD>
 </DL>

  _CREDITS

  _BACK_TO_HOME

</BODY>
</HTML>
