import classes from "./BoardSearch.module.scss";

const BoardSearch = () => {
    const onSearchSubmit = (e : React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
    }

    return <form className={classes.board_search} onSubmit={onSearchSubmit}>
        <input type="text" className={classes.board_search_input} placeholder="검색 내용을 입력해주세요." />
        <button className={classes.board_search_btn}>검색</button>
    </form>
}

export default BoardSearch;