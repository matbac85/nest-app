<template>
  <article
    class="bg-primary_200 rounded-xl drop-shadow py-10 px-8 min-w-[20rem] grid grid-cols-1 gap-y-6 lg:grid-cols-2 lg:gap-x-14 lg:p-10"
  >
    <div class="grid grid-cols-1 gap-y-6 lg:gap-y-4 lg:h-fit">
      <section id="image" class="lg:flex lg:items-center lg:h-fit">
        <h2 class="txt-title md:text-2xl text-primary_800 mb-3 lg:hidden">
          Votre séjour
        </h2>
        <div class="flex items-start gap-4 lg:flex-col">
          <img
            v-if="cabin.images"
            :src="cabin.images[0]"
            alt="Image de la cabane"
            class="w-20 h-20 bg-primary_700 rounded-xl object-cover lg:w-full lg:h-30"
          />
          <div>
            <h2 class="txt-h2">{{ cabin.name }}</h2>
            <p class="txt-body">
              <strong class="txt-body-strong">{{ cabin.price }} € </strong>par
              nuit
            </p>
          </div>
        </div>
      </section>
      <hr class="text-primary_300 border-1 lg:hidden" />
      <section class="lg:grid lg:grid-cols-1 lg:gap-y-4">
        <div>
          <p class="txt-h2 mb-1 lg:mb-0">Dates</p>
          <p class="mb-3 txt-body lg:mb-0">
            {{ useFormatDateRange(props.query.startDate, props.query.endDate) }}
          </p>
        </div>
        <div>
          <p class="txt-h2 mb-1 lg:mb-0">Nombre de voyageurs</p>
          <p v-if="props.query.travellers" class="txt-body">
            {{ props.query.travellers }}
          </p>
          <p v-if="!props.query.travellers" class="txt-body">inconnu</p>
        </div>
      </section>
    </div>
    <hr class="text-primary_300 border-1 block lg:hidden" />
    <div class="lg:flex lg:flex-col lg:justify-center">
      <section>
        <h2 class="txt-h2 mb-6">Détail du prix</h2>
        <div class="flex flex-col gap-6">
          <div class="flex justify-between">
            <p class="txt-body">
              {{ pricePerNight }} € x {{ numberOfNights }} nuits
            </p>
            <p class="txt-body">{{ totalPrice }} €</p>
          </div>
          <div class="flex justify-between">
            <p class="txt-body">Taxes</p>
            <p class="txt-body">{{ taxAmount.toFixed(1) }} €</p>
          </div>
          <hr class="text-primary_300 border-1" />
          <div class="flex justify-between">
            <p class="txt-body-strong">Total</p>
            <p class="txt-body-strong">{{ totalWithTax.toFixed(1) }} €</p>
          </div>
        </div>
        <button
          class="transition ease-in-out delay-150 block text-base font-semibold text-primary_200 bg-primary_700 py-3 rounded-lg min-w-full tracking-wide hover:bg-primary_500 mt-10 lg:mt-6 hover:scale-105 duration-300 lg:px-4 disabled:bg-disabled_200 disabled:text-disabled_400"
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
      </section>
    </div>
  </article>
</template>

<script setup>
import { userStore } from "../stores/userStore";
import { useRouter } from "vue-router";
import { computed, ref, watch } from "vue";
import { redirectStore } from "../stores/redirectStore";
import { useFormatDateRange } from "../composables/useFormatDateRange";
import {
  useNumberOfNights,
  useTotalPrice,
  useTaxAmount,
  useTotalWithTax,
} from "../composables/useBookingPrice";

const router = useRouter();

const props = defineProps({
  query: Object,
  id: Number,
  cabin: Object,
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

const isUserLoggedIn = computed(() => !!userStore.user);

const redirect = () => {
  redirectStore.setUrl(router.currentRoute.value);
  router.push({
    name: "Login",
  });
};

const pricePerNight = ref(props.cabin.price);
const numberOfNights = ref(0);
const totalPrice = ref(0);
const taxAmount = ref(0);
const totalWithTax = ref(0);

watch(
  () => props.cabin,
  () => {
    console.log(props.cabin, "CABIN");
    pricePerNight.value = props.cabin.price;
    numberOfNights.value = useNumberOfNights(
      props.query.startDate,
      props.query.endDate
    );
    totalPrice.value = useTotalPrice(numberOfNights.value, props.cabin.price);
    taxAmount.value = useTaxAmount(totalPrice.value);
    totalWithTax.value = useTotalWithTax(totalPrice.value, taxAmount.value);
  },
  { immediate: true }
);
</script>

<style lang="scss" scoped></style>
