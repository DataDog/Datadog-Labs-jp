# Lab1 - Datadogの導入

## インフラの有効化

### Datadog Agentの導入

【Document】 [https://docs.datadoghq.com/ja/agent/basic_agent_usage/deb/?tab=agentv6v7](https://docs.datadoghq.com/ja/agent/basic_agent_usage/deb/?tab=agentv6v7)

1. Datadogにログインし左の\[Integrations\]→\[[Agent](https://app.datadoghq.com/account/settings#agent)\]を選択
2. 画面上部のタブが\[Agent\]となっていることを確認し、Agent選択一覧から\[[Debian](https://app.datadoghq.com/account/settings#agent/debian)\] を選択
3. \[Select API Key\]を押下し、 \[+Create New\]で新しいAPI-Keyを追加（例: Name: key-自分の名前や愛称等）し、\[Save\]で保存
4. 新しく作成されたAPI-Keyを選んで\[Use API Key\]を選択
5. インストールコマンドのコピー、\[Use our easy one-step install.\]から以下のようなコマンドラインをコピー
```
DD_API_KEY=xxxxxxxxxxxxxxxxxxxxxx DD_SITE="datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script_agent7.sh)" 
```
6. Lab0でSSH接続したターミナルを開き、EC2インスタンスに5でコピーしたコマンドをペーストし実行
7. 以下のように出力されればエージェントのインストールは完了です。
```
* Starting the Datadog Agent...

  Your Datadog Agent is running and functioning properly.
  It will continue to run in the background and submit metrics to Datadog.
  If you ever want to stop the Datadog Agent, run:

      sudo systemctl stop datadog-agent

  And to run it again run:

      sudo systemctl start datadog-agent
```

### ［参考］Datadog Agentの起動、停止、再起動の方法
| 説明  | コマンド |
| --- | --- |
| Agent をサービスとして起動 | sudo service datadog-agent start |
| サービスとして実行中の Agent の停止 | sudo service datadog-agent stop |
| サービスとして実行中の Agent の再起動 | sudo service datadog-agent restart |
| Agent サービスのステータス | sudo service datadog-agent status |
| 実行中の Agent のステータスページ | sudo datadog-agent status |
| フレアの送信 | sudo datadog-agent flare |
| コマンドの使用方法の表示 | sudo datadog-agent --help |
| チェックの実行 | sudo -u dd-agent -- datadog-agent check &lt;CHECK_NAME&gt; |

### Datadogでのメトリクスおよびホストの確認
**エージェントインストールしたホストの情報反映には時間が掛かります**
1. Datadog画面に戻り左の\[Infrastructure\]→\[Host Map\]を選択
    - ホストマップが表示されることを確認してください。何も表示されない場合は、時間をおいてリロードをしてください
2. 表示されたホスト（六角形の）をクリック、クリックするとホストの詳細ペインが表示されます
    1. ホストの詳細ペインの「Apps」ヘッダーの下にそのホストからのメトリクスをレポートするインテグレーションがリストされていることを確認できます。
    この段階では、「agent」、「ntp」、「system」が表示されています。
    2. インテグレーションの名前をクリックすると、そのインテグレーションのメトリクスがコンパクトなダッシュボードに表示されます。「system」をクリックし、CPU 使用率、メモリ使用量、ディスクのレイテンシーなどのシステムメトリクスが取得されていることを確認します。

### Liferayの操作
1. SSHターミナル上で以下コマンドを実行します。
```
cat ~/bitnami_credentials
```
以下のような出力が現れるので、中央部に表示されるパスワードをメモします。
```
Welcome to the Liferay packaged by Bitnami

******************************************************************************
The default username and password is 'user@liferay.com' and 'xxxxxxxxxxxxx'.
******************************************************************************

You can also use this password to access the databases and any other component the stack includes.

Please refer to https://docs.bitnami.com/ for more details.
```

2. ChromeなどのWebブラウザを開き**http://x.x.x.x/**　にアクセスします。x.x.x.xにはEC2インスタンスのパブリックIPを入力、またhttpsではなく、httpで接続します。
3. 画面右上の"Sign in"をクリックし、 以下のように入力して"Sign in"ボタンをクリックします。
```
Email Address: user@liferay.com  
Password: 上記でメモした内容  
```
3. 利用規約（Terms of Use）を確認し\[I Agree\]をクリックします。
4. Change Passwordで新しいパスワードを入力（2回）
5. パスワードリカバリを登録（Password Recovery Question and Answer）
6. 左上のHome横の□をクリックしメニューを表示
7. \[Content&Data\]のWikiなどの追加を操作
8. Datadogでメトリクスなどの状況を確認

以上でLab1は終了です。
[Lab2](../Lab2)を進めてください。
