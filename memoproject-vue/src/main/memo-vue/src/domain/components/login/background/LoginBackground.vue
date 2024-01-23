<template>
  <div
      class="login_bg"
      :class="{ fade_in: fadeIn, fade_out: !fadeIn }"
      :style="{ backgroundImage: `url(${currentBg})` }"
  ></div>
</template>

<script setup lang="ts">
import {onUnmounted, ref} from "vue";

let fadeIn = ref(true)
const images = [
  '/src/assets/img/background/winter-login-bg00.jpg',
  '/src/assets/img/background/winter-login-bg01.jpg',
  '/src/assets/img/background/winter-login-bg02.jpg',
  '/src/assets/img/background/winter-login-bg03.jpg',
  '/src/assets/img/background/winter-login-bg04.jpg',
  '/src/assets/img/background/winter-login-bg05.jpg'
]
let bgIdx = 0
let currentBg = ref(images[bgIdx])


const bgInterval = setInterval(() => {
  bgIdx = ++bgIdx % images.length
  currentBg.value = images[bgIdx]
  fadeIn.value = false
  setTimeout(() => {
    fadeIn.value = true
  }, 500)
}, 13000);

onUnmounted(() => {
  clearInterval(bgInterval)
})

</script>

<style scoped>

</style>