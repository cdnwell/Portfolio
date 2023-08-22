const USER_TYPE = {
    Bear : "Bear",
    Bird : "Bird",
    Dog : "Dog",
    Dolphin : "Dolphin",
    None : "None"
} as const;
export type USER_TYPE = typeof USER_TYPE[keyof typeof USER_TYPE];