import classes from "./BoardReplyGroup.module.scss";

interface BoardReplyGroupProps {
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

const BoardReplyGroup = ({ reply }: BoardReplyGroupProps) => {
  return <div>

  </div>;
};

export default BoardReplyGroup;
