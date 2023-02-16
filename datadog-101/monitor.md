
# アラート設定
【Document】https://docs.datadoghq.com/ja/monitors/
## CPU使用率によるモニターの設定
1. Datadog アカウントにログインし、[Monitor]→ [New Monitor] ページに移動
2. [Metric] を選択して、新しい Metric モニターを作成
	1.  [Choose the detection method] セクションを設定
 		1. [Threshold Alert] （しきい値アラート）を選択します。
		2. [Define the metric] で [system.cpu.user] （CPUがUserのプロセスを実行するのに費やした時間の割合）を選択し、fromで設定したインスタンス（host:i-00xxxxxxxxxxx）を選択。
  		3.  「simple Alert」を設定。

	2. [Set alert conditions]セクションを設定

  		1分間の平均のCPU使用率が70%を超えた場合はWarningを、80%を超えた場合はAlertを設定。	
		- Trigger when the metric is [ above(より上) ]  the threshold [on average(平均)]  during the last  [1 minute]
		- Alert Threshold > 80
		- Warning Threshold > 70

  	3. [Say what's happening ]セクションでモニター名、メッセージを設定

         - モニター名：`CPU使用率アラート： {{host.name}}`
         - メッセージ： 
				```IP {{host.ip}} :  {{host.name}} が高負荷になっています。 
 					CPU使用率:{{value}} ```

	4.  [Notify your team ]セクションで通知先を設定

		@ [自分のメールアドレス]を設定 
 		`  例) @hoge@hoge.com  `

  	5. ページの一番下までスクロールし、[Save]をクリックします。

## サーバに負荷をかける
 EC2にstressツールのインストール
```
$ sudo apt-get install stress
```
stressコマンドで、サーバのCPU（ユーザー）に負荷をかける
```
$ stress -c 1
```
設定したメールアドレスにアラートメールが来ていることを確認

Stressツールを止める（Ctrl+c)
