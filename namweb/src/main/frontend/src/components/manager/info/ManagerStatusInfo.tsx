import classes from "./ManagerStatusInfo.module.scss";

import { useState, useEffect } from "react";

import ManagerStatusInfoPaging from "./paging/ManagerStatusInfoPaging";
import { PagingType } from "../../board/types/PagingType";
import ManagerStatusTotal from "./total/ManagerStatusTotal";
import ManagerStatusAccount from "./account/ManagerStatusAccount";
import axios from "../../../common/axiosInstance";
import ManagerStatusInfoTray from "./tray/ManagerStatusInfoTray";
import { infoType } from "./type/infoType";
import { useSelector } from "react-redux";

type bwnoReduxType = {
  manager: {
    bwno: number;
  };
}

const ManagerStatusInfo = () => {
  const [paging, setPaging] = useState<PagingType>();
  const [info, setInfo] = useState<infoType>([]);
  const [pageNo, setPageNo] = useState<number>();

  const bwno = useSelector((state: bwnoReduxType) => state.manager.bwno);

  const onPageNoClick = (pageNo: number) => {
    setPageNo(pageNo);
  };

  // 1. Status에 대한 정보(info)를 받아온다.
  useEffect(() => {
    // a. bwno가 존재하지 않는다면 useEffect 종료
    if(!bwno) return;

    axios
      .get(`/namweb/manager/book/info?bwno=${bwno}&pageNo=1`)
      .then((response) => {
        const info = response.data.bookInfoList;
        const paging = response.data.paging;

        setInfo(info);
        setPaging(paging);
      })
      .catch((error) => {
        console.log(error);
      });
  }, [bwno]);

  // 2. page 변경에 따른 Status에 대한 정보(info)를 받아온다.
  useEffect(() => {
    // a. pageNo가 존재하지 않는다면 useEffect 종료
    if(!pageNo) return;

    axios
      .get(`/namweb/manager/book/info?bwno=${bwno}&pageNo=${pageNo}`)
      .then((response) => {
        const info = response.data.bookInfoList;
        const paging = response.data.paging;

        setInfo(info);
        setPaging(paging);
      })
      .catch((error) => {
        console.log(error);
      });
  }, [pageNo]);

  return (
    <div className={classes.manager_status_info}>
      <h2>Info</h2>
      <div className={classes.manager_status_info_user}>
        <div className={classes.manager_status_user_name}>
          <p className={classes.manger_status_name_p}>이름</p>
          <span className={classes.manager_status_name_span}>hsh</span>
        </div>
        <div className={classes.manager_status_book_date_box}>
          <p className={classes.manager_status_book_date_p}>예약일</p>
          <span className={classes.manager_status_book_date_span}>
            04/09 일
          </span>
        </div>
      </div>
      <div className={classes.manager_status_info_box}>
        <div className={classes.manager_status_info_property_box}>
          <div className={classes.manager_status_info_con_date}>
            공사 예약일
          </div>
          <div className={classes.manager_status_info_properties}>
            <span className={classes.manager_status_property_span}>아침</span>
            <span className={classes.manager_status_property_span}>점심</span>
            <span className={classes.manager_status_property_span}>추가</span>
          </div>
        </div>
        <div className={classes.manager_status_info_item_box}>
          {info && <ManagerStatusInfoTray info={info} />}
        </div>
        <div className={classes.manager_status_info_paging}>
          {paging && (
            <ManagerStatusInfoPaging
              paging={paging}
              onPageNoClick={onPageNoClick}
            />
          )}
        </div>
      </div>
      <div className={classes.manager_status_total_box}>
        <div className={classes.manager_status_total_property}>
          <ManagerStatusTotal />
        </div>
        <div className={classes.manager_status_total_price}>
          <ManagerStatusAccount />
        </div>
      </div>
    </div>
  );
};

export default ManagerStatusInfo;
