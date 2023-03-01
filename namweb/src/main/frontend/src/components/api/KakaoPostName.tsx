import { useState, useEffect } from "react";

const { kakao } = window;

const KakaoPostName: React.FC<{ posData: { lat: number; lng: number } }> = ({
  posData,
}) => {
  const [address, setAddress] = useState("");
  const [isWaiting, setIsWaiting] = useState(false);
  const [lat, setLat] = useState(posData.lat);
  const [lng, setLng] = useState(posData.lng);

  useEffect(() => {
    setLat(posData.lat);
    setLng(posData.lng);
  }, [posData.lat, posData.lng]);

  useEffect(() => {
    const geocoder = new kakao.maps.services.Geocoder();
    geocoder.coord2Address(lng, lat, (result, status) => {
      if (status === kakao.maps.services.Status.OK) {
        setIsWaiting(false);
        const address_name = result[0].address.address_name;
        setAddress(address_name);
      } else {
        setIsWaiting(true);
      }
    });
  }, [lat, lng]);

  return <strong>{isWaiting ? "불러오는 중" : address}</strong>;
};

export default KakaoPostName;
