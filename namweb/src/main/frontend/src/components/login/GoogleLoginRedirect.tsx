import { useEffect } from "react";
import axios from "../../common/axiosInstance";

const GoogleLoginRedirect = () => {
  const code = new URL(window.location.href).searchParams.get("code");

  console.log("google code :", code);

  useEffect(() => {
    axios
      .post(`/login/googleLogin?code=${code}`)
      .then((response) => console.log(response))
      .catch((error) => console.log(error));
  }, []);

  return <div></div>;
};

export default GoogleLoginRedirect;
