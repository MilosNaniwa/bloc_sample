#!/bin/sh

# このシェルを実行前に以下のコマンドを実行してLCOVをインストールすること
# $ brew install lcov

rm -rf test_report/
rm -rf coverage/

mkdir test_report
mkdir coverage

flutter test --coverage > test_report/test_resuls.txt
genhtml coverage/lcov.info -o test_report/

open test_report/index.html
