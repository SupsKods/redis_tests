#!/bin/bash
i=1
PORT=$[i+7000]
sed -i "s/port/port $PORT/g" test.txt
