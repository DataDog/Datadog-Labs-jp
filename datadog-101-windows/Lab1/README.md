# Datadogの導入

DatadogエージェントをEC2インスタンスへインストールし、Datadogで収集された各種インフラメトリクスのデータを確認します。

## Datadog Agentの導入

【Document】 [https://docs.datadoghq.com/ja/agent/basic_agent_usage/deb/?tab=agentv6v7](https://docs.datadoghq.com/ja/agent/basic_agent_usage/deb/?tab=agentv6v7)

1. ローカル端末でDatadogにログインし左のメニューから\[Integrations\]→\[[Agent](https://app.datadoghq.com/account/settings#agent)\]を選択
2. 画面上部のタブが\[Agent\]となっていることを確認し、Agent選択一覧から\[[Windows](https://app.datadoghq.com/account/settings#agent/windows)\] を選択
4. \[Select API Key\]を押下し、 \[+Create New\]で新しいAPI-Keyを追加（例: Name: key-自分の名前や愛称等）し、\[Save\]で保存
5. 新しく作成されたAPI-Keyを選んで\[Use API Key\]を選択
6. [Download the Datadog Agent installer]のリンクを右クリックしAgentのインストーラーダウンロードのリンクをコピー

![agent_install](./../images/agent_install.jpg)

6. Lab0で接続したRDPを開き、ブラウザ上にコピーしたURLを貼り付けダウンロードを実行
7. ダウンロードが完了したら実行しインストールウィザードを起動
8. 基本的にデフォルトのままNextで進めていき、API Key入力の際に5で選択したAPI Keyをコピー＆ペースト
9. インストール完了時にDatadog Agent Managerを起動するチェックボックスにチェックを入れ、完了
10. ブラウザでDatadog Agent Managerの起動を確認

## Datadogでのメトリクスおよびホストの確認

エージェントをインストールしたホストの各種インフラメトリクスを確認します。
> **エージェントインストールしたホストの情報反映には時間がかかります**

1. Datadog画面に戻り左の\[Infrastructure\]→\[Host Map\]を選択
    - ホストマップが表示されることを確認してください。何も表示されない場合は、時間をおいてリロードをしてください
2. 表示されたホスト（六角形の）をクリック、クリックするとホストの詳細ペインが表示されます
    1. ホストの詳細ペインの「Apps」ヘッダーの下にそのホストからのメトリクスをレポートするインテグレーションがリストされていることを確認できます。<br>
    この段階では、「agent」、「ntp」、「system」が表示されています。
    2. インテグレーションの名前をクリックすると、そのインテグレーションのメトリクスがコンパクトなダッシュボードに表示されます。「system」をクリックし、CPU 使用率、メモリ使用量、ディスクのレイテンシーなどのシステムメトリクスが取得されていることを確認します。

以上でLab1は終了です。
[Lab2](../Lab2)を進めてください。

