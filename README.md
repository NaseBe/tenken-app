# アプリケーション名
TenkenApp

# アプリケーション概要
前職では、年に2回大規模なプレゼン設備の点検が行われました。現場で結果を紙のチェックシートに記載してから、作業後にExcel管理シート等に入力する流れで対応していました。数人で手分けして作業していたため、一人の入力が終わるまで待ち時間が発生し、全員の入力が終わるまで進捗状況を把握するのが難しい状態でした。また、フォローアップが必要な場合（〇〇の交換、〇〇の修理など）、それも別のExcelシートに入力していたが、見づらい・管理しづらいところがありました。
現場でタブレットやスマートフォンから点検の結果を入力し、進捗状況を一目で確認でき、フォローアップも簡単にできるアプリがあればいいなと考えて、このアプリを開発しました。

# URL
- https://tenken-app.herokuapp.com

# テスト用アカウント
- Basic認証
id: admin
password: 7788
- テストユーザー１
email: tenkenuser1@test.com
password: testinguser1
- テストユーザー２
email: tenkenuser2@test.com
password: testinguser2

# 利用方法
- ログイン後、点検一覧（＝トップページ）が表示される
- トップメニューで自分のニックネームをクリックすると、ユーザー情報編集画面に遷移する
- 新しい点検を作成するには、トップページで点検名を入力して、「点検を作成する」ボタンを押す
- トップページで点検名をクリックすると、チェックシート一覧ページへ遷移する
- チェックシート一覧ページで次ができる：
点検名の編集
点検の削除
新規チェックシートの作成
対応中・対応の完了教室の確認
未着手の教室の確認
- 新規チェックシートを作成するには、「点検を開始」ボタンを押す
- 点検結果入力後、「送信」ボタンを押す→チェックシート一覧ページへ遷移する
- チェックシート一覧ページで確認したい教室番号をクリックすると、チェックシート詳細ページに遷移する
- チェックシート詳細ページで次ができる：
点検結果の確認
点検結果の編集
チェックシートの削除
コメントの投稿
コメント一覧の確認
（自分だけの）コメントの削除

# 洗い出した要件

| 機能 | 目的 | 詳細 | ストーリー |
| --- | ---- | --- | -------- |
| ユーザー管理 | 登録されたユーザーのみアクセスできるようにするため | 名前、メールアドレス、パスワードを登録させる | 同じメールアドレスで複数のアカウントを登録できないようにする |
| ユーザー情報編集 | ユーザー名・メールアドレスの編集を可能にするため | 登録した情報に誤りがある場合等、編集できるようにする | 最上メニューでの自分のニックネームをクリックすると、この画面に遷移する |
| 点検一覧表示 | 作成済みの点検を表示するため | カード状のサムネールに点検名・作成者名が表示される | 点検のサムネールをクリックすると、チャックシート一覧に遷移する |
| 点検作成 | 新規点検の作成を実装するため | 点検名を入力して、新規点検を追加する | 点検はチェックシートの収納で、実際の作業の管理はチェックシート毎で行われる。ユーザー全員が点検を作成できる |
| 点検名編集 | 点検名の編集を実装するため | 点検名に誤りがあった場合、編集できるようにする | 作成者に関係なく、ユーザー全員が点検名を編集できる |
| 点検削除 | 点検の削除を実装するため | 点検を削除すると、その中に登録されている全てのチェックシートも削除される | 作成者に関係なく、ユーザー全員が点検を削除できる |
| チェックシート一覧表示 | 対応完了・対応中教室の一覧表示を実装するため | 対応完了・対応中教室番号がボタン状で表示される | 対応中の教室を三角のアイコン、完了の教室をチェックのアイコンで見分ける |
| チェックシート作成 | 新規チェックシート作成ページを実装するため | １チェックシート＝１教室。設備毎にステータス（OK, NG等）をプールダウンメニューから選択させる。詳細入力欄にテキスト入力・画像アップロードができる。「担当者１」「担当者２」のプールダウンメニューにDBに登録されているユーザー名が表示される | 必須項目が未入力の場合、投稿できないようにする |
| チェックシート詳細表示 | 教室毎の点検結果を表示するため | 教室毎の点検結果、実施日、担当者名などを確認できる | -------- |
| チェックシート編集 | 教室毎の点検結果の編集機能を実装するため | 「チェックシート作成」と同じ画面（以前に入力したデータが表示される） | 担当者に関係なくユーザー全員が編集できる。必須項目が未入力の場合、投稿できないようにする |
| チェックシート削除 | チェックシート削除機能を実装するため | --- | 担当者に関係なくユーザー全員が削除できる |
| コメント作成 | 各チェックシートに対してフォローアップのコメントを投稿できるようにするため | 画像付きのコメントを投稿できる | 画像のみのコメントを投稿できるようにする |
| コメント一覧表示 | チェックシート詳細ページでコメント一覧表示を実装するため | コメントは降順に表示される | -------- |
| コメント削除 | コメント削除機能を実装するため | 投稿者名の隣に削除のアイコンが表示される | 他ユーザーのコメントを削除できないようにする |

# 実装した機能
## 点検関連機能
 - サインイン後、点検一覧画面へ遷移
 ![サインイン後、点検一覧画面へ遷移](https://i.gyazo.com/fb1ae495f090360349cc13dd857a470d.gif)
 - 新規点検作成
 ![新規点検作成](https://i.gyazo.com/2138785bdf48cbef1e68b19a8dd9343e.gif)
 - 点検名編集
 ![点検名編集](https://i.gyazo.com/a57fccbc1225756600c0e451a4d6c2cd.gif)
 - 点検削除
 ![点検削除](https://i.gyazo.com/a5b83ea8ac37d9d8fe3fa05a5fa6e58f.gif)
## チェックシート関連機能
 - 新規チェックシート作成
 ![新規チェックシート作成](https://i.gyazo.com/065c1580d015fed336c66b2d42af70ad.gif)
 ![入力結果の投稿](https://i.gyazo.com/65d3729a6051c3fa73f3c10835281e4a.gif)
 - チェックシート詳細表示（点検結果表示）
 ![チェックシート詳細表示](https://i.gyazo.com/6f2a453b1dd2033df8b51765f27b6f43.gif)
 - チェックシート編集
 ![チェックシート編集](https://i.gyazo.com/933fc2686496ab8361620309725c6aac.gif)
 - チェックシート削除
 ![チェックシート削除](https://i.gyazo.com/67f2f7d1a90eaea378c28de2d3e0fcb4.gif)
## コメント関連機能
 - 新規コメント投稿
 ![新規コメント投稿](https://i.gyazo.com/73c9080c4fa69616c556546fa81673e6.gif)
 - コメント削除
![コメント削除](https://i.gyazo.com/e3011a55f747be8b6d494828022d12fe.gif)

# 工夫したポイント
 - 実装に取り組む前にプロトタイプアプリ（簡易版）を作って、モデル・ビュー・コントローラーが希望通りに動いてくれると確認できた。お陰でやり直し作業量が少なかった。
 - 主にタブレット・携帯から使われるアプリのため、レスポンシブデザインに拘った。Bootstrapを導入し、画面サイズによって表示を細かく調整した（例えば、点検一覧表示のプロジェクターの画像は小さい画面で表示されない等）。

# 実装予定の機能
- 非同期コメント
- admin機能
- 対応完了・対応中の教室を色で分ける
- エラーメッセージ表示
- 点検・チェックシート削除時に確認メッセージを表示させる

# テーブル設計
### ER図
![ER図](https://user-images.githubusercontent.com/85017378/138562605-38e89ff8-5cc9-4f60-91a3-0aec076c46fa.png)

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |

### Association

- has_many :tenkens  
- has_many :checksheets
- has_many :comments

## tenkens テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :checksheets 

## checksheets テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| classroom_id  | integer    | null: false                    |
| projector     | string     |                                |
| control_panel | string     |                                |
| mic           | string     |                                |
| pc            | string     |                                |
| bd_dvd_player | string     |                                |
| remotes       | string     |                                |
| ohc           | string     |                                |
| screen        | string     |                                |
| ports         | string     |                                |
| cables        | string     |                                |
| expendables   | string     |                                |
| details       | text       |                                |
| staff         | string     | null: false                    |
| helper        | string     |                                |
| date          | date       | null: false                    |
| status        | string     | null: false                    |
| tenken        | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :tenken 
- belongs_to :user
- has_many :comments

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| checksheet | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :checksheet

# ローカルでの動作方法
```ターミナル
% git clone https://github.com/NaseBe/tenken-app.git
% cd tenken-app
% bundle install
% rails db:create
% rails db:migrate
% rails s
→http://localhost:3000
```

# 開発環境
- フロント：HTML, CSS(Bootstrap)
- サーバーサイド：Ruby on Rails(6.0.0), Ruby(2.6.5)
- データベース：MySQL(5.6.51), Sequel Pro
- サーバー：Heroku
- タスク管理：GitHub, Trello

