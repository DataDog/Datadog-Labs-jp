# ダッシュボードの作成

## 新規ダッシュボードの作成

1.  左側のメニューから「Dashboards」→「New Dashboard」をクリック
2.  Dashboard Nameをイニシャル-Dashboard（例 KS-Dashboard）と入力し、「New Dashboard」をクリック

### ウィジェットの追加
#### 自ホストのCPUメトリクスを表示
 1. 「Add widgets」→ GraphのTimeseriesをクリック
2. 「②Graph your data」で 以下のように編集
    -  avg:  `system.cpu.system`
    -  from: `host:xxxxxxx（自分のホスト名）`        #これを一つのホストに絞り込みます。
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
    -   avg: `trace.aspnet.request.hits`
    -   from: `host:xxxxxxx（自分のインスタンス名）`
3.  右下の「Save」をクリック

### プリセットダッシュボードからのウィジェットコピー

1.  「SQL - Metrics」 ダッシュボードを開き、「SQL Server user connections」グラフを確認
2.  グラフにマウスをホバーした際に現れるExportアイコンをクリック
3.  「Copy」をクリック
4.  自分が新規に作成したダッシュボード画面に戻り、貼り付け（Ctr + V or ⌘ + V）
5.  グラフが貼り付けられたことを確認
