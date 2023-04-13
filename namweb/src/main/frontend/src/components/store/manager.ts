import { createSlice } from "@reduxjs/toolkit";

type bookStatusDateType = {
  payload: {
    date: string;
  };
};

type bwnoType = {
  payload: {
    bwno : number;
  }
}

const initialState = {
  date: "",
  bwno: -1,
};

const manager = createSlice({
  name: "manager-data",
  initialState,
  reducers: {
    setDate(state, action : bookStatusDateType) {
      state.date = action.payload.date;
    },
    setBookDate(state, action : bwnoType) {
      state.bwno = action.payload.bwno;
    }
  },
});

export const managerActions = manager.actions;

export default manager.reducer;
