import { useNavigate } from "react-router-dom";
import classes from "./BackwardButton.module.scss";

const BackwardButton: React.FC<{ path: string }> = ({ path }) => {
  const navigate = useNavigate();

  return (
    <button type="button" className={classes.backward_button} onClick={() => navigate(-1)}>
      뒤로가기
    </button>
  );
};

export default BackwardButton;
