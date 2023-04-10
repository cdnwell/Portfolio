import classes from "./ManagerStatusInfo.module.scss";

import { useState, useEffect } from "react";

import ManagerStatusInfoItem from "./item/ManagerStatusInfoItem";
import ManagerStatusInfoPaging from "./paging/ManagerStatusInfoPaging";
import PagingProps from "../../board/types/PagingProps";
import { PagingType } from "../../board/types/PagingType";
import ManagerStatusTotal from "./total/ManagerStatusTotal";
import ManagerStatusAccount from "./account/ManagerStatusAccount";

const ManagerStatusInfo = () => {
  const [paging, setPaging] = useState<PagingType>();

  const onPageNoClick = (pageNo: number) => {
    console.log(pageNo);
  };

  useEffect(() => {
    
    setPaging({
      currentPageNo : 1,
      endPageOfPageGroup : 5,
      nextPageGroup: true,
      previousPageGroup : true,
      startPageOfPageGroup : 1,
      totalPage : 10,
      nowPageGroupNo : 1,
      totalPageGroup : 2,
    })
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
          <ManagerStatusInfoItem />
          <ManagerStatusInfoItem />
          <ManagerStatusInfoItem />
          <ManagerStatusInfoItem />
        </div>
        <div className={classes.manager_status_info_paging}>
          {paging && (
            <ManagerStatusInfoPaging paging={paging} onPageNoClick={onPageNoClick} />
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
