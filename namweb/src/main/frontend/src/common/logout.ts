import { useDispatch } from "react-redux";
import { loginActions } from "../components/store/login";

const logout = () => {
  const dispatch = useDispatch();
  dispatch(loginActions.setLoginInvalid());
};

export default logout;
