import classes from "./RegProfile.module.scss";

import { useState } from "react";

import userDefaultImage from "@assets/png/icon/user.png";

interface ProfileFieldProps {
    onSendImg: (img: string) => void;
}

const RegProfile: React.FC<ProfileFieldProps> = ({ onSendImg }) => {
    const [profileImg, setProfileImg] = useState<string>(userDefaultImage);

    const onProfileImgChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        if(event.target.files && event.target.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e: ProgressEvent<FileReader>) {
                if (e.target && e.target.result) {
                    setProfileImg(e.target.result as string);
                    onSendImg(e.target.result as string);
                }
            }
            reader.readAsDataURL(event.target.files[0]);
        }
    }

    return (
        <div className={classes.reg_prof_div}>
            <div className={classes.reg_prof_wrapper}>
                <p className={classes.prof_p}>
                    Profile
                </p>
                <div className={classes.prof_img_div}>
                    <img src={profileImg} alt="프로필 이미지" />
                </div>
                <div className={classes.prof_input_div}>
                    <label htmlFor="reg_prof_input">
                        업로드
                    </label>
                    <input type="file" id="reg_prof_input" style={{ display : 'none' }} onChange={onProfileImgChange} />
                </div>
            </div>
        </div>
    )
}

export default RegProfile;