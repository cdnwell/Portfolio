import classes from "./ManagerMain.module.scss";

import ManagerMenu from "./menu/ManagerMenu";
import ManagerBarGraph from "./graph/ManagerBarGraph";
import ManagerBookStatus from "./status/ManagerBookStatus";

const ManagerMain = () => {
    const currentPage = "book";

  return (
    <div className={classes.manager_main}>
      <div className={classes.manager_main_menu}>
        <ManagerMenu page={currentPage} />
      </div>
      <div className={classes.manager_graph_status_box}>
        <ManagerBarGraph />
        <ManagerBookStatus />
      </div>
    </div>
  );
};

export default ManagerMain;
