import { configureStore, createSlice } from "@reduxjs/toolkit";

const CENTER_POS_Y = 37.64836248151049;
const CENTER_POS_X = 127.2455233464401;

const initialState = {
  name: "namweb-book",
  lat: CENTER_POS_Y,
  lng: CENTER_POS_X,
};

const namwebSlice = createSlice({
  name: "namweb-item",
  initialState,
  reducers: {
    setPosition(
      state: { name: string; lat: number; lng: number },
      action: { payload: { lat: number; lng: number } }
    ) {
      state.lat = action.payload.lat;
      state.lng = action.payload.lng;
    },
  },
});

const store = configureStore({
  reducer: namwebSlice.reducer,
});

export const namwebActions = namwebSlice.actions;

export default store;
