import { SELECTED_EMOTICON } from "../enum/ChatEnum";
import classes from "./ChatEmoticonMenu.module.scss";

import OfficeCatThumb from "@assets/gif/emoticon/cat-worker/office_cat_thumb_nail.png";
import FaceNormalThumb from "@assets/gif/emoticon/face-normal-emo/face_imoticon.png";
import KakaoFamilyThumb from "@assets/png/family/family_dish.png";

const ChatEmoticonMenu = ({ handleClickedEmoMenu } : { handleClickedEmoMenu : (menu : string) => void;}) => {
    const menuImages = [
        { img: OfficeCatThumb, menu: SELECTED_EMOTICON.OFFICE_CAT },
        { img: FaceNormalThumb, menu: SELECTED_EMOTICON.FACE_NORMAL },
        { img: KakaoFamilyThumb, menu: SELECTED_EMOTICON.KAKAO_FAMILY },
    ];

    return <div className={classes.emo_menu_div}>
        {menuImages && menuImages.map((item, i) => {
            return <img key={i} className={classes.emo_menu_img} src={item.img} onClick={() => handleClickedEmoMenu(item.menu)} />
        })}
    </div>
}

export default ChatEmoticonMenu;