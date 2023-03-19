// import PagingProps from "../types/PagingProps";
import { PagingType } from "../types/PagingType";
import BoardPage from "./BoardPage";
import classes from "./BoardPageWrite.module.scss";
import BoardWriteBtn from "./BoardWriteBtn";

interface PagingProps {
  paging: PagingType;
  onPageNoListClick: (pageNo: number) => void;
}

const BoardPageWrite = ({ paging, onPageNoListClick }: PagingProps) => {
  const onPageNoPageClick = (pageNo: number) => {
    onPageNoListClick(pageNo);
  };

  return (
    <tr>
      <BoardPage paging={paging} onPageNoPageClick={onPageNoPageClick} />
      <BoardWriteBtn />
    </tr>
  );
};

export default BoardPageWrite;
