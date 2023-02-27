import { useEffect } from "react";
import axios from "../../common/axiosInstance";

import { useNavigate } from "react-router-dom";

const KakaoLoginRedirect = () => {
  const navigate = useNavigate();

  const code = new URL(window.location.href).searchParams.get("code");

  useEffect(() => {
    axios
      .post(`/login/kakaoLogin?code=${code}`,)
      .then((response) => {
        console.log(response);

        navigate("/");
      })
      .catch((error) => {
        console.log(error);

        navigate("/login");
      });
  }, []);

  return <div></div>;
};

export default KakaoLoginRedirect;
