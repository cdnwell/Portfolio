import { useEffect } from 'react';
import axios from '../../common/axiosInstance';

import { useNavigate } from 'react-router-dom';

const NaverLoginRedirect = () => {
    const navigate = useNavigate();

    let code = new URL(window.location.href).searchParams.get("code");

    useEffect(()=>{
        axios
            .get(`/login/naverLogin?code=${code}`)
            .then(response => {
                console.log(response);

                navigate("/");
            })
            .catch((error) => {
                console.log(error);

                navigate("/login");
            })
    },[]);

    return <div></div>
}

export default NaverLoginRedirect;