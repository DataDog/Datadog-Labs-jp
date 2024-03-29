# Synthetics外形監視 

【Document】https://docs.datadoghq.com/ja/synthetics/browser_tests/

 ## ブラウザテスト
前提：ブラウザテストの作成にはChoromeを使用し、Chromeの拡張機能[[Datadog test recorder](https://chrome.google.com/webstore/detail/datadog-test-recorder/kkbncfpddhdmkfmalecgnphegacgejoa?hl=en)]がインストールされている必要があります。

 
 ## 新規ブラウザテストの作成[](https://app.datadoghq.com/notebook/2100591/aws-hands-on-tokyo-region-in-japanese#%E6%96%B0%E8%A6%8F%E3%83%80%E3%83%83%E3%82%B7%E3%83%A5%E3%83%9C%E3%83%BC%E3%83%89%E3%81%AE%E4%BD%9C%E6%88%90)

1.  左側のメニューから「UX Monitoring」→「New Test」をクリック
2.  ポップアップメニューの「Browser Test」をクリック
3.  監視対象の詳細を設定
  1.  Set your test detailsを入力
        -  **Starting URL**：構築したLiferayのURLを入力　（必須。今回は、httpsではなく、httpを使用してください）  
        -  **Name**：hoge-hoge 適当な名前を入力（必須）  
        -  **Browsers & Devices**：テストを実行するブラウザ (`Chrome`) とデバイス (`Laptop Large`)を選択  
        -  **Select locations**：監視するロケーションをAWS、Azureのリージョンから選択  
        -  **Define scheduling and alert conditions**: 5分間隔に設定
        -  ほかはデフォルトのままでOK  

![synthetics-1](./../images/synthetics-1.jpg)

![synthetics-2](./../images/synthetics-2.jpg)

  1. **Save & Edit Recording**をクリックして次に

1. **右上の Open in popup** をクリックして、レコーディング用のブラウザウインドウを起動します。
2. **Start recording** をクリックして、ブラウザテストの記録を開始します。
3. **Open in Popupを**クリックし新しいブラウザを起動（HTTP接続なのでOpen in Popupが求められます。） 
　　監視したいユーザー操作のためのアプリケーションをクリックすると、アクションが自動的に記録され、左側のブラウザテストシナリオ内で[ステップ](https://docs.datadoghq.com/ja/synthetics/browser_tests/actions/)を作成するために使用されます。 

![scenario-recording](../images/scenario-rocording.jpg)

1. 適当な操作を実施し、コメントなどを残します。  
    1. 10クリックほど行い、アクションを記録します。
    2.  左メニュのAssertionをクリックし、**Test an elemeents contents**をクリックし適当な文字列（例：画面内のWelcom to Liferay）をクリックし**Apply**をクリック  
    **注**: ブラウザテストによって実行された操作が期待される状態になったことを確認するために、常に**ブラウザテストは、[Assertion](https://docs.datadoghq.com/ja/synthetics/browser_tests/actions/#assertion)で終了する**必要があります。  


1. シナリオが終了したら、**Save & Launch** をクリックします。
2. **Synthetics Test**に戻ったら右上の**Run Test Now**をクリックししばらく様子をみます。
3. テスト内容の確認
　テストが実行されたら、**Sample Run**や**Test Run**を確認し外形監視内容を確認できます（HTML内のどの処理の部分が遅くなっている等確認できます。）

![](https://datadog-docs.imgix.net/images/synthetics/browser_test.320b5f953a90aae0576d19eeca2e70dd.gif)

以上でハンズオンは終了です。お疲れさまでした。
