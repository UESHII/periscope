# README
---

## アプリケーション基本情報

| アプリケーション名        | PERISCOPE |
| アプリケーション概要      | 社員同士で評価し合うことができる。 |
| | 全社員の所属チーム、入社日、連絡先を検索することができる。 |
| サンプルページURL | http://54.168.201.215/ |
| テスト用アカウント | Basic認証 ID：admin |
| | Basic認証パスワード：2222 |
| | テスト用ユーザー名：Test I |
| | テスト用ユーザーE-mailアドレス：test1@example.com     |
| | テスト用ユーザーパスワード：test1111 |

|                                                                                                                   |                                                                                                                                                                             | 
| ----------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | 
| アプリケーション名<br>&#124;  &#124;  &#124;<br>&#124;  &#124;  &#124;<br>&#124; &#124;  &#124;<br>&#124; &#124;  | PERISCOPE                                                                                                                                                                   | 
| アプリケーション概要                                                                                              | 社員同士で評価し合うことができる。<br>全社員の所属チーム、入社日、連絡先を検索することができる。                                                                            | 
| サンプルページURL                                                                                                 | http://54.168.201.215/                                                                                                                                                      | 
| テスト用アカウント                                                                                                | Basic認証 ID：admin<br>Basic認証パスワード：2222<br>テスト用ユーザー名：Test I<br>テスト用ユーザーE-mailアドレス：test1@example.com<br>テスト用ユーザーパスワード：test1111 | 

---

## 利用方法
### ユーザー登録
* 会員登録・ログインをします。（未ログイン時にはどの機能も使うことができません。）
* ログイン後にはプロフィール作成ページへ遷移します。プロフィール画像、入社日、所属チーム、連絡先（社用E-Mailアドレス等）を登録します。

### Evaluation
* 各ユーザーは決められた営業期末月に翌期の目標と前期の結果を記入します。初めてのユーザーは【NEW POST】から新しいフォームを送信します。このフォームを【Evaluation】といい、対象の営業期の自分の目標や結果を記録し、対象期間の自分がどうだったかという他ユーザーからの評価を受ける為の受け皿となります。
* Evaluationには営業期、翌期の目標、結果を入力することができますが、登録時は【営業期】と【翌期の目標】のみ入力して送信します。
* 送信が完了すると、トップページへ遷移します。

### Review
* 各ユーザーは他ユーザーがEvaluationを投稿したらそのユーザーに対して評価を行います。この評価を【Review】といいます。
* トップページには自分が所属している同じチーム内の他ユーザーが投稿したEvaluationが表示されますが、これらは自分がまだReviewを送信していないEvaluationです。（レビュー送信済みのEvaluationまたはEvaluationのデータが無い場合は表示されません。）
* トップページからレビューを投稿するEvaluationの【詳細】を選択し、詳細ページへ遷移すると【Review投稿フォーム】が表示されます。フォームには【Clear】と【Dark】を入力可能です。
* 【Clear】=> 対象ユーザーの強みを入力します。特に自分だけが知っている、または営業期内に新たに発揮された、そのユーザーを強みとなる部分を入力して下さい。
* 【Dark】 => 対象ユーザーがより成長するためのヒントを入力します。対象ユーザーに合うような本や記事を引用したり、自らの体験談を用いて勧める、もしくは、改善することでどのような良い結果を予想できるかといった、具体案を記入して下さい。但し、誹謗中傷や個人情報となる記述は一切禁止とし、建設的な投稿をすることに努めて下さい。

### EXPLORE]
* 全ユーザーを検索することができます。検索できる項目は名前、所属チーム、入社日ですが、すべてを空欄で検索すると登録しているユーザー全員が表示されます。

### EDIT REGI.
* 自分の名前、メールアドレス、パスワードを変更できます。

### EDIT PROF.
* 自分のプロフィール画像、連絡先、所属チーム、入社日を変更できます。

### 退会
* EDIT REGI.ページから退会可能です。退会することによってPERISCOPEは利用できなくなりますが、これまでに投稿した内容やユーザーデータはサーバーに保持され、退会後も継続して他ユーザーが閲覧可能です。

---

## 目指した課題解決
### 課題
経営陣と社員との距離が離れている場合や、コミュニケーションが不足している場合において、社員の活動を公平に評価するため判断材料が不足している。また適切な評価が行われないことに対して、社員のフラストレーションやストレスを抱えている。

### 解決策
社員に対しての公平な評価やアドバイスを行う為や、その評価やアドバイスによる社員のモチベーション向上をサポートして生産性の向上に繋げる為に、各社員の取り組みをPERISCOPEを用いて見える化する。

---

## 洗い出した要件
* ユーザー管理機能
* Progress一覧表示機能
* ユーザーリスト表示機能
* ユーザーページ機能
* Profile編集機能
* Evaluation投稿機能
* Evaluation詳細表示機能
* Evaluation編集機能
* Review投稿機能
* 未Review一覧表示機能
* ユーザーリスト絞り込み機能
* パスワードリセット機能
* 管理者機能
* Review管理機能

---

## 工夫したポイント
### 未Review一覧機能
* 自分がまだレビューしていない、かつ同じチーム内のユーザーが投稿したEvaluationを表示させるための自動絞り込み機能。

### レスポンシブ対応
* PC操作に慣れない社員でもスマートフォンを利用して操作できるようにスマートフォン画面に対応したビューを実装。

### Review投稿機能
* Review投稿には投稿者の名前が記載されない機能とすることで立場に左右されない公平な投稿が可能。

---

## 実装予定の機能
### 管理者機能・Review管理機能
* 管理者のみ直近に投稿されたReviewを全て一覧で表示できるようにし、不適切なReview手動で削除できる機能。

---

## データベース設計

---
### users Table
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

#### Association
* has_one :profile
* has_many :evaluations
* has_many :progresses
* has_many :reviews

---

### profile Table
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| contact | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| team_id | integer    | null: false                    |

#### Association
* belongs_to :user
* belongs_to_active_hash :team

---

### evaluation Table
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| goal           | text       | null: false                    |
| result         | text       |                                |
| fiscal_year_id | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

#### Association
* belongs_to :user
* has_many :progresses
* has_many :reviews

---

### review Table
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| clear      | text       | null: false                    |
| dark       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| evaluation | references | null: false, foreign_key: true |

#### Association
* belongs_to :evaluation
* belongs_to :user

---

### progress Table
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| description | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| evaluation  | references | null: false, foreign_key: true |

#### Association
* belongs_to :progress
* belongs_to :evaluation

---

## ローカルでの動作方法

---

### 開発環境

* Ruby 2.6.5
* Rails 6.0.3.4
* MySQL 5.6

### 導入方法

#### ダウンロードするディレクトリへ移動

```
例）$ cd /Users/user-name/
```

#### リポジトリをクローン

```
$ git clone https://github.com/UESHII/periscope.git
```

#### Homebrewを設定する

```
# https://brew.sh/index_jaから下記のようなインストール用のコマンドをコピーしてペーストする
例）$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Homebrewがインストールされている場合はHomebrewのアップデートを行う
$ brew update

# Homebrewの権限を変更する
$ sudo chown -R `whoami`:admin /usr/local/bin

# rbenvとruby-buildをインストールする
$ brew install rbenv ruby-build

# rbenvをどこからでも使えるようにする
$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

# システムに変更を適用
$ source ~/.bash_profile

# Ruby 2.6.5をインストールする
$ rbenv install 2.6.5

# クローンしたアプリのディレクトリへ移動する
$ cd /periscope

-------------------------------
【以下アプリのあるディレクトリで実行】
-------------------------------

# Rubyのバージョン指定（local = 指定ディレクトリのみに指定バージョンを適用する ｜ global = PC全体で使用するバージョンを一括適用する）
$ rbenv local 2.6.5

# 設定を反映する
$ rbenv rehash

# バージョンが適用されているか確認
$ ruby -v 
=> 2.6.5と表示されればOK
```

#### MySQLを設定する

```
# MySQLをインストールする
$ brew install mysql@5.6


# 自動でMySQLを起動させるよう設定する
$ mkdir ~/Library/LaunchAgents
$ ln -sfv /usr/local/opt/mysql\@5.6/*.plist ~/Library/LaunchAgents
$ launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql\@5.6.plist


# mysqlコマンドをどこからでも使用できるようにする
$ echo 'export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"' >> ~/.bash_profile
$ source ~/.bash_profile


# mysqlのコマンドが打てるか確認する
$ which mysql

=> /usr/local/opt/mysql@5.6/bin/mysql
# 上記のように表示されれば成功


#mysqlの起動を確認する
$ mysql.server status

=> SUCCESS! MySQL running
# 上記のように表示されれば成功
```

#### Railsを準備する

```
# bundlerのインストール
$ gem install bundler


# Railsのバージョンを指定してインストール
$ gem install rails --version='6.0.3.4'


# rbenvを再読み込みしておく
$ rbenv rehash


# バージョンを確認する
#「Rails」のあとに続く数字は変わる可能性があります
$ rails -v

=> Rails 6.0.3.4
# 上記のように表示されればOK
```

#### アプリ実行のための準備

```
# 必要なgemをインストールする
$ bundle install

# データベースの作成
$ rails db:create

# マイグレーションの実行
$ rails db:migrate
```

#### アプリの実行

```
# サーバーの起動
$ rails s

# ブラウザでlocalhost:3000/へアクセスして確認する
```