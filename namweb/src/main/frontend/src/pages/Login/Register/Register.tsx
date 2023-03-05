import classes from "./Register.module.scss";
import { useEffect } from "react";

import RegisterPage from "../../../components/login/register/RegisterPage";

const Register = () => {
  return (
    <div className={classes.register}>
      <RegisterPage />
    </div>
  );
};

export default Register;
