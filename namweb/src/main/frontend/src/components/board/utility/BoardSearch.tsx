import classes from "./BoardSearch.module.scss";

import { useState } from "react";
import { SearchType } from "../types/SearchType";
import { useDispatch } from "react-redux";
import { searchActions } from "../../store/search";

const BoardSearch = () => {
  const [search, setSearch] = useState("");
  const [category, setCategory] = useState(0);
  const dispatch = useDispatch();


  const onSearchSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    dispatch(searchActions.setSearchCategory({
      search, category
    }))
  };

  const onSelectChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const categoryTmp = parseInt(e.target.value);

    setCategory(categoryTmp);
  };

  const onSearchEntered = (e: React.ChangeEvent<HTMLInputElement>) => {
    const searchTmp = e.target.value;

    if (searchTmp.length > 30) return;

    setSearch(searchTmp);
  };

  return (
    <form className={classes.board_search} onSubmit={onSearchSubmit}>
      <select
        className={classes.board_search_select}
        onChange={onSelectChange}
        value={category}
      >
        <option value="0" defaultChecked>
          전체
        </option>
        <option value="1">공지</option>
        <option value="2">자유</option>
        <option value="3">의뢰</option>
      </select>
      <input
        type="text"
        className={classes.board_search_input}
        onChange={onSearchEntered}
        value={search}
        placeholder="검색 내용을 입력해주세요."
      />
      <button className={classes.board_search_btn}>검색</button>
    </form>
  );
};

export default BoardSearch;
