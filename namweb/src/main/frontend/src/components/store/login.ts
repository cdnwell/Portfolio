import { createSlice } from "@reduxjs/toolkit";
import { PURGE } from "redux-persist";

type LoginSliceType = {
  payload : {
    email : string;
    nick : string;
    name : string;
  }
}

const initialState = {
  isLoggedIn: false,
  email: "",
  nick: "",
  name: "",
};

const loginSlice = createSlice({
  name: "login-data",
  initialState,
  reducers: {
    setLoginInfo(state, action: LoginSliceType) {
      state.isLoggedIn = true;
      state.email = action.payload.email;
      state.nick = action.payload.nick;
      state.name = action.payload.name;
    },
    setLoginInvalid(state) {
      state.isLoggedIn = false;
      state.email = "";
      state.nick = "";
      state.name = "";
    },
  },
  extraReducers: (builder) => {
    builder.addCase(PURGE, () => initialState);
  },
});

export const loginActions = loginSlice.actions;

export default loginSlice.reducer;
