#!/bin/bash

# 概要
#   本スクリプトは po4a の cfg ファイルと対応する Makefile を自動生成します。
#   これに伴って関連ファイルも自動生成します。処理にあたっては original ディ
#   レクトリ配下に original/man[0-9n]/* という、翻訳対象のオリジナル man ページ
#   が配置済みであることが必要です。
#
#   生成ファイル
#     po4a{,/man[0-9n]}/<package name>.cfg:
#		po4a の cfg ファイル		(上書き生成)
#     Makefile:	cfg ファイルを処理する Makefile	(上書き生成)
#     translation_list.tmp:
#		translation_list 相当の初期テンプレートファイル
#						(上書き生成)
#     po4a/add_ja/copyright/man[0-9n]/<manpage name>.[0-9n].txt:
#		いわゆる"copyright"ファイル	(上書きはしない)
#     def.mk:	パッケージ情報を提供するためのファイル
#		非存在時にはエラー終了しテンプレートを生成する。
#		テンプレート内容を適切に書き換えて再実行する。
#
# 使用方法
#   翻訳パッケージディレクトリ (jm.git/manual/<package name>) にて実行。
#   (manual ディレクトリと同列の support ディレクトリに本スクリプトを配置
#    しており、相対パスで本スクリプトを実行することを前提とする)
#
#   $ cd jm.git/manual/<package name>
#   $ ../../support/genmancfg.sh [options]
#
#   オプションは genmancfg.sh -h の出力を参照してください。
#   ほとんどのオプションは、処理に必要となる名称等を指定するものです。
#   その中で重要なものが -m または -o であり、これは処理タイプを指定します。
#   以下に説明。
#
# 本スクリプトにおける処理タイプ
#   処理にあたっては二種類の po4a 処理タイプに対応します。
#   デフォルト(-m, -o の未指定時) は -m (multi) です。
#   常時これにしておいて (オプション未指定で) 問題はありません。
#
#   これを用いる必要があるケースとして upstream がたった一つの po ファイルを
#   提供していることがあり、それと同調して(upstream への提供も考慮して)
#   たった一つの po ファイルとしたい場合に -o (one) を指定します。
#
# TYPE=one:
#   １つめは処理タイプ one (オプション -o 指定時) です。
#   original ディレクトリ配下の man ページソースに対応づく ja.po を１つだけ作るタイプです。
#
#   (top) --+--original--+--man1
#           |            +--man3
#           |            +--man5
#           +--po4a--+--<package name>.cfg
#                    +--<package name>.pot
#                    +--ja.po
#
# TYPE=multi:
#   ２つめは処理タイプ multi (オプション -m 指定時; オプション未指定時の
#   デフォルト) です。
#   original ディレクトリ配下のサブディレクトリ構造 (man1, man3 など) に合わせて
#   そのサブディレクトリごとに man1/ja.po, man3/ja.po などを分割して作るタイプです。
#
#   (top) --+--original--+--man1
#           |            +--man3
#           |            +--man5
#           +--po4a--+--man1--+--<package name>-man1.cfg
#                    |        +--<package name>-man1.pot
#                    |        +--ja.po
#                    +--man3--+--<package name>-man3.cfg
#                    |        +--<package name>-man3.pot
#                    |        +--ja.po
#                    +--man5--+--<package name>-man5.cfg
#                             +--<package name>-man5.pot
#                             +--ja.po
#
# ----------

THISARGS=$*
THISDATE=`date '+%F'`
THISTOOL=`basename $0`

# 処理タイプを表す変数 TYPE に multi をデフォルト設定する。
# これはオプション引数 -m の指定時に採用されるタイプである。
# オプション引数 -o の指定時には one が設定される。
TYPE=multi

# オプション -h 指定時のヘルプ表示(関数)
usage() {
  echo "Usage: genmancfg.sh [options]"
  echo "  Create po4a config file as TYPE as follows, in po4a directory."
  echo "  This requires the original man sources under the \"original\" directory."
  echo ""
  echo "  options:"
  echo "  -o:     TYPE=one;   for creating only one po file."
  echo "  -m:     TYPE=multi; for creating po files per man sections [default]."
  echo "  -n STR: name of the package [default: basename of the current directory]."
  echo "  -d STR: release date of the package [default: \"YYYY/MM/DD\"]."
  echo "  -v STR: version of the package [default: \"x.xx\"]."
  echo "  -u STR: user name [default: git config --get user.name if exists]."
  echo "  -e STR: email address [default: git config --get user.email if exists]."
  echo "  -U "STR,..": list of commands untranslated [default: ""]."
  echo "  -h:     print this help."
  exit 0
}

# 以下の変数をそれぞれ定める。
#    PACKAGE_NAME: パッケージ名
#    PACKAGE_VER:  パッケージバージョン
#    PACKAGE_DATE: パッケージのリリース日付 ("YYYY/MM/DD" 形式)
# これらは def.mk ファイル内に同名変数定義が行われていれば、それを参照して定める。
# def.mk ファイルが存在しない場合、def.mk のひながたファイルを出力して終了する。
# 上の設定値はそれぞれ、オプション -n (パッケージ名)、-v (バージョン)、-d (リリース
# 日付) により上書き設定できる。
if test -f def.mk; then
  PACKAGE_NAME=`grep "PACKAGE_NAME" def.mk | sed -e "s/.*[ ]*=[ ]*\(.*\)$/\1/"`
  PACKAGE_VER=`grep "PACKAGE_VER" def.mk | sed -e "s/.*[ ]*=[ ]*\(.*\)$/\1/"`
  PACKAGE_DATE=`grep "PACKAGE_DATE" def.mk | sed -e "s/.*[ ]*=[ ]*\(.*\)$/\1/"`
else
  echo "Error: def.mk not found so newly created;"
  echo " process again after editting it correctly."
  cat > def.mk <<"EOF"
PACKAGE_NAME    = sample_package
PACKAGE_VERSION = x.xx
PACKAGE_DATE    = YYYY/MM/DD
EOF
  exit 1
fi

# 当プロジェクトで用いている copyright ファイルに、ユーザー名とメールアドレス
# を書き入れるため、そのデフォルト値を git config の user.{name,email} から設定する。
# git config から取得できなかった場合は、それぞれ "TRANSLATOR NAME", "EMAIL@ADDRESS"
# とする。これはオプション -u (user name), -e (email address) により指定できる。
# (なおメールアドレスが正しい書式を有しているかどうかは確認しない。)
# これらは translation_list の出力項目にも利用する。
USERNAME=`git config --get user.name 2>/dev/null || echo "TRANSLATOR NAME"`
EMAILADDR=`git config --get user.email 2>/dev/null || echo "EMAIL@ADDRESS"`

# po4a cfg の "-o untranslated=xxxxxxx" に指定したいコマンドを
# オプション -U によって指定できるようにしているため、そのオプション値を
# 保持するための以下の変数 UNTRANS_INIT をここで初期化する。
# 下述の $OPT 処理文の中で、オプション -U が指定されていれば設定される。
# roff コマンドの先頭のピリオドは省く。複数指定する場合はカンマで区切る。
# 指定方法を誤ってもエラー処理は行わない。po4a 処理においてエラーとなるのみ。
UNTRANS_INIT=""

# オプション引数を走査して、前述までの各変数を定める。
# 処理タイプは、変数 TYPE に対応値 (one か multi か) を設定する。
# オプション -h 指定時はヘルプ表示、無効なオプション指定時はエラーとする。
while getopts :omn:d:v:u:e:U:h OPT; do
  case $OPT in
     o) TYPE=one;;
     m) TYPE=multi;;
     n) PACKAGE_NAME="$OPTARG";;
     d) RELEASEDATE="$OPTARG";;
     v) VERSION="$OPTARG";;
     u) USERNAME="$OPTARG";;
     e) EMAILADDR="$OPTARG";;
     U) UNTRANS_INIT="$OPTARG";;
     h) usage;;
     *) echo "Illegal option: $OPT"; exit 1;;
  esac
done

# original ディレクトリ配下に original/man[0-9n] のようなサブディレクトリが
# 存在するかどうかをチェックする。この構成でなければエラー終了する。
if ! ls original/man[0-9n] >/dev/null 2>&1; then
  echo "Error: Not exists the original directory or"
  echo "       not contains man[0-9n] subdirectories."
  exit 1
fi

# カレントディレクトリ直下に po4a ディレクトリ生成
mkdir -p po4a

# po4a cfg ファイル内の各処理行に対するオプション指定追加処理
# $d, $f, $CFG_NAME などの変数は、上位処理のものを用いる。
#   $d: man ページディレクトリ名; man1, man3 など。
#   $f: man ファイル名; gcc.1, acl_check.3 など。
#   $CFG_NAME: 出力 cfg 名; gcc-man1.cfg など。
opt_proc_man() {

  # (1) groff_code=verbatim 処理

  # "-o groff_code=verbatim" を宣言すべき roff コマンド候補リストを定義する。
  # (grep に直接受け渡すため、各コマンド(先頭ピリオド除く)を | (縦棒) で区切る。)
  GROFF_CANDIDATES="de|ie"

  # 上のコマンド候補リストがカレントな man ファイルに含まれているか
  # どうかを grep 検索し、該当していれば cfg ファイルに
  # "-o groff_code=verbatim" の宣言を出力する。
  grep "^\.[$GROFF_CANDIDATES]" original/$d/$f >/dev/null 2>&1
  if test $? -eq 0; then
    echo -ne " \\\\\n\topt:\"-o groff_code=verbatim\"" >> $CFG_NAME
  fi

  # (2) generated 処理

  # "-o generated" を宣言すべき記述候補リストを定義する。
  GENERATED_CANDIDATES=(
    "DO NOT EDIT"
    "DO NOT MODIFY THIS FILE"
    "It is generated"
    "Man page generated from reStructuredText."
    "Automatically generated by Pod::Man"
    "Automatically generated from an mdoc"
    "\.\\\\\"Text automatically generated by"
  )

  # 上の記述候補リストのそれぞれがカレントな man ファイルに
  # 含まれているかどうかを順に grep 検索して、含まれていれば cfg ファイルに
  # "-o generated" の宣言を出力する。
  GENERATED=0
  for m in "${GENERATED_CANDIDATES[@]}"; do
    grep "$m" original/$d/$f >/dev/null 2>&1
    if test $? -eq 0; then
      GENERATED=1; break
    fi
  done
  if test $GENERATED -eq 1; then
    echo -ne " \\\\\n\topt:\"-o generated\"" >> $CFG_NAME
  fi

  # (3) untranslated 処理

  # "-o untranslated" を宣言すべきコマンド候補リストを定義する。
  UNTRANS_CANDIDATES="\.\. \.\\\\} 'br\\\\} \.als \.bP \.cc \.cp \.de1 \.do \.el \.el\\\\{. \.end \.ev \.Ex \.FN \.FT \.i \.Id \.ie \.INDENT \.Ip \.it \.LI \.MTO \.NE \.NOP \.NS \.PE \.PS \.Quoted \.rm \.rn \.rr \.Sh \.Sp \.Sx \.tq \.Vb \.UNINDENT \.URL \.Ve \.Xw \.zZ \.zY"

  # 上のコマンド候補リストのそれぞれがカレントな man ファイルに
  # 含まれているかどうかを順に grep 検索して、含まれていれば cfg ファイルに
  # "-o untranslated=XX,YY,ZZ,..." の宣言を出力する。
  UNTRANS=
  for u in $UNTRANS_CANDIDATES; do

    grep "^$u" original/$d/$f >/dev/null 2>&1
    if test $? -eq 0; then
      if test -z "$UNTRANS"; then
        UNTRANS="\\\\\n\topt:\"-o untranslated="
      else
        UNTRANS="$UNTRANS,"
      fi
      CMD=`echo $u | sed "s/^\\\\\.//g"`
      if test "$CMD" = "\."; then
        CMD="."
      fi
      case $CMD in
        \'br\\*) CMD=`echo $CMD\' | sed "s/^\'//"`;;
        *\\*) CMD="'$CMD'";;
      esac

      UNTRANS="$UNTRANS$CMD"
    fi
  done

  # オプション引数 -U によりコマンドラインから untranslated 対象が指定されて
  # いれば "-o untranslated=" 行に追加する。
  if test "$UNTRANS_INIT" != ""; then
    if test -z "$UNTRANS"; then
      UNTRANS="\\\\\n\topt:\"-o untranslated="
    else
      UNTRANS=$UNTRANS,
    fi
    UNTRANS=$UNTRANS$UNTRANS_INIT
  fi

  # untranslated 指定対象が存在していれば cfg ファイルに指定行を出力する。
  if test -n "$UNTRANS"; then
    echo -ne " $UNTRANS\"" >> $CFG_NAME
  fi

  echo >> $CFG_NAME # 最終改行調整
}

# cfg 生成処理 (TYPE=one, multi 共通)
#  (copyright ファイルも同時生成する。)
create_cfg() {

  echo "Creating cfg file:" # 処理進捗出力

  # TYPE=one である場合、cfg ファイルは１つのみをここで作り始める。
  if test $TYPE = one; then
    CFG_NAME=po4a/$PACKAGE_NAME.cfg
    echo "# Created by $THISTOOL, $THISDATE," > $CFG_NAME
    echo "# with argument(s): $THISARGS" >> $CFG_NAME
    echo "[po4a_langs] ja" >> $CFG_NAME
    echo "[po4a_paths] po4a/$PACKAGE_NAME.pot \$lang:po4a/\$lang.po" >> $CFG_NAME
    echo "[po4a_alias: man] man opt:\"-v --previous\" opt_ja:\"-M UTF-8\"" >> $CFG_NAME
  fi

  # original 配下の man[0-9n] サブディレクトリ $d について
  for d in `cd original; ls -d man[0-9n]`; do

    echo -n "  $d: " # 処理進捗出力

    # TYPE=multi である場合、cfg ファイルを man[0-9n] ごとにここから生成する。
    if test $TYPE = multi; then
      mkdir -p po4a/$d
      CFG_NAME=po4a/$d/$PACKAGE_NAME-$d.cfg
      echo "# Created by $THISTOOL, $THISDATE," > $CFG_NAME
      echo "# with argument(s): $THISARGS" >> $CFG_NAME
      echo "[po4a_langs] ja" >> $CFG_NAME
      echo "[po4a_paths] po4a/$d/$PACKAGE_NAME-$d.pot \$lang:po4a/$d/\$lang.po" >> $CFG_NAME
      echo "[po4a_alias: man] man opt:\"-v --previous\" opt_ja:\"-M UTF-8\"" >> $CFG_NAME
    fi

    # original/man[0-9n]  配下の各ファイル $f について
    for f in `cd original/$d; ls *`; do

      echo -n "." # 処理進捗出力

      # ファイルがシンボリックリンクである場合
      if test -L original/$d/$f; then
        : # シンボリックリンクは処理しない
      else
        LINECNT=`grep -v '^\.\\\"' original/$d/$f 2>/dev/null | wc -l | gawk -F" " '{print $1}'`
        SOLINE=`grep -v '^\.\\\"' original/$d/$f 2>/dev/null | sed -n "/^\.so.*/p"`

        # ファイルが ".so manN/*.N" の形式である場合
        if ( test $LINECNT = "0" || test $LINECNT = "1" ) && test -n "$SOLINE"; then
          : # .so １行構成のものは処理しない
        else

          # ファイルが通常の場合 (シンボリックリンクや .so 形式でない場合) cfg 処理行を出力する。
          echo >>$CFG_NAME
          echo     "[type: man] original/$d/$f \$lang:release/$d/$f \\">>$CFG_NAME
          echo -ne "\tadd_\$lang:?po4a/add_\$lang/copyright/$d/$f.txt">>$CFG_NAME

          # po4a の処理設定各行においてオプション指定行を出力する。
          opt_proc_man

          # copyright ファイルの生成 (非存在時のみ)
          if test -f po4a/add_ja/copyright/$d/$f.txt; then
            : # 存在時は何もしない (上書き生成しない)
          else
            # 対象ディレクトリ生成
            mkdir -p po4a/add_ja/copyright/$d

            # コマンド .TH または .Dd が存在するかどうかを取得する。
            FIRST=`grep "^\.TH" original/$d/$f >/dev/null 2>&1 && echo "^\\\\\\\\.TH"`
            if test -z $FIRST; then
              FIRST=`grep "^\.Dd" original/$d/$f >/dev/null 2>&1 && echo "^\\\\\\\\.Dd"`
            fi

            # 上で .TH または .Dd が取得できなかった場合は先頭行を取得。
            if test $FIRST != "^\\\\.TH" && test $FIRST != "^\\\\.Dd"; then
              FIRST=`head -1 original/$d/$f`
            fi

            # copyright ファイルのひながたを出力
            cat > po4a/add_ja/copyright/$d/$f.txt <<"EOF"
PO4A-HEADER: mode=before; position=__FIRST__
.\"
.\" Translated __DATE__
.\"    by __USERNAME__ <__EMAILADDR__>
.\"
EOF

            # 上記生成ファイルに対して変数部分を置換する。
            sed -i -e "s/__FIRST__/$FIRST/" \
                   -e "s/__DATE__/$THISDATE/" \
                   -e "s/__USERNAME__/$USERNAME/" \
                   -e "s/__EMAILADDR__/$EMAILADDR/" \
                po4a/add_ja/copyright/$d/$f.txt
          fi
        fi
      fi
    done

    echo # 処理進捗出力 (最終改行)
  done
}

# TYPE=one 用の Makefile 生成処理
makefile_one() {
  cat > Makefile.tmp <<"EOF"
PACKAGE_NAME = __PACKAGE_NAME__

THRESH = 0
EXTFLAGS =
PO4AFLAGS += -k $(THRESH) $(EXTFLAGS)
PO4ACFG = po4a/$(PACKAGE_NAME).cfg
POFILE  = po4a/ja.po

all: translate

translate:
	po4a $(PO4AFLAGS) $(PO4ACFG)

stat:
	@msgfmt -v --statistics -o /dev/null $(POFILE)

page-stat:
	@echo $(POFILE):
	@po4a --force --no-update -k 0 $(PO4ACFG)

.PHONY: translate stat page-stat
EOF
  sed -e "s/__PACKAGE_NAME__/$PACKAGE_NAME/" Makefile.tmp >Makefile
  rm -f Makefile.tmp
}

# TYPE=one 用の Makefile 生成処理
makefile_multi() {
  cat > Makefile.tmp <<"EOF"
PACKAGE_NAME = __PACKAGE_NAME__
man_numbers = __MAN_NUMBERS__

THRESH = 0
EXTFLAGS =
PO4AFLAGS += -k $(THRESH) $(EXTFLAGS)

target-mans = $(addprefix man,$(man_numbers))
po_dirs     = $(addprefix po4a/,$(target-mans))
po_files    = $(addsuffix /ja.po,$(po_dirs))

all: translate

translate: $(target-mans)

$(target-mans): man%:
	po4a $(PO4AFLAGS) po4a/man$*/$(PACKAGE_NAME)-man$*.cfg

stat:
	@for po in $(po_files); do \
	  msgfmt -v --statistics -o /dev/null $$po; \
	done

page-stat:
	@for n in $(man_numbers); do \
	  if test -f po4a/man$$n/$(PACKAGE_NAME)-man$$n.cfg; then \
	    echo po4a/man$$n/$(PACKAGE_NAME)-man$$n.cfg: ;\
	    po4a --force --no-update -k 0 po4a/man$$n/$(PACKAGE_NAME)-man$$n.cfg | \
	      sed "s/^/  /g" ;\
	  fi \
	done

.PHONY: all translate stat page-stat
EOF
  MAN_NUMBERS=`cd original; ls -dm man[0-9n] | sed -e "s/,//g" -e "s/man//g"`
  sed -e "s/__PACKAGE_NAME__/$PACKAGE_NAME/" \
      -e "s/__MAN_NUMBERS__/$MAN_NUMBERS/" \
    Makefile.tmp >Makefile
  rm -f Makefile.tmp
}

# メイン処理
# 変数 TYPE の設定に応じて、それぞれの処理を行う。
# これによって TYPE に応じた cfg ファイル、Makefile を生成する。
case $TYPE in
  one)   create_cfg; makefile_one;;    # TYPE=one の場合の処理
  multi) create_cfg; makefile_multi;;  # TYPE=multi の場合の処理
esac

# translation_list.tmp 生成処理
rm -f translation_list.tmp

echo "Creating translation_list.tmp file:" # 処理進捗出力

# original 配下の man[0-9n] サブディレクトリ $d について
for d in `cd original; ls -d man[0-9n]`; do

  echo -n "  $d: " # 処理進捗出力

  # original/man[0-9n]  配下の各ファイル $f について
  for f in `cd original/$d; ls *`; do

    echo -n "." # 処理進捗出力

    # ファイルがシンボリックリンクである場合
    if test -L original/$d/$f; then
      LINK=1
      LINK_ITEM=`readlink original/$d/$f | sed -e "s|\(.*\)\.\([1-9].*\)|\1:\2|"`
      echo -n "※:" >>translation_list.tmp # 決め打ちで "※" 出力; "＠"(リンク先翻訳済み)かどうかは判断できない。
    else
      LINECNT=`grep -v '^\.\\\"' original/$d/$f 2>/dev/null | wc -l | gawk -F" " '{print $1}'`
      SOLINE=`grep -v '^\.\\\"' original/$d/$f 2>/dev/null | sed -n "/^\.so .*/p"`

      # ファイルが ".so manN/*.N" の形式である場合
      if ( test $LINECNT = "0" || test $LINECNT = "1" ) && test -n "$SOLINE"; then
        LINK=1
        LINK_ITEM=`echo $SOLINE | sed "s|^\.so man\([0-9n]\)/\(.*\)\..*|\2:\1|"`
        echo -n "※:" >>translation_list.tmp # 決め打ちで "※" 出力; "＠"(リンク先翻訳済み)かどうかは判断できない。
      else
        # ファイルが通常の場合 (シンボリックリンクや .so 形式でない場合)
        LINK=0
        echo -n "▲:" >>translation_list.tmp # 決め打ちで "▲" 出力; "■"(改訂予約)などかどうかは判断できない。
      fi
    fi

    man_sect=`echo $d | sed "s/man//"`
    man_base=`echo $f | sed 's/^\(.*\)\.[^\.]*$/\1/'`

    # translation_list 用に本日日付を再定義
    THISDATE=`date '+%Y/%m/%d'`

    # リンク情報かどうか (LINK 値) の違いを切り分けて translation_list 行を出力する。
    if test $LINK = "0"; then
      echo "$PACKAGE_NAME:$PACKAGE_VER:$PACKAGE_DATE:$man_base:$man_sect:$THISDATE::$EMAILADDR:$USERNAME:" \
        >>translation_list.tmp
    else
      echo "$PACKAGE_NAME:$PACKAGE_VER:$PACKAGE_DATE:$man_base:$man_sect:$LINK_ITEM" \
        >>translation_list.tmp
    fi
  done

  echo # 処理進捗出力 (最終改行)
done

exit 0
