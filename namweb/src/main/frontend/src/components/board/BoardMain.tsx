import classes from "./BoardMain.module.scss";
import BoardList from "./utility/BoardList";
import BoardSearch from "./utility/BoardSearch";

const BoardMain = () => {
    return <div className={classes.board_main}>
        <h1>자유 게시판</h1>
        <BoardSearch />
        <BoardList />
    </div>
}

export default BoardMain;