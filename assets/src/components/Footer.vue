<template>
  <div
    class="hidden items-center lg:footer-shadow lg:flex bg-primary_200 py-4 px-4 justify-between md:px-6 xl:px-14"
  >
    <p class="text-sm text-primary_800">© Copyright 2024</p>
    <div class="flex gap-4">
      <a href="https://www.instagram.com/matbac/">
        <img
          loading="lazy"
          src="/images/instagram-icon.svg"
          alt=""
          class="block min-w-[1.5rem]"
        />
      </a>
      <a href="https://www.facebook.com/">
        <img
          loading="lazy"
          src="/images/facebook-icon.svg"
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
