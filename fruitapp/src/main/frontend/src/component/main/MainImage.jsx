import React from 'react';
import { Slide } from 'react-slideshow-image';
import 'react-slideshow-image/dist/styles.css';
import '../../css/main/slideImage.css';

const slideImages = [
    {
        url: 'img/rotate/grape_green_light.jpg',
        caption : 'Slide 1'
    },
    {
        url : 'img/rotate/apple_big.jpg',
        caption : 'Slide 2'
    },
    {
        url : 'img/rotate/blueberry.jpg',
        caption : 'Slide 3'
    },
    {
        url : 'img/rotate/peach.jpg',
        caption : 'Slide 4'
    },
    {
        url : 'img/rotate/orange.jpg',
        caption : 'Slide 5'
    }
]

const MainImage = () => {

    return (
        <div className='slide-container'>
            <Slide>
                {slideImages.map((slideImage, index) => (
                    <div className='each-slide' key={index}>
                        <div style={{'backgroundImage' : `url(${slideImage.url})`}}>
                            <span>{slideImage.caption}</span>
                        </div>
                    </div>
                ))}
            </Slide>
        </div>
    );
}

export default MainImage;