# Synthetics外形監視 (Option) 

【Document】https://docs.datadoghq.com/ja/synthetics/browser_tests/

 ## ブラウザテスト
 
 ## 新規ブラウザテストの作成[](https://app.datadoghq.com/notebook/2100591/aws-hands-on-tokyo-region-in-japanese#%E6%96%B0%E8%A6%8F%E3%83%80%E3%83%83%E3%82%B7%E3%83%A5%E3%83%9C%E3%83%BC%E3%83%89%E3%81%AE%E4%BD%9C%E6%88%90)

1.  左側のメニューから「UX Monitoring」→「New Test」をクリック
2.  ポップアップメニューの「New Browser Test」をクリック
3.  監視対象の詳細を設定
  1.  Set your test detailsを入力
        -  **Starting URL**：構築したWordpressのURLを入力　（必須）  
        -  **Name**：hoge-hoge 適当な名前を入力（必須）  
        -  **Browsers & Devices**：テストを実行するブラウザ (`Chrome`、`Firefox`、`Edge`) とデバイス (`Laptop Large`、`Tablet`、`Mobile Small`)を選択  
        -  **Select locations**：監視するロケーションをAWS、Azureのリージョンから選択  
        -   **ow often should Datadog run the test?**: 5 分間隔から週に一度までの間でインターバルを設定できます。  
        -   ほかはデフォルトのままでOK  


 2. **Save &Edit Recording**をクリックして次に

1. **Start recording** をクリックして、ブラウザテストの記録を開始します。
1. **Open in Popupを**クリックし新しいブラウザを起動（HTTP接続なのでOpen in Popupが求められます。） 
　　監視したいユーザー操作のためのアプリケーションをクリックすると、アクションが自動的に記録され、左側のブラウザテストシナリオ内で[ステップ](https://docs.datadoghq.com/ja/synthetics/browser_tests/actions/)を作成するために使用されます。 

1. 適当な操作を実施し、コメントなどを残します。  
    1. **Hello World**をクリック
    2. **Leave a Reply**で適当にコメントなどを追加し**Post Comment**をクリック
    3.  左メニュのAssertionをクリックし、**Test an elemeents contents**をクリックし適当な文字列（例：画面上部のHello world）をクリックし**Apply**をクリック  
    **注**: ブラウザテストによって実行された操作が期待される状態になったことを確認するために、常に**ブラウザテストは、[Assertion](https://docs.datadoghq.com/ja/synthetics/browser_tests/actions/#assertion)で終了する**必要があります。  


1. シナリオが終了したら、**Save & Launch **  をクリックします。
2. **Synthetics Test**に戻ったら右上の**Run Test Now**をクリックししばらく様子をみます。
3. テスト内容の確認
　テストが実行されたら、**Sample Run**や**Test Run**を確認し外形監視内容を確認できます（HTML内のどの処理の部分が遅くなっている等確認できます。）

![](https://datadog-docs.imgix.net/images/synthetics/browser_test.320b5f953a90aae0576d19eeca2e70dd.gif)
