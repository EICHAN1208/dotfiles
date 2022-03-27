# プロセスの確認
# grepコマンドのプロセスを除外
# ex. pss spring
pss () {
  ps aux | grep -E "PID|$1" | grep -v grep
}

# kill process spring
ks () {
  kill $(ps ax | grep spring | grep -v grep | awk '{print $1}')
}
