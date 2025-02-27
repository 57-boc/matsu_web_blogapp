# フォルダを作成したときApi::(foldername::)を付けるのが決まり
class Api::CommentsController < Api::ApplicationController

  def index
    article = Article.find(params[:article_id])
    comments = article.comments.order(:id)
    render json: comments
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    @comment.save!

    render json: @comment

    # if @comment.save
    #   redirect_to article_path(article), notice: 'コメント保存できたよ'
    # else
    #   flash.now[:error] = 'コメント保存に失敗しました'
    #   render :new
    # end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
    # {commnet: {content: 'aaaaaaa'}}という形式
  end

end