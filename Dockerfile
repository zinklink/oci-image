# 1. 使用官方 Go Alpine 映像檔
FROM golang:1.26-alpine

# 2. 設定工作目錄
WORKDIR /app

# Clone Prometheus 的官方範例庫
RUN git clone https://github.com/prometheus/client_golang.git

# 4. 切換到 random 範例的目錄
WORKDIR /app/client_golang/examples/random



# 6. 編譯 Golang 程式
RUN go build -o random .

# 7. 暴露埠號並設定啟動命令
EXPOSE 8082
CMD ["./random", "-listen-address=:8082"]