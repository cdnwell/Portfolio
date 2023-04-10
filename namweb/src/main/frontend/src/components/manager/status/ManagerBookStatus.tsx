import classes from "./ManagerBookStatus.module.scss";

import { useState, useEffect } from "react";
import axios from "../../../common/axiosInstance";
import { useSelector } from "react-redux";

import ManagerBookStatusItem from "./item/ManagerBookStatusItem";
import ManagerBookPaging from "./paging/ManagerBookPaging";
import ManagerBookProperty from "./property/ManagerBookProperty";
import { PagingType } from "../../board/types/PagingType";
import { ManagerBookStatusType } from "../type/ManagerBookStatusType";
import ManagerBookStatusTray from "./tray/ManagerBookStatusTray";

type managerDateReduxType = {
  manager: {
    date: string;
  };
};

const ManagerBookStatus = () => {
  const bookDate = useSelector(
    ({ manager }: managerDateReduxType) => manager.date
  );

  const [book, setBook] = useState<ManagerBookStatusType>();
  const [paging, setPaging] = useState<PagingType>();
  const [page, setPage] = useState<number>(1);

  // a. bookDate가 바뀔 경우 1 page부터 게시글 불러오기
  useEffect(() => {
    // 1. bookDate가 바뀌면 page를 1로 초기화
    setPage(1);

    axios
      .get(`/namweb/manager/book/status?date=${bookDate}&pageNo=1`)
      .then((response) => {
        const data = response.data;
        console.log(response);

        setBook(data.book);
        setPaging(data.paging);
      })
      .catch((error) => {
        console.log(error);
      });
  }, [bookDate]);

  // a. page가 바뀔 경우 게시글 불러오기
  useEffect(() => {
    axios
      .get(`/namweb/manager/book/status?date=${bookDate}&pageNo=${page}`)
      .then((response) => {
        const data = response.data;
        console.log(response);

        setBook(data.book);
        setPaging(data.paging);
      })
      .catch((error) => {
        console.log(error);
      });
  }, [page]);

  const onPageTransfer = (page: number) => {
    console.log('page',page);
    setPage(page);
  };

  return (
    <div className={classes.manager_book_status}>
      <div className={classes.manager_book_status_box}>
        <div className={classes.manager_book_status_property_box}>
          <ManagerBookProperty />
        </div>
        <div className={classes.manager_book_status_item_box}>
          {book && <ManagerBookStatusTray book={book} />}
        </div>
        <div className={classes.manager_book_status_paging}>
          {paging && (
            <ManagerBookPaging
              onPageTransfer={onPageTransfer}
              paging={paging}
            />
          )}
        </div>
      </div>
    </div>
  );
};

export default ManagerBookStatus;
