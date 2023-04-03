import { createSlice } from "@reduxjs/toolkit";

type BackgroundImageSliceType = {
  payload : {
    path : string;
  }
}

type BackgroundSliceType = {
  payload : {
    background : string;
  }
}

const initialState = {
  path : "",
  background : "",
};

const backgroundSlice = createSlice({
  name: "background-data",
  initialState,
  reducers: {
    setBackground(state, action : BackgroundSliceType) {
      state.background = action.payload.background;
    },
    setBackgroundImage(state, action : BackgroundImageSliceType) {
      state.path = action.payload.path;
    },
    setBackgroundInvalid(state) {
      state.path = "";
      state.background = "";
    },
  },
});

export const backgroundActions = backgroundSlice.actions;

export default backgroundSlice.reducer;
