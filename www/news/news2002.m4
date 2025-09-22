m4_dnl # news.m4: GNU m4 source for news.html.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_define(`_SUB_ONE',1)m4_dnl
m4_include(../jm_www.m4)
m4_include(../news_macro.m4)
_EDIT_WARNING(index)
_HEADER(`JM 新着情報 (2002 年分)')

_NEWS_INDEX

m4_dnl This is an anchor for ml2cvs. DON'T REMOVE.
m4_dnl ML2CVS ADD HERE
 <H2>2002/12/15</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>ncurses</DT>
  <DD>
   _NEW_PAGE(ncurses, curs_window.3)
  </DD>
 </DL>

 <H2>2002/12/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, tcp.7)
  </DD>
 </DL>

 <H2>2002/12/13</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, getpeername.2)
   _UPD_PAGE(LDP man-pages, mount.2)
   _UPD_PAGE(LDP man-pages, mremap.2)
   _UPD_PAGE(LDP man-pages, msgop.2)
   _UPD_PAGE(LDP man-pages, getipnodebyname.3)
  </DD>
 </DL>

 <H2>2002/12/12</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>netatalk</DT>
  <DD>
   _NEW_PAGE(netatalk, apple_cp.1)
   _NEW_PAGE(netatalk, apple_mv.1)
   _NEW_PAGE(netatalk, apple_rm.1)
   _UPD_PAGE(netatalk, afpd.conf.5)
   _UPD_PAGE(netatalk, afpd.8)
  </DD>
  <DT>sudo</DT>
  <DD>
   _UPD_PAGE(sudo, sudoers.5)
  </DD>
 </DL>

 <H2>2002/11/16</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, proc.5)
  </DD>
 </DL>

 <H2>2002/11/15</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, locale.7)
  </DD>
 </DL>

 <H2>2002/11/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, getdtablesize.2)
  </DD>
  <DT>util-linux</DT>
  <DD>
   _UPD_PAGE(util-linux, nfs.5)
  </DD>
 </DL>

 <H2>2002/11/04</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, open.2)
  </DD>
  <DT>nfs-utils</DT>
  <DD>
   _UPD_PAGE(nfs-utils, exportfs.8)
   _UPD_PAGE(nfs-utils, mountd.8)
  </DD>
 </DL>

 <H2>2002/10/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>modutils</DT>
  <DD>
   _UPD_PAGE(modutils, modinfo.8)
  </DD>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, on_exit.3)
   _UPD_PAGE(LDP man-pages, clock.3)
   _UPD_PAGE(LDP man-pages, assert.3)
   _UPD_PAGE(LDP man-pages, kill.2)
  </DD>
 </DL>

 <H2>2002/10/12</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, madvise.2)
   _UPD_PAGE(LDP man-pages, setlocale.3)
  </DD>
  <DT>SysVinit</DT>
  <DD>
   _UPD_PAGE(SysVinit, mesg.1)
   _UPD_PAGE(SysVinit, wall.1)
   _UPD_PAGE(SysVinit, halt.8)
   _UPD_PAGE(SysVinit, init.8)
   _UPD_PAGE(SysVinit, shutdown.8)
   _NEW_PAGE(SysVinit, sulogin.8)
  </DD>
  <DT>e2fsprogs</DT>
  <DD>
   _UPD_PAGE(e2fsprogs, chattr.1)
   _UPD_PAGE(e2fsprogs, libuuid.3)
   _UPD_PAGE(e2fsprogs, badblocks.8)
   _UPD_PAGE(e2fsprogs, debugfs.8)
   _UPD_PAGE(e2fsprogs, e2fsck.8)
   _NEW_PAGE(e2fsprogs, findfs.8)
   _UPD_PAGE(e2fsprogs, fsck.8)
   _UPD_PAGE(e2fsprogs, mke2fs.8)
   _UPD_PAGE(e2fsprogs, tune2fs.8)
  </DD>
  <DT>nfs-utils</DT>
  <DD>
   _UPD_PAGE(nfs-utils, exports.5)
   _NEW_PAGE(nfs-utils, nfsstat.8)
   _NEW_PAGE(nfs-utils, rquotad.8)
   _NEW_PAGE(nfs-utils, showmount.8)
   _NEW_PAGE(nfs-utils, statd.8)
  </DD>
  <DT>shadow</DT>
  <DD>
   _UPD_PAGE(shadow, chage.1)
   _UPD_PAGE(shadow, chfn.1)
   _UPD_PAGE(shadow, chsh.1)
   _NEW_PAGE(shadow, expiry.1)
   _UPD_PAGE(shadow, gpasswd.1)
   _UPD_PAGE(shadow, groups.1)
   _UPD_PAGE(shadow, id.1)
   _UPD_PAGE(shadow, login.1)
   _UPD_PAGE(shadow, newgrp.1)
   _UPD_PAGE(shadow, passwd.1)
   _UPD_PAGE(shadow, su.1)
   _UPD_PAGE(shadow, pw_auth.3)
   _UPD_PAGE(shadow, shadow.3)
   _UPD_PAGE(shadow, faillog.5)
   _UPD_PAGE(shadow, limits.5)
   _UPD_PAGE(shadow, login.access.5)
   _UPD_PAGE(shadow, login.defs.5)
   _UPD_PAGE(shadow, passwd.5)
   _UPD_PAGE(shadow, porttime.5)
   _UPD_PAGE(shadow, shadow.5)
   _UPD_PAGE(shadow, suauth.5)
   _UPD_PAGE(shadow, chpasswd.8)
   _UPD_PAGE(shadow, dpasswd.8)
   _UPD_PAGE(shadow, faillog.8)
   _UPD_PAGE(shadow, groupadd.8)
   _UPD_PAGE(shadow, groupdel.8)
   _UPD_PAGE(shadow, groupmod.8)
   _UPD_PAGE(shadow, grpck.8)
   _UPD_PAGE(shadow, lastlog.8)
   _UPD_PAGE(shadow, logoutd.8)
   _UPD_PAGE(shadow, mkpasswd.8)
   _UPD_PAGE(shadow, newusers.8)
   _UPD_PAGE(shadow, pwauth.8)
   _UPD_PAGE(shadow, pwck.8)
   _UPD_PAGE(shadow, pwconv.8)
   _UPD_PAGE(shadow, shadowconfig.8)
   _UPD_PAGE(shadow, sulogin.8)
   _UPD_PAGE(shadow, useradd.8)
   _UPD_PAGE(shadow, userdel.8)
   _UPD_PAGE(shadow, usermod.8)
   _UPD_PAGE(shadow, vipw.8)
  </DD>
  <DT>ypserv</DT>
  <DD>
   _UPD_PAGE(ypserv, ypserv.conf.5)
  </DD>
 </DL>

 <H2>2002/10/11</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, accept.2)
   _UPD_PAGE(LDP man-pages, clone.2)
   _UPD_PAGE(LDP man-pages, ioctl.2)
   _UPD_PAGE(LDP man-pages, select.2)
   _UPD_PAGE(LDP man-pages, select_tut.2)
   _UPD_PAGE(LDP man-pages, setfsgid.2)
   _UPD_PAGE(LDP man-pages, setfsuid.2)
   _UPD_PAGE(LDP man-pages, socketpair.2)
   _UPD_PAGE(LDP man-pages, write.2)
   _UPD_PAGE(LDP man-pages, copysign.3)
   _NEW_PAGE(LDP man-pages, ecvt_r.3)
   _NEW_PAGE(LDP man-pages, ether_aton.3)
   _NEW_PAGE(LDP man-pages, gamma.3)
   _UPD_PAGE(LDP man-pages, j0.3)
   _UPD_PAGE(LDP man-pages, lgamma.3)
   _NEW_PAGE(LDP man-pages, qecvt.3)
   _NEW_PAGE(LDP man-pages, signbit.3)
   _NEW_PAGE(LDP man-pages, strverscmp.3)
   _UPD_PAGE(LDP man-pages, system.3)
   _NEW_PAGE(LDP man-pages, tgamma.3)
  </DD>
 </DL>

 <H2>2002/09/19</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, getrlimit.2)
   _UPD_PAGE(LDP man-pages, alloca.3)
   _UPD_PAGE(LDP man-pages, hosts.5)
  </DD>
  <DT>util-linux</DT>
  <DD>
   _UPD_PAGE(util-linux, line.1)
   _UPD_PAGE(util-linux, readprofile.1)
   _UPD_PAGE(util-linux, ipcrm.8)
   _UPD_PAGE(util-linux, mount.8)
  </DD>
 </DL>

 <H2><A NAME="20020915">2002/09/15</A></H2>
 <UL>
  <LI>rpm パッケージのビルドシステムを改善し、ドキュメントを
   _LINK(rpm/index.html,JM RPM/SRPM パッケージ)
   のページにまとめました。
  <LI>rpm を従来の FSSTND 準拠 (/usr/man にインストール) から
   FHS 準拠 (/usr/share/man にインストール) に変更しました。
  <LI>tar.gz アーカイブ付属のインストールスクリプトも、
   インストール先のデフォルトを従来の /usr/man から
   /usr/share/man に変更しました。
 </UL>

 <H2>2002/09/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, getpriority.2)
   _UPD_PAGE(LDP man-pages, shmget.2)
   _UPD_PAGE(LDP man-pages, socket.2)
   _UPD_PAGE(LDP man-pages, truncate.2)
   _UPD_PAGE(LDP man-pages, wait.2)
   _UPD_PAGE(LDP man-pages, times.2)
   _UPD_PAGE(LDP man-pages, dlopen.3)
   _UPD_PAGE(LDP man-pages, getcwd.3)
   _UPD_PAGE(LDP man-pages, printf.3)
   _UPD_PAGE(LDP man-pages, strtol.3)
   _UPD_PAGE(LDP man-pages, strtoul.3)
   _UPD_PAGE(LDP man-pages, sysconf.3)
   _UPD_PAGE(LDP man-pages, ttyname.3)
   _UPD_PAGE(LDP man-pages, iso_8859-1.7)
  </DD>
 </DL>

 <H2>2002/08/20</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>util-linux</DT>
  <DD>
   _UPD_PAGE(util-linux, hwclock.8)
  </DD>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, mmap2.2)
   _UPD_PAGE(LDP man-pages, msgctl.2)
   _UPD_PAGE(LDP man-pages, open.2)
   _NEW_PAGE(LDP man-pages, sigqueue.2)
   _NEW_PAGE(LDP man-pages, syscall.2)
   _UPD_PAGE(LDP man-pages, unlink.2)
   _NEW_PAGE(LDP man-pages, a64l.3)
   _UPD_PAGE(LDP man-pages, clearenv.3)
   _UPD_PAGE(LDP man-pages, lockf.3)
   _UPD_PAGE(LDP man-pages, ld.so.8)
   _UPD_PAGE(LDP man-pages, ldconfig.8)
  </DD>
 </DL>

 <H2>2002/08/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, mmap.2)
   _NEW_PAGE(LDP man-pages, stdio_ext.3)
   _UPD_PAGE(LDP man-pages, services.5)
  </DD>
 </DL>

 <H2>2002/08/07</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, boot.7)
   _NEW_PAGE(LDP man-pages, getfsent.3)
   _UPD_PAGE(LDP man-pages, bootparam.7)
  </DD>
 </DL>

 <H2>2002/07/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, access.2)
  </DD>
 </DL>

 <H2>2002/06/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, shmop.2)
   _NEW_PAGE(LDP man-pages, dirfd.3)
  </DD>
  <DT>rp-pppoe</DT>
  <DD>
   _UPD_PAGE(rp-pppoe, pppoe-server.8)
  </DD>
  <DT>ucd-snmp</DT>
  <DD>
   _NEW_PAGE(ucd-snmp, snmp.conf.5)
   _NEW_PAGE(ucd-snmp, snmpd.conf.5)
  </DD>
  <DT>util-linux</DT>
  <DD>
   _UPD_PAGE(util-linux, cal.1)
   _UPD_PAGE(util-linux, ipcrm.8)
  </DD>
 </DL>

 <H2>2002/06/02</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, select.2)
   _NEW_PAGE(LDP man-pages, select_tut.2)
  </DD>
 </DL>

 <H2>2002/05/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>reiserfsprogs</DT>
  <DD>
   _UPD_PAGE(reiserfsprogs, debugreiserfs.8)
   _UPD_PAGE(reiserfsprogs, mkreiserfs.8)
   _UPD_PAGE(reiserfsprogs, reiserfsck.8)
   _NEW_PAGE(reiserfsprogs, reiserfstune.8)
   _UPD_PAGE(reiserfsprogs, resize_reiserfs.8)
  </DD>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, strtoul.3)
   _UPD_PAGE(LDP man-pages, syslog.3)
   _UPD_PAGE(LDP man-pages, truncate.2)
  </DD>
  <DT>modutils</DT>
  <DD>
   _UPD_PAGE(modutils, depmod.8)
  </DD>
 </DL>

 <H2>2002/04/13</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, man.7)
   _UPD_PAGE(LDP man-pages, environ.5)
   _UPD_PAGE(LDP man-pages, strtol.3)
   _UPD_PAGE(LDP man-pages, strtok.3)
   _UPD_PAGE(LDP man-pages, getcwd.3)
   _UPD_PAGE(LDP man-pages, fopen.3)
   _UPD_PAGE(LDP man-pages, difftime.3)
   _UPD_PAGE(LDP man-pages, getopt.3)
   _UPD_PAGE(LDP man-pages, memchr.3)
   _UPD_PAGE(LDP man-pages, readdir.3)
  </DD>
  <DT>modutils</DT>
  <DD>
   _UPD_PAGE(modutils, rmmod.8)
   _UPD_PAGE(modutils, modprobe.8)
   _UPD_PAGE(modutils, modinfo.8)
   _UPD_PAGE(modutils, lsmod.8)
   _UPD_PAGE(modutils, ksyms.8)
   _UPD_PAGE(modutils, kallsyms.8)
   _UPD_PAGE(modutils, genksyms.8)
  </DD>
  <DT>ucd-snmp</DT>
  <DD>
   _NEW_PAGE(ucd-snmp, snmp_config.5)
  </DD>
  <DT>util-linux</DT>
  <DD>
   _UPD_PAGE(util-linux, hexdump.1)
   _UPD_PAGE(util-linux, fstab.5)
   _UPD_PAGE(util-linux, mount.8)
  </DD>
 </DL>

 <H2>2002/03/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>shadow</DT>
  <DD>
   _UPD_PAGE(shadow, su.1)
   _UPD_PAGE(shadow, lastlog.8)
   _UPD_PAGE(shadow, useradd.8)
   _UPD_PAGE(shadow, userdel.8)
  </DD>
 </DL>

 <H2>2002/03/13</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>lilo</DT>
  <DD>
   _UPD_PAGE(lilo, lilo.8)
  </DD>
  <DT>ucd-snmp</DT>
  <DD>
   _NEW_PAGE(ucd-snmp, snmptrapd.conf.5)
   _NEW_PAGE(ucd-snmp, variables.5)
   _NEW_PAGE(ucd-snmp, snmptrapd.8)
  </DD>
 </DL>

 <H2>2002/02/19</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>nfs-server</DT>
  <DD>
   _UPD_PAGE(nfs-server, exports.5)
   _UPD_PAGE(nfs-server, mountd.8)
   _UPD_PAGE(nfs-server, nfsd.8)
  </DD>
 </DL>

 <H2>2002/02/15</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>net-tools</DT>
  <DD>
   _UPD_PAGE(net-tools, ifconfig.8)
   _NEW_PAGE(net-tools, nameif.8)
  </DD>
  <DT>nfs-server</DT>
  <DD>
   _UPD_PAGE(nfs-server, exports.5)
   _UPD_PAGE(nfs-server, mountd.8)
   _UPD_PAGE(nfs-server, nfsd.8)
  </DD>
  <DT>nfs-utils</DT>
  <DD>
   _NEW_PAGE(nfs-utils, exportfs.8)
   _NEW_PAGE(nfs-utils, lockd.8)
  </DD>
  <DT>sendmail</DT>
  <DD>
   _UPD_PAGE(sendmail, qtool.8)
  </DD>
  <DT>util-linux</DT>
  <DD>
   _UPD_PAGE(util-linux, mount.8)
   _UPD_PAGE(util-linux, umount.8)
  </DD>
  <DT>ypserv</DT>
  <DD>
   _NEW_PAGE(ypserv, yphelper.8)
  </DD>
 </DL>

 <H2>2002/02/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, ldd.1)
   _UPD_PAGE(LDP man-pages, uname.2)
   _NEW_PAGE(LDP man-pages, openpty.3)
   _UPD_PAGE(LDP man-pages, scandir.3)
   _UPD_PAGE(LDP man-pages, stdio.3)
   _UPD_PAGE(LDP man-pages, tsearch.3)
   _NEW_PAGE(LDP man-pages, ld.so.8)
  </DD>
  <DT>lilo</DT>
  <DD>
   _UPD_PAGE(lilo, lilo.8)
   _NEW_PAGE(lilo, mkrescue.8)
  </DD>
 </DL>
 <P>
  JM における smbfs 関連マニュアル (smbmount.8, smbumount.8)
  の配布を終了しました。
  これらの更新版を含む Samba 関連の日本語マニュアルは
  _LINK(http://www.samba.gr.jp/doc/,日本 Smaba ユーザー会)
  から取得できます。
 </P>

 <H2>2002/02/03</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, getsid.2)
   _UPD_PAGE(LDP man-pages, crypt.3)
   _UPD_PAGE(LDP man-pages, mkstemp.3)
  </DD>
 </DL>

 <H2>2002/01/21</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, getloadavg.3)
  </DD>
 </DL>

 <H2>2002/01/15</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>man</DT>
  <DD>
   _UPD_PAGE(man, man.1)
   _NEW_PAGE(man, manlint.1)
  </DD>
 </DL>

 <H2>2002/01/14</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, fcntl.2)
   _NEW_PAGE(LDP man-pages, asprintf.3)
   _NEW_PAGE(LDP man-pages, dprintf.3)
   _NEW_PAGE(LDP man-pages, fpurge.3)
   _NEW_PAGE(LDP man-pages, getdate.3)
   _NEW_PAGE(LDP man-pages, timegm.3)
   _UPD_PAGE(LDP man-pages, hier.7)
   _NEW_PAGE(LDP man-pages, units.7)
   _UPD_PAGE(LDP man-pages, charsets.7)
   _UPD_PAGE(LDP man-pages, charmap.5)
   _UPD_PAGE(LDP man-pages, console_codes.4)
   _UPD_PAGE(LDP man-pages, console.4)
   _UPD_PAGE(LDP man-pages, termios.3)
   _UPD_PAGE(LDP man-pages, strftime.3)
   _UPD_PAGE(LDP man-pages, printf.3)
   _UPD_PAGE(LDP man-pages, initgroups.3)
   _UPD_PAGE(LDP man-pages, getutent.3)
   _UPD_PAGE(LDP man-pages, ffs.3)
   _UPD_PAGE(LDP man-pages, ctime.3)
   _UPD_PAGE(LDP man-pages, truncate.2)
   _UPD_PAGE(LDP man-pages, mount.2)
   _UPD_PAGE(LDP man-pages, kill.2)
   _UPD_PAGE(LDP man-pages, close.2)
   _UPD_PAGE(LDP man-pages, gethostname.2)
   _UPD_PAGE(LDP man-pages, gettimeofday.2)
   _UPD_PAGE(LDP man-pages, open.2)
   _UPD_PAGE(LDP man-pages, select.2)
   _UPD_PAGE(LDP man-pages, semctl.2)
   _UPD_PAGE(LDP man-pages, signal.2)
   _UPD_PAGE(LDP man-pages, catopen.3)
   _UPD_PAGE(LDP man-pages, daemon.3)
   _UPD_PAGE(LDP man-pages, gethostbyname.3)
   _UPD_PAGE(LDP man-pages, hsearch.3)
   _UPD_PAGE(LDP man-pages, strptime.3)
   _UPD_PAGE(LDP man-pages, dir_colors.5)
   _UPD_PAGE(LDP man-pages, proc.5)
   _UPD_PAGE(LDP man-pages, tzselect.8)
   _UPD_PAGE(LDP man-pages, syslog.3)
  </DD>
  <DT>dhcp2</DT>
  <DD>
   _NEW_PAGE(dhcp2, dhcpd.conf.5)
   _NEW_PAGE(dhcp2, dhcpd.leases.5)
   _NEW_PAGE(dhcp2, dhcpd.8)
   _NEW_PAGE(dhcp2, dhcrelay.8)
  </DD>
  <DT>modutils</DT>
  <DD>
   _UPD_PAGE(modutils, depmod.8)
   _UPD_PAGE(modutils, insmod.8)
  </DD>
  <DT>net-tools</DT>
  <DD>
   _UPD_PAGE(net-tools, netstat.8)
  </DD>
  <DT>nfs-utils</DT>
  <DD>
   _NEW_PAGE(nfs-utils, exports.5)
   _NEW_PAGE(nfs-utils, mountd.8)
   _NEW_PAGE(nfs-utils, nfsd.8)
  </DD>
 </DL>

 <H2>2002/01/06</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _NEW_PAGE(LDP man-pages, dysize.3)
   _NEW_PAGE(LDP man-pages, fseeko.3)
   _UPD_PAGE(LDP man-pages, ftok.3)
   _UPD_PAGE(LDP man-pages, tzset.3)
  </DD>
  <DT>modutils</DT>
  <DD>
   _UPD_PAGE(modutils, modules.conf.5)
  </DD>
 </DL>

 <H2>2002/01/05</H2>
 <P>
  以下のファイルを
  _LINK(http://www.jp.freebsd.org/man-jp/,FreeBSD jpman project)
  から寄贈していただきました。
 </P>
 <DL>
  <DT>GNU grep</DT>
  <DD>
   _UPD_PAGE(GNU_grep, grep.1)
  </DD>

  <DT>GNU groff</DT>
  <DD>
   _UPD_PAGE(GNU_groff, addftinfo.1)
   _NEW_PAGE(GNU_groff, afmtodit.1)
   _UPD_PAGE(GNU_groff, eqn.1)
   _UPD_PAGE(GNU_groff, grn.1)
   _UPD_PAGE(GNU_groff, grodvi.1)
   _UPD_PAGE(GNU_groff, groff.1)
   _UPD_PAGE(GNU_groff, grog.1)
   _UPD_PAGE(GNU_groff, grolbp.1)
   _UPD_PAGE(GNU_groff, grolj4.1)
   _UPD_PAGE(GNU_groff, grops.1)
   _UPD_PAGE(GNU_groff, grotty.1)
   _UPD_PAGE(GNU_groff, hpftodit.1)
   _UPD_PAGE(GNU_groff, indxbib.1)
   _UPD_PAGE(GNU_groff, lkbib.1)
   _UPD_PAGE(GNU_groff, lookbib.1)
   _NEW_PAGE(GNU_groff, neqn.1)
   _UPD_PAGE(GNU_groff, nroff.1)
   _UPD_PAGE(GNU_groff, pfbtops.1)
   _UPD_PAGE(GNU_groff, pic.1)
   _UPD_PAGE(GNU_groff, refer.1)
   _UPD_PAGE(GNU_groff, soelim.1)
   _UPD_PAGE(GNU_groff, tbl.1)
   _UPD_PAGE(GNU_groff, tfmtodit.1)
   _UPD_PAGE(GNU_groff, troff.1)
   _UPD_PAGE(GNU_groff, groff_font.5)
   _UPD_PAGE(GNU_groff, groff_out.5)
   _NEW_PAGE(GNU_groff, groff_tmac.5)
   _UPD_PAGE(GNU_groff, groff.7)
   _UPD_PAGE(GNU_groff, groff_char.7)
   _UPD_PAGE(GNU_groff, groff_man.7)
   _NEW_PAGE(GNU_groff, groff_mdoc.7)
   _UPD_PAGE(GNU_groff, groff_me.7)
   _UPD_PAGE(GNU_groff, groff_mm.7)
   _UPD_PAGE(GNU_groff, groff_mmse.7)
   _UPD_PAGE(GNU_groff, groff_ms.7)
   _NEW_PAGE(GNU_groff, groff_mwww.7)
   _UPD_PAGE(GNU_groff, mmroff.7)
   _UPD_PAGE(GNU_groff, roff.7)
  </DD>

  <DT>bsd-games</DT>
  <DD>
   _NEW_PAGE(bsd-games, wump.6)
  </DD>

  <DT>bsd-games-non-free</DT>
  <DD>
   _NEW_PAGE(bsd-games-non-free, hack.6)
  </DD>

  <DT>tcsh</DT>
  <DD>
   _UPD_PAGE(tcsh, tcsh.1)
  </DD>
 </DL>

 <H2>2002/01/01</H2>
 <P>
  以下のファイルを追加・更新しました。
 </P>
 <DL>
  <DT>LDP man-pages</DT>
  <DD>
   _UPD_PAGE(LDP man-pages, man.7)
   _UPD_PAGE(LDP man-pages, rpc.5)
   _UPD_PAGE(LDP man-pages, fs.5)
   _UPD_PAGE(LDP man-pages, environ.5)
   _UPD_PAGE(LDP man-pages, ttyname.3)
   _UPD_PAGE(LDP man-pages, swab.3)
   _UPD_PAGE(LDP man-pages, perror.3)
   _UPD_PAGE(LDP man-pages, ftime.3)
   _UPD_PAGE(LDP man-pages, dlopen.3)
   _UPD_PAGE(LDP man-pages, write.2)
   _UPD_PAGE(LDP man-pages, shmget.2)
   _UPD_PAGE(LDP man-pages, kill.2)
  </DD>
 </DL>

  _CREDITS

  _BACK_TO_HOME

</BODY>
</HTML>
