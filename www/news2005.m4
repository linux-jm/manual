m4_dnl # news.m4: GNU m4 source for news.html.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_include(jm_www.m4)
_EDIT_WARNING(index)
_HEADER(`JM 新着情報 (2005 年分)')

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
 <H2>2005/12/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>procps</DT>
  <DD>
   _NEW_PAGE(procps, pmap.1)
   _NEW_PAGE(procps, pwdx.1)
   _NEW_PAGE(procps, slabtop.1)
  </DD>
 </DL>

 <H2>2005/12/13</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, kill.2)
   _UPD_PAGE(LDP man-pages, poll.2)
   _UPD_PAGE(LDP man-pages, shmop.2)
   _UPD_PAGE(LDP man-pages, sigpending.2)
   _UPD_PAGE(LDP man-pages, sigsetops.3)
   _UPD_PAGE(LDP man-pages, strftime.3)
   _UPD_PAGE(LDP man-pages, intro.7)
   _UPD_PAGE(LDP man-pages, socket.7)
  </DD>
 </DL>

 <H2>2005/12/04</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, arch_prctl.2)
   _UPD_PAGE(LDP man-pages, execve.2)
   _UPD_PAGE(LDP man-pages, fcntl.2)
   _UPD_PAGE(LDP man-pages, open.2)
   _UPD_PAGE(LDP man-pages, stat.2)
   _UPD_PAGE(LDP man-pages, frexp.3)
   _UPD_PAGE(LDP man-pages, strtok.3)
   _UPD_PAGE(LDP man-pages, proc.5)
  </DD>
 </DL>

 <H2>2005/11/13</H2>
 <UL>
  <LI>LDP man-pages の最新版 2.13 に対応しました。
 </UL>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, getrlimit.2)
   _UPD_PAGE(LDP man-pages, mlock.2)
   _UPD_PAGE(LDP man-pages, path_resolution.2)
   _UPD_PAGE(LDP man-pages, setresuid.2)
   _UPD_PAGE(LDP man-pages, shmget.2)
   _UPD_PAGE(LDP man-pages, sigaltstack.2)
   _UPD_PAGE(LDP man-pages, byteorder.3)
   _UPD_PAGE(LDP man-pages, ftw.3capabilities.7)
  </DD>
 </DL>

 <H2>2005/11/03</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, mprotect.2)
   _UPD_PAGE(LDP man-pages, elf.5)
  </DD>
 </DL>

 <H2>2005/10/30</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, getitimer.2)
   _UPD_PAGE(LDP man-pages, mremap.2)
   _UPD_PAGE(LDP man-pages, outb.2)
   _UPD_PAGE(LDP man-pages, fopen.3)
   _UPD_PAGE(LDP man-pages, getaddrinfo.3)
   _UPD_PAGE(LDP man-pages, inet.3)
   _UPD_PAGE(LDP man-pages, udp.7)
  </DD>
 </DL>

 <H2>2005/10/28</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, getopt.3)
  </DD>
 </DL>

 <H2>2005/10/23</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, fcntl.2)
   _UPD_PAGE(LDP_man-pages, getpriority.2)
   _UPD_PAGE(LDP_man-pages, getrlimit.2)
   _UPD_PAGE(LDP_man-pages, msgctl.2)
   _UPD_PAGE(LDP_man-pages, nice.2)
   _UPD_PAGE(LDP_man-pages, open.2)
   _UPD_PAGE(LDP_man-pages, poll.2)
   _UPD_PAGE(LDP_man-pages, prctl.2)
   _UPD_PAGE(LDP_man-pages, readv.2)
   _UPD_PAGE(LDP_man-pages, remap_file_pages.2)
   _UPD_PAGE(LDP_man-pages, sched_setparam.2)
   _UPD_PAGE(LDP_man-pages, sched_setscheduler.2)
   _UPD_PAGE(LDP_man-pages, semctl.2)
   _UPD_PAGE(LDP_man-pages, shmctl.2)
   _UPD_PAGE(LDP_man-pages, stat.2)
   _UPD_PAGE(LDP_man-pages, getpwnam.3)
   _UPD_PAGE(LDP_man-pages, initrd.4)
   _UPD_PAGE(LDP_man-pages, read.2)
   _UPD_PAGE(LDP_man-pages, write.2)
   _UPD_PAGE(LDP_man-pages, proc.5)
   _NEW_PAGE(LDP_man-pages, pty.7)
   _UPD_PAGE(LDP_man-pages, socket.7)
  </DD>
 </DL>

 <H2>2005/10/16</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, cacheflush.2)
   _UPD_PAGE(LDP_man-pages, connect.2)
   _UPD_PAGE(LDP_man-pages, mmap.2)
   _UPD_PAGE(LDP_man-pages, sigaction.2)
   _NEW_PAGE(LDP_man-pages, sigpending.2)
   _NEW_PAGE(LDP_man-pages, sigprocmask.2)
   _NEW_PAGE(LDP_man-pages, sigsuspend.2)
   _UPD_PAGE(LDP_man-pages, utmp.5)
   _UPD_PAGE(LDP_man-pages, capabilities.7)
   _UPD_PAGE(LDP_man-pages, ip.7)
  </DD>
 </DL>

 <H2>2005/10/15</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>module-init-tools</DT>
  <DD>
   _UPD_PAGE(module-init-tools, insmod.8)
   _UPD_PAGE(module-init-tools, depmod.8)
   _UPD_PAGE(module-init-tools, lsmod.8)
   _UPD_PAGE(module-init-tools, modinfo.8)
   _UPD_PAGE(module-init-tools, modprobe.8)
   _UPD_PAGE(module-init-tools, rmmod.8)
   _UPD_PAGE(module-init-tools, modprobe.conf.5)
   _UPD_PAGE(module-init-tools, modules.dep.5)
  </DD>
 </DL>

 <H2>2005/10/09</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>module-init-tools</DT>
  <DD>
   _NEW_PAGE(module-init-tools, modules.dep.5)
   _NEW_PAGE(module-init-tools, modprobe.conf.5)
   _NEW_PAGE(module-init-tools, modprobe.8)
   _NEW_PAGE(module-init-tools, insmod.8)
   _NEW_PAGE(module-init-tools, depmod.8)
   _NEW_PAGE(module-init-tools, rmmod.8)
   _NEW_PAGE(module-init-tools, modinfo.8)
   _NEW_PAGE(module-init-tools, lsmod.8)
  </DD>
 </DL>

 <H2>2005/10/08</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, sched_setaffinity.2)
   _UPD_PAGE(LDP_man-pages, open.2)
   _UPD_PAGE(LDP_man-pages, scanf.3)
  </DD>
 </DL>

 <H2>2005/09/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, accept.2)
   _UPD_PAGE(LDP_man-pages, clone.2)
   _UPD_PAGE(LDP_man-pages, connect.2)
   _UPD_PAGE(LDP_man-pages, dup.2)
   _UPD_PAGE(LDP_man-pages, fcntl.2)
   _UPD_PAGE(LDP_man-pages, shmctl.2)
   _UPD_PAGE(LDP_man-pages, hosts.5)
   _UPD_PAGE(LDP_man-pages, ip.7)
   _NEW_PAGE(LDP_man-pages, pthreads.7)
   _UPD_PAGE(LDP_man-pages, tcp.7)
  </DD>
 </DL>

 <H2>2005/09/13</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _NEW_PAGE(LDP_man-pages, canonicalize_file_name.3)
   _UPD_PAGE(LDP_man-pages, getaddrinfo.3)
   _UPD_PAGE(LDP_man-pages, epoll_ctl.2)
   _UPD_PAGE(LDP_man-pages, execve.2)
   _UPD_PAGE(LDP_man-pages, flock.2)
   _UPD_PAGE(LDP_man-pages, fsync.2)
   _UPD_PAGE(LDP_man-pages, getrusage.2)
   _UPD_PAGE(LDP_man-pages, mknod.2)
   _UPD_PAGE(LDP_man-pages, mmap.2)
   _UPD_PAGE(LDP_man-pages, mount.2)
   _UPD_PAGE(LDP_man-pages, nice.2)
   _UPD_PAGE(LDP_man-pages, prctl.2)
   _UPD_PAGE(LDP_man-pages, read.2)
   _UPD_PAGE(LDP_man-pages, semop.2)
   _UPD_PAGE(LDP_man-pages, setresuid.2)
   _UPD_PAGE(LDP_man-pages, sigreturn.2)
   _UPD_PAGE(LDP_man-pages, stat.2)
   _UPD_PAGE(LDP_man-pages, syslog.2)
   _UPD_PAGE(LDP_man-pages, truncate.2)
   _UPD_PAGE(LDP_man-pages, umask.2)
   _UPD_PAGE(LDP_man-pages, atexit.3)
   _UPD_PAGE(LDP_man-pages, confstr.3)
   _UPD_PAGE(LDP_man-pages, errno.3)
   _UPD_PAGE(LDP_man-pages, exit.3)
   _UPD_PAGE(LDP_man-pages, fpclassify.3)
   _UPD_PAGE(LDP_man-pages, getgrent.3)
   _UPD_PAGE(LDP_man-pages, getgrnam.3)
   _UPD_PAGE(LDP_man-pages, getpwent.3)
   _UPD_PAGE(LDP_man-pages, getpwnam.3)
   _UPD_PAGE(LDP_man-pages, gets.3)
   _UPD_PAGE(LDP_man-pages, getspnam.3)
   _UPD_PAGE(LDP_man-pages, log2.3)
   _UPD_PAGE(LDP_man-pages, readdir.3)
   _UPD_PAGE(LDP_man-pages, realpath.3)
   _UPD_PAGE(LDP_man-pages, shm_open.3)
   _UPD_PAGE(LDP_man-pages, stdin.3)
  </DD>
 </DL>

 <H2>2005/08/31</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, getaddrinfo.3)
  </DD>
 </DL>

 <H2>2005/08/28</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, clone.2)
   _UPD_PAGE(LDP_man-pages, fcntl.2)
   _UPD_PAGE(LDP_man-pages, semop.2)
   _UPD_PAGE(LDP_man-pages, sendfile.2)
   _UPD_PAGE(LDP_man-pages, uselib.2)
   _UPD_PAGE(LDP_man-pages, strftime.3)
   _UPD_PAGE(LDP_man-pages, man.7)
  </DD>
 </DL>

 <H2>2005/08/25</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>acl</DT>
  <DD>
   _NEW_PAGE(acl, chacl.1)
   _NEW_PAGE(acl, getfacl.1)
   _NEW_PAGE(acl, setfacl.1)
   _NEW_PAGE(acl, acl.5)
  </DD>
  <DT>procps</DT>
  <DD>
   _UPD_PAGE(procps, free.1)
   _UPD_PAGE(procps, kill.1)
   _UPD_PAGE(procps, pgrep.1)
   _UPD_PAGE(procps, ps.1)
   _UPD_PAGE(procps, skill.1)
   _UPD_PAGE(procps, watch.1)
   _UPD_PAGE(procps, sysctl.8)
   _UPD_PAGE(procps, vmstat.8)
  </DD>
 </DL>

 <H2>2005/08/09</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU patch</DT>
  <DD>
   _UPD_PAGE(GNU patch, patch.1)
  </DD>
 </DL>

 <H2>2005/08/07</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>GNU patch</DT>
  <DD>
   _UPD_PAGE(GNU patch, patch.1)
  </DD>
 </DL>

 <H2>2005/07/12</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>autofs</DT>
  <DD>
   _NEW_PAGE(autofs, auto.master.5)
   _NEW_PAGE(autofs, autofs.5)
   _NEW_PAGE(autofs, autofs.8)
   _NEW_PAGE(autofs, automount.8)
  </DD>
 </DL>

 <H2>2005/06/12</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, st.4)
  </DD>
 </DL>

 <H2>2005/06/05</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>util-linux</DT>
  <DD>
   _UPD_PAGE(util-linux, colrm.1)
   _NEW_PAGE(util-linux, mesg.1)
   _NEW_PAGE(util-linux, write.1)
  </DD>
 </DL>

 <H2>2005/06/04</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>e2fsprogs</DT>
  <DD>
   _UPD_PAGE(e2fsprogs, uuid_parse.3)
   _UPD_PAGE(e2fsprogs, uuid_time.3)
   _UPD_PAGE(e2fsprogs, uuid_unparse.3)
   _UPD_PAGE(e2fsprogs, badblocks.8)
   _UPD_PAGE(e2fsprogs, blkid.8)
   _UPD_PAGE(e2fsprogs, debugfs.8)
   _UPD_PAGE(e2fsprogs, e2image.8)
   _UPD_PAGE(e2fsprogs, fsck.8)
   _UPD_PAGE(e2fsprogs, mke2fs.8)
   _UPD_PAGE(e2fsprogs, tune2fs.8)
  </DD>
  <DT>util-linux</DT>
  <DD>
   _NEW_PAGE(util-linux, flock.1)
   _NEW_PAGE(util-linux, pg.1)
   _UPD_PAGE(util-linux, fstab.5)
   _UPD_PAGE(util-linux, cytune.8)
   _UPD_PAGE(util-linux, losetup.8)
   _UPD_PAGE(util-linux, mkswap.8)
   _UPD_PAGE(util-linux, mount.8)
   _UPD_PAGE(util-linux, sfdisk.8)
   _UPD_PAGE(util-linux, swapon.8)
   _UPD_PAGE(util-linux, umount.8)
  </DD>
 </DL>

 <H2>2005/05/31</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>util-linux</DT>
  <DD>
   _NEW_PAGE(util-linux, od.1)
   _NEW_PAGE(util-linux, wall.1)
   _UPD_PAGE(util-linux, rdev.8)
   _UPD_PAGE(util-linux, tunelp.8)
  </DD>
 </DL>

 <H2>2005/05/19</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>vsftpd</DT>
  <DD>
   _NEW_PAGE(vsftpd, vsftpd.conf.5)
  </DD>
 </DL>

 <H2>2005/05/12</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, epoll_create.2)
   _UPD_PAGE(LDP man-pages, epoll_ctl.2)
   _UPD_PAGE(LDP man-pages, epoll_wait.2)
   _UPD_PAGE(LDP man-pages, link.2)
   _UPD_PAGE(LDP man-pages, mincore.2)
   _UPD_PAGE(LDP man-pages, posix_fadvise.2)
   _UPD_PAGE(LDP man-pages, rename.2)
   _UPD_PAGE(LDP man-pages, random.4)
  </DD>
 </DL>

 <H2>2005/05/07</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, getitimer.2)
   _UPD_PAGE(LDP man-pages, times.2)
   _UPD_PAGE(LDP man-pages, strstr.3)
  </DD>
 </DL>

 <H2>2005/04/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, mkdir.2)
   _UPD_PAGE(LDP man-pages, mlock.2)
   _UPD_PAGE(LDP man-pages, outb.2)
  </DD>
 </DL>

 <H2>2005/04/12</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>reiserfsprogs</DT>
  <DD>
   _UPD_PAGE(reiserfsprogs, debugreiserfs.8)
   _UPD_PAGE(reiserfsprogs, mkreiserfs.8)
   _UPD_PAGE(reiserfsprogs, reiserfsck.8)
   _UPD_PAGE(reiserfsprogs, reiserfstune.8)
   _UPD_PAGE(reiserfsprogs, resize_reiserfs.8)
  </DD>
 </DL>

 <H2>2005/04/05</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, syscalls.2)
  </DD>
 </DL>

 <H2>2005/04/03</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, fcntl.2)
  </DD>
 </DL>

 <H2>2005/04/01</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, select.2)
  </DD>
 </DL>

 <H2>2005/03/31</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _NEW_PAGE(LDP_man-pages, capabilities.7)
   _UPD_PAGE(LDP_man-pages, recv.2)
   _UPD_PAGE(LDP_man-pages, select_tut.2)
   _UPD_PAGE(LDP_man-pages, send.2)
   _UPD_PAGE(LDP_man-pages, sendfile.2)
   _UPD_PAGE(LDP_man-pages, sigaction.2)
   _UPD_PAGE(LDP_man-pages, wait.2)
   _UPD_PAGE(LDP_man-pages, dlopen.3)
   _UPD_PAGE(LDP_man-pages, getlogin.3)
   _UPD_PAGE(LDP_man-pages, getmntent.3)
   _UPD_PAGE(LDP_man-pages, getutent.3)
   _UPD_PAGE(LDP_man-pages, malloc.3)
   _UPD_PAGE(LDP_man-pages, perror.3)
   _UPD_PAGE(LDP_man-pages, printf.3)
   _UPD_PAGE(LDP_man-pages, rand.3)
   _UPD_PAGE(LDP_man-pages, sysconf.3)
  </DD>
 </DL>

 <H2>2005/03/26</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>hdparm</DT>
  <DD>
   _NEW_PAGE(hdparm, hdparm.8)
  </DD>
 </DL>

 <H2>2005/03/15</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, bdflush.2)
   _UPD_PAGE(LDP man-pages, bind.2)
   _UPD_PAGE(LDP man-pages, capget.2)
   _UPD_PAGE(LDP man-pages, chdir.2)
   _UPD_PAGE(LDP man-pages, execve.2)
   _UPD_PAGE(LDP man-pages, futex.2)
   _UPD_PAGE(LDP man-pages, getsockname.2)
   _UPD_PAGE(LDP man-pages, getuid.2)
   _UPD_PAGE(LDP man-pages, killpg.2)
   _UPD_PAGE(LDP man-pages, link.2)
   _UPD_PAGE(LDP man-pages, modify_ldt.2)
   _UPD_PAGE(LDP man-pages, mprotect.2)
   _UPD_PAGE(LDP man-pages, pipe.2)
   _UPD_PAGE(LDP man-pages, quotactl.2)
   _UPD_PAGE(LDP man-pages, read.2)
   _UPD_PAGE(LDP man-pages, readlink.2)
   _UPD_PAGE(LDP man-pages, rename.2)
   _UPD_PAGE(LDP man-pages, sched_setparam.2)
   _UPD_PAGE(LDP man-pages, setsid.2)
   _UPD_PAGE(LDP man-pages, sigpause.2)
   _UPD_PAGE(LDP man-pages, swapon.2)
   _UPD_PAGE(LDP man-pages, symlink.2)
   _UPD_PAGE(LDP man-pages, utime.2)
   _UPD_PAGE(LDP man-pages, vhangup.2)
   _UPD_PAGE(LDP man-pages, closedir.3)
   _UPD_PAGE(LDP man-pages, cos.3)
   _UPD_PAGE(LDP man-pages, cosh.3)
   _UPD_PAGE(LDP man-pages, erf.3)
   _UPD_PAGE(LDP man-pages, gcvt.3)
   _UPD_PAGE(LDP man-pages, infnan.3)
   _UPD_PAGE(LDP man-pages, killpg.3)
   _UPD_PAGE(LDP man-pages, profil.3)
   _UPD_PAGE(LDP man-pages, opendir.3)
   _UPD_PAGE(LDP man-pages, regex.3)
   _UPD_PAGE(LDP man-pages, remainder.3)
   _UPD_PAGE(LDP man-pages, resolver.3)
   _UPD_PAGE(LDP man-pages, setenv.3)
   _UPD_PAGE(LDP man-pages, sin.3)
   _UPD_PAGE(LDP man-pages, sinh.3)
   _UPD_PAGE(LDP man-pages, strcat.3)
   _UPD_PAGE(LDP man-pages, telldir.3)
  </DD>
  <DT>file</DT>
  <DD>
   _UPD_PAGE(file, file.1)
  </DD>
 </DL>

 <H2>2005/03/12</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, accept.2)
   _UPD_PAGE(LDP_man-pages, access.2)
   _UPD_PAGE(LDP_man-pages, clone.2)
   _UPD_PAGE(LDP_man-pages, connect.2)
   _UPD_PAGE(LDP_man-pages, flock.2)
   _UPD_PAGE(LDP_man-pages, getpeername.2)
   _UPD_PAGE(LDP_man-pages, getpriority.2)
   _UPD_PAGE(LDP_man-pages, intro.2)
   _UPD_PAGE(LDP_man-pages, ioctl.2)
   _UPD_PAGE(LDP_man-pages, ioperm.2)
   _UPD_PAGE(LDP_man-pages, iopl.2)
   _UPD_PAGE(LDP_man-pages, kill.2)
   _UPD_PAGE(LDP_man-pages, lseek.2)
   _UPD_PAGE(LDP_man-pages, mount.2)
   _UPD_PAGE(LDP_man-pages, msgget.2)
   _UPD_PAGE(LDP_man-pages, msgop.2)
   _NEW_PAGE(LDP_man-pages, readahead.2)
   _UPD_PAGE(LDP_man-pages, rmdir.2)
   _UPD_PAGE(LDP_man-pages, semget.2)
   _UPD_PAGE(LDP_man-pages, semop.2)
   _UPD_PAGE(LDP_man-pages, setfsgid.2)
   _UPD_PAGE(LDP_man-pages, setfsuid.2)
   _UPD_PAGE(LDP_man-pages, shmget.2)
   _UPD_PAGE(LDP_man-pages, stat.2)
   _UPD_PAGE(LDP_man-pages, tkill.2)
   _UPD_PAGE(LDP_man-pages, uselib.2)
   _UPD_PAGE(LDP_man-pages, wait4.2)
   _UPD_PAGE(LDP_man-pages, basename.3)
   _UPD_PAGE(LDP_man-pages, cexp2.3)
   _UPD_PAGE(LDP_man-pages, cproj.3)
   _UPD_PAGE(LDP_man-pages, ctime.3)
   _UPD_PAGE(LDP_man-pages, exec.3)
   _UPD_PAGE(LDP_man-pages, fenv.3)
   _NEW_PAGE(LDP_man-pages, finite.3)
   _UPD_PAGE(LDP_man-pages, getnameinfo.3)
   _UPD_PAGE(LDP_man-pages, isalpha.3)
   _UPD_PAGE(LDP_man-pages, lsearch.3)
   _UPD_PAGE(LDP_man-pages, on_exit.3)
   _UPD_PAGE(LDP_man-pages, ptsname.3)
   _UPD_PAGE(LDP_man-pages, realpath.3)
   _NEW_PAGE(LDP_man-pages, setnetgrent.3)
   _UPD_PAGE(LDP_man-pages, strftime.3)
   _UPD_PAGE(LDP_man-pages, system.3)
   _UPD_PAGE(LDP_man-pages, termios.3)
  </DD>
 </DL>

 <H2>2005/03/11</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>rssh</DT>
  <DD>
   _UPD_PAGE(rssh, rssh.1)
   _UPD_PAGE(rssh, rssh.conf.5)
  </DD>
 </DL>

 <H2>2005/03/10</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, complex.5)
   _UPD_PAGE(LDP_man-pages, hosts.equiv.5)
   _UPD_PAGE(LDP_man-pages, group.5)
   _UPD_PAGE(LDP_man-pages, utmp.5)
   _UPD_PAGE(LDP_man-pages, LDP.7)
   _UPD_PAGE(LDP_man-pages, ascii.7)
   _UPD_PAGE(LDP_man-pages, boot.7)
   _UPD_PAGE(LDP_man-pages, mailaddr.7)
   _UPD_PAGE(LDP_man-pages, man.7)
   _UPD_PAGE(LDP_man-pages, packet.7)
   _UPD_PAGE(LDP_man-pages, signal.7)
   _UPD_PAGE(LDP_man-pages, socket.7)
   _UPD_PAGE(LDP_man-pages, tcp.7)
   _UPD_PAGE(LDP_man-pages, unix.7)
  </DD>
 </DL>

 <H2>2005/02/27</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, nanosleep.2)
   _UPD_PAGE(LDP_man-pages, lookup_dcookie.2)
  </DD>
  <DT>vsftpd</DT>
  <DD>
   _NEW_PAGE(vsftpd, vsftpd.8)
  </DD>
 </DL>

 <H2>2005/02/26</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>procmail</DT>
  <DD>
   _NEW_PAGE(procmail, procmailrc.5)
   _NEW_PAGE(procmail, procmailsc.5)
  </DD>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, cerf.3)
   _UPD_PAGE(LDP_man-pages, clog10.3)
   _UPD_PAGE(LDP_man-pages, clog2.3)
   _UPD_PAGE(LDP_man-pages, mkstemp.3)
   _UPD_PAGE(LDP_man-pages, remainder.3)
   _UPD_PAGE(LDP_man-pages, tzset.3)
   _UPD_PAGE(LDP_man-pages, initgroups.3)
   _UPD_PAGE(LDP_man-pages, gets.3)
   _UPD_PAGE(LDP_man-pages, bsearch.3)
   _UPD_PAGE(LDP_man-pages, inet_ntop.3)
   _UPD_PAGE(LDP_man-pages, shm_open.3)
  </DD>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, tgamma.3)
   _UPD_PAGE(LDP man-pages, gamma.3)
   _UPD_PAGE(LDP man-pages, lgamma.3)
  </DD>
 </DL>

 <H2>2005/02/21</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP_man-pages</DT>
  <DD>
   _UPD_PAGE(LDP_man-pages, undocumented.3)
   _UPD_PAGE(LDP_man-pages, ctan.3)
   _UPD_PAGE(LDP_man-pages, ctanh.3)
  </DD>
 </DL>

 <H2>2005/02/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, acct.2)
   _UPD_PAGE(LDP man-pages, chown.2)
   _UPD_PAGE(LDP man-pages, gettimeofday.2)
   _UPD_PAGE(LDP man-pages, open.2)
   _UPD_PAGE(LDP man-pages, poll.2)
   _UPD_PAGE(LDP man-pages, remap_file_pages.2)
   _UPD_PAGE(LDP man-pages, sched_setaffinity.2)
   _UPD_PAGE(LDP man-pages, semctl.2)
   _UPD_PAGE(LDP man-pages, seteuid.2)
   _UPD_PAGE(LDP man-pages, setresuid.2)
   _UPD_PAGE(LDP man-pages, setreuid.2)
   _UPD_PAGE(LDP man-pages, setuid.2)
   _UPD_PAGE(LDP man-pages, shmctl.2)
   _UPD_PAGE(LDP man-pages, shmop.2)
   _UPD_PAGE(LDP man-pages, signal.2)
   _UPD_PAGE(LDP man-pages, sigqueue.2)
   _UPD_PAGE(LDP man-pages, statfs.2)
   _UPD_PAGE(LDP man-pages, statvfs.2)
   _UPD_PAGE(LDP man-pages, unlink.2)
   _UPD_PAGE(LDP man-pages, ceil.3)
   _UPD_PAGE(LDP man-pages, clock_getres.3)
   _UPD_PAGE(LDP man-pages, fabs.3)
   _UPD_PAGE(LDP man-pages, fclose.3)
   _UPD_PAGE(LDP man-pages, fdim.3)
   _UPD_PAGE(LDP man-pages, floor.3)
   _UPD_PAGE(LDP man-pages, fma.3)
   _UPD_PAGE(LDP man-pages, fmax.3)
   _UPD_PAGE(LDP man-pages, fmin.3)
   _UPD_PAGE(LDP man-pages, fpclassify.3)
   _UPD_PAGE(LDP man-pages, gethostbyname.3)
   _UPD_PAGE(LDP man-pages, getopt.3)
   _UPD_PAGE(LDP man-pages, hsearch.3)
   _UPD_PAGE(LDP man-pages, hypot.3)
   _UPD_PAGE(LDP man-pages, isgreater.3)
   _UPD_PAGE(LDP man-pages, ldexp.3)
   _UPD_PAGE(LDP man-pages, log2.3)
   _UPD_PAGE(LDP man-pages, login.3)
   _UPD_PAGE(LDP man-pages, lrint.3)
   _UPD_PAGE(LDP man-pages, lround.3)
   _UPD_PAGE(LDP man-pages, readdir.3)
   _UPD_PAGE(LDP man-pages, rint.3)
   _UPD_PAGE(LDP man-pages, round.3)
   _UPD_PAGE(LDP man-pages, scandir.3)
   _UPD_PAGE(LDP man-pages, trunc.3)
   _UPD_PAGE(LDP man-pages, epoll.4)
   _UPD_PAGE(LDP man-pages, random.4)
   _UPD_PAGE(LDP man-pages, elf.5)
   _UPD_PAGE(LDP man-pages, proc.5)
   _UPD_PAGE(LDP man-pages, resolv.conf.5)
   _UPD_PAGE(LDP man-pages, ip.7)
   _UPD_PAGE(LDP man-pages, nscd.8)
   _NEW_PAGE(LDP man-pages, exit_group.2)
   _NEW_PAGE(LDP man-pages, getrusage.2)
   _NEW_PAGE(LDP man-pages, path_resolution.2)
   _NEW_PAGE(LDP man-pages, set_tid_address.2)
   _NEW_PAGE(LDP man-pages, INFINITY.3)
   _NEW_PAGE(LDP man-pages, dl_iterate_phdr.3)
   _NEW_PAGE(LDP man-pages, drand48_r.3)
   _NEW_PAGE(LDP man-pages, ilogb.3)
   _NEW_PAGE(LDP man-pages, logb.3)
   _NEW_PAGE(LDP man-pages, lseek64.3)
   _NEW_PAGE(LDP man-pages, posix_openpt.3)
   _NEW_PAGE(LDP man-pages, pow10.3)
   _NEW_PAGE(LDP man-pages, remquo.3)
   _NEW_PAGE(LDP man-pages, scalb.3)
   _NEW_PAGE(LDP man-pages, significand.3)
   _NEW_PAGE(LDP man-pages, ksoftirqd.9)
  </DD>
  <DT>gnumaniak</DT>
  <DD>
   _UPD_PAGE(gnumaniak, gasp.1)
  </DD>
 </DL>

 <H2>2005/01/21</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, sigaltstack.2)
  </DD>
 </DL>

 <H2>2005/01/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, acct.2)
   _UPD_PAGE(LDP man-pages, adjtimex.2)
   _UPD_PAGE(LDP man-pages, chmod.2)
   _UPD_PAGE(LDP man-pages, chown.2)
   _UPD_PAGE(LDP man-pages, chroot.2)
   _UPD_PAGE(LDP man-pages, close.2)
   _UPD_PAGE(LDP man-pages, epoll_create.2)
   _UPD_PAGE(LDP man-pages, epoll_ctl.2)
   _UPD_PAGE(LDP man-pages, fork.2)
   _UPD_PAGE(LDP man-pages, getdomainname.2)
   _UPD_PAGE(LDP man-pages, getgroups.2)
   _UPD_PAGE(LDP man-pages, gethostname.2)
   _UPD_PAGE(LDP man-pages, getrlimit.2)
   _UPD_PAGE(LDP man-pages, gettimeofday.2)
   _UPD_PAGE(LDP man-pages, llseek.2)
   _UPD_PAGE(LDP man-pages, mincore.2)
   _UPD_PAGE(LDP man-pages, mknod.2)
   _UPD_PAGE(LDP man-pages, mmap.2)
   _UPD_PAGE(LDP man-pages, msgctl.2)
   _NEW_PAGE(LDP man-pages, elf.5)
   _NEW_PAGE(LDP man-pages, posixoptions.7)
  </DD>
  <DT>gnumaniak</DT>
  <DD>
   _UPD_PAGE(gnumaniak, gasp.1)
  </DD>
 </DL>

  _CREDITS

  _BACK_TO_HOME

</BODY>
</HTML>
