import { createSlice } from "@reduxjs/toolkit";

const initialState = { src: '', };

const emoticonSlice = createSlice({
    name: 'emoticon',
    initialState,
    reducers: {
        getEmoticon(state) {
            return { src: state.src };
        },
        setEmoticon(state, action) {
            state.src = action.payload;
        },
    },
});

export default emoticonSlice.reducer;

export const emoticonActions = emoticonSlice.actions;