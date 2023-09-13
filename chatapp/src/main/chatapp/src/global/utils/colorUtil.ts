import { BEAR_COLOR, BIRD_COLOR, DOG_COLOR, DOLPHIN_COLOR } from "../colors/constantColor";

export const animalColorConfirm = (userAnimal : string) => {
    return userAnimal === 'Bear' ? BEAR_COLOR 
    : userAnimal === 'Bird' ? BIRD_COLOR
    : userAnimal === 'Dog' ? DOG_COLOR
    : userAnimal === 'Dolphin' ? DOLPHIN_COLOR
    : BEAR_COLOR;
}