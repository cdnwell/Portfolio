import axios from "@/global/axios";
import {SIGNIN_FAIL_CODE, SIGNIN_FAIL_MSG} from "@/global/enum/ResponseEnum";

export const signInRepo = async (email: string, pwd: string): { message: string, code: number } => {
    try {
        const result = await axios.post("/signin", { email, pwd });
        const { data } = result;
        const { message } = data;
        let { code } = data;
        code = parseInt(code);

        console.log('[result]');
        console.log(result);

        console.log('message : ' + message);
        console.log('code : ' + code);

        return { message, code };
    } catch (err) {
        console.error(err);
        return { message: SIGNIN_FAIL_MSG, code: SIGNIN_FAIL_CODE };
    }
}