<template>
  <section class="bg-primary_200 rounded-xl drop-shadow px-6 py-8 min-w-full">
    <h2 class="txt-title mb-4">Mes réservations</h2>
    <ul
      class="grid gap-y-4 md:grid-cols-2 lg:grid-cols-4 md:gap-x-4"
      v-if="visibleReservations.length > 0"
    >
      <li
        v-for="(reservation, index) in visibleReservations"
        :key="index"
        class="flex flex-col shadow-lg rounded-xl"
      >
        <img
          loading="lazy"
          v-if="reservation.cabin.images"
          :src="reservation.cabin.images[0]"
          alt=""
          class="w-full h-44 object-cover rounded-t-xl"
        />
        <div class="p-4 flex flex-col flex-grow">
          <h2 class="txt-h2">
            {{ reservation.cabin.name }}
          </h2>
          <p class="txt-body">
            {{ reservation.cabin.city }}
          </p>
          <p class="txt-body-strong">
            {{
              useFormatDateRange(reservation.start_date, reservation.end_date)
            }}
          </p>
        </div>
      </li>
      <div
        v-if="showButton"
        class="md:col-span-2 lg:col-span-4 flex justify-end"
      >
        <button
          @click="toggleShowAll"
          class="txt-body-strong underline mt-2 text-primary_700 hover:text-primary_500"
        >
          {{ showAll ? "Voir moins" : "Voir plus" }}
        </button>
      </div>
    </ul>
    <EmptyReservationsSection v-else />
  </section>
</template>

<script setup>
import { ref, computed } from "vue";
import { useFormatDateRange } from "../composables/useFormatDateRange";
import EmptyReservationsSection from "../components/EmptyReservationsSection.vue";

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
