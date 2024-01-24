#!/bin/bash
make clean
make
echo ""
echo "From C program:"
./output
RES=$?
echo "From assembly program:"
./result <<< $RES
echo ""
make clean
