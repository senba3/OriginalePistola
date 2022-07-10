# Originale Pistola
手軽に銃を大量に

## Features
多少の知識量があれば様々な銃を作れる。残弾数やチャージ時間もお好きなように。


## Usage
ここにお手本の銃のgiveコマンドを貼ります。

``/give @s iron_hoe{sen.clicks:1b,SenGuns:{Damage:{damage:300},gun:{Count:6b,Charge:20,Load:60,Move:10,Speed:3}}}``

"sen.clicks:1b"のタグはこのデータパックを構成しているライブラリを反応させるために必要です。

"SenGuns"の内部に銃や弾丸の情報を記入します。Damage部分はそのままのダメージ量。この部分は私の他のライブラリ、DamageProductionと同じ書き方に対応しています。

"gun"の内部は主な銃の情報です。"Count"は銃弾数を表しています。"Charge"は銃弾を発射するスピードを表します。"Load"は銃弾を出し切った後の補充時間を表します。"Move"は銃弾が動く時間(tick)を表します。"Speed"は1tick(1/20s)あたりに動く速さ(m/tick)を表します。

これらの簡単な設定により銃は動きます。鍬に限らす基本的にどんなアイテムでも銃にすることが出来ますが、防具や名札には対応していません。


## Author
 Senba

## License
"Originale Pistola" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).

## 使用範囲
再配布可能
自作発言はおやめを
