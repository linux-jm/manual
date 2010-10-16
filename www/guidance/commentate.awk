#!/usr/bin/awk -f
{
        if ($0 ~ /^\.\\"/) {
                print
        } else {
                printf(".\\\"O %s\n", $0)
        }
}
