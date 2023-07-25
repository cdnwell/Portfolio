import React, { useReducer, useContext, createContext, Dispatch } from "react";
import { IRoomProps } from "../interface/chat";

type State = {
    name: string;
    rooms: IRoomProps[];
    urls: string[];
};

type Action =
    | { type: "SET_NAME"; name: string; }
    | { type: "SET_ROOMS"; rooms: IRoomProps[]; }
    | { type: "SET_URLS"; urls: string[]; };

type UserDispatch = Dispatch<Action>;

const UserStateContext = createContext<State | null>(null);
const UserDispatchContext = createContext<UserDispatch | null>(null);

function reducer(state: State, action: Action): State {
    switch (action.type) {
        case "SET_NAME":
            return {
                ...state,
                name: action.name,
            };
        case "SET_ROOMS":
            return {
                ...state,
                rooms: action.rooms,
            };
        case "SET_URLS":
            return {
                ...state,
                urls: action.urls,
            };
        default:
            throw new Error("unhandled action");
    }
}

export function UserProvider({ children }: {children: React.ReactNode }) {
    const [state, dispatch] = useReducer(reducer, {
        name: "",
        rooms: [],
        urls: [],
    });

    return (
        <UserStateContext.Provider value={state}>
            <UserDispatchContext.Provider value={dispatch}>
                {children}
            </UserDispatchContext.Provider>
        </UserStateContext.Provider>
    );
}

export function useUserState() {
    const state = useContext(UserStateContext);
    if (!state) throw new Error("Cannot find SampleProvider");
    return state;
}

export function useUserDispatch() {
    const dispatch = useContext(UserDispatchContext);
    if (!dispatch) throw new Error("Cannot find SampleProvider");
    return dispatch;
}