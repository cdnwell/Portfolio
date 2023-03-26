import { createSlice } from "@reduxjs/toolkit";

const initialState = {
    isReplyUpdate : false,
};

const replySlice = createSlice({
  name: "reply-data",
  initialState,
  reducers: {
    setIsReplyUpdate(state, action) {
        state.isReplyUpdate = action.payload;
    }
  },
});

export const replyActions = replySlice.actions;

export default replySlice.reducer;
