import { useEffect, useState } from "react";
import { useSelector as useReduxSelector } from "react-redux";
import axios from "../../../common/axiosInstance";
import UpdateAni from "../../animation/UpdateAni";
import classes from "./AddressButton.module.scss";

const AddressButton: React.FC<{
  addressP: string;
  addressInit: string;
  addressDetailP: string;
  addressDetailInit: string;
  onReloadClick: () => void;
}> = ({
  addressP,
  addressInit,
  addressDetailP,
  addressDetailInit,
  onReloadClick,
}) => {
  const [address, setAddress] = useState("");
  const [initAddress, setInitAddress] = useState("");
  const [initAddressDetail, setInitAddressDetail] = useState("");
  const [addressDetail, setAddressDetail] = useState("");
  const [isNoAddress, setIsNoAddress] = useState(false);
  const [isNoContent, setIsNoContent] = useState(false);
  const [isInitAddress, setIsInitAddress] = useState(false);
  const [isUpdate, setIsUpdate] = useState(false);

  const userEmail = useReduxSelector(
    (state: { login: { email: string } }) => state.login.email
  );

  useEffect(() => {
    setAddress(addressP);
  }, [addressP]);

  useEffect(() => {
    setInitAddress(addressInit);
  }, [addressInit]);

  useEffect(() => {
    setAddressDetail(addressDetailP);
  }, [addressDetailP]);

  useEffect(() => {
    setInitAddressDetail(addressDetailInit);
  }, [addressDetailInit]);

  const onAddressCheck = () => {
    setIsNoContent(false);
    setIsNoAddress(false);
    setIsInitAddress(false);

    if (address.trim().length === 0 || addressDetail.trim().length === 0) {
      setIsNoContent(true);
      return;
    }
    setIsNoContent(false);

    const regex = /[^가-힣A-Za-z0-9\\\- ]/g;

    if (regex.test(addressDetail)) {
      setIsNoAddress(true);
      return;
    }
    setIsNoAddress(false);

    if (initAddress === address && initAddressDetail === addressDetail) {
      setIsInitAddress(true);
      return;
    }
    setIsInitAddress(false);

    const changeSelect = confirm("주소를 변경하시겠습니까?");

    if (!changeSelect) return;

    axios
      .put("/member/address", {
        email: userEmail,
        address: address,
        address_detail: addressDetail,
      })
      .then((response) => {
        onReloadClick();
        setIsUpdate(true);
        setTimeout(()=>{
          setIsUpdate(false);
        },2000);
      })
      .catch((error) => console.log(error));
  };

  return (
    <>
      <button className={classes.address_button} onClick={onAddressCheck}>
        주소 변경
      </button>
      {isNoContent && (
        <p className={classes.address_right}>
          주소, 상세 주소를 모두 입력해주세요.
        </p>
      )}
      {isNoAddress && (
        <p className={classes.address_right}>
          주소는 문자와 숫자로만 적어주세요.{"["}특수문자 :{" "}
          <span style={{ fontFamily: "Arial" }}>\</span> , - 만 가능{"]"}
        </p>
      )}
      {isInitAddress && (
        <p className={classes.address_right}>기존의 주소와 같습니다.</p>
      )}
      {isUpdate && <UpdateAni content="업데이트 완료" />}
    </>
  );
};

export default AddressButton;
