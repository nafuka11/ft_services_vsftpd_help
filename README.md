# [ft_services] vsftpdにlftpで接続した後コンテナが終了してしまう

## 環境

42 VM（english-version）

LFTP Version 4.8.1

## 事象

vsftpdのコンテナにlftpで接続し、コマンドを実行した後exitすると、コンテナが Status Exited (139) で終了してしまう。

## 再現手順

1. リポジトリをcloneする

   ```bash
   git clone https://github.com/nafuka11/ft_services_vsftpd_help.git
   ```

1. lftprcを~/.lftprcに配置する

   注意：既にファイルが存在する場合はcpして退避しておくこと

   ```bash
   cp lftprc ~/.lftprc
   ```

1. imageを作成する

   ```bash
   docker build -t ftps .
   ```

1. コンテナを立ち上げる

   ```bash
   docker run -p 21:21 -p 42000-42010:42000-42010 -d --name ftps ftps
   ```

1. lftpで接続

   ```bash
   lftp -u user42 localhost

   Password: user42
   lftp user42@localhost:~> ls
   lftp user42@localhost:~> exit
   ```

1. コンテナ確認

   ```bash
   docker ps -a
   ```
