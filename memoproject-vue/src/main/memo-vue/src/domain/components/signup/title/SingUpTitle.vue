<template>
  <div class="signup_title_div">
    <h2 class="signup_title">{{ text }}</h2>
  </div>
</template>

<script setup lang="ts">
const props = defineProps({
  text: String
})

</script>

<style scoped>
.signup_title_div {
  width: 100%;

  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  padding: 10px;

  font-weight: lighter;
  font-size: 18px;

  user-select: none;
}

.signup_title{
  transition: 0.2s;
}

.signup_title:hover {
  color: var(--btn-permit);
}
</style>