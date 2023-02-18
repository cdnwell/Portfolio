import { configureStore, createSlice } from "@reduxjs/toolkit";

const CENTER_POS_Y = 37.64836248151049;
const CENTER_POS_X = 127.2455233464401;

const initialState = {
  name: "namweb-book",
  base_lat: CENTER_POS_Y,
  base_lng: CENTER_POS_X,
  post_lat: CENTER_POS_Y,
  post_lng: CENTER_POS_X,
};

const namwebSlice = createSlice({
  name: "namweb-item",
  initialState,
  reducers: {
    setPosition(state : {name : string; base_lat : number, base_lng : number},
      action : {payload : {base_lat : number, base_lng : number}}) {
      state.base_lat = action.payload.base_lat;
      state.base_lng = action.payload.base_lng;
    },
    setPostPosition(
      state: { name: string; post_lat: number; post_lng: number },
      action: { payload: { post_lat: number; post_lng: number } }
    ) {
      state.post_lat = action.payload.post_lat;
      state.post_lng = action.payload.post_lng;
    },
  },
});

const store = configureStore({
  reducer: namwebSlice.reducer,
});

export const namwebActions = namwebSlice.actions;

export default store;
