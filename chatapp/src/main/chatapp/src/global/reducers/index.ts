import { createSlice, configureStore } from "@reduxjs/toolkit";
import { USER_TYPE } from "../uniontypes/user-type";

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
            console.log('payload', action.payload);
            return [...action.payload];
        },
    },
});

const initialStateUser : {userId : string; userAnimal : USER_TYPE } = { userId: '', userAnimal : 'None'};

const userSlice = createSlice({
    name: 'user',
    initialState: initialStateUser,
    reducers: {
        setUserId(state, action) {
            return { userId: action.payload, userAnimal: state.userAnimal };
        }
    }
})

const store = configureStore({
    reducer: { chat: chatSlice.reducer, user: userSlice.reducer },
});

export const chatActions = chatSlice.actions;

export const userActions = userSlice.actions;

export default store;
