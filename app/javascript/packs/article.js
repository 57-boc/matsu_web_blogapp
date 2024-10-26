import $ from "jquery";
import axios from "modules/axios";
import {
  listenInactiveHeartEvent,
  listenActiveHeartEvent
} from 'modules/handle_heart'


// ハートの表示を切り替える
const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $(".active-heart").removeClass("hidden");
  } else {
    $(".inactive-heart").removeClass("hidden");
  }
};

const handleCommentForm = () => {
  // コメント投稿フォームを表示する
  $(".show-comment-form").on("click", () => {
    $(".show-comment-form").addClass("hidden");
    $(".comment-text-area").removeClass("hidden");
  });
}

// コメントを表示する
const appendNewComment = (comment) => {
  $(".comments-container").append(`<div class="article_comment"><p>${comment.content}</p></div>`);
}

// articleのshowが表示されたときの挙動
document.addEventListener("turbolinks:load", () => {
  const dataset = $("#article-show").data();
  const articleId = dataset.articleId;

  // コメントの取得と表示
  axios
    .get(`/api/articles/${articleId}/comments`)
    .then((response) => {
      const comments = response.data;
      comments.forEach((comment) => {
        appendNewComment(comment);
      });
    })
    .catch((e) => {
      window.alert("Error");
      console.log(e);
    });

  handleCommentForm();

  // コメント投稿ボタンが押されたらformの値を投稿する
  $(".add-comment-button").on("click", () => {
    const content = $("#comment_content").val();
    if (!content) {
      window.alert("コメントを入力してください");
    } else {
      axios
        .post(`/api/articles/${articleId}/comments`, {
          comment: {content: content},
          // comment_paramsで指定されている形式にする
        })
        .then((res) => {
          const comment = res.data;
          appendNewComment(comment);
          $("#comment_content").val('');
        });
    }
  });

  // ハートを表示する
  axios.get(`/api/articles/${articleId}/like`).then((response) => {
    const hasLiked = response.data.hasLiked;
    handleHeartDisplay(hasLiked);
  });

  listenInactiveHeartEvent(articleId);
  listenActiveHeartEvent(articleId);

});

