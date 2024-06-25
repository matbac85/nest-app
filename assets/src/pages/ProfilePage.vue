<template>
  <Layout>
    <template #content>
      <main
        class="bg-primary_500 flex-1 flex flex-col items-start p-6 gap-4 md:px-36 md:py-10 xl:p-20 overflow-auto"
        v-if="userData"
      >
        <ProfileCard :userData="userData" />
        <ReservationsSection :reservations="userData.reservations" />
        <FavoritesSection :favorites="userData.favorites" />
      </main>
    </template>
  </Layout>
</template>

<script setup>
import { watch, ref } from "vue";
import { userStore } from "../stores/userStore";
import { useRoute } from "vue-router";
import Layout from "../components/Layout.vue";
import ProfileCard from "../components/ProfileCard.vue";
import ReservationsSection from "../components/ReservationsSection.vue";
import FavoritesSection from "../components/FavoritesSection.vue";

const route = useRoute();
const userData = ref({});

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
    userData.value = await response.json();
  } else {
    console.log(`réservation ratée, marraine!!`);
  }
};

watch(() => route.query, fetchData, { immediate: true });
</script>

<style lang="scss" scoped></style>
