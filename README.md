# digdagサーバとクライアントのサンプル

## 必要環境

- docker
- docker-compose


## セットアップ

### データコンテナ作成

初回に一度だけ実行する

```
(cd data_container && docker build -t digdag_data_container . && docker run --name digdag_data_container digdag_data_container)
```


### コンテナビルド

```
bin/run build
```

### digdagサーバ起動

```
bin/run up

or

bin/run up -d
```

### クライアンでの作業サンプル

#### クライアント用コンテナに入る

```
docker exec -it digdag_client bash
```

以下はコンテナ内の作業

- 今サーバに登録されているworkflowを確認

```
# digdag workflows
2016-09-22 07:46:18 +0000: Digdag v0.8.15

Use `digdag workflows <project-name> <name>` to show details.
```

まだなにも登録してないので空っぽ

- サンプルのワークフローを登録

```
# cd workflows/my_wf1/
# ls
my_wf1.dig
# digdag push project1
2016-09-22 07:49:34 +0000: Digdag v0.8.15
Creating .digdag/tmp/archive-62087772360119953.tar.gz...
  Archiving my_wf1.dig
Workflows:
  my_wf1

Uploaded:
  id: 36
  name: project1
  revision: 1b987e8d-1a72-4000-a882-b65041b38e75
  archive type: db
  project created at: 2016-09-22T07:49:36Z
  revision updated at: 2016-09-22T07:49:36Z

Use `digdag workflows` to show all workflows.
```

- 登録されたワークフローを確認

```
# digdag workflows
2016-09-22 07:50:30 +0000: Digdag v0.8.15
  project1
    my_wf1

Use `digdag workflows <project-name> <name>` to show details.
```

- このワークフローを実行する

```
# digdag start project1 my_wf1 --session now
2016-09-22 07:51:34 +0000: Digdag v0.8.15
Started a session attempt:
  session id: 69
  attempt id: 69
  uuid: 0e605e6c-fabc-4e49-9251-3323db650571
  project: project1
  workflow: my_wf1
  session time: 2016-09-22 16:51:35 +0900
  retry attempt name:
  params: {}
  created at: 2016-09-22 07:51:35 +0000

* Use `digdag session 69` to show session status.
* Use `digdag task 69` and `digdag log 69` to show task status and logs.
```

- 実行結果確認

```
# digdag sessions 69
2016-09-22 07:52:41 +0000: Digdag v0.8.15
  session id: 69
  attempt id: 69
  uuid: 0e605e6c-fabc-4e49-9251-3323db650571
  project: project1
  workflow: my_wf1
  session time: 2016-09-22 16:51:35 +0900
  retry attempt name:
  params: {}
  created at: 2016-09-22 07:51:35 +0000
  kill requested: false
  status: success
```

- 実行ログ確認

```
# digdag log 69
2016-09-22 07:52:29 +0000: Digdag v0.8.15
2016-09-22 07:51:36.384 +0000 [INFO] (0105@+my_wf1+query) io.digdag.core.agent.OperatorManager: sh>: echo 'hello, world'
hello, world
```
