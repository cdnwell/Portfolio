import classes from "./ChatEmoticonImages.module.scss";

import { SELECTED_EMOTICON } from "../enum/ChatEnum";
import { useDispatch } from "react-redux";
import { emoticonActions } from "../../../global/reducers/emoticon";

import TypingCatGif from '@assets/gif/emoticon/cat-worker/AYXecFwQxRbaho7J.5.gif';
import GoOfficeCatGif from '@assets/gif/emoticon/cat-worker/goofficecat.gif';
import GoHomeCatGif from '@assets/gif/emoticon/cat-worker/gohomecat.gif';
import NotGoTimeCatPng from "@assets/gif/emoticon/cat-worker/office_cat_time_not_go.png";

import FaceNormalPng from '@assets/gif/emoticon/face-normal-emo/face_imoticon.png';
import FaceSunglasses from '@assets/gif/emoticon/face-normal-emo/face_sunglasses.png';

import FamilyHi from "@assets/png/family/kakao_family_hi.png";
import FamilyMarshmallow from "@assets/png/family/family_marshmallow.png";
import FamilyJump from "@assets/png/family/family_jump.png";
import FamilyHug from "@assets/png/family/family_hug.png";
import FamilyDish from "@assets/png/family/family_dish.png";

const ChatEmoticonImages = ({ selectedEmoticon } : { selectedEmoticon : string; }) => {
    const dispatch = useDispatch();

    // const [selectedEmo, setSelectedEmo] = useState(SELECTED_EMOTICON.OFFICE_CAT);
    
    const images = selectedEmoticon === SELECTED_EMOTICON.OFFICE_CAT ? [ TypingCatGif, GoOfficeCatGif, GoHomeCatGif, NotGoTimeCatPng ]
                    : selectedEmoticon === SELECTED_EMOTICON.FACE_NORMAL ? [ FaceNormalPng, FaceSunglasses ]
                    : selectedEmoticon === SELECTED_EMOTICON.KAKAO_FAMILY ? [ FamilyHi, FamilyMarshmallow, FamilyJump, FamilyHug, FamilyDish ]
                    : '';

    const emoTypingClicked = (event: any) => {
        console.log('타자 치는 고양이~');
        console.log(event.target.src);
        const imageSrc = event.target.src;
        dispatch(emoticonActions.setEmoticon(imageSrc));       
    };

    return <div className={classes.emo_img_div}>
        { images && images.map((item, i) => {
            return <img key={i} className={classes.emo_img} src={item} onClick={emoTypingClicked} />
        }) }
    </div>
}

export default ChatEmoticonImages;