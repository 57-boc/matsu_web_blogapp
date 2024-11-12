import $ from "jquery";
import axios from "modules/axios";
import { listenInactiveHeartEvent, listenActiveHeartEvent } from "modules/handle_heart";

const handleCommentForm = () => {
  // コメント投稿フォームを表示する
  $(".show-comment-form").on("click", () => {
    $(".show-comment-form").addClass("hidden");
    $(".comment-text-area").removeClass("hidden");
  });
};

// コメントを表示する
const appendNewComment = (comment) => {
  $(".comments-container").append(`<div class="article_comment"><p>${comment.content}</p></div>`);
};

// ハートの表示を切り替える
const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $(".active-heart").removeClass("hidden");
  } else {
    $(".inactive-heart").removeClass("hidden");
  }
};


document.addEventListener("DOMContentLoaded", function () {
  const articleShow = $("#article-show");
  const dataset = articleShow.data();
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
    .catch((error) => {
      console.error("Error fetching comments:", error);
    });
  handleCommentForm();
  $(".add-comment-button")
    .off("click")
    .on("click", () => {
      const content = $("#comment_content").val();
      if (!content) {
        window.alert("コメントを入力してください");
      } else {
        axios
          .post(`/api/articles/${articleId}/comments`, {
            comment: { content: content },
          })
          .then((res) => {
            const comment = res.data;
            appendNewComment(comment);
            $("#comment_content").val("");
          })
          .catch((error) => {
            console.error("コメント投稿エラー:", error);
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
