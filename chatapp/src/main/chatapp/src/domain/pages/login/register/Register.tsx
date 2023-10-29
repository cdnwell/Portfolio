import classes from "./Register.module.scss";

import RegisterBox from "@/domain/login/register/RegisterBox";

const Register = () => {
    return (
        <div className={classes.register_root}>
            <RegisterBox />
        </div>
    )
}

export default Register;