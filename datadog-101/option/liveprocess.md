# ライブプロセス
【Document】https://docs.datadoghq.com/ja/infrastructure/process/

インフラストラクチャー上で実行中のプロセスをリアルタイムに可視化します。

datadog agentを以下のように編集

```
$ sudo vi /etc/datadog-agent/datadog.yaml
```
```
process_config:
    enabled: "true"
```
### datadog-agentを再起動

`$ sudo service datadog-agent restart`

### Datadogでのライブプロセスの確認
1. 左側のメニューから「Infrastructure」→「Processes」をクリック
2.  左にあるfacetsから「Host」を開き、自分のホストを探してクリック（または、画面上部の検索窓から「host:i-xxxxx」と入力）
3. プロセスが表示されることを確認
