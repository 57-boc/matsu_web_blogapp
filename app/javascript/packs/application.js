// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix");
require("@rails/actiontext");

// import $ from 'jquery'
// import axios from "modules/axios";
// import {
//   listenInactiveHeartEvent,
//   listenActiveHeartEvent
// } from 'modules/handle_heart'

// const handleCommentForm = () => {
//   // コメント投稿フォームを表示する
//   $(".show-comment-form").on("click", () => {
//     $(".show-comment-form").addClass("hidden");
//     $(".comment-text-area").removeClass("hidden");
//   });
// }

// // コメントを表示する
// const appendNewComment = (comment) => {
//   $(".comments-container").append(`<div class="article_comment"><p>${comment.content}</p></div>`);
// }

// // ハートの表示を切り替える
// const handleHeartDisplay = (hasLiked) => {
//   if (hasLiked) {
//     $(".active-heart").removeClass("hidden");
//   } else {
//     $(".inactive-heart").removeClass("hidden");
//   }
// };

// document.addEventListener("turbolinks:load", () => {
//   const articleShow = $("#article-show");
//   if (articleShow.length === 0) {
//     console.log("Article show element not found");
//     return;
//   }

//   const dataset = articleShow.data();
//   if (!dataset || !dataset.articleId) {
//     console.log("Article ID not found in dataset");
//     return;
//   }

//   const articleId = dataset.articleId;

//   // コメントの取得と表示
//   axios
//     .get(`/api/articles/${articleId}/comments`)
//     .then((response) => {
//       const comments = response.data;
//       comments.forEach((comment) => {
//         appendNewComment(comment);
//       });
//     })
//     .catch((error) => {
//       console.error("Error fetching comments:", error);
//     });

//   handleCommentForm();

//   $(".add-comment-button")
//     .off("click")
//     .on("click", () => {
//       const content = $("#comment_content").val();
//       if (!content) {
//         window.alert("コメントを入力してください");
//       } else {
//         axios
//           .post(`/api/articles/${articleId}/comments`, {
//             comment: { content: content },
//           })
//           .then((res) => {
//             const comment = res.data;
//             console.log(comment);
//             appendNewComment(comment);
//             $("#comment_content").val("");
//             console.log("ok");
//           })
//           .catch((error) => {
//             console.error("コメント投稿エラー:", error);
//           });
//       }
//     });

//   // ハートを表示する
//   axios.get(`/api/articles/${articleId}/like`).then((response) => {
//     const hasLiked = response.data.hasLiked;
//     handleHeartDisplay(hasLiked);
//   });

//   listenInactiveHeartEvent(articleId);
//   listenActiveHeartEvent(articleId);
// });