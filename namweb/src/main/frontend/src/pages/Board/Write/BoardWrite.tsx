import classes from "./BoardWrite.module.scss";

import BoardWritePage from "../../../components/board/write/BoardWritePage";

const BoardWrite = () => {
    return <div className={classes.board_write}>
        <BoardWritePage />
    </div>
}

export default BoardWrite;