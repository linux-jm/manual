m4_dnl # news.m4: GNU m4 source for news.html.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_define(`_SUB_ONE',1)m4_dnl
m4_include(../jm_www.m4)
m4_include(../news_macro.m4)
_EDIT_WARNING(index)
_HEADER(JM 新着情報)

 <DIV CLASS="copyright">
  m4_esyscmd(`date')
 </DIV>

m4_dnl This is an anchor for ml2cvs. DON'T REMOVE.
m4_dnl ML2CVS ADD HERE
 <H2><A NAME="20140424">2014/04/24</A></H2>
 <DL>
  <DT>_LINK(../INDEX/ldp.html,LDP man-pages 3.65 対応版)を公開しました。</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, fcntl.2)
   _UPD_PAGE(LDP_man-pages, mlock.2)
   _UPD_PAGE(LDP_man-pages, msgop.2)
   _UPD_PAGE(LDP_man-pages, personality.2)
   _UPD_PAGE(LDP_man-pages, shmget.2)
   _UPD_PAGE(LDP_man-pages, shmget.2)
  </DD>
  <DD>
   _UPD_PAGE(LDP_man-pages, fexecve.3)
   _UPD_PAGE(LDP_man-pages, getcontext.3)
   _UPD_PAGE(LDP_man-pages, inet.3)
   _UPD_PAGE(LDP_man-pages, makecontext.3)
   _UPD_PAGE(LDP_man-pages, pthread_kill.3)
   _UPD_PAGE(LDP_man-pages, termios.3)
  </DD>
  <DD>
   _UPD_PAGE(LDP_man-pages, credentials.7)
   _UPD_PAGE(LDP_man-pages, libc.7)
   _UPD_PAGE(LDP_man-pages, netdevice.7)
   _UPD_PAGE(LDP_man-pages, socket.7)
  </DD>
 </DL>

 <H2><A NAME="20140420">2014/04/20</A></H2>
 <DL>
  <DT>_LINK(../INDEX/ldp.html,LDP man-pages 3.64 対応版)を公開しました。</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, clock_getres.2)
   _UPD_PAGE(LDP_man-pages, fallocate.2)
   _UPD_PAGE(LDP_man-pages, link.2)
   _UPD_PAGE(LDP_man-pages, lseek.2)
   _UPD_PAGE(LDP_man-pages, open.2)
   _UPD_PAGE(LDP_man-pages, pipe.2)
   _UPD_PAGE(LDP_man-pages, readlink.2)
   _UPD_PAGE(LDP_man-pages, shmctl.2)
  </DD>
  <DD>
   _UPD_PAGE(LDP_man-pages, catopen.3)
   _UPD_PAGE(LDP_man-pages, ctime.3)
   _UPD_PAGE(LDP_man-pages, dlopen.3)
   _UPD_PAGE(LDP_man-pages, duplocale.3)
   _UPD_PAGE(LDP_man-pages, exit.3)
   _UPD_PAGE(LDP_man-pages, fseek.3)
   _UPD_PAGE(LDP_man-pages, fseeko.3)
   _UPD_PAGE(LDP_man-pages, ftw.3)
   _UPD_PAGE(LDP_man-pages, getaddrinfo.3)
   _UPD_PAGE(LDP_man-pages, getdate.3)
   _UPD_PAGE(LDP_man-pages, getline.3)
   _UPD_PAGE(LDP_man-pages, gets.3)
   _UPD_PAGE(LDP_man-pages, isalpha.3)
   _UPD_PAGE(LDP_man-pages, mkfifo.3)
   _UPD_PAGE(LDP_man-pages, printf.3)
   _UPD_PAGE(LDP_man-pages, scanf.3)
   _UPD_PAGE(LDP_man-pages, setjmp.3)
   _UPD_PAGE(LDP_man-pages, strfmon.3)
   _UPD_PAGE(LDP_man-pages, strftime.3)
   _UPD_PAGE(LDP_man-pages, strptime.3)
   _UPD_PAGE(LDP_man-pages, toascii.3)
  </DD>
  <DD>
   _UPD_PAGE(LDP_man-pages, elf.5)
   _UPD_PAGE(LDP_man-pages, nscd.conf.5)
   _UPD_PAGE(LDP_man-pages, resolv.conf.5)
  </DD>
  <DD>
   _UPD_PAGE(LDP_man-pages, locale.7)
   _UPD_PAGE(LDP_man-pages, tcp.7)
  </DD>
 </DL>

 <H2><A NAME="20140414">2014/04/14</A></H2>
 <DL>
  <DT>_LINK(../INDEX/ldp.html,LDP man-pages 3.63 対応版)を公開しました。</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, access.2)
   _UPD_PAGE(LDP_man-pages, alarm.2)
   _UPD_PAGE(LDP_man-pages, capget.2)
   _UPD_PAGE(LDP_man-pages, chmod.2)
   _UPD_PAGE(LDP_man-pages, chown.2)
   _UPD_PAGE(LDP_man-pages, clone.2)
   _UPD_PAGE(LDP_man-pages, close.2)
   _UPD_PAGE(LDP_man-pages, epoll_wait.2)
   _UPD_PAGE(LDP_man-pages, execve.2)
   _UPD_PAGE(LDP_man-pages, fcntl.2)
   _UPD_PAGE(LDP_man-pages, getgroups.2)
   _UPD_PAGE(LDP_man-pages, getrlimit.2)
   _UPD_PAGE(LDP_man-pages, mkdir.2)
   _UPD_PAGE(LDP_man-pages, msgctl.2)
   _UPD_PAGE(LDP_man-pages, poll.2)
   _UPD_PAGE(LDP_man-pages, reboot.2)
   _UPD_PAGE(LDP_man-pages, recv.2)
   _UPD_PAGE(LDP_man-pages, select.2)
   _UPD_PAGE(LDP_man-pages, select_tut.2)
   _UPD_PAGE(LDP_man-pages, send.2)
   _UPD_PAGE(LDP_man-pages, seteuid.2)
   _UPD_PAGE(LDP_man-pages, setfsuid.2)
   _UPD_PAGE(LDP_man-pages, setpgid.2)
   _UPD_PAGE(LDP_man-pages, setreuid.2)
   _UPD_PAGE(LDP_man-pages, sigpending.2)
   _UPD_PAGE(LDP_man-pages, socket.2)
   _UPD_PAGE(LDP_man-pages, stat.2)
   _UPD_PAGE(LDP_man-pages, swapon.2)
   _UPD_PAGE(LDP_man-pages, umount.2)
   _UPD_PAGE(LDP_man-pages, utime.2)
  </DD>
  <DD>
   _UPD_PAGE(LDP_man-pages, atof.3)
   _UPD_PAGE(LDP_man-pages, atoi.3)
   _UPD_PAGE(LDP_man-pages, bsd_signal.3)
   _UPD_PAGE(LDP_man-pages, crypt.3)
   _UPD_PAGE(LDP_man-pages, fexecve.3)
   _UPD_PAGE(LDP_man-pages, fts.3)
   _UPD_PAGE(LDP_man-pages, ftw.3)
   _UPD_PAGE(LDP_man-pages, mbstowcs.3)
   _UPD_PAGE(LDP_man-pages, mkstemp.3)
   _UPD_PAGE(LDP_man-pages, mktemp.3)
   _UPD_PAGE(LDP_man-pages, raise.3)
   _UPD_PAGE(LDP_man-pages, setenv.3)
   _UPD_PAGE(LDP_man-pages, sigpause.3)
   _UPD_PAGE(LDP_man-pages, sigqueue.3)
   _UPD_PAGE(LDP_man-pages, sigsetops.3)
   _UPD_PAGE(LDP_man-pages, sigwait.3)
   _UPD_PAGE(LDP_man-pages, statvfs.3)
   _UPD_PAGE(LDP_man-pages, strerror.3)
   _UPD_PAGE(LDP_man-pages, string.3)
   _UPD_PAGE(LDP_man-pages, strsep.3)
   _UPD_PAGE(LDP_man-pages, strsignal.3)
   _UPD_PAGE(LDP_man-pages, strspn.3)
   _UPD_PAGE(LDP_man-pages, strstr.3)
   _UPD_PAGE(LDP_man-pages, strtod.3)
   _UPD_PAGE(LDP_man-pages, strtoimax.3)
   _UPD_PAGE(LDP_man-pages, strtol.3)
   _UPD_PAGE(LDP_man-pages, strtoul.3)
   _UPD_PAGE(LDP_man-pages, sysv_signal.3)
  </DD>
  <DD>
   _UPD_PAGE(LDP_man-pages, capabilities.7)
   _UPD_PAGE(LDP_man-pages, environ.7)
   _UPD_PAGE(LDP_man-pages, socket.7)
  </DD>
 </DL>

 <H2>2014/04/13</H2>
 <DL>
  <DT>ebtables 2.0.10-4 の翻訳を公開しました。</DT>
  <DD>_NEW_PAGE(ebtables, ebtables.8)</DD>
 </UL>

 <H2>2013/10/14</H2>
 <P>
 _LINK(../INDEX/ldp.html,LDP man-pages 3.54 対応版)を公開しました。
 </P>
 <H2>2013/08/16</H2>
 <DL>
  <DT>_LINK(../INDEX/ldp.html,LDP man-pages 3.53 対応版)を公開しました。</DT>
  <DD>
   _NEW_PAGE(LDP_man-pages, kcmp.2)
   _NEW_PAGE(LDP_man-pages, CPU_SET.3)
   _UPD_PAGE(LDP_man-pages, fchownat.2)
   _UPD_PAGE(LDP_man-pages, fstatat.2)
   _UPD_PAGE(LDP_man-pages, linkat.2)
   _UPD_PAGE(LDP_man-pages, readlinkat.2)
   _UPD_PAGE(LDP_man-pages, proc.5)
   _UPD_PAGE(LDP_man-pages, inotify.7)
   _UPD_PAGE(LDP_man-pages, man-pages.7)
  </DD>
 </DL>

 <H2>2013/05/01</H2>
 <P>
 _LINK(../INDEX/ldp.html,LDP man-pages 3.51 対応版)を公開しました。
 </P>

 <H2>2013/04/30</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU_sed (sed 4.2.2 への更新)</DT>
  <DD>
   _UPD_PAGE(GNU_sed, sed.1)
  </DD>
 </DL>

 <H2>2013/03/25</H2>
 <P>
 _LINK(../INDEX/ldp.html,LDP man-pages 3.50 対応版)を公開しました。
 </P>
 
 <H2>2012/07/07</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>cups (cups 1.5.3 への更新)</DT>
  <DD>
   _NEW_PAGE(cups, cancel.1)
   _NEW_PAGE(cups, lp.1)
   _NEW_PAGE(cups, lpoptions.1)
   _NEW_PAGE(cups, lpq.1)
   _NEW_PAGE(cups, lpr.1)
   _NEW_PAGE(cups, lprm.1)
   _NEW_PAGE(cups, lpstat.1)
   _NEW_PAGE(cups, lpadmin.8)
   _NEW_PAGE(cups, lpc.8)
  </DD>
 </DL>

 <H2>2012/06/04</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, sched_setscheduler.2)
   _NEW_PAGE(LDP_man-pages, setns.2)
   _UPD_PAGE(LDP_man-pages, pthread_cancel.3)
   _NEW_PAGE(LDP_man-pages, pthread_cleanup_push.3)
   _NEW_PAGE(LDP_man-pages, pthread_cleanup_push_defer_np.3)
   _UPD_PAGE(LDP_man-pages, pthread_kill_other_threads_np.3)
   _UPD_PAGE(LDP_man-pages, pthread_setcancelstate.3)
   _UPD_PAGE(LDP_man-pages, proc.5)
  </DD>
 </DL>

 <H2>2012/06/03</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>acl (acl 2.2.51 への更新)</DT>
  <DD>
   _UPD_PAGE(acl, getfacl.1)
   _UPD_PAGE(acl, setfacl.1)
   _UPD_PAGE(acl, acl.5)
  </DD>
  <DT>GNU_gzip (gzip 1.4 への更新)</DT>
  <DD>
   _UPD_PAGE(GNU_gzip, gzexe.1)
   _UPD_PAGE(GNU_gzip, gzip.1)
   _UPD_PAGE(GNU_gzip, zdiff.1)
   _UPD_PAGE(GNU_gzip, zgrep.1)
   _NEW_PAGE(GNU_gzip, zless.1)
   _UPD_PAGE(GNU_gzip, zmore.1)
  </DD>
  <DT>GNU_cpio (cpio 2.11 への更新)</DT>
  <DD>
   _UPD_PAGE(GNU_cpio, cpio.1)
   _UPD_PAGE(GNU_cpio, mt.1)
  </DD>
  <DT>GNU_make (make 3.82 への更新)</DT>
  <DD>
   _UPD_PAGE(GNU_make, make.1)
  </DD>
 </DL>

 <H2>2012/06/02</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU_gdbm (make 1.8.3 への更新)</DT>
  <DD>
   _UPD_PAGE(GNU_gdbm, gdbm.3)
  </DD>
  <DT>GNU_ed (ed 0.5 への更新)</DT>
  <DD>
   _UPD_PAGE(GNU_ed, ed.1)
  </DD>
 </DL>

 <H2>2012/05/31</H2>
 <P>
 _LINK(../INDEX/ldp.html,LDP man-pages 3.41 対応版)を公開しました。
 </P>
 
 <H2>2012/05/09</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>sudo</DT>
  <DD>
   _UPD_PAGE(sudo, sudo.8)
   _UPD_PAGE(sudo, sudoers.5)
   _UPD_PAGE(sudo, sudoers.ldap.5)
   _NEW_PAGE(sudo, sudoreplay.8)
   _UPD_PAGE(sudo, visudo.8)
  </DD>
 </DL>

 <H2>2012/05/03</H2>
 <P>
 _LINK(../INDEX/ldp.html,LDP man-pages 3.40 対応版)を公開しました。
 </P>
 
 <H2>2012/04/21</H2>
 <P>
  _LINK(../INDEX/gnu.html#GNU_coreutils,GNU coreutils 8.16 の翻訳)を公開しました。
  (新規公開のため、ファイルリストは掲載していません)
 </P>

 <H2>2012/04/01</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU_bash</DT>
  <DD>
   _UPD_PAGE(GNU_bash, bash.1)
  </DD>
 </DL>

 <H2><A NAME="OLDNEWS">過去の新着情報</A></H2>
 <UL>
  <LI>_LINK(news2011.html,2011年)
  <LI>_LINK(news2010.html,2010年)
  <LI>_LINK(news2009.html,2009年)
  <LI>_LINK(news2008.html,2008年)
  <LI>_LINK(news2007.html,2007年)
  <LI>_LINK(news2006.html,2006年)
  <LI>_LINK(news2005.html,2005年)
  <LI>_LINK(news2004.html,2004年)
  <LI>_LINK(news2003.html,2003年)
  <LI>_LINK(news2002.html,2002年)
  <LI>_LINK(news2001.html,2001年)
  <LI>_LINK(news2000.html,2000年)
  <LI>_LINK(news1999.html,1999年)
 </UL>

  _CREDITS

  _BACK_TO_HOME

</BODY>
</HTML>
