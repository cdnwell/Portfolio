export default interface ChatMessageType {
    message : {
        mno: string;
        content: string;
        writer: string;
        readNum: number;
        message: string;
    }[];
}