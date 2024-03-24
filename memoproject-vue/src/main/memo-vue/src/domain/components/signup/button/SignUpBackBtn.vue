<template>
  <div class="back_arrow_div">
    <IconSignUpArrow class="back_arrow" />
  </div>
</template>

<script setup lang="ts">
import IconSignUpArrow from "@/domain/components/icons/IconRightArrow.vue";
import {LOGIN_ID} from "@/domain/components/login/enum/LoginEnum";


</script>

<style scoped>
.back_arrow_div {
  width: 32px;
  height: 32px;

  display: flex;
  justify-content: center;
  align-items: center;

  border: 1px solid gray;
  border-radius: 50%;

  background-color: white;

  transition: 0.2s;
}

.back_arrow_div:hover {
  background-color: var(--btn-permit);
}

.back_arrow_div:hover .back_arrow {
  filter: invert(100%);
}
</style>