import classes from "./BoardReplyList.module.scss";

import { useEffect, useState } from "react";
import BoardReplyGroup from "./BoardReplyGroup";
import boardReplyRangeFunc from "../../../../common/boardReplyRangeFunc";

interface BoardReplyListProps {
  reply: {
    replyno: number;
    bno: number;
    replyforno: number;
    email: string;
    nick: string;
    content: string;
    replyDate: string;
  }[];
}

const BoardReplyList = ({ reply } : BoardReplyListProps) => {
    const [boardReplyGroup, setBoardReplyGroup] = useState();

    useEffect(()=>{
        const boardReplyArray = [];
        let boardReplyRange = [...reply];
        
        boardReplyRange = boardReplyRangeFunc(boardReplyRange);

        console.log('range',boardReplyRange);

        boardReplyRange.map((list) => {
            if(list.replyforno === -1) {
                boardReplyArray.push(<BoardReplyGroup reply={reply} />);
            }
        })
    },[]);

  return <>
    
  </>;
};

export default BoardReplyList;
