import $ from "jquery";
import axios from 'modules/axios';

// ハートがクリックされたら状態を変更する
const listenInactiveHeartEvent = (articleId) => {
  $(".inactive-heart").on("click", () => {
    axios
      .post(`/api/articles/${articleId}/like`)
      .then((response) => {
        if (response.data.status === "ok") {
          $(".active-heart").removeClass("hidden");
          $(".inactive-heart").addClass("hidden");
        }
      })
      .catch((e) => {
        window.alert("Error");
        console.log(e);
      });
  });
};

const listenActiveHeartEvent = (articleId) => {
  $(".active-heart").on("click", () => {
    axios
      .delete(`/api/articles/${articleId}/like`)
      .then((response) => {
        if (response.data.status === "ok") {
          $(".active-heart").addClass("hidden");
          $(".inactive-heart").removeClass("hidden");
        }
      })
      .catch((e) => {
        window.alert("Error");
        console.log(e);
      });
  });
};

export {
  listenInactiveHeartEvent,
  // jsでは同じ名前のときlistenInactiveHeartEvent: listenInactiveHeartEventの時後半を省略できる
  // verによってはできないので注意
  listenActiveHeartEvent
}