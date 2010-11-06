m4_dnl # $Id: manerror.m4,v 1.1 1999/09/08 14:36:09 nakano Exp $
m4_dnl # index.m4: GNU m4 source for index.html.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # [その他に make 時点で依存を参照するファイル]
m4_dnl # jm_www.m4: 各種 M4 マクロ定義ファイル
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_include(jm_www.m4)
_EDIT_WARNING(index)
_HEADER(`内部エラーです')

<P>
 CGI で用いているデータベースがありません。
 申し訳ありませんが復旧までしばらくお待ちください。
 一日程度経っても直らない場合は、恐れ入りますが
 _EMAILME(`_JM_')
 にご連絡をお願いします。
</P>

_CREDITS

_BACK_TO_HOME

</body>
</html>

