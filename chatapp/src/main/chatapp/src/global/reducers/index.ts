import { createSlice, configureStore } from "@reduxjs/toolkit";

const initialState = [{ message : '', clientId: '' }];

const chatSlice = createSlice({
    name : 'chat',
    initialState: initialState,
    reducers: {
        digMessage(state) {
            // action : 나중에 추가된 메시지
            // state : 기존의 메시지
            return [...state];
        },
        storeMessage(state, action) {
            state = [...action.payload];
        },
    },
});

const store = configureStore({
    reducer: chatSlice.reducer,
});

export const chatActions = chatSlice.actions;

export default store;
