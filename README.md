# 計算アプリ

暗算が苦手な自分が、「こんなアプリがあったら便利だろう」と思って作ったアプリ。<br>
税込価格の計算と、単価の計算の２種類を実装。

---
## 構成要件
* Language : Swift
* Version : 5
* XCode : 15.2
* iOS : 17.2

---
## 使い方
#### 1. 税込計算

<img src="スクリーンショット 2024-05-29 14.45.09.png" width="30%">

1. 「税抜：」の入力欄に税抜き金額を入力
1. 「8%」か「10%」かボタンで選択してタップする
1. ボタンの下に、税込金額が自動で表示される

#### 2. 単価計算

<img src="スクリーンショット 2024-05-29 14.32.11.png" width="30%">

1. 「合計金額：」入力欄に商品の金額を入力
1. 「個数：」入力欄に何個入りかを入力
1. 「計算する」ボタンをタップで、ボタンの下に１個いくらかが自動で表示される

#### 3. 共通の仕様

<img src="スクリーンショット 2024-05-29 14.51.25.png" width="30%">

* 赤丸ボタンのタップで、入力欄をクリアにする
* 入力欄のクリックで、自動でキーボードが出てくる
* 計算ボタン（"8%"、"10%"、"計算する"）を押下、または画面を下スワイプでキーボードが下がる
* 0以下の数字が入っている状態で計算ボタンをタップすると、計算結果の代わりにエラーメッセージが表示される

---
## 動画
#### 1. 税込計算

![taxViewUsing](https://github.com/Natsukotochobi/CalculationApp/assets/105856391/17b14c92-8e53-4650-ae9c-154d05a8f76b)

#### 2. 単価計算

![unitPriceUsing](https://github.com/Natsukotochobi/CalculationApp/assets/105856391/4d9dd857-a2df-41fe-9748-285b20cc5d8d)

---

## 開発したきっかけ
Swiftの本を１冊終えたので、学んだ知識を使って自分でアプリを作ってみることにした。<br>
何か生活が便利になるものを作りたいと思い、買い物をするときに、暗算が苦手な自分がよく電卓で計算するものを二つピックアップした。