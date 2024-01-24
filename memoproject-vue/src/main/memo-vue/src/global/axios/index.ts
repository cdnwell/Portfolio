import axios from 'axios';
import baseURL from "@/global/axios/baseURL";

const instance = axios.create({
    baseURL: baseURL
});

export default instance;