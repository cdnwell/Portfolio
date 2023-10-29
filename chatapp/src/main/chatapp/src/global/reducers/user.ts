import { createSlice } from "@reduxjs/toolkit";
import { PURGE } from "redux-persist";
import { USER_TYPE } from "../uniontypes/user-type";

const initialStateUser: { userId: string; userAnimal: USER_TYPE } = {
    userId: "",
    userAnimal: "None",
  };
  
const userSlice = createSlice({
  name: "user",
  initialState: initialStateUser,
  reducers: {
    setUserId(state, action) {
      state.userId = action.payload;
      state.userAnimal = state.userAnimal;
    },
    setUserAnimal(state, action) {
      // state.userId = state.userId;
      state.userAnimal = action.payload;
      console.log('animals :', action.payload);
    },
  },
  extraReducers: (builder) => {
    builder.addCase(PURGE, () => initialStateUser);
  },
});
  
export default userSlice.reducer;

export const userActions = userSlice.actions;