import ReactDOM from "react-dom";

import classes from "./Opacity.module.scss";

const Opacity = () => {
  return ReactDOM.createPortal(
    <div className={classes.opacity}></div>,
    document.getElementById("backdrop-overlay") as HTMLElement
  );
};

export default Opacity;
