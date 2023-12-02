# Tomcatメトリクスの送信
Integration的な機能はなし、後ほど出てくるトレーサーでランタイムメトリクスは取れるが、Collector単体では取れるのだろうか、誰か調べて！

# Tomcatログの送信



### Liferayでの操作
WebアクセスログをDatadogに送信するために、Liferayにアクセスします。

## Datadog上でログを確認
1. Datadog画面に戻り左の\[Logs\]→\[Search\]を選択
2. 左側のFacets欄のCORE->Hostを開き、下図のように自分のホストのみにチェックをつけてください。

![facets](https://github.com/DataDog/Datadog-Labs-jp/blob/main/datadog-101/images/facets.png)

3. どれか1つログをクリックします。
4. Sourceがtomcatとなっており、ログがJSON形式に構造化されていることを確認します。

以上でLab2は終了です。
[Lab3](../Lab3)を進めてください。
