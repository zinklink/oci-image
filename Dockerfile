# 使用 Alpine Linux 作為基礎鏡像
FROM alpine:latest

# 安裝 net-snmp 工具包
RUN apk add --no-cache net-snmp-tools

# 設定工作目錄
WORKDIR /root

# 預設執行 shell，方便進入容器後互動
CMD ["/bin/sh"]