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
import userReducer from "./user";

const reducers = combineReducers({
  chat: chatReducer,
  user: userReducer,
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

export default store;
