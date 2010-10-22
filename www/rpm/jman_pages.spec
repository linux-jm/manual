%define rel             @@release@@
%define lang            ja_JP.eucJP
%define mandir          %{buildroot}%{_mandir}/%{lang}
%define compress        gzip

Summary: Japanese manual pages
Name: jman_pages
Version: @@version@@
Release: %{rel}
Source0: http://www.linux.or.jp/JM/man-pages-ja-%{rel}.tar.gz
License: distributable
Group: Documentation
URL: http://www.linux.or.jp/JM/
# Distribution: RedHat linux 5.2J (original PJE)
BuildArchitectures: noarch
Buildroot: /var/tmp/%{name}-root
# in debian, the following line blocks the build process
# BuildRequires: man, perl, %{compress}
Summary: Man (manual) pages from JM project
Summary(ja): Linux 日本語 man ページ

%description
Japanese Manual Pages by JM-Project (Japanese Manual Project). See
http://www.linux.or.jp/JM/ about JM-Project.

  Section 1 = User Commands
  Section 2 = System Calls and error numbers
  Section 3 = Functions in the C libraries
  Section 4 = Device drivers (special Files) (ex. hd, sd)
  Section 5 = File Formats
  Section 6 = Games and other diversions
  Section 7 = Miscellaneous topics (ex. nroff, ascii)
  Section 8 = System maintenance and operation commands

Sometimes the content can differ from Texinfo manual or roff manual
in English. So if unsure reading Japanese manual, please see
%{_defaultdocdir}/%{name}-%{version}/translation_list/ and try other formats.

%description -l ja
JM-Project (Japanese Manual Project)による, 日本語マニュアル・ページです.
JM-Projectについては, http://www.linux.or.jp/JM/ を御覧ください.
また、rpm に関する man ページも追加しています.

各章の構成は英語版と同じく以下のようになっています。

  第 1 章 = ユーザーコマンド
  第 2 章 = システムコール
  第 3 章 = C 言語ライブラリ
  第 4 章 = スペシャルファイル (例: hd, sd)
  第 5 章 = ファイルフォーマットとプロトコル (例: wtmp, /etc/passwd, nfs)
  第 6 章 = ゲーム
  第 7 章 = 約束事, マクロパッケージなど (例: nroff, ascii)
  第 8 章 = システム管理

なお、日本語版マニュアルが、英語版マニュアルや Texinfo 形式のマニュアルに
追従できていない場合があります。

%{_defaultdocdir}/%{name}-%{version}/translation_list/ 以下にインストールされる翻訳
進行状況リストを見て、適宜他の形式のマニュアルの原文に当たってください。

%prep
[ "%{buildroot}" != "/" ] && rm -rf %{buildroot}

%setup -n man-pages-ja-%{rel}

%build

%install
## Start install.sh ################
mkdir -p %{mandir}/man{1,2,3,4,5,6,7,8}
packages=`cat script/pkgs.list \
    | perl -e 'while(<STDIN>){if (/^([^#\s]+\s)\s*Y/){unshift(@s,$1)}} print @s'`

for pkg in $packages; do
    for i in 1 2 3 4 5 6 7 8; do
        if [ -f contrib/$pkg/man$i/*.$i ] ; then
            cp -p contrib/$pkg/man$i/* %{mandir}/man$i/
        fi
        if [ -f manual/$pkg/man$i/*.$i ] ; then
            cp -p manual/$pkg/man$i/* %{mandir}/man$i/
        fi
    done
done

# special file
if [ -f manual/GNU_sh-utils/man1/su.1 ]; then
    cp -a manual/GNU_sh-utils/man1/su.1 %{mandir}/man1/
fi

if [ x%{compress} != x ]; then
    find %{mandir} -type f -print | xargs %{compress}
fi

### copy translation_lists for installation ###
(mkdir translation_list
cd manual
for i in */translation_list ; do
    j=`echo $i | cut -d/ -f1`
    cp -p $i ../translation_list/$j
done
)

%post
( cd %{_mandir} && [ ! -e ja ] && ln -s ja_JP.eucJP ja )
/usr/sbin/makewhatis

%clean
[ "%{buildroot}" != "/" ] && rm -rf %{buildroot}

%files
%defattr(-,root,root)
%doc dist/INSTALL dist/README translation_list
%{_mandir}/%{lang}/*/*

%changelog
* Sun Sep 01 2002 michihito matsubara <m-mitch@mb.kcom.ne.jp> %{version}-%{release}
- refine spec
  - install.sh into spec
  - make symlink to ja, neither directory nor link
  - /usr/man -> %%{_mandir} by default
  - use %%{_defaultdocdir} in %%description
  - replace %%clean macro for removing safely even if rebuild by root privilege
  - add perl to %%BuildRequires:

* Sun Oct 15 2000 Tatsto SEKINE <tsekine@isoternet.org>
- use %{locale_euc_jp}

* Thu Apr 13 2000 Tatsuo SEKINE  <tsekine@isoternet.org>
- include translation list into doc_dir (from Project Vine)
- modify description (from Project Vine)

* Wed Nov 03 1999 Tatsuo SEKINE <tsekine@isoternet.org>
- for man-pages-ja-19991103(JM internal release)

* Wed Oct 27 1999 Laser5 <develop@laser5.co.jp>
- for man-pages-ja-991015

* Fri Jun 11 1999 Yoshitaka Hisabe <hisabe@cdrom.co.jp>
- for man-pages-ja-0.4

* Wed Nov 11 1998 Jun Nishii <nishii@postman.riken.go.jp>
- use -p for makewhatis

* Tue Oct 06 1998 Jun Nishii <nishii@postman.riken.go.jp>
- first release

