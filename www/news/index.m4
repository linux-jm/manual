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
 <H2><A NAME="20220614">2022/6/14</A></H2>
  <DL>
  <DT>_LINK(../INDEX/misc.html#qpdf, qpdf 10.6.3 の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(qpdf, fix-qdf.1)
   _NEW_PAGE(qpdf, qpdf.1)
   _NEW_PAGE(qpdf, zlib-flate.1)
  </DD>
 </DL>

 <H2><A NAME="20220613">2022/6/13</A></H2>
  <DL>
  <DT>_LINK(../INDEX/linux.html#upower, upower 0.99.17 の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(upower, upower.1)
   _NEW_PAGE(upower, UPower.7)
   _NEW_PAGE(upower, upowerd.8)
  </DD>
 </DL>

 <H2><A NAME="20220612">2022/6/12</A></H2>
 <DL>
 <DT>_LINK(../INDEX/gnu.html#GNU_grub, GNU grub 2.06 の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(GNU_grub, grub-editenv.1)
   _NEW_PAGE(GNU_grub, grub-file.1)
   _NEW_PAGE(GNU_grub, grub-fstest.1)
   _NEW_PAGE(GNU_grub, grub-glue-efi.1)
   _NEW_PAGE(GNU_grub, grub-kbdcomp.1)
   _NEW_PAGE(GNU_grub, grub-macho2img.1)
   _NEW_PAGE(GNU_grub, grub-menulst2cfg.1)
   _NEW_PAGE(GNU_grub, grub-mkfont.1)
   _NEW_PAGE(GNU_grub, grub-mkimage.1)
   _NEW_PAGE(GNU_grub, grub-mklayout.1)
   _NEW_PAGE(GNU_grub, grub-mknetdir.1)
   _NEW_PAGE(GNU_grub, grub-mkpasswd-pbkdf2.1)
   _NEW_PAGE(GNU_grub, grub-mkrelpath.1)
   _NEW_PAGE(GNU_grub, grub-mkrescue.1)
   _NEW_PAGE(GNU_grub, grub-mkstandalone.1)
   _NEW_PAGE(GNU_grub, grub-mount.1)
   _NEW_PAGE(GNU_grub, grub-render-label.1)
   _NEW_PAGE(GNU_grub, grub-script-check.1)
   _NEW_PAGE(GNU_grub, grub-syslinux2cfg.1)
   _NEW_PAGE(GNU_grub, grub-bios-setup.8)
   _NEW_PAGE(GNU_grub, grub-install.8)
   _NEW_PAGE(GNU_grub, grub-macbless.8)
   _NEW_PAGE(GNU_grub, grub-mkconfig.8)
   _NEW_PAGE(GNU_grub, grub-ofpathname.8)
   _NEW_PAGE(GNU_grub, grub-probe.8)
   _NEW_PAGE(GNU_grub, grub-reboot.8)
   _NEW_PAGE(GNU_grub, grub-set-default.8)
   _NEW_PAGE(GNU_grub, grub-sparc64-setup.8)
  </DD>
 </DL>

 <H2><A NAME="20220611">2022/6/11</A></H2>
  <DL>
  <DT>_LINK(../INDEX/gnu.html#GNU_gdb, GNU gdb 11.2 の翻訳)を追加/更新しました。</DT>
  <DD>
   _UPD_PAGE(GNU_gdb, gdbserver.1)
   _UPD_PAGE(GNU_gdb, gdb.1)
   _NEW_PAGE(GNU_gdb, gdb-add-index.1)
   _NEW_PAGE(GNU_gdb, gcore.1)
   _NEW_PAGE(GNU_gdb, gdbinit.5)
  </DD>
 </DL>

 <H2><A NAME="20220607">2022/6/7</A></H2>
 <DL>
  <DT>_LINK(../INDEX/linux.html#kmod, kmod 29 の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(kmod, depmod.d.5)
   _NEW_PAGE(kmod, modprobe.d.5)
   _NEW_PAGE(kmod, modules.dep.5)
   _NEW_PAGE(kmod, modules.dep.bin.5)
   _NEW_PAGE(kmod, depmod.8)
   _NEW_PAGE(kmod, insmod.8)
   _NEW_PAGE(kmod, kmod.8)
   _NEW_PAGE(kmod, lsmod.8)
   _NEW_PAGE(kmod, modinfo.8)
   _NEW_PAGE(kmod, modprobe.8)
   _NEW_PAGE(kmod, rmmod.8)
  </DD>
 </DL>

 <H2><A NAME="20220606">2022/6/6</A></H2>
  <DL>
  <DT>_LINK(../INDEX/gnu.html#GNU_gsl, GNU gsl 2.7.1 の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(GNU_gsl, gsl-config.1)
   _NEW_PAGE(GNU_gsl, gsl-histogram.1)
   _NEW_PAGE(GNU_gsl, gsl-randist.1)
   _NEW_PAGE(GNU_gsl, gsl.3)
  </DD>
 </DL>

 <H2><A NAME="20220605">2022/6/5</A></H2>
  <DL>
  <DT>_LINK(../INDEX/misc.html#dblatex, dblatex 0.3.12 の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(dblatex, dblatex.1)
  </DD>
 </DL>

 <H2><A NAME="20220604">2022/6/4</A></H2>
  <DL>
  <DT>_LINK(../INDEX/gnu.html#GNU_autoconf, GNU autoconf 2.71 の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(GNU_autoconf, autoconf.1)
   _NEW_PAGE(GNU_autoconf, autoheader.1)
   _NEW_PAGE(GNU_autoconf, autom4te.1)
   _NEW_PAGE(GNU_autoconf, autoreconf.1)
   _NEW_PAGE(GNU_autoconf, autoscan.1)
   _NEW_PAGE(GNU_autoconf, autoupdate.1)
   _NEW_PAGE(GNU_autoconf, ifnames.1)
  </DD>
 </DL>

 <H2><A NAME="20220531">2022/05/31</A></H2>
  <DL>
  <DT>_LINK(../INDEX/misc.html#meson, meson 0.62.1 の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(meson, meson.1)
  </DD>
 </DL>

 <H2><A NAME="20220530">2022/05/30</A></H2>
  <DL>
  <DT>_LINK(../INDEX/misc.html#nginx, nginx 1.21.6 の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(nginx, nginx.8)
  </DD>
 </DL>

 <H2><A NAME="20220529">2022/05/29</A></H2>
  <DL>
  <DT>_LINK(../INDEX/misc.html#xz, xz 5.2.5 の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(xz, lzmainfo.1)
   _NEW_PAGE(xz, xz.1)
   _NEW_PAGE(xz, xzdec.1)
   _NEW_PAGE(xz, xzdiff.1)
   _NEW_PAGE(xz, xzgrep.1)
   _NEW_PAGE(xz, xzless.1)
   _NEW_PAGE(xz, xzmore.1)
  </DD>
 </DL>

 <H2><A NAME="20220528">2022/05/28</A></H2>
  <DL>
  <DT>_LINK(../INDEX/misc.html#itstool, itstool 2.0.7 の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(itstool, itstool.1)
  </DD>
 </DL>

 <H2><A NAME="20220527">2022/5/27</A></H2>
  <DL>
  <DT>_LINK(../INDEX/gnu.html#GNU_which, GNU which の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(GNU_which, which.1)
  </DD>
 </DL>

 <H2><A NAME="20220526">2022/05/26</A></H2>
  <DL>
  <DT>_LINK(../INDEX/misc.html#flex, flex 2.6.4 の翻訳)を更新しました。</DT>
  <DD>
   _UPD_PAGE(flex, flex.1)
  </DD>
 </DL>

 <H2><A NAME="20220525">2022/05/25</A></H2>
 <DL>
  <DT>_LINK(../INDEX/misc.html#bzip2, bzip2 の翻訳)を更新しました。</DT>
  <DD>
   _UPD_PAGE(bzip2, bzdiff.1)
   _UPD_PAGE(bzip2, bzgrep.1)
   _UPD_PAGE(bzip2, bzip2.1)
   _UPD_PAGE(bzip2, bzmore.1)
  </DD>
 </DL>

 <H2><A NAME="20220518">2022/05/18</A></H2>
 <DL>
  <DT>_LINK(../INDEX/misc.html#subversion, subversion 1.14.2 の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(subversion, svn.1)
   _NEW_PAGE(subversion, svnadmin.1)
   _NEW_PAGE(subversion, svndumpfilter.1)
   _NEW_PAGE(subversion, svnlook.1)
   _NEW_PAGE(subversion, svnmucc.1)
   _NEW_PAGE(subversion, svnrdump.1)
   _NEW_PAGE(subversion, svnsync.1)
   _NEW_PAGE(subversion, svnversion.1)
   _NEW_PAGE(subversion, svnserve.conf.5)
   _NEW_PAGE(subversion, svnserve.8)
  </DD>
 </DL>

 <H2><A NAME="20220513">2022/5/13</A></H2>
  <DL>
  <DT>_LINK(../INDEX/gnu.html#GNU_sed, GNU sed の翻訳)を追加しました。</DT>
  <DD>
   _UPD_PAGE(GNU_sed, sed.1)
  </DD>
 </DL>

 <H2><A NAME="20220512">2022/5/12</A></H2>
  <DL>
  <DT>_LINK(../INDEX/gnu.html#GNU_tar, GNU tar の翻訳)を更新しました。</DT>
  <DD>
   _UPD_PAGE(GNU_tar, tar.1)
   _UPD_PAGE(GNU_tar, rmt.8)
  </DD>
 </DL>

 <H2><A NAME="20220511">2022/5/11</A></H2>
  <DL>
  <DT>_LINK(../INDEX/gnu.html#GNU_make, GNU make の翻訳)を更新しました。</DT>
  <DD>
   _UPD_PAGE(GNU_make, make.1)
  </DD>
 </DL>

 <H2><A NAME="20220510">2022/5/10</A></H2>
  <DL>
  <DT>_LINK(../INDEX/gnu.html#GNU_diffutils, GNU diffutils の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(GNU_diffutils, cmp.1)
   _NEW_PAGE(GNU_diffutils, diff.1)
   _NEW_PAGE(GNU_diffutils, diff3.1)
   _NEW_PAGE(GNU_diffutils, sdiff.1)
  </DD>
 </DL>

 <H2><A NAME="20220507">2022/05/07</A></H2>
  <DL>
  <DT>_LINK(../INDEX/gnu.html#GNU_m4, GNU m4 の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(GNU_m4, m4.1)
  </DD>
 </DL>

 <H2><A NAME="20220429">2022/04/29</A></H2>
  <DL>
  <DT>_LINK(../INDEX/gnu.html#GNU_findutils, GNU findutils の翻訳)を更新しました。</DT>
  <DD>
   _UPD_PAGE(GNU_findutils, find.1)
   _UPD_PAGE(GNU_findutils, locate.1)
   _UPD_PAGE(GNU_findutils, updatedb.1)
   _UPD_PAGE(GNU_findutils, xargs.1)
   _UPD_PAGE(GNU_findutils, locatedb.5)
  </DD>
 </DL>

 <H2><A NAME="20220422">2022/04/22</A></H2>
  <DL>
  <DT>_LINK(../INDEX/gnu.html#GNU_bison, GNU bison の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(GNU_bison, bison.1)
   _NEW_PAGE(GNU_bison, yacc.1)
  </DD>
 </DL>

 <H2><A NAME="20220415">2022/04/15</A></H2>
  <DL>
  <DT>_LINK(../INDEX/gnu.html#GNU_automake, GNU automake の翻訳)を追加しました。</DT>
  <DD>
   _NEW_PAGE(GNU_automake, automake-1.16.1)
   _NEW_PAGE(GNU_automake, automake.1)
   _NEW_PAGE(GNU_automake, aclocal-1.16.1)
   _NEW_PAGE(GNU_automake, aclocal.1)
  </DD>
 </DL>

 <H2><A NAME="20220407">2022/04/07</A></H2>
  <DL>
  <DT>_LINK(../INDEX/gnu.html#GNU_dejagnu, GNU dejagnu の翻訳)を公開しました。</DT>
  <DD>
   _NEW_PAGE(GNU_dejagnu, dejagnu-help.1)
   _NEW_PAGE(GNU_dejagnu, dejagnu-report-card.1)
   _NEW_PAGE(GNU_dejagnu, dejagnu.1)
   _NEW_PAGE(GNU_dejagnu, runtest.1)
  </DD>
 </DL>

 <H2><A NAME="20220403">2022/04/03</A></H2>
  <DL>
  <DT>_LINK(../INDEX/gnu.html#GNU_ed, GNU ed の man pages の翻訳)を更新しました。</DT>
  <DD>
   _UPD_PAGE(GNU_ed, ed.1)
  </DD>
 </DL>

 <H2><A NAME="20220331">2022/03/31</A></H2>
  <DL>
  <DT>_LINK(../INDEX/linux.html#at, at 3.2.4 の at.1 の man pages の翻訳)を更新しました。
  なお、at の最新版は 3.2.5 ですが、3.2.4 のマニュアルはそのままお使いいただけます。</DT>
  <DD>
   _UPD_PAGE(at, at.1)
  </DD>
 </DL>

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
