import BoardPage from "./BoardPage";
import classes from "./BoardPageWrite.module.scss";
import BoardWriteBtn from "./BoardWriteBtn";

const BoardPageWrite = () => {
    return <tr>
        <BoardPage />
        <BoardWriteBtn />
    </tr>
}

export default BoardPageWrite;