import classes from "./ManagerStatusInfoTray.module.scss";

import ManagerStatusInfoItem, { ManagerStatusInfoItemProps } from "../item/ManagerStatusInfoItem";

interface ManagerStatusInfoTrayProps {
    info: ManagerStatusInfoItemProps[];
}

const ManagerStatusInfoTray = ({ info } : ManagerStatusInfoTrayProps) => {
    const managerStatusInfoTray = info.map((item, index) => {
        return (
            <ManagerStatusInfoItem key={index} date={item.date} morning={item.morning} afternoon={item.afternoon} extra={item.extra} />
        )
    });

    return <>{managerStatusInfoTray}</>
}

export default ManagerStatusInfoTray;