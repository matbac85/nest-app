<template>
  <div>
    <form
      @submit.prevent="submit"
      novalidate
      class="bg-primary_200 px-6 py-8 min-w-[21.4375rem] rounded-xl drop-shadow grid grid-cols-1 gap-5 lg:grid-cols-4 lg:items-end lg:justify-between lg:min-w-[65rem] lg:px-8 lg:pt-6"
    >
      <div>
        <label
          for="areas"
          class="block text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Région</label
        >
        <select
          v-model="form.area"
          id="areas"
          class="appearance-none text-base rounded-lg block py-3 px-4 min-w-full min-h-3 focus:outline-none border border-primary_700 focus:border-primary_500"
        >
          <option option value="" disabled selected>
            Sélectionnez une région
          </option>
          <option value="Wallonie">Wallonie</option>
          <option value="Flandres">Flandres</option>
          <option value="Bruxelles">Bruxelles</option>
        </select>
      </div>
      <div class="relative">
        <label
          for="date-range"
          class="block text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Arrivée - Départ</label
        >
        <Datepicker
          v-model="form.date"
          :range="{ partialRange: false }"
          :enable-time-picker="false"
          :min-date="new Date()"
          input-class-name="dp-custom-input dp-custom-calendar"
          class="placeholder:text-red-500"
          hide-input-icon
          placeholder="JJ/MM/AAAA - JJ/MM/AAAA"
        />
        <p
          v-if="dateError"
          class="text-accent text-xs italic font-thin text-end px-2 absolute right-0 pt-1"
        >
          {{ dateError }}
        </p>
      </div>
      <div class="relative">
        <label
          for="voyageurs"
          class="block text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Voyageurs</label
        ><input
          v-model="form.travellers"
          type="number"
          min="1"
          step="1"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500 placeholder:text-primary_400"
          placeholder="3"
        />
        <p
          v-if="travellersError"
          class="text-accent text-xs italic font-thin text-end px-2 absolute right-0 pt-1"
        >
          {{ travellersError }}
        </p>
      </div>

      <button
        class="block text-base font-semibold text-primary_200 bg-primary_700 py-3 rounded-lg min-w-full tracking-wide transition mt-3 hover:bg-primary_500 lg:px-4"
      >
        Rechercher
      </button>
    </form>
  </div>
</template>

<script setup>
import { ref } from "vue";
import Datepicker from "@vuepic/vue-datepicker";
import "@vuepic/vue-datepicker/dist/main.css";
import { useRouter } from "vue-router";

const router = useRouter();
const dateError = ref("");
const travellersError = ref("");

const form = ref({
  date: "",
  travellers: null,
  area: "",
});

const submit = () => {
  if (form.value.date && form.value.travellers) {
    const startDate = form.value.date[0].toISOString().split("T")[0];
    const endDate = form.value.date[1].toISOString().split("T")[0];
    router.push({
      name: "CabinList",
      query: {
        travellers: form.value.travellers,
        area: form.value.area,
        startDate: startDate,
        endDate: endDate,
      },
    });
  } else {
    dateError.value = "";
    travellersError.value = "";
    if (!form.value.date) {
      dateError.value = "Veuillez entrer les dates de votre séjour.";
    }
    if (!form.value.travellers) {
      travellersError.value = "Veuillez entrer le nombre de voyageurs.";
    }
    if (form.value.travellers < 0) {
      travellersError.value = "Veuillez entrer un nombre positif.";
    }
    if (!Number.isInteger(form.value.travellers)) {
      travellersError.value = "Veuillez entrer un nombre entier.";
    }
    if (!form.value.date || !form.value.travellers) {
      return;
    }
  }
};
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
