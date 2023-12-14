#!/bin/bash
ROOT_DIR=/root/ipset

TMP_DIR=$ROOT_DIR/tmp
IPSET_DIR=$ROOT_DIR/ipset

if [ ! -d "$ROOT_DIR" ]; then
    mkdir -p $ROOT_DIR $TMP_DIR $IPSET_DIR;
fi

ALL_ZONES=$ROOT_DIR/all-zones.tar.gz
if [ -f "$ALL_ZONES" ]; then
    rm -f $ALL_ZONES
fi

wget -O $ALL_ZONES --no-check-certificate http://www.ipdeny.com/ipblocks/data/countries/all-zones.tar.gz
tar -xzvf $ALL_ZONES -C $TMP_DIR

countries="it fr sl de at"

echo -n > $IPSET_DIR/allowed-cc.zone
for cn in $countries; do
    echo "Adding country $cn";
    cat $TMP_DIR/$cn.zone >> $IPSET_DIR/allowed-cc.zone
done

for range in $(cat $IPSET_DIR/allowed-cc.zone); do
    echo "Adding $range to CC...";
    ipset add allow_cc $range;
done