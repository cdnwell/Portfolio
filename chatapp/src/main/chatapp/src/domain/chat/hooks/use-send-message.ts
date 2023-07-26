import { CompatClient } from "@stomp/stompjs";
import axios from "../../../global/config/axiosInstance";

interface ISendMessageProps {
    client: CompatClient;
    roomId: string;
    sender: string;
    message: string;
    deleteMessage: () => void;
}

export const useSendMessage = ({
    client
    , roomId
    , sender
    , message
    , deleteMessage
}: ISendMessageProps) => {
    client.send(
        "/pub/chat/message"
        , {
            Authorization: axios.defaults.headers.common["Authorization"]
        }
        , JSON.stringify({
            type: "TALK"
            , roomId
            , sender
            , message
        })
    );
    deleteMessage();
}