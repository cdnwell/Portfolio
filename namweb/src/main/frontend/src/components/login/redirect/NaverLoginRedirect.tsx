import { useEffect } from "react";
import { useNavigate } from "react-router-dom";

import axios from "../../../common/axiosInstance";

import { useDispatch } from "react-redux";
import { loginActions } from "../../store/login";
import Spinner from "../../layout/Spinner";
import Empty from "../../layout/Empty";

const NaverLoginRedirect: React.FC<{
  onLoginHandler: (status: boolean) => void;
}> = ({ onLoginHandler }) => {
  const navigate = useNavigate();
  const dispatch = useDispatch();

  const code = new URL(window.location.href).searchParams.get("code");

  useEffect(() => {
    onLoginHandler(true);
    axios
      .post(`/login/naverLogin?code=${code}`)
      .then((response) => {
        const data = response.data;

        if (data.error) throw new Error(data.error);

        dispatch(
          loginActions.setLoginInfo({
            email: data.email,
            nick: data.nick,
            name: data.name,
          })
        );

        navigate("/");
      })
      .catch((error) => {
        alert(error);

        navigate("/login");
      })
      .finally(() => onLoginHandler(false));
  }, []);

  return <Empty />;
};

export default NaverLoginRedirect;
