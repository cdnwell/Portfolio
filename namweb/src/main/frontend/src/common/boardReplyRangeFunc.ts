type BoardReplyType = {
  replyno: number;
  bno: number;
  replyforno: number;
  email: string;
  nick: string;
  content: string;
  replyDate: string;
}[];

const boardReplyRangeFunc = (replyArray: BoardReplyType) => {
  return replyArray.sort((pre, post) => {
    const preDate: Date = new Date(pre.replyDate);
    const postDate: Date = new Date(post.replyDate);

    if (preDate.getFullYear() != postDate.getFullYear()) {
      return preDate.getFullYear() - postDate.getFullYear();
    }
    if (preDate.getMonth() != postDate.getMonth()) {
      return preDate.getMonth() - postDate.getMonth();
    }
    if (preDate.getDate() != postDate.getDate()) {
      return preDate.getDate() - postDate.getDate();
    }
    if (preDate.getHours() != postDate.getHours()) {
      return preDate.getHours() - postDate.getHours();
    }
    if (preDate.getMinutes() != postDate.getMinutes()) {
      return preDate.getMinutes() - postDate.getMinutes();
    }
    if (preDate.getSeconds() != preDate.getSeconds()) {
      return preDate.getSeconds() - postDate.getSeconds();
    }

    // 초까지 동일하다면 replyno를 기준으로 정렬을 한다.
    return pre.replyno - post.replyno;
  });
};

export default boardReplyRangeFunc;
