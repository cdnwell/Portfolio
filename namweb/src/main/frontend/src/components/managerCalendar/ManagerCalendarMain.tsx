import classes from "./ManagerCalendarMain.module.scss";

import ManagerMenu from "../manager/menu/ManagerMenu";
import ManagerCalendarComponent from "./calendar/ManagerCalendarComponent";

const ManagerCalendarMain = () => {
    return <div className={classes.manager_calendar_main}>
        <div className={classes.manager_calendar_menu}>
            <ManagerMenu page="calendar" />
        </div>
        <div className={classes.manager_calendar_component}>
            <ManagerCalendarComponent />
        </div>
    </div>
}

export default ManagerCalendarMain;