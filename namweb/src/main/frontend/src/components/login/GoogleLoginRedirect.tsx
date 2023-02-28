import { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "../../common/axiosInstance";

const GoogleLoginRedirect = () => {
  const code = new URL(window.location.href).searchParams.get("code");
  const navigate = useNavigate();

  console.log("google code :", code);

  useEffect(() => {
    axios
      .post(`/login/googleLogin?code=${code}`)
      .then((response) => {
        console.log(response);
        alert("로그인 완료");
        
        navigate("/");
      })
      .catch((error) => console.log(error));
  }, []);

  return <div></div>;
};

export default GoogleLoginRedirect;
