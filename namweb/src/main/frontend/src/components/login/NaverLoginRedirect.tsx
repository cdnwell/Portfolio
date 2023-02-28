import { useEffect } from "react";
import { useDispatch } from "react-redux";

import axios from "../../common/axiosInstance";

import { useNavigate } from "react-router-dom";
import { loginActions } from "../store/login";

const NaverLoginRedirect = () => {
  const navigate = useNavigate();
  const dispatch = useDispatch();

  const code = new URL(window.location.href).searchParams.get("code");

  useEffect(() => {
    axios
      .post(`/login/naverLogin?code=${code}`)
      .then((response) => {
        const data = response.data;
        console.log(response);

        if (data.error) throw new Error(data.error);

        dispatch(loginActions.setLoginInfo({
            email : data.email,
            name : data.name
        }));

        navigate("/");
      })
      .catch((error) => {
        alert(error);

        navigate("/login");
      });
  }, []);

  return <div></div>;
};

export default NaverLoginRedirect;
