#! /usr/bin/env bash

set -u
set -e

MOTIF="ATAT";

sed "s/"$MOTIF"/<font color=\"red\">"$MOTIF"<\/font>/g" > motif.html
