import {SIGNUP_NICK_REGEX} from "@/domain/components/signup/enum/SignUpRegex";

export function isValidNick(nick: string) {
    const nickRegex = SIGNUP_NICK_REGEX;
    if(nick.match(nickRegex)) return true;
    return false;
}