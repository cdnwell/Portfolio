import { createSlice, configureStore, combineReducers } from "@reduxjs/toolkit";

import sessionStorage from "redux-persist/lib/storage/session";
import { persistReducer } from "redux-persist";
import {
  FLUSH,
  REHYDRATE,
  PAUSE,
  PERSIST,
  PURGE,
  REGISTER,
} from "redux-persist";

import { USER_TYPE } from "../uniontypes/user-type";

import emoticonReducer from "./emoticon";
import chatReducer from "./chat";

// const initialStateChat = [{ message: "", clientId: "", userAnimal: "" }];

// const chatSlice = createSlice({
//   name: "chat",
//   initialState: initialStateChat,
//   reducers: {
//     digMessage(state) {
//       // action : 나중에 추가된 메시지
//       // state : 기존의 메시지
//       return [ ...state ];
//     },
//     storeMessage(state, action) {
//       console.log("payload", action.payload);
//       // state.push(action.payload);
//       state = [ ...action.payload ];
//       console.log('action', action);
//       console.log('state', state);
//       return [...action.payload];
//     },
//   },
//   extraReducers: (builder) => {
//     builder.addCase(PURGE, () => initialStateChat);
//   },
// });

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

const reducers = combineReducers({
  chat: chatReducer,
  user: userSlice.reducer,
  emoticon: emoticonReducer,
});

const persistConfig = {
  key: "root",
  storage: sessionStorage,
  whitelist: ["user", "chat"],
};

const persistedReducer = persistReducer(persistConfig, reducers);

const store = configureStore({
  reducer: persistedReducer,
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({
      serializableCheck: {
        ignoredActions: [FLUSH, REHYDRATE, PAUSE, PERSIST, PURGE, REGISTER],
      },
    }),
});

// export const chatActions = chatSlice.actions;

export const userActions = userSlice.actions;

export default store;
