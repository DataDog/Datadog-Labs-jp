# ダッシュボードの作成

## 新規ダッシュボードの作成

1.  左側のメニューから「Dashboards」→「New Dashboard」をクリック
2.  Dashboard Nameを入力（未入力でも構いません）し、「New Dashboard」をクリック

### ウィジェットの追加
#### 自ホストのCPUメトリクスを表示
 1. 「Add widgets」→ GraphのTimeseriesをクリック
2. 「②Graph your data」で 以下のように編集
    -  avg:  `system.cpu.system`
    -  from: `host:i-xxxxxxx（自分のインスタンス名）`        #これを一つのホストに絞り込みます。
 3. 右下の「Save」をクリック
#### 全ホストのCPUメトリクスを表示
1. 「Add widgets」→ GraphのTimeseriesをクリック
2. 「②Graph your data」で 以下のように編集
    -  avg:  `system.cpu.system`
    -  from: (削除)
    -  avg by: `host`
 3. 右下の「Save」をクリック
#### サイトのリクエストヒット数を表示
1.  「Add widgets」→「Query Value」をクリック
2.  「②Graph your data」で 以下のように編集
    -   avg: `trace.liferay.request.hits`
    -   from: `host:i-xxxxxxx（自分のインスタンス名）`
3.  右下の「Save」をクリック

### プリセットダッシュボードからのウィジェットコピー

1.  「Tomcat - Overview」 ダッシュボードを開き、の右上にある「Rate of requests」グラフを確認
2.  グラフ右上の「4h」の左にあるExportアイコンをクリック
3.  「Copy」をクリック
4.  自分が新規に作成したダッシュボード画面に戻り、貼り付け（Ctr + V or ⌘ + V）
5.  「Rate of requests」グラフが貼り付けられたことを確認

以上でLab5は終了です。
[Lab6](../Lab6)を進めてください。
