# ダッシュボードのカスタマイズ

## 新規ダッシュボードの作成
1. 左側のメニューから「Dashboards」→「New Dashboard」をクリック
1. Dashboard Nameを入力（未入力でも構いません）し、「New Dashboard」をクリック

### ウィジェットの追加
1. 「Add  widgets」→「Query Value」をクリック
1. 「②Graph your data」で 以下のように編集
    - avg: `trace.wordpress.request.hits` 
    - from: `host:i-xxxxxxx（自分のインスタンス名）`
1. 右下の「Save」をクリック

### プリセットダッシュボードからのウィジェットコピー
1. 「Apache - Overview」 ダッシュボードを開き、の右上にある「Rate of requests」グラフを確認
1. グラフ右上の「4h」の左にあるExportアイコンをクリック
1. 「Copy」をクリック
1. 自分が新規に作成したダッシュボード画面に戻り、貼り付け（Ctr + V or ⌘ + V）
1. 「Rate of requests」グラフが貼り付けられたことを確認

