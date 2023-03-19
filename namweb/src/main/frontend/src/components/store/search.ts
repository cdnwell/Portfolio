import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  search: "",
  category: 0,
};

interface SearchSlice {
  payload: { search: string; category: number };
}

const searchSlice = createSlice({
  name: "search-data",
  initialState,
  reducers: {
    setSearchCategory(state, action: SearchSlice) {
      state.search = action.payload.search;
      state.category = action.payload.category;
    },
  },
});

export const searchActions = searchSlice.actions;

export default searchSlice.reducer;
