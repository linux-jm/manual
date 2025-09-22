m4_dnl # news.m4: GNU m4 source for news.html.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_define(`_SUB_ONE',1)m4_dnl
m4_include(../jm_www.m4)
m4_include(../news_macro.m4)
_EDIT_WARNING(index)
_HEADER(`JM 新着情報 (2015 年分)')

_NEWS_INDEX

m4_dnl This is an anchor for ml2cvs. DON'T REMOVE.
m4_dnl ML2CVS ADD HERE
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

  _CREDITS

  _BACK_TO_HOME

</BODY>
</HTML>
