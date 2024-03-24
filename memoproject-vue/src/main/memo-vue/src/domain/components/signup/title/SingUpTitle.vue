<template>
  <div class="signup_title_div">
    <h2 class="signup_title_h2">
      {{ text }}
    </h2>
    <p class="signup_title_line"></p>
  </div>
</template>

<script setup lang="ts">
const props = defineProps({
  text: String
})

</script>

<style scoped>
.signup_title_div {
  position: relative;

  width: 100%;

  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  padding: 10px;

  user-select: none;
}

.signup_title_h2 {
  background-color: white;
  color: gray;

  padding: 0 10px;

  font-size: 14px;
  font-weight: normal;
}

.signup_title_line {
  position: absolute;

  width: 90%;
  height: 2px;

  padding: 0 10px;

  background-color: #f0f0f0;

  border-radius: 50%;

  z-index: -1;
}
</style>