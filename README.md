# テーブル設計

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

