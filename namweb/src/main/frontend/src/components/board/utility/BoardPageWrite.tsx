import BoardPage from "./BoardPage";
import classes from "./BoardPageWrite.module.scss";
import BoardWrite from "./BoardWrite";

const BoardPageWrite = () => {
    return <tr>
        <BoardPage />
        <BoardWrite />
    </tr>
}

export default BoardPageWrite;