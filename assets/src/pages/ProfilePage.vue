<template>
  <div>trololo</div>
</template>

<script setup>
import { watch } from "vue";
import { userStore } from "../stores/userStore";
import { useRoute } from "vue-router";

const route = useRoute();

const fetchData = async () => {
  const response = await fetch(`/api/me`, {
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
      authorization: `Bearer ${userStore.user.jwt}`,
    },
    method: "GET",
  });
  if (response.status === 200) {
    console.log(await response.json());
  } else {
    console.log(`réservation ratée, marraine!!`);
  }
};

watch(() => route.query, fetchData, { immediate: true });
</script>

<style lang="scss" scoped></style>
