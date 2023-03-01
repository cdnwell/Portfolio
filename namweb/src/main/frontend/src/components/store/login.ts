import { createSlice } from "@reduxjs/toolkit";

const initialState = {
    isLoggedIn : false,
    name : "",
    email : ""
};

const loginSlice = createSlice({
    name : "login-data",
    initialState,
    reducers : {
        setLoginInfo(state, action : { payload : { name : string, email : string}}) {
            state.isLoggedIn = true;
            state.name = action.payload.name;
            state.email = action.payload.email;
        },
        setLoginInvalid(state) {
            state.isLoggedIn = false;
            state.name = "";
            state.email = "";
        }
    }
});

export const loginActions = loginSlice.actions;

export default loginSlice.reducer;