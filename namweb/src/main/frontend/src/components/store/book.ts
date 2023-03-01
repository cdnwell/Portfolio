import { createSlice } from "@reduxjs/toolkit";

import { CENTER_POS_Y, CENTER_POS_X } from "../../constant/KakaoConstant";

const initialState = {
  name: "book-init",
  base_lat: CENTER_POS_Y,
  base_lng: CENTER_POS_X,
  post_lat: CENTER_POS_Y,
  post_lng: CENTER_POS_X,
  re_post_lat: CENTER_POS_Y,
  re_post_lng: CENTER_POS_X,
  work_date: [{}],
};

const bookSlice = createSlice({
  name: "book-data",
  initialState,
  reducers: {
    setPosition(
      state: { name: string; base_lat: number; base_lng: number },
      action: { payload: { base_lat: number; base_lng: number } }
    ) {
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
    setRePostPosition(
      state: { name: string; re_post_lat: number; re_post_lng: number },
      action: { payload: { re_post_lat: number; re_post_lng: number } }
    ) {
      state.re_post_lat = action.payload.re_post_lat;
      state.re_post_lng = action.payload.re_post_lng;
    },
    setWorkDate(
      state,
      action: {
        payload: {
          work_date: {
            date_str: string;
            morning: boolean;
            afternoon: boolean;
            extra: boolean;
          }[];
        };
      }
    ) {
      state.work_date = action.payload.work_date;
    },
  },
});

export const bookActions = bookSlice.actions;

export default bookSlice.reducer;
