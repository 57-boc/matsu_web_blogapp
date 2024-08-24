class CommentsController < ApplicationController
  def new
    article = Article.find(params[:article_id])
    # コメントを付けたいarticleのarticle_idを持つ記事を探してくる
    @comment = article.comments.build
    # 探してきたarticleにコメントを入れる入れ物を作成
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)

    if @comment.save
      redirect_to article_path(article), notice: 'コメント保存できたよ'
    else
      flash.now[:error] = 'コメント保存に失敗しました'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end