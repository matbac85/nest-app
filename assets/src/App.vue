<script setup>
import { defineProps } from "vue";
// import { useRouter } from "vue-router";

const props = defineProps();
// const router = useRouter();
</script>

<template>
  <div>
    <router-view />
    <!-- C'est ici que les composants de page seront affichés -->
  </div>
</template>
