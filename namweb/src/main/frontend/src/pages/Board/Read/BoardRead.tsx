import classes from "./BoardRead.module.scss";

import BoardReadPage from "../../../components/board/read/BoardReadPage";

const BoardRead = () => {
    return <div className={classes.board_read_root}>
        <BoardReadPage />
    </div>
}

export default BoardRead;