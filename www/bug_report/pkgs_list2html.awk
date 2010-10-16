BEGIN {
  print "    <SELECT NAME=\"package\">";
}

/^[^#]/ {
  printf "\t<OPTION VALUE=\"%s\">%s\n", $1, $1;
}

END {
  print "    </SELECT>";
}
