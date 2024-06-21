<template>
  <div class="bg-primary_200 rounded-xl drop-shadow px-6 py-8">
    <h2 class="font-dosis font-semibold text-xl text-primary_700 mb-4">
      Mes réservations
    </h2>
    <ul class="grid gap-y-4 md:grid-cols-4 md:gap-x-4">
      <li
        v-for="(reservation, index) in visibleReservations"
        :key="index"
        class="flex flex-col shadow-lg rounded-xl md:w-60"
      >
        <img
          v-if="reservation.cabin.images"
          :src="reservation.cabin.images[0]"
          alt=""
          class="w-full h-44 object-cover rounded-t-xl"
        />
        <div class="p-4 flex flex-col justify-between flex-grow">
          <h2 class="text-primary_700 font-dosis font-bold text-xl">
            {{ reservation.cabin.name }}
          </h2>
          <p class="text-primary_800 font-normal text-base">
            {{ reservation.cabin.city }}
          </p>
          <p class="text-primary_800 font-normal text-base">
            {{
              useFormatDateRange(reservation.start_date, reservation.end_date)
            }}
          </p>
        </div>
      </li>
      <button
        v-if="showButton"
        @click="toggleShowAll"
        class="font-medium underline mt-2 text-primary_700 md:col-span-4 flex justify-end"
      >
        {{ showAll ? "Voir moins" : "Voir plus" }}
      </button>
    </ul>
  </div>
</template>

<script setup>
import { ref, computed } from "vue";
import { useFormatDateRange } from "../composables/useFormatDateRange";

const props = defineProps({
  reservations: Array,
});

const showAll = ref(false);
const maxVisible = ref(4);

const toggleShowAll = () => {
  showAll.value = !showAll.value;
};

const visibleReservations = computed(() => {
  if (!props.reservations || !Array.isArray(props.reservations)) {
    return [];
  } else if (showAll.value) {
    return props.reservations;
  } else {
    return props.reservations.slice(0, maxVisible.value);
  }
});

const showButton = computed(() => {
  if (props.reservations || Array.isArray(props.reservations)) {
    return props.reservations.length > maxVisible.value;
  }
});
</script>

<style scoped></style>
