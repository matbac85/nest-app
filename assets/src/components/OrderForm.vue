<template>
  <div class="min-w-full flex justify-between items-end gap-3 md:justify-start">
    <div class="text-base flex justify-center">
      <p class="font-semibold xl:text-3xl">
        70 €
        <strong class="text-sm font-base font-normal xl:text-xl"
          >par nuit</strong
        >
      </p>
    </div>
    <div>
      <label
        for="date-range"
        class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
        >Arrivée - Départ</label
      >
      <Datepicker
        v-model="form.date"
        :range="{ partialRange: false }"
        :enable-time-picker="false"
        input-class-name="dp-custom-input dp-custom-calendar"
        class="placeholder:text-red-500"
        hide-input-icon
        placeholder="JJ/MM/AAAA - JJ/MM/AAAA"
      />
    </div>
    <div>
      <label
        for="voyageurs"
        class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
        >Voyageurs</label
      ><input
        v-model="form.travellers"
        type="number"
        class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500 placeholder:text-primary_400"
        placeholder="3"
      />
    </div>
    <RouterLink
      to="/payment"
      class="transition ease-in-out delay-150 block font-ubuntu text-base font-semibold text-primary_200 bg-primary_700 py-3 px-4 rounded-lg min-w-fit tracking-wide xl:text-xl hover:bg-primary_500 hover:scale-105 duration-300"
    >
      Demande de réservation
    </RouterLink>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { RouterLink } from "vue-router";
import Datepicker from "@vuepic/vue-datepicker";
import "@vuepic/vue-datepicker/dist/main.css";

const form = ref({
  date: "",
  travellers: null,
});

// watch(() => route.query, fetchData, { immediate: true });
</script>

<style>
#placeholder::placeholder {
  color: #afbdbb;
}

select {
  color: #0d1312;
}

.dp-custom-input {
  border: 1px solid #51746f;
  border-radius: 0.5rem;
  padding: 0.75rem 1rem;
}

.dp__input_focus {
  border: solid 1px #87c1b9;
}

.dp-custom-input::placeholder {
  color: #afbdbb;
}

.dp__action_buttons .dp__action_select {
  background: #51746f;
}

.dp__range_end,
.dp__range_start,
.dp__active_date {
  background: #51746f;
}

.dp__menu_inner,
.dp__action_row,
.dp__action_cancel,
.dp__action_button {
  font-family: "ubuntu", "sans-serif";
}

.dp__theme_light {
  --dp-primary-color: #51746f;
  --dp-primary-disabled-color: #87c1b9;
}

.dp__menu_inner {
  font-family: "Ubuntu Sans", sans-serif;
}
</style>
