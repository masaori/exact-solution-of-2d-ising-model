#!/bin/bash

# 現在のdiffをすべてaddし、datetimeをcommit messageとしてcommit & pushするスクリプト

# 現在の日時を取得（YYYY-MM-DD HH:MM:SS形式）
DATETIME=$(date '+%Y-%m-%d %H:%M:%S')

# すべての変更をステージング
git add .

# 変更があるかチェック
if git diff --cached --quiet; then
    echo "コミットする変更がありません"
    exit 0
fi

# 日時をcommit messageとしてコミット
git commit -m "$DATETIME"

# pushを実行
git push

echo "コミットとプッシュが完了しました: $DATETIME"
