＃テーブル設計

## users テーブル
|Column               |Type        |options            |
|---------------------|------------|-------------------|
|nickname             |string      |null: false        |
|email                |string      |null: false        |
|password             |string      |null: false        |
|first_name           |string      |null: false        |
|family_name          |string      |null: false        |
|first_name_phonetic  |string       |null: false       |
|family_name_phonetic |string       |null: false       |
|birthday             |date        |null: false        |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル
|Column           |Type        |options                         |
|-----------------|------------|--------------------------------|
|image            |string      |null: false                     |
|title           |string       |null: false                     |
|introduction     |text        |null: false                     |
|category_id      |integer     |null: false                     |
|status_id        |integer     |null: false                     |
|postage_id       |integer     |null: false                     |
|area_id          |integer     |null: false                     |
|shipping_days_id |integer     |null: false                     |
|price            |integer     |null: false                     |
|user_id          |integer     |null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル
|Column           |Type        |options                         |
|-----------------|------------|--------------------------------|
|user_id          |integer     |null: false, foreign_key: true  |
|item_id          |integer     |null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :place

## placesテーブル
|Column           |Type        |options                       |
|-----------------|------------|------------------------------|
|prefecture _id   |integer     |null: false                   |
|postal_code      |string      |null: false                   |
|city             |string      |null: false                   |
|address          |string      |null: false                   |
|building         |string      |------------------------------|
|phone_number     |string      |null: false                   |
|purchase_id      |integer     |null: false, foreign_key: true|


### Association

- belongs_to :purchase