<template>
  <div
    class="hidden items-center footer-shadow fixed bottom-0 left-0 right-0 lg:flex bg-primary_200 py-4 px-4 justify-between md:px-6 xl:px-14"
  >
    <p class="text-sm text-primary_800">© Copyright 2024</p>
    <div class="flex gap-4">
      <a href="https://www.instagram.com/matbac/">
        <img
          src="../assets/instagram-icon.svg"
          alt=""
          class="block min-w-[1.5rem]"
        />
      </a>
      <a href="https://www.facebook.com/">
        <img
          src="../assets/facebook-icon.svg"
          alt=""
          class="block min-w-[1.5rem]"
        />
      </a>
    </div>
  </div>
</template>

<script setup></script>

<style scoped>
.footer-shadow {
  filter: drop-shadow(0 -1px 2px rgb(0 0 0 / 0.1))
    drop-shadow(0 -1px 1px rgb(0 0 0 / 0.06));
}
</style>
