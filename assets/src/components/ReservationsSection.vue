<template>
  <div>
    <ul
      class="bg-primary_200 rounded-xl drop-shadow px-6 py-8 flex flex-col gap-4 items-center md:grid md:grid-cols-4"
    >
      <li
        v-for="(reservation, index) in props.reservations"
        :key="index"
        class="rounded-xl shadow-lg md:md:w-auto md:h-full md:flex md:flex-col"
      >
        <img
          :src="reservation.cabin.images[0]"
          alt=""
          class="rounded-tl-xl rounded-tr-xl h-2/3"
        />
        <div class="px-6 py-6">
          <h2 class="text-primary_700 font-dosis font-bold text-xl">
            {{ reservation.cabin.name }}
          </h2>
          <p class="text-primary_800 font-normal text-base">
            {{ reservation.cabin.city }}
          </p>
          <p class="text-primary_800 font-normal text-base">
            {{ formatDateRange(reservation.start_date, reservation.end_date) }}
          </p>
        </div>
      </li>
    </ul>
  </div>
</template>

<script setup>
const props = defineProps({
  reservations: Array,
});

const formatDateRange = (startValue, endValue) => {
  const months = [
    "janvier",
    "février",
    "mars",
    "avril",
    "mai",
    "juin",
    "juillet",
    "août",
    "septembre",
    "octobre",
    "novembre",
    "décembre",
  ];

  const start = new Date(startValue);
  const end = new Date(endValue);

  const startDay = start.getDate();
  const startMonth = start.getMonth();
  const endDay = end.getDate();
  const endMonth = end.getMonth();

  if (startMonth === endMonth) {
    return `du ${startDay} au ${endDay} ${months[startMonth]}`;
  } else {
    return `du ${startDay} ${months[startMonth]} au ${endDay} ${months[endMonth]}`;
  }
};
</script>

<style lang="scss" scoped></style>
