import classes from "./Board.module.scss";

import BoardMain from "../components/board/BoardMain";

const Board = () => {
    return <div className={classes.board_root}>
        <BoardMain />
    </div>
};

export default Board;