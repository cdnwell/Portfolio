import { createSlice } from "@reduxjs/toolkit";

const initialState = {
    isReplyOpen : false,
};

const replySlice = createSlice({
  name: "reply-data",
  initialState,
  reducers: {
    setIsReplyOpen(state) {
        state.isReplyOpen = !state.isReplyOpen;
    }
  },
});

export const replyActions = replySlice.actions;

export default replySlice.reducer;
