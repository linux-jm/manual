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
 <H2><A NAME="20210713">2021/07/13</A></H2>
 <DL>
  <DT>_LINK(../INDEX/ldp.html,LDP man-pages 5.10 対応版)を公開しました。</DT>
  <DD>
        _UPD_PAGE(LDP_man-pages, getdents.2)
        _UPD_PAGE(LDP_man-pages, readdir.2)
        _UPD_PAGE(LDP_man-pages, dirfd.3)
        _UPD_PAGE(LDP_man-pages, opendir.3)
        _UPD_PAGE(LDP_man-pages, readdir.3)
        _UPD_PAGE(LDP_man-pages, readdir_r.3)
        _UPD_PAGE(LDP_man-pages, scandir.3)
        _UPD_PAGE(LDP_man-pages, seekdir.3)
        _UPD_PAGE(LDP_man-pages, telldir.3)
        _UPD_PAGE(LDP_man-pages, fifo.7)
  </DD>
 </DL>

 <H2><A NAME="20210623">2021/06/23</A></H2>
 <DL>
  <DT>_LINK(../INDEX/ldp.html,LDP man-pages 5.10 対応版)を公開しました。</DT>
  <DD>
        _UPD_PAGE(LDP_man-pages, abort.3)
        _UPD_PAGE(LDP_man-pages, assert.3)
        _UPD_PAGE(LDP_man-pages, errno.3)
        _UPD_PAGE(LDP_man-pages, error.3)
  </DD>
 </DL>

 <H2><A NAME="20210501">2021/05/01</A></H2>
 <P>
 _LINK(../INDEX/gnu.html#GNU_coreutils,GNU coreutils の翻訳)を 8.32 に更新しました。
 </P>

 <H2><A NAME="20210413">2021/04/13</A></H2>
 <P>
 _LINK(../INDEX/ldp.html,LDP man-pages 5.10 対応版)を公開しました。
 </P>

 <H2><A NAME="20210303">2021/03/03</A></H2>
 <DL>
  <DT>_LINK(../INDEX/linux.html,util-linux 2.36 の dmesg.1 setterm.1 のマニュアル)を公開しました。</DT>
  <DD>
   _UPD_PAGE(util-linux, dmesg.1)
   _UPD_PAGE(util-linux, setterm.1)
  </DD>
 </DL>

 <H2><A NAME="20210119">2021/01/19</A></H2>
 <DL>
  <DT>_LINK(../INDEX/linux.html,util-linux 2.36 の mesg.1 whereis.1 write.1 のマニュアル)を公開しました。</DT>
  <DD>
   _UPD_PAGE(util-linux, mesg.1)
   _UPD_PAGE(util-linux, whereis.1)
   _UPD_PAGE(util-linux, write.1)
  </DD>
 </DL>

 <H2><A NAME="20201222">2020/12/22</A></H2>
 <DL>
  <DT>_LINK(../INDEX/linux.html,util-linux 2.36 の logger.1 renice.1 wall.1 のマニュアル)を公開しました。</DT>
  <DD>
   _UPD_PAGE(util-linux, logger.1)
   _UPD_PAGE(util-linux, renice.1)
   _UPD_PAGE(util-linux, wall.1)
  </DD>
 </DL>

 <H2><A NAME="20201120">2020/11/20</A></H2>
 <DL>
  <DT>_LINK(../INDEX/linux.html,util-linux 2.36 の script.1 scriptreplay.1 scriptlive.1 のマニュアル)を公開しました。</DT>
  <DD>
   _UPD_PAGE(util-linux, script.1)
   _UPD_PAGE(util-linux, scriptreplay.1)
   _NEW_PAGE(util-linux, scriptlive.1)
  </DD>
 </DL>

 <H2><A NAME="20201019">2020/10/19</A></H2>
 <DL>
  <DT>_LINK(../INDEX/linux.html,util-linux 2.35.2 の chfn.1 chsh.1 last.1 のマニュアル)を公開しました。</DT>
  <DD>
   _UPD_PAGE(util-linux, chfn.1)
   _UPD_PAGE(util-linux, chsh.1)
   _UPD_PAGE(util-linux, last.1)
  </DD>
 </DL>

 <H2><A NAME="20201014">2020/10/14</A></H2>
 <DL>
  <DT>_LINK(../INDEX/linux.html,util-linux 2.35.2 の blkid.8 と 2.34 の lsblk.8 のマニュアル)を公開しました。</DT>
  <DD>
   _UPD_PAGE(util-linux, blkid.8)
   _NEW_PAGE(util-linux, lsblk.8)
  </DD>
 </DL>

 <H2><A NAME="20200824">2020/08/24</A></H2>
 <DL>
  <DT>_LINK(../INDEX/linux.html,util-linux 2.35.2 の blockdev.8 partx.8 wipefs.8 のマニュアル)を公開しました。</DT>
  <DD>
   _UPD_PAGE(util-linux, blockdev.8)
   _NEW_PAGE(util-linux, partx.8)
   _NEW_PAGE(util-linux, wipefs.8)
  </DD>
 </DL>

 <H2><A NAME="20200714">2020/07/14</A></H2>
 <DL>
  <DT>_LINK(../INDEX/linux.html,util-linux 2.35.2 の fdisk.8 cfdisk.8 sfdisk.8 のマニュアル)を公開しました。</DT>
  <DD>
   _UPD_PAGE(util-linux, cfdisk.8)
   _UPD_PAGE(util-linux, fdisk.8)
   _UPD_PAGE(util-linux, sfdisk.8)
  </DD>
 </DL>

 <H2><A NAME="20200422">2020/04/22</A></H2>
 <DL>
  <DT>_LINK(../INDEX/linux.html,util-linux 2.34 の getopt.1 と hexdump.1 のマニュアル)を公開しました。</DT>
  <DD>
   _UPD_PAGE(util-linux, getopt.1)
   _UPD_PAGE(util-linux, hexdump.1)
  </DD>
 </DL>

 <H2><A NAME="20200314">2020/03/14</A></H2>
 <DL>
  <DT>_LINK(../INDEX/linux.html,util-linux 2.34 の cal.1 と column.1 のマニュアル)を公開しました。</DT>
  <DD>
   _UPD_PAGE(util-linux, cal.1)
   _UPD_PAGE(util-linux, column.1)
  </DD>
 </DL>

 <H2><A NAME="20200226">2020/02/27</A></H2>
 <DL>
  <DT>_LINK(../INDEX/gnu.html,GNU_tar 1.32 のマニュアル)を公開しました。</DT>
  <DD>
   _UPD_PAGE(GNU_tar, tar.1)
  </DD>
 </DL>

 <H2><A NAME="20180314">2018/03/14</A></H2>
 <DL>
  <DT>_LINK(../INDEX/gnu.html,GNU_findutils 4.6.0 のマニュアル)を公開しました。</DT>
  <DD>
   _UPD_PAGE(GNU_findutils, find.1)
   _UPD_PAGE(GNU_findutils, xargs.1)
  </DD>
 </DL>

 <H2><A NAME="20170326">2017/03/26</A></H2>
 <DL>
  <DT>_LINK(../INDEX/info.html,GNU_coreutils 8.26 の info 版マニュアル)を公開しました。</DT>
  <DD>
   _UPD_PAGE(../info/GNU_coreutils, coreutils-ja)
  </DD>
 </DL>

 <H2><A NAME="20170314">2017/03/14</A></H2>
 <DL>
  <DT>_LINK(../INDEX/gnu.html,GNU_grep 2.27 のマニュアル)を公開しました。</DT>
  <DD>
   _UPD_PAGE(GNU_grep, grep.1)
  </DD>
 </DL>

 <H2><A NAME="20160920">2016/09/20</A></H2>
 <DL>
  <DT>_LINK(../INDEX/misc.html,sudo 1.8.17 のマニュアル)を公開しました。</DT>
  <DD>
   _UPD_PAGE(sudo, sudo.8)
   _UPD_PAGE(sudo, sudoers.5)
   _NEW_PAGE(sudo, sudo.conf.5)
   _UPD_PAGE(sudo, sudoers.ldap.5)
   _UPD_PAGE(sudo, sudoreplay.8)
   _UPD_PAGE(sudo, visudo.8)
  </DD>
 </DL>

 <H2><A NAME="20160219">2016/02/19</A></H2>
 <P>
 _LINK(../INDEX/gnu.html,GNU coreutils の翻訳)を 8.25 に更新しました。
 </P>

 <H2><A NAME="20150812">2015/08/12</A></H2>
 <P>
 _LINK(../download.html#INFO_MANUAL, GNU coreutils 8.22 の info 版マニュアルの翻訳をダウンロード)できるようにしました。
 </P>

 <H2><A NAME="20150205">2015/02/05</A></H2>
 <DL>
  <DT>_LINK(../INDEX/ldp.html,LDP man-pages 3.79 対応版)を公開しました。</DT>
  <DD>
        _NEW_PAGE(LDP_man-pages, sprof.1)
        _NEW_PAGE(LDP_man-pages, add_key.2)
        _NEW_PAGE(LDP_man-pages, delete_module.2)
        _NEW_PAGE(LDP_man-pages, init_module.2)
        _NEW_PAGE(LDP_man-pages, keyctl.2)
        _NEW_PAGE(LDP_man-pages, perfmonctl.2)
        _NEW_PAGE(LDP_man-pages, process_vm_readv.2)
        _NEW_PAGE(LDP_man-pages, request_key.2)
        _UPD_PAGE(LDP_man-pages, socket.2)
        _UPD_PAGE(LDP_man-pages, fflush.3)
        _NEW_PAGE(LDP_man-pages, getauxval.3)
        _NEW_PAGE(LDP_man-pages, mallinfo.3)
        _NEW_PAGE(LDP_man-pages, malloc_get_state.3)
        _NEW_PAGE(LDP_man-pages, malloc_trim.3)
        _UPD_PAGE(LDP_man-pages, tzset.3)
        _NEW_PAGE(LDP_man-pages, cpuid.4)
  </DD>
 </DL>

 <H2><A NAME="20150126">2015/01/26</A></H2>
 <DL>
  <DT>_LINK(../INDEX/ldp.html,LDP man-pages 3.78 対応版)を更新しました。</DT>
  <DD>
    _NEW_PAGE(LDP_man-pages, locale.1)
    _NEW_PAGE(LDP_man-pages, execveat.2)
    _NEW_PAGE(LDP_man-pages, memfd_create.2)
    _NEW_PAGE(LDP_man-pages, open_by_handle_at.2)
    _NEW_PAGE(LDP_man-pages, restart_syscall.2)
    _NEW_PAGE(LDP_man-pages, fopencookie.3)
    _NEW_PAGE(LDP_man-pages, uselocale.3)
    _NEW_PAGE(LDP_man-pages, symlink.7)
    _NEW_PAGE(LDP_man-pages, vdso.7)
    _NEW_PAGE(LDP_man-pages, iconvconfig.8)
  </DD>
  <DD>
    _UPD_PAGE(LDP_man-pages, fcntl.2)
    _UPD_PAGE(LDP_man-pages, prctl.2)
    _UPD_PAGE(LDP_man-pages, fmemopen.3)
    _UPD_PAGE(LDP_man-pages, setlocale.3)
    _UPD_PAGE(LDP_man-pages, locale.5)
    _UPD_PAGE(LDP_man-pages, proc.5)
    _UPD_PAGE(LDP_man-pages, repertoiremap.5)
    _UPD_PAGE(LDP_man-pages, locale.7)
    _UPD_PAGE(LDP_man-pages, zdump.8)
  </DD>
 </DL>

 <H2><A NAME="20150125">2015/01/25</A></H2>
 <DL>
  <DT>_LINK(../INDEX/ldp.html,LDP man-pages 3.78 対応版)を公開しました。</DT>
  <DD>
    _UPD_PAGE(LDP_man-pages, dup.2)
    _UPD_PAGE(LDP_man-pages, execve.2)
    _UPD_PAGE(LDP_man-pages, exit_group.2)
    _UPD_PAGE(LDP_man-pages, fallocate.2)
    _UPD_PAGE(LDP_man-pages, fcntl.2)
    _UPD_PAGE(LDP_man-pages, getrlimit.2)
    _UPD_PAGE(LDP_man-pages, mbind.2)
    _UPD_PAGE(LDP_man-pages, mmap.2)
    _UPD_PAGE(LDP_man-pages, open.2)
    _UPD_PAGE(LDP_man-pages, readv.2)
    _UPD_PAGE(LDP_man-pages, sched_setattr.2)
    _UPD_PAGE(LDP_man-pages, select.2)
    _UPD_PAGE(LDP_man-pages, setns.2)
    _UPD_PAGE(LDP_man-pages, setup.2)
    _UPD_PAGE(LDP_man-pages, shmget.2)
    _UPD_PAGE(LDP_man-pages, sigaction.2)
    _UPD_PAGE(LDP_man-pages, syscall.2)
    _UPD_PAGE(LDP_man-pages, syscalls.2)
    _UPD_PAGE(LDP_man-pages, truncate.2)
    _UPD_PAGE(LDP_man-pages, utimensat.2)
    _UPD_PAGE(LDP_man-pages, write.2)
  </DD>
  <DD>
    _UPD_PAGE(LDP_man-pages, errno.3)
    _UPD_PAGE(LDP_man-pages, exec.3)
    _UPD_PAGE(LDP_man-pages, fclose.3)
    _UPD_PAGE(LDP_man-pages, fexecve.3)
    _UPD_PAGE(LDP_man-pages, gwtpw.3)
    _UPD_PAGE(LDP_man-pages, malloc_info.3)
    _UPD_PAGE(LDP_man-pages, posix_fallocate.3)
    _UPD_PAGE(LDP_man-pages, shm_open.3)
  </DD>
 </DL>

 <H2><A NAME="20150118">2015/01/18</A></H2>
 <DL>
  <DT>_LINK(../INDEX/ldp.html,LDP man-pages 3.77 対応版)を更新しました。</DT>
  <DD>
    _NEW_PAGE(LDP_man-pages, iconv.1)
    _UPD_PAGE(LDP_man-pages, adjtimex.2)
    _NEW_PAGE(LDP_man-pages, fanotify_mark.2)
    _UPD_PAGE(LDP_man-pages, fcntl.2)
    _UPD_PAGE(LDP_man-pages, futimesat.2)
    _UPD_PAGE(LDP_man-pages, sigreturn.2)
    _NEW_PAGE(LDP_man-pages, utimensat.2)
    _UPD_PAGE(LDP_man-pages, proc.5)
  </DD>
 </DL>

 <H2><A NAME="20150112">2015/01/12</A></H2>
 <DL>
  <DT>_LINK(../INDEX/ldp.html,LDP man-pages 3.77 対応版)を更新しました。</DT>
  <DD>
    _NEW_PAGE(LDP_man-pages, memusage.1)
    _NEW_PAGE(LDP_man-pages, memusagestat.1)
    _NEW_PAGE(LDP_man-pages, mtrace.1)
    _NEW_PAGE(LDP_man-pages, pldd.1)
    _NEW_PAGE(LDP_man-pages, getaddrinfo_a.3)
    _NEW_PAGE(LDP_man-pages, inet_net_pton.3)
    _UPD_PAGE(LDP_man-pages, random.4)
    _NEW_PAGE(LDP_man-pages, nss.5)
    _NEW_PAGE(LDP_man-pages, user_namespaces.7)
  </DD>
 </DL>

 <H2><A NAME="20150111">2015/01/11</A></H2>
 <DL>
  <DT>_LINK(../INDEX/ldp.html,LDP man-pages 3.77 対応版)を公開しました。</DT>
  <DD>
    _NEW_PAGE(LDP_man-pages, fanotify_init.2)
    _UPD_PAGE(LDP_man-pages, posix_fadvise.2)
    _UPD_PAGE(LDP_man-pages, remap_file_pages.2)
    _UPD_PAGE(LDP_man-pages, setns.2)
    _UPD_PAGE(LDP_man-pages, sigaction.2)
    _UPD_PAGE(LDP_man-pages, syslog.2)
    _UPD_PAGE(LDP_man-pages, memcmp.3)
    _UPD_PAGE(LDP_man-pages, pthread_tryjoin_np.3)
    _UPD_PAGE(LDP_man-pages, mem.4)
    _UPD_PAGE(LDP_man-pages, random.4)
    _UPD_PAGE(LDP_man-pages, netlink.7)
    _UPD_PAGE(LDP_man-pages, pid_namespaces.7)
    _NEW_PAGE(LDP_man-pages, fanotify.7)
    _UPD_PAGE(LDP_man-pages, tcp.7)
  </DD>
 </DL>

 <H2><A NAME="20150109">2015/01/09</A></H2>
 <DL>
  <DT>_LINK(../INDEX/ldp.html,LDP man-pages 3.76 対応版)を更新しました。</DT>
  <DD>
    _UPD_PAGE(LDP_man-pages, getrlimit.2)
    _UPD_PAGE(LDP_man-pages, open.2)
    _UPD_PAGE(LDP_man-pages, read.2)
    _UPD_PAGE(LDP_man-pages, rename.2)
    _NEW_PAGE(LDP_man-pages, sched_setattr.2)
    _UPD_PAGE(LDP_man-pages, sched_setscheduler.2)
    _UPD_PAGE(LDP_man-pages, write.2)
    _UPD_PAGE(LDP_man-pages, printf.3)
    _NEW_PAGE(LDP_man-pages, pid_namespaces.7)
    _NEW_PAGE(LDP_man-pages, sched.7)
    _UPD_PAGE(LDP_man-pages, signal.7)
    _UPD_PAGE(LDP_man-pages, unix.7)
  </DD>
 </DL>

 <H2><A NAME="20150107">2015/01/07</A></H2>
 <DL>
  <DT>_LINK(../INDEX/ldp.html,LDP man-pages 3.76 対応版)を公開しました。</DT>
  <DD>
    _NEW_PAGE(LDP_man-pages, group_member.3)
    _NEW_PAGE(LDP_man-pages, isfdtype.3)
    _NEW_PAGE(LDP_man-pages, pthread_rwlockattr_setkind_np.3)
    _NEW_PAGE(LDP_man-pages, namespaces.7)
  </DD>
  <DD>
    _UPD_PAGE(LDP_man-pages, clock_nanosleep.2)
    _UPD_PAGE(LDP_man-pages, clone.2)
    _UPD_PAGE(LDP_man-pages, create_module.2)
    _UPD_PAGE(LDP_man-pages, dup.2)
    _UPD_PAGE(LDP_man-pages, epoll_ctl.2)
    _UPD_PAGE(LDP_man-pages, execve.2)
    _UPD_PAGE(LDP_man-pages, fallocate.2)
    _UPD_PAGE(LDP_man-pages, getitimer.2)
    _UPD_PAGE(LDP_man-pages, getpriority.2)
    _UPD_PAGE(LDP_man-pages, getrlimit.2)
    _UPD_PAGE(LDP_man-pages, inotify_add_watch.2)
    _UPD_PAGE(LDP_man-pages, kexec_load.2)
    _UPD_PAGE(LDP_man-pages, link.2)
    _UPD_PAGE(LDP_man-pages, lseek.2)
    _UPD_PAGE(LDP_man-pages, madvise.2)
    _UPD_PAGE(LDP_man-pages, pipe.2)
    _UPD_PAGE(LDP_man-pages, poll.2)
    _UPD_PAGE(LDP_man-pages, query_module.2)
    _UPD_PAGE(LDP_man-pages, readlink.2)
    _UPD_PAGE(LDP_man-pages, readv.2)
    _UPD_PAGE(LDP_man-pages, rename.2)
    _UPD_PAGE(LDP_man-pages, sched_setaffinity.2)
    _UPD_PAGE(LDP_man-pages, seteuid.2)
    _UPD_PAGE(LDP_man-pages, setgid.2)
    _UPD_PAGE(LDP_man-pages, setns.2)
    _UPD_PAGE(LDP_man-pages, setresuid.2)
    _UPD_PAGE(LDP_man-pages, setreuid.2)
    _UPD_PAGE(LDP_man-pages, setsid.2)
    _UPD_PAGE(LDP_man-pages, setuid.2)
    _UPD_PAGE(LDP_man-pages, sgetmask.2)
    _UPD_PAGE(LDP_man-pages, shmget.2)
    _UPD_PAGE(LDP_man-pages, shmop.2)
    _UPD_PAGE(LDP_man-pages, sigaction.2)
    _UPD_PAGE(LDP_man-pages, sigwaitinfo.2)
    _UPD_PAGE(LDP_man-pages, splice.2)
    _UPD_PAGE(LDP_man-pages, statfs.2)
    _UPD_PAGE(LDP_man-pages, symlink.2)
    _UPD_PAGE(LDP_man-pages, tee.2)
    _UPD_PAGE(LDP_man-pages, unlink.2)
    _UPD_PAGE(LDP_man-pages, unshare.2)
    _UPD_PAGE(LDP_man-pages, vmsplice.2)
  </DD>
  <DD>
    _UPD_PAGE(LDP_man-pages, ether_aton.3)
    _UPD_PAGE(LDP_man-pages, fseeko.3)
    _UPD_PAGE(LDP_man-pages, ftw.3)
    _UPD_PAGE(LDP_man-pages, getgrent.3)
    _UPD_PAGE(LDP_man-pages, getnameinfo.3)
    _UPD_PAGE(LDP_man-pages, lseek64.3)
    _UPD_PAGE(LDP_man-pages, mq_getattr.3)
    _UPD_PAGE(LDP_man-pages, mq_open.3)
    _UPD_PAGE(LDP_man-pages, perror.3)
    _UPD_PAGE(LDP_man-pages, siginterrupt.3)
    _UPD_PAGE(LDP_man-pages, sigvec.3)
    _UPD_PAGE(LDP_man-pages, tzset.3)
  </DD>
  <DD>
    _UPD_PAGE(LDP_man-pages, charmap.5)
    _UPD_PAGE(LDP_man-pages, resolv.conf.5)
  </DD>
  <DD>
    _UPD_PAGE(LDP_man-pages, capabilities.7)
    _UPD_PAGE(LDP_man-pages, epoll.7)
    _UPD_PAGE(LDP_man-pages, inotify.7)
    _UPD_PAGE(LDP_man-pages, ip.7)
    _UPD_PAGE(LDP_man-pages, mq_overview.7)
    _UPD_PAGE(LDP_man-pages, packet.7)
    _UPD_PAGE(LDP_man-pages, svipc.7)
  </DD>
 </DL>

 <H2><A NAME="OLDNEWS">過去の新着情報</A></H2>
 <UL>
  <LI>_LINK(news2014.html,2014年)
  <LI>_LINK(news2013.html,2013年)
  <LI>_LINK(news2012.html,2012年)
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
