<template>
  <form
    @submit.prevent="submit"
    novalidate
    class="bg-primary_200 px-6 py-8 min-w-[21.4375rem] rounded-xl shadow-lg grid grid-cols-1 gap-5 lg:grid-cols-4 lg:items-end lg:justify-between lg:min-w-[65rem] lg:px-8 lg:pt-6"
  >
    <div class="select-wrapper">
      <label for="areas" class="txt-label">Région</label>
      <select
        v-model="form.area"
        id="areas"
        aria-label="Sélectionnez une région"
        class="block w-full py-3 px-4 rounded-lg border border-primary_700 focus:outline-none focus:border-primary_500"
      >
        <option disabled value="">Sélectionnez une région</option>
        <option value="Wallonie">Wallonie</option>
        <option value="Flandres">Flandres</option>
        <option value="Bruxelles">Bruxelles</option>
      </select>
    </div>
    <div class="relative">
      <label for="date-range" class="txt-label">Arrivée - Départ</label>
      <Datepicker
        v-model="form.date"
        :range="{ partialRange: false }"
        :enable-time-picker="false"
        :min-date="new Date()"
        input-class-name="dp-custom-input dp-custom-calendar"
        hide-input-icon
        placeholder="JJ/MM/AAAA - JJ/MM/AAAA"
      />
      <p v-if="dateError" id="date-error" class="txt-error" role="alert">
        {{ dateError }}
      </p>
    </div>
    <div class="relative">
      <label for="voyageurs" class="txt-label">Voyageurs</label>
      <input
        v-model="form.travellers"
        type="number"
        min="1"
        step="1"
        id="voyageurs"
        aria-describedby="travellers-error"
        class="input"
        placeholder="Nombre de voyageurs"
      />
      <p
        v-if="travellersError"
        id="travellers-error"
        class="txt-error"
        role="alert"
      >
        {{ travellersError }}
      </p>
    </div>
    <button
      type="submit"
      class="btn-primary lg:col-span-1 lg:ml-auto lg:mt-0 col-span-full"
    >
      Rechercher
    </button>
  </form>
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

const validateTravellers = () => {
  if (form.value.travellers === null) {
    travellersError.value = "Veuillez entrer le nombre de voyageurs.";
    return false;
  }
  if (form.value.travellers <= 0) {
    travellersError.value = "Veuillez entrer un nombre positif.";
    return false;
  }
  if (!Number.isInteger(form.value.travellers)) {
    travellersError.value = "Veuillez entrer un nombre entier.";
    return false;
  }
  travellersError.value = "";
  return true;
};

const validateForm = () => {
  let isValid = true;

  if (!form.value.date) {
    dateError.value = "Veuillez entrer les dates de votre séjour.";
    isValid = false;
  } else {
    dateError.value = "";
  }

  if (!validateTravellers()) {
    isValid = false;
  }

  return isValid;
};

const submit = () => {
  if (validateForm()) {
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
  outline: none;
}

.dp__input_focus:hover {
  border: solid 1px #87c1b9;
  outline: none;
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

.select-wrapper {
  position: relative;
  display: inline-block;
  width: 100%;
}

.select-wrapper select {
  appearance: none; /* Supprime l'apparence par défaut */
  -webkit-appearance: none; /* Pour Safari */
  -moz-appearance: none; /* Pour Firefox */
  padding-right: 2.5rem; /* Ajoute un espace pour la flèche */
  background-image: url("/images/arrow_drop_down.svg");
  background-repeat: no-repeat;
  background-position: right 0.5rem center; /* Positionne la flèche à droite et centrée verticalement */
  background-size: 1.5rem; /* Ajuste la taille de l'image de la flèche */
}
</style>
