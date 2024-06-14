<template>
  <div class="bg-primary_200 rounded-xl drop-shadow grid grid-cols-1 px-6 py-8">
    <h1
      class="font-dosis text-2xl font-semibold text-start text-primary_800 mb-4"
    >
      Confirmer votre réservation
    </h1>
    <h2
      class="font-dosis text-xl font-semibold text-start text-primary_800 mb-2"
    >
      Votre voyage
    </h2>
    <h3 class="font-dosis text-lg font-semibold text-start text-primary_700">
      Dates
    </h3>
    <p class="mb-3">
      {{ formatDateRange(props.query.startDate, props.query.endDate) }}
    </p>
    <h3 class="font-dosis text-lg font-semibold text-start text-primary_700">
      Nombre de voyageurs
    </h3>
    <p v-if="props.query.travellers">
      {{ props.query.travellers }}
    </p>
    <p v-if="!props.query.travellers">inconnu</p>
    <button
      class="transition ease-in-out delay-150 block text-base font-semibold text-primary_200 bg-primary_700 py-3 rounded-lg min-w-full tracking-wide hover:bg-primary_500 mt-6 hover:scale-105 duration-300 lg:px-4 disabled:bg-disabled_200 disabled:text-disabled_400"
      @click="order()"
      :disabled="!isUserLoggedIn"
    >
      confirmer
    </button>
    <button
      v-if="!isUserLoggedIn"
      @click="redirect"
      class="text-primary_700 mt-2 tracking-wide underline text-center hover:text-primary_500"
    >
      Connectez-vous pour confirmer votre réservation.
    </button>
  </div>
</template>

<script setup>
import { userStore } from "../stores/userStore";
import { useRouter } from "vue-router";
import { computed } from "vue";
import { redirectStore } from "../stores/redirectStore";

const router = useRouter();

const props = defineProps({
  query: Object,
  id: Number,
});

const form = {
  start_date: props.query.startDate,
  end_date: props.query.endDate,
  travellers: props.query.travellers,
};

const order = async () => {
  const response = await fetch(`/api/cabins/${props.id}/reservations`, {
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
      authorization: `Bearer ${userStore.user.jwt}`,
    },
    method: "POST",
    body: JSON.stringify(form),
  });
  if (response.status === 200) {
    router.push({
      name: "ThankYou",
    });
  } else {
    console.log("réservation ratée, marraine!!");
  }
};

const formatDateRange = (startDate, endDate) => {
  const options = { day: "numeric", month: "long" };
  const start = new Date(startDate).toLocaleDateString("fr-FR", options);
  const end = new Date(endDate).toLocaleDateString("fr-FR", options);
  return `Du ${start} au ${end}`;
};

const isUserLoggedIn = computed(() => !!userStore.user);

const redirect = () => {
  redirectStore.setUrl(router.currentRoute.value);
  router.push({
    name: "Login",
  });
};
</script>

<style lang="scss" scoped></style>
