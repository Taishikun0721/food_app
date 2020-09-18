# Ajaxを使用したコメント投稿機能を実装

今回現場railsのアウトプットで、Ajaxを使用したコメント機能を実装したので
メモをして残しておく。

今回は食べものを投稿して、その投稿にユーザー毎のコメントをつける。

テーブルの関連で言うとフードテーブルとコメントテーブルに対して、コメントテーブルが1対多で紐づく様な形になる。

[ER図載せておきます](https://app.lucidchart.com/invitations/accept/2c0e49c7-7d1a-4556-8ec7-7b1022a2d560)

##ルーティング
```
  resources :foods do
    resources :comments, only: [:new, :create, :edit, :update, :destroy], shallow: true
  end
```
shallowオプションを付けるとルーティングのネストを浅くなって、可動性が上がるので今回は
下記リンクを参考にして使用してみました。

[resources を nest するときは shallow を使うと幸せになれる](https://qiita.com/kuboon/items/96bbd227f9497ed81f38)
[2.7.2 「浅い」ネストRailsガイド](https://railsguides.jp/routing.html#%E3%80%8C%E6%B5%85%E3%81%84%E3%80%8D%E3%83%8D%E3%82%B9%E3%83%88)

ルーティングが設定し終わったので次はコントローラーの実装に移りたいと思います。
今回コメント新規投稿のフォームを作成したのが、`foods#show.html.slim`です。
そしてコメント一覧を作成するのも同じく`foods#show.html.slim`となります。

そのため流れとしては、以下の様になります。

1.`foods#show.html.slim`にコメント新規登録のフォームを作成。`remote: true`オプションを付けて、`comments#create`アクションにリクエストをする。
2.`comments#create`アクションで保存を実行すると、`comments#create.js.slim`がレスポンスとして返却される。
3.`comments#create.js.slim`内に登録したコメントを表示する内容を記載されていて、`foods#show.html.slim``foods#show.html.slim`に更新されたコメント一覧が表示される。


まずフォームを`foods#show.html.slim`に表示するため`foods#show`に新しいCommentクラスのインスタンスを作成します。

`foods#show`

```
  def show
    @food = Food.find(params[:id])
    @comment = Comment.new
    @comments = @food.comments
  end
```

`@food`は詳細ページ表示のために事前に定義していたインスタンスです。
`@comment`が`form_with`に渡す。Commentクラスのインスタンスです。
`@comments`は同じページに作成する。コメント一覧表示機能で使用するインスタンスです

必要な情報は作成できたので、次はviewを作成していこうと思います。

今回はコメント表示用のテンプレートと、コメント作成用フォームのテンプレート2つに切り分けて作成します。


