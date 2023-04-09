import classes from "./ManagerBookStatusTray.module.scss";

import { ManagerBookStatusType } from "../../type/ManagerBookStatusType";
import ManagerBookStatusItem from "../item/ManagerBookStatusItem";

interface ManagerBookStatusTrayProps {
  book: ManagerBookStatusType;
}

const ManagerBookStatusTray = ({ book }: ManagerBookStatusTrayProps) => {
  const bookStatusTray = book.map((item, idx) => {
    return <ManagerBookStatusItem key={idx} item={item} />;
  });

  return <div></div>;
};

export default ManagerBookStatusTray;
