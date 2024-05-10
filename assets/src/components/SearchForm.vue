<template>
  <div>
    <form
      novalidate
      class="bg-primary_200 px-6 py-8 min-w-[21.4375rem] rounded-xl drop-shadow"
    >
      <div
        class="flex flex-col gap-4 lg:flex-row lg:items-end lg:justify-between"
      >
        <div>
          <label
            for="areas"
            class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
            >Régions</label
          >
          <select
            id="areas"
            class="appearance-none font-ubuntu text-base text-slate-400 rounded-lg block py-3 px-4 min-w-full min-h-3 focus:outline-none border border-primary_700"
          >
            <option selected>Sélectionnez une région</option>
            <option value="WA">Wallonie</option>
            <option value="FL">Flandres</option>
            <option value="BR">Bruxelles</option>
          </select>
        </div>
        <div>
          <label
            for="date-range"
            class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
            >Arrivée - Départ</label
          >
          <Datepicker
            v-model="date"
            :range="{ partialRange: false }"
            :enable-time-picker="false"
            input-class-name="dp-custom-input dp-custom-calendar"
            hide-input-icon
          />
        </div>
        <div>
          <label
            for="voyageurs"
            class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
            >Voyageurs</label
          ><input
            type="number"
            class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700"
          />
        </div>
        <button
          class="block font-ubuntu text-base font-semibold text-primary_200 bg-primary_700 py-3 rounded-lg min-w-full tracking-wide transition hover:bg-primary_500 lg:min-w-fit lg:px-4"
        >
          Rechercher
        </button>
      </div>
    </form>
  </div>
</template>

<script setup>
import { ref } from "vue";
import Datepicker from "@vuepic/vue-datepicker";
import "@vuepic/vue-datepicker/dist/main.css";

const date = ref();
</script>

<style>
.dp-custom-input {
  border: 1px solid #51746f;
  border-radius: 0.5rem;
  padding: 0.75rem 1rem;
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
</style>
