import classes from "./SignIn.module.scss";

import SignInBox from "@/domain/login/signin/SignInBox";

const SignIn = () => {
    return (
        <div className={classes.sign_root}>
            <SignInBox />
        </div>
    )
}

export default SignIn;