#!/bin/sh

BLOCKLISTS="
https://small.oisd.nl/unbound
"
BLOCKLIST_FILE='/etc/unbound/blacklist.conf'

echo updating blocklist...
echo '' > $BLOCKLIST_FILE

for p in $BLOCKLISTS; do
        curl -s $p >> $BLOCKLIST_FILE
done

unbound-control reload
unbound-control start
