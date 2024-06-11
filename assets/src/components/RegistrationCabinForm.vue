<template>
  <div>
    <form
      @submit.prevent="submit"
      novalidate
      class="bg-primary_200 rounded-xl drop-shadow grid grid-cols-1 gap-4 px-6 py-8 min-w-[21.4375rem] md:min-w-[48rem] md:grid-cols-2 mt-10 mb-10 md:m-0 md:gap-y-6"
    >
      <div class="md:col-span-2 relative">
        <label
          for="cabinname"
          class="block text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Nom de la cabane</label
        ><input
          id="cabinname"
          type="text"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500 placeholder:text-primary_400"
          placeholder="Gîte La Petite Ardennaise"
        />
        <p
          v-if="cabinnameError"
          class="text-accent text-xs italic font-thin text-end px-2 absolute right-0 pt-1"
        >
          {{ cabinnameError }}
        </p>
      </div>
      <div class="relative">
        <label
          for="city"
          class="block text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Localité</label
        ><input
          id="city"
          type="text"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500 placeholder:text-primary_400"
          placeholder="Durbuy"
        />
        <p
          v-if="cityError"
          class="text-accent text-xs italic font-thin text-end px-2 absolute right-0 pt-1"
        >
          {{ cityError }}
        </p>
      </div>
      <div class="relative">
        <label
          for="area"
          class="block text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide md:col-span-2"
          >Région</label
        ><input
          type="text"
          name=""
          id="area"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500 placeholder:text-primary_400"
          placeholder="Wallonie"
        />
        <p
          v-if="areaError"
          class="text-accent text-xs italic font-thin text-end px-2 absolute right-0 pt-1"
        >
          {{ areaError }}
        </p>
      </div>
      <div class="relative">
        <label
          for="travellers"
          class="block text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Nombre de voyageurs</label
        ><input
          type="number"
          name=""
          id="travellers"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500 placeholder:text-primary_400"
          placeholder="6"
        />
        <p
          v-if="travellersError"
          class="text-accent text-xs italic font-thin text-end px-2 absolute right-0 pt-1"
        >
          {{ travellersError }}
        </p>
      </div>
      <div class="relative">
        <label
          for="price"
          class="block text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Prix par nuit</label
        ><input
          type="number"
          name=""
          id="price"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500 placeholder:text-primary_400"
          placeholder="80"
        />
        <p
          v-if="priceError"
          class="text-accent text-xs italic font-thin text-end px-2 absolute right-0 pt-1"
        >
          {{ priceError }}
        </p>
      </div>
      <button
        class="transition ease-in-out delay-150 block text-base font-semibold text-primary_200 bg-primary_700 py-3 rounded-lg min-w-full tracking-wide hover:bg-primary_500 mt-4 hover:scale-105 duration-300 lg:px-4 md:col-start-2 md:mt-0"
      >
        Enregistrer
      </button>
    </form>
  </div>
</template>

<script setup>
import { ref } from "vue";

const form = ref({
  cabinname: "",
  city: "",
  area: "",
  travellers: "",
  price: "",
});

const cabinnameError = ref("");
const cityError = ref("");
const areaError = ref("");
const travellersError = ref("");
const priceError = ref("");

const submit = async () => {
  cabinnameError.value = "";
  cityError.value = "";
  areaError.value = "";
  travellersError.value = "";
  priceError.value = "";

  if (!form.value.cabinname) {
    cabinnameError.value = "Veuillez entrer le nom de la cabane.";
  }
  if (!form.value.city) {
    cityError.value = "Veuillez entrer le nom de la localité.";
  }
  if (!form.value.area) {
    areaError.value = "Veuillez entrer le nom de la région.";
  }
  if (!form.value.travellers) {
    travellersError.value = "Veuillez entrer le nombre de voyageurs.";
  }
  if (!form.value.price) {
    priceError.value = "Veuillez entrer le prix par nuit.";
  }

  if (
    !form.value.cabinname ||
    !form.value.city ||
    !form.value.area ||
    !form.value.travellers ||
    !form.value.price
  ) {
    return;
  }
};
</script>

<style lang="scss" scoped></style>
