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

  const bwno = useSelector((state: bwnoReduxType) => state.manager.bwno);

  const onPageNoClick = (pageNo: number) => {
    console.log(pageNo);
  };

  useEffect(()=>{
    console.log('bookDate', bwno);
  },[bwno]);

  useEffect(() => {
    setPaging({
      currentPageNo: 1,
      endPageOfPageGroup: 5,
      nextPageGroup: true,
      previousPageGroup: true,
      startPageOfPageGroup: 1,
      totalPage: 10,
      nowPageGroupNo: 1,
      totalPageGroup: 2,
    });
  }, []);

  // 1. Status에 대한 정보(info)를 받아온다.
  useEffect(() => {
    axios
      .get(``)
      .then((response) => {
        console.log(response);
      })
      .catch((error) => {
        console.log(error);
      });
  }, []);

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
