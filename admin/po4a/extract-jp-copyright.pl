#!/usr/bin/env perl

$in_msg = 0;
$done = 0;

print <<'EOF';
PO4A-HEADER: mode=before; position=^\.TH
.\"
EOF

while (<>) {
    next if $done;
    $in_msg = 1 if (/^\.\\".*Japanese/i);
    next if not $in_msg;
    if (not /^\.\\"/) { $in_msg = 0; $done = 0; }
    if (/^\.\\".*WORD:/) { $in_msg = 0; $done = 0; }
    print if $in_msg;
}
