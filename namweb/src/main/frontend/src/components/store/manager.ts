import { createSlice } from "@reduxjs/toolkit";

type bookStatusDateType = {
  payload: {
    date: string;
  };
};

const initialState = {
  date: "",
};

const manager = createSlice({
  name: "manager-data",
  initialState,
  reducers: {
    setDate(state, action : bookStatusDateType) {
      state.date = action.payload.date;
    },
  },
});

export const managerActions = manager.actions;

export default manager.reducer;
