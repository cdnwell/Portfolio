import { createSlice } from "@reduxjs/toolkit";

import { CENTER_POS_Y, CENTER_POS_X } from "../../constant/KakaoConstant";

const initialState = {
  name: "book-init",
  base_lat: CENTER_POS_Y,
  base_lng: CENTER_POS_X,
  post_lat: CENTER_POS_Y,
  post_lng: CENTER_POS_X,
  stored_lat: CENTER_POS_Y,
  stored_lng: CENTER_POS_X,
  workDate: [{}],
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
    setStoredPosition(
      state: { name: string; stored_lat: number; stored_lng: number },
      action: { payload: { stored_lat: number; stored_lng: number } }
    ) {
      state.stored_lat = action.payload.stored_lat;
      state.stored_lng = action.payload.stored_lng;
    },
    setWorkDate(
      state,
      action: {
        payload: {
          workDate: {
            dateStr: string;
            morning: boolean;
            afternoon: boolean;
            extra: boolean;
          }[];
        };
      }
    ) {
      state.workDate = action.payload.workDate;
    },
  },
});

export const bookActions = bookSlice.actions;

export default bookSlice.reducer;
