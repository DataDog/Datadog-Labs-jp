# コース開始前の準備

- [Datadog Learning Center のアカウントを登録](https://learn.datadoghq.com/)
- [Datadog Datadog Quick Start コースを登録](https://learn.datadoghq.com/courses/course-quickstart)し、別のタブで開きながら手順を進めてください

# はじめに

基礎から学ぶ Datadog - ハンズオントレーニング 2025 コースへようこそ！このコースでは、Datadog のコアとなる製品や機能について学びます。

Datadog は、SaaS（Software-as-a-Service）型の監視プラットフォームで、次のような目的で設計されています。

- システムが生成するメトリクス、トレース、ログを含む膨大な量の監視データを収集します。
- すべてのデータを一箇所に集めます。
- 直感的なフォーマットでデータを整理して表示し、お客様とお客様のチームがより効果的に問題を検出、診断、解決できるようにします。

Datadog は、アプリケーション、セキュリティ、インフラストラクチャ、およびその他の領域に、幅広い機能を通じてオブザーバビリティを提供します。その多くは他の Datadog Learning Center のコースでも紹介されています。この基礎から学ぶ Datadog - ハンズオントレーニング 2025 コースの目的は、これらの製品や機能の主要なサブセットを紹介することです。

本トレーニングでは Datadog の基本的なスキルを身につけながら、仮想マシンにデプロイされた実際の eコマース・アプリケーションをモニタリングします。

# コースの概要

**Logs** は、インフラストラクチャのさまざまなコンポーネントからのイベントストリームをキャプチャします。Datadog Log Management を使用すると、すべてのログをコスト効率よく収集、処理、アーカイブ、調査、監視することができます。

**APM** は、アプリケーションにおける内部処理、外部 DB や API との接続に関するパフォーマンスデータを取得します。リクエスト数、エラー数、レイテンシといったアプリケーションにおける主要なメトリクスだけでなく、個々のアプリケーショントランザクションにおけるコンポーネント間のやり取りをトレースし、可視化を行うことが出来ます。

**メトリクス**は、環境内のレイテンシ、エラー率、ユーザ登録など、さまざまな測定値を長期にわたって追跡できます。

**モニター**は、これらのメトリクスをアクティブにチェックし、重大な変化が発生したとき、たとえば問題を示すしきい値を超えたときに警告を発します。

**サービスレベル目標、SLO** は、パフォーマンスの目標を定義し、サービス品質の明確な基準を確立するためのフレームワークを提供します。

**Integration** は、Datadog が個々のサードパーティのソフトウェア、サービス、またはツールを監視できるようにするプラグインまたはアドオンです。Datadog は、Integration を利用することで、インフラストラクチャに導入された多くのテクノロジによって生成された、さまざまなメトリクスやログを統合することができます。

**ダッシュボード**を使用すると、 重要なオブザーバビリティデータを1つのページで視覚化することができます。カスタムダッシュボードをスクラッチから作成することもできますが、すぐに使える（OOTB）ダッシュボードやビルド済みダッシュボードも多数あります。

### 注意事項

- 各セクションに依存関係はありませんのでご興味のあるセクションより開始下さい。
- 演習時間内に全セクションは完了できることは想定しておりません。演習時間中はご興味のあるセクションについて理解を深める、Datadog のエンジニアとディスカッションをすることに集中して頂き、残りのセクションはお持ち帰り下さい。
- 払い出された演習環境は最大2週間有効であり、2週間経過後も何度でもやり直しが可能です。

# 演習環境

各セクションで演習がスタートされると自動で以下の環境が起動し、Web サービスに対するトラフィックも流れます。各演習環境は一定時間後リセットされます。環境が使用不可となった場合は再度演習をスタートしてください。

![environment](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/environment.png)

Datadog Quick Start のメニューより、[Lab: Datadog Quick Start](https://learn.datadoghq.com/courses/take/course-quickstart/texts/47100306-lab-datadog-quick-start) を選択し、`Launch` ボタンをクリックしてラボを起動してください。

# Logs

Datadog Log Management を使用すると、すべてのログをコスト効率よく収集、処理、アーカイブ、調査、監視することができます。

Datadog Log Management を使用すると、次のようなことが可能になります：

- ホスト、コンテナ、クラウドプロバイダなど、さまざまなソースからログを収集できます。
- ログが Datadog によって取り込まれると、パイプラインやプロセッサを使用してログを拡張したり、ログからメトリクスを作成したり、ログ構成オプションを使用してストレージに最適化されたアーカイブを管理したりすることができます。
- ログを他の Datadog 製品のメトリクスやトレースに紐づけて、より深い洞察を得ることができます。
- 取り込まれたログは、ログエクスプローラで検索、フィルタリング、クエリできます。

## Log Explorer

ログ エクスプローラーはログの調査とトラブルシューティングを行う場所であるため、時間をかけてログ エクスプローラーのさまざまな部分を調べることができます。

![Log Explorer page with logs from foundation-lab-host.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/log-explorer-overview2.png)

1.  ラボが作成した Datadog トレーニング アカウントの認証情報を使用して [Datadog](https://app.datadoghq.com/) にログインします。 試用版の認証情報を取得する必要があるときはいつでも、ラボ ターミナルで `creds` コマンドを実行できます。

2.  **[Logs > Search & Analytics](https://app.datadoghq.com/logs)** に移動します。

> [!NOTE]
> [Discover Datadog Log Management] ページが表示された場合は、 **Get Started** ボタンをクリックします。 ポップアップ ダイアログで、 **Get Started** ボタンをクリックします。

### Time Range

時間範囲セレクターは、ログ エクスプローラーに表示されるログの時間範囲を制御します。

![Time range drop down menu is set to past 15 minutes.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/time-range-dropdown.png)

1. ページの右上隅に、時間範囲のドロップダウン メニューがあります。 デフォルトは `Past 15 Minutes` です。

これを `Live Tail` に変更し、リストの作成が開始されるまで待ちます。

Live Tail を使用すると、インフラストラクチャ内のどこからでもすべてのログ イベントにリアルタイムでアクセスできます。 このビューでは、インデックスが作成されているかどうかに関係なく、すべてのログを表示できます。 これは、プロセスが正しく開始されたかどうか、または新しいデプロイメントがスムーズに完了したかどうかを確認する場合に便利です。

2. 時間範囲を `Past 15 Minutes` に戻します。

### Search Bar

検索バーを使用すると、クエリを使用してログを検索およびフィルタリングできます。

![Log Explorer search bar is empty.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/logs-search-bar.png)

検索バーの下には、ログをフィールド、パターン、またはトランザクションにグループ化し、ログをリスト、時系列、上位リスト、テーブル、ツリー マップ、または円グラフとして視覚化するオプションがあります。

1. 検索バーに `service:store-frontend` と入力し始めると、検索バーのオートコンプリート機能により、クエリを完了するための値が表示されます。

表示されたら、オートコンプリート リストで `store-frontend` を選択し、`store-frontend` サービスからのすべてのログを表示します。

2. 検索バーをクリアします。


### Facet panel

前のセクションでは検索バーに入力してデータをフィルタリング、グループ化しましたが、**ファセット** パネルはデータを探索するためのより簡単な方法です。

![The facet panel has the core facets expanded.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/facet-panel.png)

1. ログ リストの左側にはファセット パネルがあります。 **Service** で `store-frontend` をクリックして、 `store-frontend` サービスからのログのみを表示します。
これにより、以前と同じログのリストが作成されます。

2. 別のファセットを選択してログをフィルタリングしてみてください。簡単に所望のログのみをフィルタリング出来ることがお分かりいただけるかと思います。

3. 検索バーをクリアします。

> [!IMPORTANT]
> 特別なクエリ言語をイチから学んで頂く必要なく、組織の誰もが使えるログ検索機能を提供します。

### Log side panel

ログはデフォルトでリスト表示されます。 リスト内のログをクリックすると、サイド パネルが開きます。

![The log side panel shows details about the log.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/log-side-panel2.png)

1. ログ リストから、ステータスが `Info` である `store-backend` からのログをクリックします。

> [!TIP]
> 検索バーまたはファセット パネルを使用してログをフィルタリングしてみてください。

2. ログのサイド パネルの上部には、インフラストラクチャまたはアプリケーションに関する一般的なコンテキスト情報が表示されます。 情報はタグから収集されます。 タグは、Datadog Agent または Log Forwarder によって自動的に付加されるか ( `host`、 `container_name` など)、またはカスタム タグ ( `team`、`env` など) を通じて追加されます。

ログメッセージを見てください。 ログ メッセージが切り詰められている場合は、 **Show More** をクリックしてログ メッセージ全体を表示します。

ログ メッセージの下には、ログが他のデータとどのように相関しているかを示すさまざまなタブがあります。

3. **Event Attributes** タブには、ログ属性の名前と値が JSON 形式で表示されます。 属性を操作して、属性によるフィルタリング、ログ テーブルへの列の追加、ファセットの作成などのアクションを実行できます。

4.  **Trace** タブをクリックします。 ログへのトレース挿入が有効になっている場合は、選択したログがトレース全体のコンテキストで表示されます。 **View Trace Details** をクリックすると、後に紹介するAPM データを詳しく調べることができます。

5.  **Metrics** タブをクリックします。 ここでは、ログ周辺の 30 分の時間枠でインフラストラクチャ メトリックを表示できます。

> [!IMPORTANT]
> Datadog ではプラットフォームに収集されたログ/APM/メトリクス(オブザーバビリティの3本柱とも呼ばれます。)を相関付け、単一のページで確認出来ることが強みとなっています。これによりそれぞれのツールを切り替えながら各種データを確認するのに掛かる無駄な時間を削減し、ひいてはシステム障害による機会損失の低減が可能となります。
> 参考: CNCF Observability Whtepaper https://github.com/cncf/tag-observability/blob/main/whitepaper.md#observability-signals

## Search, Filter, and Query

### Filter using log attributes

ログ属性を使用してログをさらにフィルタリングできます。

1. **Service** で `store-ads` をクリックして、 `store-ads` サービスからのログのみを表示します。ログのリストから "Total advertisements available." で始まるログ メッセージが含まれるログエントリを探しクリックします。 ログ メッセージは、ログ リストの **CONTENT** 列で表示できます。

2. ログのサイド パネルで、**Event Attribute** の下にこのログのさまざまな属性を表示できることに注目してください。 これらのログは、 `ads.py` ファイルから取得されているようです。 その `filename` 属性を使用して、 `ads.py` ファイルに由来するすべてのログを検索するにはどうすればよいでしょうか?

![Log side panel showing filename attribute highlighted.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/filename-attribute2.png)

3. `Filename` 属性をクリックし、ポップアップ メニューから **Filter by @filename:ads.py** でフィルターを選択します。

検索クエリが `@filename:ads.py` を含むように更新されたことに注目してください。 `@` は、特定の属性を検索していることを示します。

4. サイド パネルを閉じて、アプリケーションの `ads.py` ファイルから生成された `store-ads` ログのリストに戻ります。

![List of logs from the ads.py file.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/logs-ads-py.png)

これでログ属性によるフィルタリングがうまくいきました。

> [!IMPORTANT]
> ログ内の任意のフィールドをクリックのみでフィルタ条件として使用することが出来ます。

### Filter using text strings from log messages

`"Total advertisements available"` というログ メッセージが含まれるログのみを表示したい場合はどうすればよいでしょうか? ログメッセージの文字列を使用して検索できます。

1. 検索バーでクエリをクリアし、次のように入力します。テキスト文字列の前後には必ず二重引用符 " を含めてください。

```
"Total advertisements available"
```

2. ログ メッセージに `"Total advertisements available"` というテキスト文字列を含むログのリストが表示されます。

![List of logs with a log message of "Total advertisements available."](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/total-ads-available.png)

3. 完了したら、検索バーをクリアします。

> [!IMPORTANT]
> ログ中の特定文字列検索は従来の監視ツールでもよく使われる手法ですが、Datadog ももちろんサポートしています。

これで、ファセット パネルまたは検索バーを使用して検索クエリを作成する方法がわかりました。

## Customize the Log Explorer

### Create a custom facet

Datadog がログを解析すると、共通のタグと属性がファセット パネルに自動的に表示されます。 ファセットは定性的または定量的なデータ分析に役立つため、ファセットを使用してログの検索、ログ パターンの定義、ログ分析の実行を行うことができます。 自動生成されたファセットは便利ですが、ファセット パネルに表示される独自のカスタム ファセットを作成することもできます。 これは、ログ サイド パネルのログの詳細を利用して実行できます。

1. ログ メッセージに "influencer specific discounts" が含まれる `store-discounts` ログのリストから、ログ行の 1 つをクリックしてログのサイド パネルを開きます。

2. **Event Attributes** で、`process` 属性の `name` をクリックし、ポップアップ メニューから **Create facet for @process.name** を選択します。

**Add facet** ポップアップダイアログが表示されます。追加のフィールドを表示する場合は、**Advanced** を展開します。

3. **Add** をクリックします。

ファセットが正常に追加されたことを確認するメッセージが表示されます。

4. ログのサイド パネルを閉じ、ページ上部の検索バーをクリアします。

5. ファセットパネルの一番下までスクロールします。**OTHERS** ファセット グループの下で、**process.name** ファセットを展開します。

新しいファセットが表示されるには、新たなログが収集および処理されるまで待つ必要がある場合があります。しばらく待つとログ エントリで見つかったこの属性のさまざまな値が表示されるようになります。

![The process.name facet is expanded.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/process-name-facet2.png)

6. `bootstrap` を選択して、`process.name` 属性値が `bootstrap` である行ごとにログをフィルターします。

7. 完了したら、検索バーをクリアします。

> [!IMPORTANT]
> ログ中の任意のフィールドをファセットとして追加することでさらにログの検索性が上がります。同じファセットを他のユーザも利用できるようになり、属人性の低減にも寄与します。

使用可能な検索コンテキストは、割り当てたタグとログから抽出された属性によって異なります。

## Log Aggregation

### Field Aggregations

Field aggregation では、クエリ フィルターに一致するすべてのログが、指定されたログ ファセットのさまざまな値に基づいてグループに分割されます (つまり、集約されます)。この方法でログを集約またはグループ化すると、傾向をより明確に確認し、さまざまな種類のログ ファセット間の関係を視覚化するのに役立ちます。

注: このコースではフィールドごとのログの集計について説明しますが、[patterns](https://docs.datadoghq.com/ja/logs/explorer/analytics/patterns/) や [transactions](https://docs.datadoghq.com/ja/logs/explorer/analytics/transactions/) ごとにログを集計することもできます。 興味がある場合は、リンクを使用してこれらの集計タイプの詳細を確認してください。

1. **[Logs > Search & Analytics](https://app.datadoghq.com/logs)** に移動します。

2. 検索バーの下で、**Group into** の横にある `Fields` を選択し、 **Visualize as** で `Timeseries` を選択します。ログのリストをグラフで視覚化したものがログのリストに置き換わります。

![A bar graph showing the number of log entries over time.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/fields-agg-timeseries.png)

3. これはログの数を視覚化したものとしては興味深いかもしれませんが、たとえば `Service` ごとにログをグループ化して表示できれば、さらに便利になるでしょう。

**by** の横にある `Everything` を `Service (service)` に変更して、サービスごとにグループ化します。

![A timeseries graph showing a count of all logs grouped into fields by service.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/fields-agg-timeseries-grouped.png)

どのサービスが最も多くのログを生成しているかを視覚化できるようになりました。

どのサービスがエラー ログを生成しているかを確認したい場合はどうすればよいでしょうか?
ファセット パネルまたは検索バーを使用して、`error` ステータスを持つログをフィルタリングします。

![A timeseries graph showing a count of error logs grouped into fields by service.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/error-field-agg.png)

どのサービスがエラーログを生成しているのか、またこれらのエラーがいつ発生しているのかを簡単に視覚化できるようになりました。 この例では、`store-ads` サービスと `store-discounts` サービスがエラー ログを生成しており、`store-ads` サービスがエラーの大部分を生成しています。 4 分ごとに急増していることもわかります。

他の視覚化オプションを選択して、どのように見えるかを確認します。 一部のビジュアライゼーションは、他のビジュアライゼーションよりも必要なデータを表示するのに優れている場合があります。

- **Top List**
![A top list showing a count of all logs grouped into fields by service.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/fields-agg-toplist.png)

- **Table**
![A table showing a count of all logs grouped into fields by service.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/fields-agg-table.png)

- **Tree Map**
![A tree map showing a count of all logs grouped into fields by service.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/fields-agg-treemap.png)

- **Pie Chart**
![A pie chart showing a count of all logs grouped into fields by service.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/fields-agg-pie-chart.png)

> [!IMPORTANT]
> ログをソースとしたデータ解析も可能です。時系列表記だけでなく、ランキング、表、パイチャートなど様々なデータ表現形式をサポートします。日々の手入力によるデータ集計作業を自動化、リアルタイム化します。

### Export Graphs

ログの視覚化を Datadog の他の領域にエクスポートできます。 ログからカスタム メトリックを作成したり、集計データを CSV としてダウンロードしたりすることもできます。

1. ビジュアライゼーションを `Timeseries` に戻します。

2. グラフの上にある **More** ボタンをクリックし、**Save to Dashboard** をクリックします。

3. **Save to Dashboard** ポップアップ ダイアログで、**New Dashboard** を選択し、**Save and Open** をクリックします。

![Export graph dialog with New Dashboard highlighted.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Logs/export-graph-dashboard2.png)

> [!IMPORTANT]
> データ解析結果をダッシュボードに出力し、他チームや経営層、協力会社様へのレポートにご利用頂けます。

後ほど別のラボでダッシュボードをより深く学びます。

# APM

最新のソフトウェア・アプリケーションは、頻繁に更新されるコードの断片で構成されており、通常、多様なインフラに分散しています。このため、パフォーマンス問題の原因を突き止めるのはしばしば困難です。パフォーマンスの突然の変化は、次のような原因が考えられます。

- エラー状態の増加？
- データベースクエリが遅い？
- ハードウェアの過負荷？
- クラウドサービスの停止？

Datadog のエンドツーエンドの分散トレース、APM、およびプロファイラを使用すると、トレースをフロントエンドとバックエンドのデータと関連付けることによって、これらの問題を特定することができます。これにより、サービス間の相互作用や依存関係のパフォーマンスをより完全に把握することができ、レイテンシを削減し、多くのリソースを使用しているプロセスを特定し、ユーザーエクスペリエンスに悪影響を与えるエラーを排除することができます。

Datadog は、あらゆる技術スタックに APM を実装するための多くのソリューションを提供しており、アプリケーション・レベルからホスト、コンテナ、サーバーレス機能などに至るまでのトレース・メトリクスを収集し、関連付けることができます。様々なサービス間でこれらのメトリクスを関連付ける能力を持つことで、アプリケーションを強化するために何ができるのか、どこでそれを行うべきなのかをよりよく理解することができます。さらに、あなたや組織のメンバーは、APM のトレースに基づいてモニターを作成し、サービスが最適なパフォーマンスでない場合に警告を出すことができます。

本セクションでは Datadog アプリケーションで APM トレースをどのように読むか、トレースとログをどのように関連付けるか、アプリケーションの問題を特定するためにモニタをどのように使用するかについて理解を深めます。

## Navigate the Service Catalog

このラボが始まってから、Agent はあなたのアプリケーションサービスからトレースを収集し続けています。次に、Datadog でこれらのサービスの状態を確認し、そのトレースを調べます。

1. ラボが作成した Datadog トレーニング アカウントの認証情報を使用して [Datadog](https://app.datadoghq.com/) にログインします。 試用版の認証情報を取得する必要があるときはいつでも、ラボ ターミナルで `creds` コマンドを実行できます。

2. Datadog で[APM > Services](https://app.datadoghq.com/software?env=quickstart-course) に移動します。`env:quickstart-course` が選択されていることを確認してください。

![Service Catalog page with `env:foundation-lab` environment selected](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/APM/service-catalog-env2.png)

3. 有効になっている全てのサービスのリストが表示されます。Datadog エージェントと直接通信しない PostgreSQL コンテナである `database` も表示されます。

データベースが表示されるのは、`store-backend`、`store-ads`、`store-discounts` のトレースがそれを捕捉しているからです。PostgreSQL 自体は Agent にトレースを送信しません、ここではデータベースに接続するアプリケーションがトレースを送信しています。

同様に、`store-backend-cache` など、Docker コンテナに対応しない新しいサービスもいくつか見られます。`store-backend` サービスは、アプリケーションのこれらの補助的な領域をサービスとして自動タグ付けするようにインストルメント化されています。

4. 左上隅の [Map](https://app.datadoghq.com/software?env=quickstart-course&view=map) を選択すると、各サービスが互いにどのように通信しているかのサービスマップが表示されます。

![The Service Map displays the flow of requests between services](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/APM/apm_service_map_flow2.png)

注: このマップは、Datadog が新しいトレースを受信してから表示されるまでに時間がかかることがあります。今すぐ表示されない場合は、ページをリフレッシュするか、後で再度アクセスしてください。

5. 右上の **Map layout** ボタンに注目してください。**Cluster** と **Flow** を切り替えて違いを確認してください。**Flow** レイアウトはより大きなサービスマップに適しています。

6. 左上の [Catalog](https://app.datadoghq.com/software?env=quickstart-course) を選択すると、サービスカタログのリストビューに戻ります。

> [!IMPORTANT]
> Software Catalog のデフォルトビューは `Performance` ですが、他のタブをクリックしてみましょう。例えば `Ownership` タブでは各サービスを開発・運用しているチームやコンタクト先、ソースコードレポジトリを、`Security` タブではアプリケーションのライブラリやコードの脆弱性、脆弱性を突いた脅威についての情報がまとまっています。

7. リストの `store-discounts` にカーソルを合わせ、**Service Page** をクリックすると、`store-discounts` のサービスページが開きます。

8. `store-discounts` ページで、**Service Summary** セクションで利用可能なさまざまなグラフを調べます。

> [!IMPORTANT]
> RED(Request/Error/Duration) メトリクスと呼ばれるアプリケーションレベルの重要な指標をデフォルトで提供し、後に説明するダッシュボードへのエクスポートも可能です。

9. **Endpoint** セクションまでスクロールダウンします。ここではAPMがトレースしたサービスのアプリケーションエンドポイントが表示されます。このサービスのリソースをリクエスト、レイテンシ、エラー、時間でソートして、トラフィックが多いエンドポイントや潜在的な問題を発見することができます。`store-discounts` サービスは `GET /discount` のエンドポイントを持っています。

![Discounts service resources](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/APM/discounts_apm_services_resources.png)

10. クリックすると、サイドパネルが開き、リソースに関する OOTB のグラフ、リソースの依存性マップ、スパンサマリー表が表示されます。スパンはトレース内の単一の操作を表し、トレースはアプリケーションがリクエストの処理に費やした時間とこのリクエストのステータスを追跡します。

> [!IMPORTANT]
> 環境変数等で `version` タグを設定することによりアプリケーションのバージョンに対するアプリケーションパフォーマンスを可視化可能です。新バージョン展開によるサービスレベルのデグレがないかを視覚的に切り分け頂けます。

一番下までスクロールすると、Traces が表示されます。

11. トレースをクリックすると、スパンのフルトレースのフレームグラフを表示する別のサイドパネルが開きます。

フレームグラフとは、トレースを視覚化したもので、それぞれの帯は異なるスパンを表し、スパンの実行時間、そのスパンを呼び出したもの、そのスパンが行った呼び出しを示します。

> [!IMPORTANT]
> 1回の呼び出しが1つのスパン、スパンの横幅が1回の呼び出しあたりの実行時間を示します。過剰なデータベースアクセスやスロークエリ問題を迅速に特定可能です。

これで、ソフトウェアカタログから特定のサービスリソースのトレースにドリルダウンする方法がわかりました。次に、すべてのサービスのトレースを一箇所で見てみましょう。

## Explore all service traces

APM トレース・ページでは、すべてのサービスのトレースが一箇所に表示されます。

1. [APM > Traces](https://app.datadoghq.com/apm/traces?query=env%3Aquickstart-course)に移動します。ここには APM が過去 15 分間にキャプチャしたトレースのライブストリームが表示される。検索フィールドに `env:quickstart-course` 以外のものが含まれている場合は、それをクリアして `env:quickstart-course` と入力します。

2. `service` 名でトレースをフィルタリングします。左側のファセットパネルを使って `store-discounts` サービスでフィルタリングしてください。

3. `store-discounts` トレースをクリックすると、トレースの詳細サイドパネルが開き、そのトレースのフレームグラフが表示されます。フレームグラフには、このトレースの各サービスに費やされた時間が表示されます。

![Trace side panel showing a flame graph](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/APM/apm_traces_flamegraph.png)

> [!IMPORTANT]
> トレースを見てみましょう。上の画像例ではブラウザアプリケーションから `/discount` の API が呼び出され、`store-discounts` サービスから postgres データベースに対して無数のデータベースクエリが投げられている（いわゆる N+1 問題）ことを示しています。これによりブラウザリクエストへのレスポンスに4.53秒という時間が掛かっています。よって次のアクションとしては `store-discounts` アプリケーションのチームに報告し、N+1 問題を解決する修正を行ってもらうことが考えられます。

## Traverse between APM traces and logs

トレース中にアプリケーションがログを出力した場合、トレース詳細パネルから直接ログにジャンプすることができます。

1. 前セクションで確認したトレース詳細パネルに移動し、下部にある **Logs** タブをクリックします。上部の水平の仕切りをドラッグすることで、ログの表示領域のサイズを変更することができます。

これらは、トレースの時間枠内にキャプチャされた関連ログ行です。

![Logs tab showing logs related to the trace](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/APM/apm_traces_logs.png)

2. それぞれのログ行にマウスオーバーし、フレームグラフを見てください。トレースの中で、ログ行が放出された正確なポイントを示す垂直線が表示されます。これは、`DD_LOGS_INJECTION:true` の環境変数を設定することで有効になります。

3. **Logs** で、一番端にある **Go to Logs Explorer** のアイコンをクリックします。

![Open the traces logs in the Log Explorer](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/APM/discounts_trace_logs.png)

これにより新しいタブでログエクスプローラーが開かれます。ここでは `trace_id` という属性情報に基づいて、表示したトレースに関連するログのみを見ることができます。

> [!IMPORTANT]
> トレース画面に戻って他のタブも見てみましょう。"Infrastructure" タブではアプリケーションを展開しているホストやコンテナのメトリクス、"SQL Queries" タブではトレース内で呼び出されているデータベースクエリのリスト、"Code Hotspots" タブではプロファイラ機能により `store-discounts` サービス内のどの関数でどれだけの実行時間となっているかの情報が得られます。既にご紹介したログとトレースの相関以外にも、トレースとあらゆる情報を関連付けてご確認頂けます。

# Metrics, Monitors, SLOs

**メトリクス**は、Datadog の世界では最小の単位ですが、可視化され、測定され、監視されることで、インフラストラクチャに多大な洞察を与えます。メトリクスは、レイテンシ、エラー率、ユーザ登録数など、一定期間におけるシステムのあらゆる側面に関する数値測定値です。Datadog では、 メトリック・データは、 値とタイムスタンプを含むデータ・ポイントとして受信され、保持されます。

**モニター**は定義した許容範囲から外れたときに通知を送信します。

**サービスレベル目標(SLO)** は、品質基準を定義するため、長期間のメトリクスを追跡します。

## Metrics Explorer

メトリクス エクスプローラーは、Datadog でメトリクスを調べて視覚化するためのインターフェイスです。グラフは、Datadog が環境から取り込むメトリクスを視覚的に表現するもので、データの傾向、パターン、異常をすばやく把握できます。Storedog アプリからいくつかのメトリクスをグラフ化してみてください。

1. **[Metrics > Explorer](https://app.datadoghq.com/metric/explorer)** に移動します。

ページの右上隅に、時間範囲のドロップダウン メニューがあります。 デフォルトは `Past 1 Hour` です。

2. 時間枠を `Past 30 Minutes` に変更します

![Metrics Explorer page with time range selector highlighted.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/metrics-explorer-time-range.png)

### Query editor

Metrics Explorer ページの上部近くには、グラフのカスタマイズに使用できるクエリ エディターがあります。

![The query editor with docker.cpu.system in the query field.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/query-editor.png)

1. クエリ エディターの検索フィールドで、`docker.cpu.system` を検索します。

結果のグラフは、過去 30 分間に CPU がシステム コールを実行していた時間の割合を示します。

2. **avg by** テキスト ボックスを使用すると、Datadog が特定のメトリックに対して受け取る個別の値を結合するために使用されるメソッド (スペース集約と呼ばれます) を定義できます。 スペース集約では、集約される値は、特定のグループのすべてのメンバー (たとえば、クエリ フィルターに一致するすべてのホスト) によって報告された同時測定値を反映します。

スペース集約の可能なオプションには、レポート値の平均 (デフォルト)、最大、最小、および合計が含まれます。 詳細については、[Space aggregation](https://docs.datadoghq.com/ja/metrics/#space-aggregation) に関するドキュメントを参照してください。

**avg by** の横にあるテキスト ボックスをクリックし、`service` と入力します。

![Graph showing docker.cpu.system metric for 9 services with avg by text box highlighted.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/metrics-agg.png)

グラフには、`service` ごとにグループ化された `docker.cpu.system` メトリックが表示され、測定された各時点のコンテナー間で平均された値が表示されます。したがって、この特定のグラフを使用すると、さまざまなサービス間でメトリクスを比較し、データ内の異常を見つけることができます。

3. また、**from** テキスト ボックスを使用してタグ値を選択または検索して、フィルタリング範囲を定義することもできます。まずテキストボックスの **avg by** をクリアします。

4. **from** の横にあるテキスト ボックスをクリックし、`service:store-ads` と入力し始めます。

5. `service:store-ads` を選択して、`store-ads` サービスの `docker.cpu.system` メトリクスをグラフ化します。

![The query editor service:store-ads in the from text box.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/query-editor-from.png)

これで、`store-ads` を選択し、そのサービスのみの指標を調べることができます。

6. `store-discounts` の `docker.cpu.system` メトリクスもグラフ化したい場合はどうすればよいでしょうか? これにより、2 つのサービスを並べて比較することができます。

クエリ エディターの検索フィールドの下にある **+ Add Query** ボタンをクリックします。 これにより、新しいクエリ エディターが開きます。

7. 新しい **from** テキスト ボックスで、`service:store-ads` を `service:store-discounts` に置き換えます。

![Metrics Explorer with two query editors and two graphs.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/two-query-editors.png)

既存のグラフの隣に追加のグラフがどのように追加されているかに注目してください。 それらを 1 つに結合したい場合はどうすればよいでしょうか?

8. 2 つのクエリを 1 つのグラフにグラフ化するには、**One graph per query** ボタンをオフに切り替えます。

![Two metrics are shown in one graph with the one graph per query button togged off.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/one-graph-two-queries.png)

> [!IMPORTANT]
> 各メトリクスに付与されたメタデータ(タグ)の情報を用いてフィルタリング、グルーピングが可能です。

### Export to dashboard

1. **Save to Dashboard** ボタンをクリックすると、グラフをエクスポートするダッシュボードを選択するようポップアップ モーダルが表示されます。

**New Dashboard** リンクを選択して、このグラフを含む新しいダッシュボードを作成します。

![An Export graph popup modal with the New Dashboard link highlighted.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/export-graph.png)

2. **[Dashboards > Dashboard List](https://app.datadoghq.com/dashboard/lists)** に移動します。

3. 現在の日付と時刻が印刷されているリストの上部にある新しいダッシュボードをクリックします。

![Dashboard list with the first dashboard highlighted.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/new-dashboard.png)

ダッシュボードにメトリクス グラフが表示されるはずです。

![Dashboard with a metrics graph.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/dashboard-graph.png)

> [!IMPORTANT]
> 本セクションのように Metrics Explorer で作ったグラフをウィジェットとしてダッシュボードにエクスポートも出来ますし、ダッシュボードのウィジェットから直接グラフを作成することで同じ結果を取得することもできます。

## Monitors

### Create a metric-based monitor

メトリクスを検索、フィルタリング、グラフで視覚化すると、問題を簡単に発見できます。 しかし、何か問題が起こっていないかどうかを確認するために、これらのグラフを一日中見ることはできません。

そこでモニターが役に立ちます。 モニターは、メトリクス、Integration の可用性、ネットワーク エンドポイントなどをアクティブにチェックできます。

ここでは `store-discounts` サービスにおける `trace.flask.request` メトリクスがしきい値の2秒を超えたときにチームに警告するモニターを作成します。

1. **[Monitors > New Monitor](https://app.datadoghq.com/monitors/create)** に移動します。

Datadog が提供するすべての種類のモニターに注目してください。 各タイプの上にカーソルを置くと、その概要が表示されます。

2. **Metric** をクリックして、新しいメトリックベースのモニターを作成します。

3. 右上隅で、時間枠を `Past 1 Hour` に変更します。

4. **Choose the detection method** では、**Threshold Alert** のデフォルト値をそのまま使用します。 メトリックが設定したしきい値を超えると、アラートがトリガーされます。

5. **Define the metric** で、メトリックフィールドに `trace.flask.request` と入力し、**From** フィールドに `service:store-discounts` と入力します。

![Query for the new monitor is highlighted.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/monitor-query.png)

6. アラートと警告のしきい値を定義します。

**Set alert conditions** で、**Alert threshold** を 2 に、**Warning threshold** を 1.5 に設定します。

![Alert and warning threshold is set to 2 and 1.5 seconds.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/alert-conditions.png)

メトリックが警告しきい値とアラートしきい値を超えると、アラートがトリガーされます。

7. **Notify your team** で、モニターに名前を付け、モニターの警告メッセージを設定できます。

モニター名として、次を貼り付けます。

```
Discounts service request time
```

注: 次のアクティビティに進むには、モニターの名前が上記と一致する必要があります。

8. 監視メッセージの場合は、何を探すべきか、誰に通知すべきか、その他の役立つ情報を他の人に知らせる簡単なメッセージを作成します。 独自のメッセージを書いてみたり、以下のメッセージを自由に使用してみてください。

```
Investigate the source of the problem.

Try checking the APM service page for `store-discounts`:  
https://app.datadoghq.com/apm/resource/store-discounts/flask.request/142958ce96cf2aa?query=env%3Aquickstart-course

Contact @incident@example.com after triage.
```

注: 電子メール アドレスの前にある `@` 記号は、そのユーザーが組織の一部である場合、そのユーザーの Datadog プロファイルへのリンクとして表示されます。 このアクティビティでは、参照ユーザー (incident@example.com) は存在しませんが、通知メールがどのように送信されるかを確認したい場合は、ご自身のメール アドレスを自由に追加してください。
通知テキスト領域の特別な構文機能の詳細については、[Notifications docs](https://docs.datadoghq.com/ja/monitors/notify/) を参照してください。 これらのドキュメントでは、Slack、PagerDuty、Webhook の Datadog 統合によって可能になる強力な通知ベースの機能についても説明しており、将来的には他の機能も可能になります。

9.  このアクティビティでは、残りのデフォルト設定をそのままにしておきます。

10. **Create** をクリックします。

> [!IMPORTANT]
> 通知先としてはメールアドレス、Slack、Teams 等のコラボレーションツール、Jira、Datadog Event Management 等の問題管理ツール、ServiceNow等のITSMツール、他に汎用的な Webhook を用いた API コールも可能です。

> [!IMPORTANT]
> 通知文をカスタマイズ出来る点がポイントです。文面には設定されたモニターによるアラート通知を受けた際にどういったアクションを取るべきか、つまりアクショナブルなメッセージを記述すべきです。例えば連絡すべきチーム、併せて確認すべきポイント、該当サービスの状態を確認するための URL、そして手順書等です。

### Monitor status page

新しく作成されたモニターはデータが表示されるまでに数分かかるため、待っている間にモニターのインターフェイスを調べてください。

![Discounts service request time monitor is in ok status.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/discounts_service_monitor2.png)

ページの上部、モニター タイトルの隣にモニターのステータスが表示されます。 モニターは、関連するデータがモニターのしきい値を超えているかどうか (またはまったく報告していないか) に基づいて、`OK`, `Warn`, `Alert`, もしくは `No Data` の状態になります。

- 上側に、**Mute** (モニターが警告状態にある場合は **Resolve** ) があります。

- **Mute** ボタンを使用すると、モニター全体をミュートしたり、スコープを設定して部分的にミュートしたりできます。

- **Next Steps** ドロップダウン メニューには、ケースを作成するか、インシデントを宣言するオプションがあります。

- モニターがアラート状態にある場合は、モニターを手動で解決できる **Resolve** ボタンが表示されます。

注: `trace.flask.request` メトリックは APM から発生する分散メトリックであるため、モニターは APM モニターです。

- **Monitor behavior** セクションには、モニターのステータスを経時的に示すステータス グラフが、履歴グラフと評価グラフとともに表示されます。

- **Event timeline** セクションには、アラートがいつトリガーまたは回復されたかなど、モニターから生成されたイベントが表示されます。

**Monitor behavior** セクションのグラフにはすでにデータが入力されているはずなので、詳しく見てみましょう。

1. グラフの時間枠を `Past 1 Hour` に変更します。

![Status and history section showing the status graph and evaluation graph.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/status-history2.png)

2. ステータスグラフを調べます。

![Status graph shows just one group.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/status-graph.png)

ステータス グラフには、監視クエリのディメンションではなく、アラート用に構成したディメンションが表示されます。 たとえば、モニターのクエリが `service` と `host` ごとにグループ化されているが、アラートが `service` に対してのみ設定されている場合、ステータス グラフには `service` に対するモニターのステータスのみが表示されます。

![Example of a status graph grouped by service.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/status-graph-grouped.png)

ただし、このアクティビティでは、`store-discounts` サービスのメトリクスのみを確認するように指定したため、ステータス グラフはグループ化されません。

3. 履歴グラフを調べます。 収集されたデータがその上のステータス グラフと並べて表示されます。 モニターで、メトリック クエリに対して送信された生データ ポイントを確認できます。

![History graph shows data for the past hour.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/history-graph.png)

**Evaluation Graph** を調べます。 評価グラフはモニターごとに異なります。 履歴グラフと同じクエリ ロジックを使用しますが、スコープは履歴グラフの時間枠ブラケットに限定されます。モニターの評価ウィンドウに対応する固定のズーム ウィンドウがあり、表示されたポイントが正しく集計されていることを確認します。

![Evaluation graph shows data points where they fall in relation to the warning and alert thresholds.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/evaluation-graph.png)

警告しきい値が黄色で網掛けされ、アラートしきい値が赤色で網掛けされていることに注目してください。

> [!IMPORTANT]
> タグを使ってグループ化を行うことでモニタリング対象を自動追加すれば手動の監視対象追加は不要です。例えばモニタを host タグでグループ化すれば、新たなホストが加わった際には当該ホストは自動的にモニターの対象となります。管理負荷低減と設定漏れの防止に寄与します。

### Monitor in alert status

モニターがまだアラート ステータスになっていない場合は、モニターを編集してアラートのしきい値を下げ、アラートをトリガーします。

1. 評価グラフを確認し、メトリクスがどの程度急上昇したかをメモします。

2. 右上にある、**Edit** を選択してモニターを編集します。

3. **Set alert conditions** で、アラートがトリガーされるように、**Alert threshold** と **Warning threshold** のしきい値を適宜下げます。 たとえば、アラートしきい値を 1.5 秒に設定し、警告しきい値を 1 秒に設定できます。

![Alert and warning threshold is set to 1.5 and 1 second.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/lower-threshold.png)

4. **Save** をクリックしてモニターに戻ります。

5. モニターが更新されるまで待ち、評価グラフの陰影が新しい警告およびアラートのしきい値でどのように更新されたかを確認します。

6. アラートがトリガーされ、モニターのステータスが赤色に変わったら、ステータスと評価のグラフを確認してください。

![Evaluation graph shows the metric reaching the alert threshold.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/eval-graph-alert.png)

7. **Event** セクションで、モニターを変更するイベントとアラートがいつトリガーされたかを確認します。

![Events noting when the monitor was modified and when the alert was triggered.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/events-alert.png)

通知を受け取るために電子メール アドレスを入力した場合、次の内容が届きます。

![Notification email for alert triggered.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/triggered-email.png)

メールにはメッセージ、クエリ、評価グラフが含まれます。
また、モニターが警告しきい値を超えた場合、およびアラート状態から回復した場合にも通知されます。

![Notification email for monitor in warning status.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/warn-email.png)

![Notification email for recovered monitor.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/recovered-email.png)

注: [conditional variables](https://docs.datadoghq.com/ja/monitors/notify/variables/?tab=is_alert#conditional-variables) を使用すると、モニターのステータスまたはモニターのトリガー方法に関する詳細に応じて、さまざまなメッセージを表示できます。

> [!IMPORTANT]
> 本セクションではアラート発報する値を静的に設定する、いわゆるしきい値監視を設定しました。Datadog では通常のふるまいから逸脱した動きが一定時間以上あった際にアラート発報する Anomaly 分析、同じふるまいをすべきグループ内で異なるふるまいを行うメンバーを検知する Outlier 分析、またこのままのペースであるメトリクスが推移した場合に今後どういったふるまいをするかを予測する Forecast 分析を AIOps の機能群として提供しており、人間が把握できない異常検知を支援する機能としてモニター設定の中で活用頂く事が可能です。

## Service Level Objectives(SLOs)

SLO を使用すると、提供されるサービス、製品、またはアプリケーションの明確なパフォーマンス目標を設定し、長期的にこれらの目標をどれだけ達成できているかを測定できます。 Datadog では、SLO を使用して、パフォーマンス測定 (または一連の測定) が、7 日、30 日、または 90 日のローリング時間枠における目標時間割合 (デフォルトでは 99.9%) の最小しきい値を満たしているかどうかを判断します。この機能を使用すると、組織が外部顧客または内部エンド ユーザーに対するサービス義務をどの程度満たしているかを追跡できます。

SLO の良い例は、「`discounts` サービスは 7 日間の 99.9% の時間で正常に実行される必要がある」などです。

`discount` サービスのリクエスト時間をモニターとして構成したので、それを新しい SLO のサービス レベル インジケーター (SLI) として使用できます。

1. **[Service Mgmt > SLOs](https://app.datadoghq.com/slo/manage)** に移動します。

2. 右上隅にある `New SLO` ボタンをクリックします。

3. **Select how to measure your SLO** で、`By Monitor Uptime` を選択します。

4. **Select monitors** ドロップダウン メニューから、`Discounts service request time` を選択します。

5. **Set your target & time window** で、デフォルト値の 99.9% (7 日間) のままにします。

6. **Add name and tags** で、**Name** を次のように設定します。

```
SLO: Discounts service request time
```

> [!NOTE]
> このアクティビティを完了するには、SLO の名前が上記と一致する必要があります。

![New SLO settings are populated for the Discounts service request time SLO](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/new-slo.png)

7. **Create and Set Alert** をクリックします。 これにより、新しい SLO モニター設定ページが表示されます。
**Select SLO** で、SLO がすでに選択されていることに注目してください。

8. **Set alert conditions** では、**Error Budget** をデフォルト値のままにします。 7 日間のターゲットの budget が 100% 消費されると、アラートが表示されます。

9. **Notify Your Team** で、モニターに次の名前を付けます。

```
SLO: Discounts service request time
```

10. 次のメッセージをメッセージ テキスト領域に貼り付けます。

```
Discounts service request time budget depleted.
```

11. このアクティビティでは、残りの設定はデフォルトのままにしておきます。

12. **Create** をクリックします。 これにより、新しい SLO モニター ページが表示されます。

13. **Properties** セクションで、**SLO: Discounts service request time** リンクをクリックして、新しいブラウザ ウィンドウで SLO サイド パネルを開きます。

14. **Status & History** タブをクリックして、実際の SLO を確認します。

![The status and history for the SLO.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Metrics/slo-status-history.png)

サイド パネルには、SLO の各ターゲットの全体的なステータスのパーセンテージと残りのエラー バジェットが表示されるほか、SLI の履歴のステータス バー (モニター ベースの SLO) または棒グラフ (メトリック ベースの SLO) も表示されます。

> [!IMPORTANT]
> CPUやメモリ使用率等の「リソースメトリクス」ではなく、APM メトリクス等のエンドユーザに近いポイントで取得した「ワークメトリクス」を用いてSLIを定義することが重要です。

> [!IMPORTANT]
> 本セクションでは(モニターが正常である時間)/(総時間)でSLIを定義しましたが、カウンタ形式のメトリクスを用いて(Good Event 数)/(Total Event 数)という形で SLI を定義することも可能です。

# Integration

Integration とは、Datadog がサードパーティのアプリケーションなど、個々のテクノロジーを監視するためのアドオンソフトウェアパッケージです。この記事を書いている時点では、900 以上の Integration が利用可能で、さらに定期的にリリースされています。

Integration には主に 3 つのタイプがあります。エージェントベースの Integration、認証ベースの Integration、ライブラリ Integration です。ほとんどの Integration は事前に構築されており、単にインストールするだけですが、独自のカスタム Integration を構築することもできます。

- **Agent ベースの Integration** は、Datadog Agent と共にホストまたはコンテナにインストールされ、`check` と呼ばれる Python クラス・メソッドを使用して収集するメトリクスを定義します。

Datadog Agent は、ホスト上で動作する重要なソフトウェアです。Datadog Agent はプロセスレベルのイベントとメトリクスを収集し、Datadog に送信します(このコースでは、全てのラボで Datadog Agent が既にインストールされています)。

Datadog のデフォルトの Agent ベースの Integration は、ディスク、CPU、メモリ、ネットワークスループットなどのパフォーマンスデータを収集し、組織のインフラストラクチャの主要なコンポーネントを監視する能力を提供します。

- **認証(クローラー)ベースの Integration** は、Datadog アプリで構成され、API 経由でメトリクスやデータを取得するための認証情報を提供する必要があります。これらには、Slack、AWS、Azure、PagerDuty のような一般的な Integration が含まれます。

- **Library Integration** は、Datadog API を使用して、Node.js や Python など、アプリケーションの記述言語に基づいてアプリケーションを監視することができます。

## Agent-based Integration

Agent ベースの Integration は、Datadog Agent と一緒にインストールされます。それぞれ、Agent が 15 秒ごとに実行する `check` という Python メソッドを公開しています。そのため Agent の Integration は、特に Agent のコマンドラインインタフェースで作業する場合、"checks" とも呼ばれます。

このアクティビティでは、Agent コマンドを実行して、Agent が実行しているチェックを観察します。また、チェックが収集する正確なメトリクスを確認する方法と、そのドキュメントを見つける方法を学びます。

Storedog の eコマース・ウェブサイトは、今あなたのラボの仮想マシンで実行されています。
バックエンド、フロントエンド、関連サービスを提供するために、約10個の Docker コンテナが稼働しています。コンテナの1つは Datadog Agent で、仮想マシン、Docker デーモン、デーモンが実行しているコンテナを監視しています。

前述したように、このコンテキストにおける Agent の Integration は "チェック" と呼ばれます。

### Check status

いくつかのシステムチェックは、エージェントに同梱されている数十の Integration 機能の中に含まれています。これらは、CPU、IO、負荷、メモリ、スワップ、アップタイムに関する基本システムからのメトリクスを提供します。

今、あなたのラボでこれらのチェックが実行されているのを見てみます。

1. ターミナルで以下のコマンドを実行します。

```
docker compose exec datadog agent status
```

このコマンドは、コンテナオーケストレータである `docker compose` に、`datadog` サービスコンテナ内で `agent status` コマンドを実行するように指示します。

これにより、エージェントのステータスに関する数ページの情報が出力され、その多くは実行中のチェックのステータスです。

2. 出力をスクロールアップして、実行中のチェックに注目してください。CPU、メモリー、I/O、ディスクなどのシステムチェックを探してください。

![system checks](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Integration/agent_status_output.png)

`Instance ID` の隣に、チェックの健全性が表示されます。この場合、`[OK]` です。

さらにその下には、`Total Runs` があり、Agent が起動してからこのチェックを実行した回数が表示されます。

また、前回のチェックで収集されたメトリックサンプル数と、Agent の開始以降のこれらのサンプルの実行合計も表示されます。

最後に、`Average Execution Time`、`Last Execution Date`、`Last Successful Execution Date` を見ることもできます。

デフォルトでは、Disk Integration は `Service Checks` を実行せず、`Events` も発行しません。

また、エージェントはこれらの情報を保持しません。エージェントが再起動すると、合計と平均はリセットされます。

> [!IMPORTANT]
> disk 以外にもどのようなチェックが動いているか確認してみましょう。nginx, postgres, regisdb 等のチェックが動いており、Agent から nginx, postgres, regisdb の各エンドポイントにアクセスし統計情報を取得しています。

## Integrations in Datadog

Agent にとって Integration とは、メトリクス、イベント、ログ、サービスチェックを収集する、Python のチェックの1つです。Datadog では、Integration は、すぐに使える（OOTB）ダッシュボード、パイプラインと呼ばれる特別なログ処理ルール、推奨モニタ、その他の資産を提供することもできます。

> [!IMPORTANT]
> これによりユーザーは利用するサービスからすぐにデータ収集を開始でき、データの構造化、データ可視化、さらにはデータ監視設定もイチから行わず、Datadog が提供する雛形を活用することが出来ます。

### Open the Integrations page

1. ラボが作成した Datadog トレーニング アカウントの認証情報を使用して [Datadog](https://app.datadoghq.com/) にログインします。 試用版の認証情報を取得する必要があるときはいつでも、ラボ ターミナルで `creds` コマンドを実行できます。

2. Datadog にログインすると、自動検出されインストールされた Integration 機能の一部が Datadog ホームページに表示されます。

![Partial list of installed integrations on the app homepage](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Integration/homepage_installed_integrations.png)

3. グローバルナビゲーションで [Integrations](https://app.datadoghq.com/integrations) をクリックしてください。アイコンはパズルのピースです。

Integrations はタイルとして表示され、**Autodetected Integrations**、**Installed**、**Available** の 3 つのカテゴリーに分類されます。

![Integrations page with tiles grouped by autodetected, installed, and available](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Integration/integrations_page_categories.png)

- **Autodetected Integrations** は、エージェントによって検出されましたが、まだ構成されていません。
- **Installed** はエージェントによって検出され、設定を必要としません。設定は必要ありません。
- **Available** は、エージェント以外の Integration を含む、それ以外のものです。次のアクティビティで学びます。

4. **Installed** セクションの下にある Integration を確認してください。

一般的に、エージェントが Integration のチェックを正常に実行している場合、そしてその Integration が OOTB ダッシュボード、ログ、またはパイプラインに付属している場合、Integration はここに表示されます。

### Find configuration instructions

1. [Integrations](https://app.datadoghq.com/integrations) ページで、**Docker** タイルをクリックします。Integration パネルが開きます。すべての Integration パネルには、少なくとも **Overview** と **Configuration**（または **Configure**）タブがあります。

まだ選択されていない場合は、[Configuration] タブをクリックします。このタブには、仮想ホスト上で Docker Integration を設定するための手順が記載されており、[コンテナ化された Docker Agent ドキュメント](https://docs.datadoghq.com/ja/containers/docker/?tab=standard#setup) へのリンクもあります。

このラボでは、コンテナ化された Agent を使用しています。

2. Docker Integration パネルで、**Data Collected** タブをクリックします。

ここには、この Integration が収集するすべてのメトリクスが表示されます。

3. より複雑な設定の Integration を見るには、Docker Integration パネルを閉じ、**PostgreSQL** タイルをクリックします。

4. **Configure** タブをスクロールして、**Docker** セクションを見つけます。PostgreSQL Integration がラボでどのように構成されているかを示します。

5. PostgreSQL パネルで、**Monitoring Resources** タブをクリックします。この Integration がインストールされると自動的に作成されるその他のアセットが一覧表示されます。

![PostgreSQL integration panel on the Assets tab](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Integration/postgres_integration_assets.png)

PostgreSQL の場合、2 つのダッシュボードと 2 つの推奨モニターがあります。

### Browse OOTB dashboards

1. PostgreSQL Integration パネルの **Monitoring Resources** タブで、**Dashboards** の下の **Postgres - Overview** をクリックします。

この Integration に含まれる PostgreSQL 概要ダッシュボードが開きます。ダッシュボードは以下のようになります：

![A partial view of the Postgres - Overview OOTB dashboard](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Integration/postgres_overview_dashboard.png)

他の OOTB ダッシュボードと同様に、このダッシュボードは、Integration が構築されたコンポーネント（この場合は PostgreSQL）の監視を即座に開始するためのものであり、利用可能な可視化の例を提供します。
   
2. グローバルナビゲーションの **[Dashboards](https://app.datadoghq.com/dashboard/lists)** をクリックして、ダッシュボードリストに移動します。

ここでは、すでにインストールされている Integration によって利用可能になった多くの OOTB ダッシュボードを見ることができます。

![Partial view of the Dashboards list displaying several OOTB from integrations](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Integration/integration_ootb_dashboards_in_list.png)

これらのダッシュボードをご自由にご覧ください。

> [!IMPORTANT]
> OOTB ダッシュボード内のウィジェットをコピーし、自分のダッシュボードにペーストして好みのレイアウトとすることも可能です。

## Authentication and Library Integrations

このアクティビティでは、残りの 2 つの Integration タイプについて学びます。まず、認証ベースの Integration をいくつか見ていきます。次に、アプリケーションをクライアントライブラリでインスツルメンテーションする方法を説明します。

### Authentication integrations

認証ベースの Integration がサードパーティのデータを Datadog アカウントに取り込むために使用する一般的な方法は 2 つあります。

- Datadog は、サードパーティ API の API キー、トークン、その他の認証情報を使用して、データを Datadog に *Pull* することができます。
- サードパーティは、ユーザが提供する Datadog API キーを使用して、データを Datadog に *Push* することができます。

> [!IMPORTANT]
> 最も共通的に使われる認証ベースの Integration はクラウドプロバイダとの Integration です。Datadog に展開されたクローラーから各クラウドプロバイダのメトリクスエンドポイントに接続することで各クラウドサービスのメトリクスを Datadog に収集します。

#### Datadog pulls from third party

CircleCI の Integration は、サードパーティの API からデータを引き出す Integration の例です。どのように構成されているか見てみましょう。

1. Datadogで、**[Integrations](https://app.datadoghq.com/integrations)** に移動します。

2. 検索フィールドに `circleci` と入力します。

![Searching for the CircleCI integration in Datadog](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Integration/circle_ci_integration_search.png)

3. `Integration` タグの付いたタイル（`Software License` ではない）をクリックして、Integration の詳細パネルを開きます。

4. **Configure** タブをクリックし、説明をお読みください。

CircleCI に接続するには、CircleCI アカウントにログインし、Datadog 用の API トークンを生成します。

5. **Add Account** ボタンをクリックしてください。

ここに API キーを貼り付け、関連するリポジトリ名を指定します。

![CircleCI integration configuration with form to paste ](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Integration/circle_ci_configuration_page.png)

ここでは説明のみであり、何も設定変更を行う必要はありません、

6. Integration パネルを閉じます。

#### Datadog pushes to third party

GitHub Integration は、サードパーティが Datadog にデータをプッシュする Integration 例です。

1. Integrations の検索フィールドに `github` と入力します。

![Searching for the GitHub integration in Datadog](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Integration/github_integration_search.png)

2. `by Datadog` と書かれたタイルをクリックして、の詳細パネルを開く。

3. **Configuration** タブをクリックします。

この Integration は、GitHub アカウントに "GitHub App" を作成することで機能します。これは GitHub があなたのリポジトリへの外部からのアクセスを制御する方法です。

![The GitHub integration configuration page](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Integration/github_configuration_first_view.png)

4. **Create Your First GitHub App** ボタンをクリックします。

フォームが表示されるので、Integration したい GitHub アカウントの種類、有効にしたい Integration 機能の種類、そして GitHub App がリポジトリに対して持つ権限などを入力します。

![The GitHub integration App configuration form](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Integration/github_configuration_form.png)

ここでは説明のみであり、何も設定変更を行う必要はありません、

5. この Integration を実際に設定する場合は、次のようにします。**Create App in GitHub** ボタンをクリックし、GitHub アカウントでさらに設定を進めます。

これらのステップを適切に実行し、後でこのページに戻ると、Integration の初期設定が成功したことがわかります。しかし、いくつかの機能を有効にするには、より細かい設定が必要であることもわかります。

![The GitHub integration App configuration](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Integration/github_configuration_page.png)

Integration が設定されると、GitHub は Datadog のエンドポイントを呼び出してデータをアカウントにプッシュします。

### Library integrations

Datadog Integration の第3のタイプは、クライアント・ライブラリです。これらの Integration は、 アプリケーションコードに直接インポートされるオープンソースのコードパッケージです。これらのライブラリを使用することで、開発者はアプリケーション・パフォーマンス・モニタリング（APM）のために、エージェントを通じて Datadog にトレースやプロファイリング・データを簡単に送信することができます。

ラボで実行されている eコマース・アプリケーションである Storedog は、いくつかのサービスによって提供されています。Ruby で書かれたものもあれば、Python で書かれたものもあります。これらの言語にはそれぞれ Datadog のライブラリがあり、Storedog はすでに完全にインスツルメンテーションされています。

> [!IMPORTANT]
> 先述した APM はこの Library Integration によってアプリケーションからデータを収集します。

#### Installing libraries

Datadog は、様々なコンテキストでライブラリをコードにインストールするためのウィザードを提供します。

1. Datadog で[APM > Add a component](https://app.datadoghq.com/apm/getting-started) に移動します。
2. 左側の **Container-Based** をクリックします
3. **Docker** をクリックします。
4. **Same host** をクリックします。
5. **Python** をクリックします。

コンテナの設定を支援するウィザードを含む、この構成用の Python アプリケーションのインスツルメンテーションの手順が表示されます：

![APM for a docker python service](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Integration/ddtrace_pthon_configuration_wizard.png)

最初の手順は **Run the Agent** であることに注意してください。エージェントは、アプリケーションからトレースデータを受け取る必要があります。

ここでは説明のみであり、何も設定変更を行う必要はありません、

7. **Java** や **Ruby** など、他の言語をクリックして、指示がどのように変わるか見てください。

> [!IMPORTANT]
> ご覧頂いた通り、基本的なAPMの設定はアプリケーションの起動コマンドやパラメータの設定で済み(自動インスツルメンテーションと呼びます)、アプリケーションのソースコードに手を入れて頂く必要はありません。アプリケーションで Datadog Library にてサポートされていないフレームワークをお使いの場合や、メタデータの細かい制御が必要な場合のみ、ソースコードに手を入れて頂く(カスタムインスツルメンテーションと呼びます)必要があります。

# Dashboards

ダッシュボードを抜きにして、Datadog の主な機能と利点を語ることは出来ません。ダッシュボードを使用すると、さまざまなチャート、テーブル、グラフ、その他の視覚的なデータ表現を1つのページに統合することができます。すぐに使える OOTB ダッシュボードとカスタムダッシュボードの両方を通じて、システムの健全性にとって最も重要なメトリクスを明確かつ簡潔に把握することができます。すべてのダッシュボードは中央の場所に保存されるため、問題を特定し、傾向を検出し、システム・パフォーマンスを改善するための措置を講じるために必要な情報をすばやく見つけることができます。

これらのダッシュボードは、他のユーザーと共有することができます。ダッシュボードを URL や電子メールのリンクで共有することで、他の人がデータを変更することなく、リアルタイムでダッシュボードの内容を見せることができます。

## Dashboard list

Datadog で利用可能ないくつかのすぐに使える (OOTB) ダッシュボードを見てみましょう。

> [!IMPORTANT]
> Datadog は 2024/1 時点で 450 以上の OOTB ダッシュボードを提供しています。

1. ラボが作成した Datadog トレーニング アカウントの認証情報を使用して [Datadog](https://app.datadoghq.com/) にログインします。 試用版の認証情報を取得する必要があるときはいつでも、ラボ ターミナルで `creds` コマンドを実行できます。

2. **[Dashboards > Dashboard List](https://app.datadoghq.com/dashboard/lists)** に移動します。
Postgres、Python、Redis、Ruby、NGINX などの Integration 機能とともにインストールされた、事前に構築されたダッシュボードが多数あることに気づくでしょう。

3. 検索バーに `Postgres` と入力し始めます。 2 つの Postgres ダッシュボードが表示されます。

4. **Postgres - Metrics** ダッシュボードをクリックします。

5. 時間枠を `Past 15 minutes` に設定します。

PostgreSQL データベースとデータベース サーバーに関するリアルタイムのパフォーマンス データが表示され、パフォーマンスの問題のトラブルシューティングに役立つ可視性が提供されます。

![Postgres metrics dashboard with four graph widgets.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Dashboard/postgres-metrics-dashboard.png)

6. このダッシュボードを自分用にカスタマイズしたい場合は、複製を作成できます。
ダッシュボードの右上にある **Clone** ボタンをクリックします。

7. ポップアップ モーダルで、複製されたダッシュボードに新しい名前と説明を自由に入力できます。
**Clone** をクリックします。

8. ウィジェットを再配置したり、新しいウィジェットを追加したりできるようになりました。
ウィジェットをクリックしてドラッグし、ダッシュボード上の位置を再配置します。

これらすべてのウィジェットが必要ない場合はどうすればよいでしょうか? クローンを作成する代わりに、独自のダッシュボードを最初から作成できます。

## Create a dashboard

独自のダッシュボードを作成し、OOTB ダッシュボードからウィジェットをコピーするか、既存のグラフをそこにエクスポートすることで、ダッシュボードを埋めることができます。 あるいは、新しいダッシュボードから新しいウィジェットを直接追加することもできます。

> [!IMPORTANT]
> ダッシュボードの作成にも特別なクエリ言語の習得は必要ありません。組織全体向けのダッシュボードであっても、ある個人向けのダッシュボードであっても、ユーザーが自分の作りたいダッシュボードを体感的なインタフェースでお作りいただけます。

1. **Dashboards > New Dashboard** に移動します。

作成できるさまざまな種類のダッシュボード (グリッドベースのダッシュボード、タイムボード、スクリーンボード) に注目してください。

![Create a Dashboard popup modal that shows different dashboard layouts.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Dashboard/create-dashboard-modal.png)

2. **Dashboard Name** として以下を入力してください。

```
Datadog Quick Start Dashboard
```

3. **New Dashboard** をクリックします。
空のダッシュボードが表示されますので、そのまま入力してください。

4. 既存の OOTB ダッシュボードのウィジェットを使用する場合は、それらをコピーして貼り付けることができます。
**Postgres - Metrics** ダッシュボードに戻ります。

ヒント: `Cmd/Ctrl+K` を押してクイック ナビゲーション メニューを開き、名前でダッシュボードを検索できます。

5. コピーしたいウィジェットを選択します。 ウィジェットの上にカーソルを置き、`Cmd/Ctrl+C` を押してウィジェットをコピーします。ウィジェットがコピーされたことを示すメッセージが表示されます。

![Popup modal confirming widget was copied to clipboard.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Dashboard/copying_widget_from_preset.png)

6. **Done** をクリックします。

7. `Cmd/Ctrl+Shift+K` を押してクリップボードを開きます

![Clipboard indicator showing one widget copied.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Dashboard/clipboard_indicator.png)

Datadog 全体のグラフ、ウィジェット、その他のコピー可能なリソースをここに収集し、後でノートブック、ダッシュボード、その他のページに貼り付けることができます。

8. `Cmd/Ctrl+Shift+K` をもう一度押すか、クリップボードの右上隅にある **x** をクリックしてクリップボードを閉じます。

9. `Datadog Foundation Dashboard` に戻ります。

10. **Add Widgets** サイド パネルが開いている場合は閉じます。 (このサイドパネルについては次のセクションで詳しく説明します。)

11. `Cmd/Ctrl+V` を押して、コピーしたウィジェットを貼り付けます。あるいは、クリップボードにアクセスして、**Paste on this page** ボタンをクリックすることもできます。

コピーされたウィジェットがダッシュボードに表示されるはずです。

![Dashboard with the copied widget pasted.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Dashboard/copied-widget.png)

12. `Cmd/Ctrl+Shift+K` をもう一度押すか、クリップボードの右上隅にある **x** をクリックしてクリップボードを閉じます。

独自のダッシュボード ウィジェットを最初から作成して構成することもできます。

## Add and configure a widget

多くのウィジェット新規に作成したり、ダッシュボードに追加できます。たとえば、ダッシュボードにメトリクス グラフを追加してみてください。

1. ダッシュボード ページの右上にある **+ Add Widgets** ボタンをクリックするか、ダッシュボードの中央にある大きな **Add Widgets or Powerpacks** の四角形をクリックして、**Add Widgets** サイド パネルを開きます。

2. **Graphs**で、 `Timeseries` ウィジェットをクリックします。

3. Step 2 **Graph your data** で、 `system.cpu.user` を次のものに置き換えてクエリを変更します。

```
docker.cpu.system
```

これは、ページの上部で選択した時間枠にわたって、コンテナーのプロセスに代わって CPU がシステム コールを実行している時間の割合を反映する `docker.cpu.system` メトリック値をグラフ化します。

4. 時間枠を `Past 15 minutes` に変更します。

![Widget modal graphing docker.cpu.system over the past 15 minutes.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Dashboard/widget-metrics-graph.png)

5. これを 1 つのサービス `store-discounts` に絞り込みます。
**from** フィールドに次のように入力してクエリを変更します。

```
service:store-discounts
```

現在、グラフには、過去 15 分間 `store-discounts` サービスのみの `docker.cpu.system` に メトリック値が表示されています。

![Widget modal graphing docker.cpu.system for the discounts service over the past 15 minutes.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Dashboard/widget-discounts-metrics-graph.png)

`Store-ads` サービスの `docker.cpu.system` メトリクスもグラフ化したい場合はどうすればよいでしょうか?
 **+ Add Query** ボタンをクリックして新しいクエリを追加し、今回は **from** フィールドを ``service:store-ads` に設定します。
 
 ![Widget modal graphing docker.cpu.system for the discounts and ads service over the past 15 minutes.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Dashboard/widget-discounts-ads-metrics-graph.png)
 
6. ステップ 4 で、グラフにタイトルを付けます。自由に名前を付けます。 (提案されたタイトルを残すこともできます。)
次に、 **Save** をクリックします。
新しく作成したウィジェットがダッシュボードに表示されるはずです。

![Newly created metrics graph widget on the Datadog Foundation Dashboard.](https://raw.githubusercontent.com/DataDog/Datadog-Labs-jp/main/foundation-lab/images/Dashboard/metrics-widget.png)

注: メトリック エクスプローラーでこのグラフを作成し、そのグラフをこのダッシュボードにエクスポートすると、同じ結果が得られます。

注: パワーパックを使用して、多くの関連ウィジェットを一度にダッシュボードに追加することもできます。 詳細については、[Scale Graphing Expertise with Powerpacks documentation](https://docs.datadoghq.com/ja/dashboards/guide/powerpacks-best-practices/) と、 [Save dashboard widgets in reusable groups with Powerpacks blog post](https://www.datadoghq.com/blog/standardize-dashboards-powerpacks-datadog/) を参照してください。

# Summary

基礎から学ぶ Datadog - ハンズオントレーニング 2025の終了おめでとうございます！

このコースでは、Datadog のような機能群を触ることにより、インフラやアプリケーションを含む環境全体を把握するための幅広いツールを提供する包括的な監視プラットフォームであることを学びました。

- **Logs** では、インフラストラクチャやアプリケーション全体のイベントを記録し、メトリックスでは、長期的な測定値を追跡することができます。
- **APM** では、ライブラリを読み込むことによりサービス間の呼び出しを可視化しアプリケーションレベルの健全性データを取得します。
- **モニター**や **SLO** 機能を用いてメトリクスを用いた監視やサービスの健全性の可視化を行います。
- **Integration** により、サードパーティ製アプリケーションなど、環境のさまざまなコンポーネントから Datadog にすべてのメトリクスとログを取り込むことができ、システムを統合的に把握することができます。
- **ダッシュボード**は、重要な観測データのさまざまな可視化を統合するための使いやすいインターフェイスを提供し、システムの健全性の特定の側面の概要をすばやく把握するのに役立ちます。

# Next Steps
このコースは多くの内容をカバーしていますが、Datadog で実現できることのほんの表面をなぞったに過ぎません。学習を継続するために、[Datadog Learning Center](https://learn.datadoghq.com/) の他のコースを受講することをお勧めします。これらのコースの中には、セットアップ手順等、ここで学んだことの延長線上にあるものもあれば、Datadog の全く新しい側面を紹介するものもあります。
