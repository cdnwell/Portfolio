<template>
  <h1 class="login_title">
    Memo
    <p class="login_title_p">P</p>
  </h1>
</template>

<script setup lang="ts">

</script>

<style scoped>
@-webkit-keyframes hue {
  from {
    -webkit-filter: hue-rotate(0deg);
  }
  to {
    -webkit-filter: hue-rotate(-360deg);
  }
}

.login_title {
  display: flex;
  justify-content: center;

  font-weight: lighter;
  font-size: 32px;
}
.login_title_p {
  margin-left: 5px;

  background-image: -webkit-linear-gradient(92deg, #f35626, #feab3a);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  -webkit-animation: hue 10s infinite linear;
}
</style>