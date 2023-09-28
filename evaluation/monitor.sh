#!/bin/bash

# 运行你的主命令并将其放在后台运行
python ./chain.py &

# 获取你的主命令的 PID
PID=$!

# 开始监控 CPU 使用情况，每两秒记录一次
top -b -d 2 -p $PID > cpu_usage.txt &

# 开始监控 GPU 使用情况，每两秒记录一次
nvtop -p -C > gpu_usage.txt &

# 保存监控进程的 PID
TOP_PID=$!
WATCH_PID=$!

# 等待你的主命令结束
wait $PID

# 主命令结束后，停止监控进程
kill $TOP_PID
kill $WATCH_PID