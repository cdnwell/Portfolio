import { createSlice } from "@reduxjs/toolkit";
import { PURGE } from "redux-persist";

const initialStateChat = [{ message: "", clientId: "", userAnimal: "" }];

const chatSlice = createSlice({
  name: "chat",
  initialState: initialStateChat,
  reducers: {
    digMessage(state) {
      // action : 나중에 추가된 메시지
      // state : 기존의 메시지
      return [ ...state ];
    },
    storeMessage(state, action) {
      console.log("payload", action.payload);
      // state.push(action.payload);
      state = [ ...action.payload ];
      console.log('action', action);
      console.log('state', state);
      return [...action.payload];
    },
  },
  extraReducers: (builder) => {
    builder.addCase(PURGE, () => initialStateChat);
  },
});

export default chatSlice.reducer;

export const chatActions = chatSlice.actions;