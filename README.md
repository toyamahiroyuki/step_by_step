# Step-by-Step
<https://step-by-step.work>

## 概要
　　Step-by-Stepは、簡単に家計簿を作成できるアプリケーションです。

## 機能
- カレンダー
  １.日付クリック
  １.収支登録
  １.その日の収支合計表示
- 円グラフ
  １.当月の収支一覧
  １.収支登録後、円グラフに反映
- 棒グラフ
  １.当月の予算の登録
  １.収支登録後、実績と予算を比較
  
  #### 技術面での工夫
- jQueryを用いたカレンダー表示
- 非同期通信を用いたカレンダーの日付クリック
- 非同期通信を用いたカレンダーの収支の表示
- 非同期通信を用いたカレンダーの収支金額による表示色の変化
- jQueryを用いた円グラフの収支表示
- 家賃などのuser単一の情報は一度のみ登録、その後は常に編集
- 多ユーザーの円グラフのみ参照可能
- ナビゲーションバーのスクロール機能

## 使用言語
- ruby 2.5.7
- Rails 5.2.4.2
- javascript/jQuery
  
### 開発環境

- Vagrant

### インフラ
- AWS(EC2, RDS, Route53)
- MySQL2
- Nginx(Webサーバ)

###  Gem・APIなど
- Rspec (モデルテスト、コントローラテスト、フィーチャーテスト)
- devise (認証機能)
- devise-i18n (日本語化)
- fullcalendar (スケジュール機能)
- chart.js (収支、予算の円グラフ)
- kaminari (ページネーション)
- bootstrap3（レイアウト）
- Rubocop（コーディング）

## インストール　
```
$ git clone https://github.com/nkwada/Volun-Tuner.git
$ cd Volun-Tuner
$ bundle install
$ rails db:migrate
$ rails db:seed

テストユーザー： mail "test1@test", password "aaaaaa"
管理者： mail "test@admin", password "testadmin"
```

