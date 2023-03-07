import { useNavigate } from "react-router-dom";
import classes from "./BackwardButton.module.scss";

const BackwardButton: React.FC<{ path: string }> = ({ path }) => {
  const navigate = useNavigate();

  return (
    <button className={classes.backward_button} onClick={() => navigate(path)}>
      뒤로가기
    </button>
  );
};

export default BackwardButton;
