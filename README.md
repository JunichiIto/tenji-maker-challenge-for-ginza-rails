# tenji-maker-challenge-for-ginza-rails 
銀座Rails#41の特別企画「銀座Rails版『Rubyプログラミング問題にチャレンジ！』公開コードレビュー」の提出用リポジトリです。

この企画に参加される方はこのリポジトリをフォークし、自分の書いたコードでプルリクエストを作成してください。

（注）この企画はQiitaで開催中の「 [Rubyプログラミング問題にチャレンジ！ －改訂版・チェリー本発売記念－ Advent Calendar 2021](https://qiita.com/advent-calendar/2021/ruby-challenge) 」の銀座Rails版です。銀座Rails向けに内容を一部モディファイしています。

## 企画の概要

この企画では「プロを目指す人のためのRuby入門」の著者である伊藤淳一（ [@jnchito](https://twitter.com/jnchito) ）から、Rubyを使ったプログラミング問題を出します。「我こそは！」という人は解答となるコードを書いて、プルリクエストを作成してください。

投稿されたプルリクエストの中から勉強会当日に1件をピックアップし、僕・伊藤淳一がその内容をコードレビューします。

## 参加資格

銀座Rails#41に参加される人なら、初心者・上級者を問わず、どなたでもOKです（ただし、Qiitaのアドベントカレンダーに参加された方は別途レビューしますので、こちらの参加はご遠慮願います🙏）。

書籍「プロを目指す人のためのRuby入門（通称チェリー本）」を持っていてもいなくても構いません。
イベント当日までにコードを書いてプルリクエストを作成すれば、それで登録完了です！

（注）プルリクエストの作成は任意です。「プルリクエストを作らないと銀座Rails#41に参加できない」というわけではないのでご心配なく。

## 今回のお題「点字メーカープログラム」

この企画ではみなさんに「点字メーカープログラム」を作成してもらいます。このプログラムでは入力されたローマ字に対応する点字をテキストで出力します。以下はこのプログラムの実行例です。

```ruby 
tenji_maker = TenjiMaker.new
puts tenji_maker.to_tenji('A HI RU')
#=> o- o- oo
#   -- o- -o
#   -- oo --

puts tenji_maker.to_tenji('KI RI N')
#=> o- o- --
#   o- oo -o
#   -o -- oo
```

- ローマ字（に対応するひらがな）から点字への変換ルールは以下のwebページに説明されている内容に従うものとします。

http://www.naiiv.net/braille/?tenji-sikumi

![Screen Shot 2021-10-28 at 6.39.12.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/7465/1c80d44b-ae0f-1153-b29d-d92be6965380.png)
*引用 [全視情協:点字とは \- 点字のしくみ](http://www.naiiv.net/braille/?tenji-sikumi)*

- 点字の点が出力される部分には`o`の文字を、出力されない部分には`-`の文字をそれぞれ出力してください。
- 上の実行例のように、点字と点字の間は半角スペースで区切ってください。

### 入力テキストについて

入力テキストは半角大文字のローマ字とします。文字と文字の間は半角スペースで区切ってください。ローマ字表記の形式は訓令式とします。訓令式については以下のwebページを参考にしてください。

https://green.adam.ne.jp/roomazi/kunreisiki.html

![Screen Shot 2021-10-28 at 6.42.53.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/7465/6ff9bed3-cd5a-452c-d567-a7af7697a574.png)
*引用 [訓令式](https://green.adam.ne.jp/roomazi/kunreisiki.html)*

### 入力テキストの例

- あひる = A HI RU
- きりん = KI RI N
- しまうま = SI MA U MA
- にわとり = NI WA TO RI
- ひよこ = HI YO KO
- きつね = KI TU NE

なお、上記の入力テキストの例はこのリポジトリのテストコード内で使われています。

```ruby 
class TenjiMakerTest < Minitest::Test
  def setup
    @tenji_maker = TenjiMaker.new
  end

  def test_a_hi_ru
    tenji = @tenji_maker.to_tenji('A HI RU')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo
      -- o- -o
      -- oo --
    TENJI
  end

  def test_ki_ri_n
    tenji = @tenji_maker.to_tenji('KI RI N')
    assert_equal <<~TENJI.chomp, tenji
      o- o- --
      o- oo -o
      -o -- oo
    TENJI
  end

  # 以下省略
```

### 変換対象となるローマ字・ならないローマ字

変換対象となるローマ字は以下のとおりです。

- あいうえお、かきくけこ、（省略）、やゆよ、らりるれろ、わ、ん

仕様を簡単にするため、以下のローマ字は対応不要です（というか、コード量が増えてレビューに時間がかかってしまうため、むしろ対応しないでください！）。

- を
- 促音（「らっこ」のような、小さな「っ」）
- 長音（「こーもり（こうもり）」のような、伸びる音）
- 濁音（がぎぐげご、など）
- 半濁音（ぱぴぷぺぽ）
- 拗音・拗半濁音（きゃきゅきょ、ぎゃぎゅぎょ、ぴゃぴゅぴょ、など）

### その他：異常系の考慮は不要

仕様を簡単にするため、以下のような異常系の入力を考慮する必要はありません（こちらもわざわざ対応しないように！）。

- 対応不要のローマ字（例 YA GI、BU TA）
- ヘボン式で入力されたローマ字（例 SHI MA U MA、KI TSU NE）
- ありえないローマ字や半角大文字以外の文字（例 XYZ、ne ko、羊）
- 半角スペースで区切られていない（例 HIYOKO）
- 半角スペースが2文字以上入っている（例 TO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RA）
- 空文字列や文字列以外のオブジェクト（数値や`nil`）

## 技術要件

### 雛形リポジトリについて

このリポジトリはコードを提出するための雛形となるGitHubリポジトリです。

### 実行環境について

- Ruby 3.0以上で動作すること（GitHub ActionsのRubyバージョンは3.1.0-preview1です）
- 追加でインストールが必要なgemを使用しないこと
- Bundlerは使用しないこと

### 自分が書いたコードの配置について

- 実行用プログラムは`lib`ディレクトリに置くこと。必要に応じてファイルを追加しても良い。
- テストコードは`test`ディレクトリに置くこと。必要に応じてファイルやテストパターンを追加しても良い。
- `lib`ディレクトリと`test`ディレクトリ以外のコードは触らないこと。
- 雛形リポジトリに最初から配置しているテストコードも変更不可。

### 提出の必須条件

[このリポジトリにあるテストコード](https://github.com/JunichiIto/tenji-maker-challenge-for-ginza-rails/blob/main/test/tenji_maker_test.rb) がすべてパスすること。テストは`rake`コマンドで全件実行することができる。

```
$ rake
Run options: --seed 41041

# Running:

......

Finished in 0.000333s, 18018.0194 runs/s, 18018.0194 assertions/s.
6 runs, 6 assertions, 0 failures, 0 errors, 0 skips
```

## コードの提出方法

1. この雛形リポジトリをフォークする
2. コードが書けたらプルリクエストを作る
3. GitHub ActionsのテストがパスすればOK
4. （任意）ロジックを解説したブログ記事等があれば、そのURLもプルリクエストのdescriptionに載せる

## プルリクエストのdescriptionに書いてほしいこと

プルリクエストのdescriptionには以下のような内容を含めてください。

- コードのアピールポイント
  - 頑張ったところ
  - 苦労したところ
  - 工夫したところ
  - 自慢したいところ
  - etc
- ロジックを詳しく解説したブログ記事（もしあれば）
- 伊藤さんにメッセージ（こちらももしあればw）

## 「あれ、ちょっと待って！これだと、他の人のコードが見えちゃうんじゃ？？」

はい、見ようと思ったら見えちゃいますが、この企画に参加する人は自分のコードを提出するまで、他の人のコードはなるべく見ないようにお願いします！（今回は「性善説」でいきます）

## 質問はGitHub issuesへ

何か不明な点があれば、このリポジトリのissuesへ投稿してください。

https://github.com/JunichiIto/tenji-maker-challenge-for-ginza-rails/issues

## まとめ

この点字メーカープログラムですが、拙著「プロを目指す人のためのRuby入門」の知識があれば、ほぼ解答可能なはずです！2021年12月2日に [改訂版が発売](https://www.amazon.co.jp/dp/4297124378/) されたので、この改訂版をざーっと読んでから解答に着手するのも良いと思います 👍

みなさんからカッコいいコードがたくさん届くのを楽しみにしています〜😄
