<template>
  <article
    class="bg-primary_200 drop-shadow py-10 px-8 grid grid-cols-1 gap-y-6 min-w-[20rem]"
  >
    <section>
      <div class="flex items-start gap-4">
        <img
          loading="lazy"
          v-if="cabin.images"
          :src="cabin.images[0]"
          alt="Image de la cabane"
          class="w-20 h-20 bg-primary_700 rounded-xl object-cover"
        />
        <div>
          <h2 class="txt-h2">{{ cabin.name }}</h2>
          <p class="txt-body">
            <strong class="txt-body-strong">{{ cabin.price }} € </strong>par
            nuit
          </p>
        </div>
      </div>
      <hr class="mt-6 text-primary_300 border-1" />
    </section>

    <section>
      <h2 class="txt-h2 text-primary_800 mb-4">Détail du prix</h2>
      <div class="flex flex-col gap-2">
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
        <hr class="my-3 text-primary_800 border-1" />
        <div class="flex justify-between">
          <p class="txt-body-strong">Total</p>
          <p class="txt-body-strong">{{ totalWithTax.toFixed(1) }} €</p>
        </div>
      </div>
    </section>
  </article>
</template>

<script setup>
import { ref, watch } from "vue";
import {
  useNumberOfNights,
  useTotalPrice,
  useTaxAmount,
  useTotalWithTax,
} from "../composables/useBookingPrice";

const props = defineProps({
  query: Object,
  cabin: Object,
});

const pricePerNight = ref(props.cabin.price);
const numberOfNights = ref(0);
const totalPrice = ref(0);
const taxAmount = ref(0);
const totalWithTax = ref(0);

watch(
  () => props.cabin,
  () => {
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
