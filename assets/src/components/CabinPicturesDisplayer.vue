<template>
  <section>
    <!-- Mobile -->
    <div
      class="relative min-w-screen mb-6 overflow-hidden rounded-xl md:hidden"
    >
      <figure>
        <img
          v-if="pictures"
          :src="pictures.at(imageIndex)"
          alt=""
          class="object-cover rounded-xl"
        />
      </figure>
      <button
        class="btn-slide-lateral"
        @click.prevent="slideRight(pictures)"
        aria-label="Next Image"
      >
        <img src="../assets/arrow-right.svg" alt="" />
      </button>
      <button
        class="btn-slide-lateral"
        @click.prevent="slideLeft(pictures)"
        aria-label="Previous Image"
      >
        <img src="../assets/arrow-left.svg" alt="" />
      </button>
    </div>

    <!-- Desktop -->
    <div
      class="hidden md:rounded-xl md:grid md:grid-cols-4 md:grid-rows-2 md:gap-2 md:max-h-[400px] mb-6"
    >
      <figure
        v-for="(picture, index) in pictures"
        :key="index"
        :class="getClass(index, pictures)"
      >
        <img
          :src="picture"
          alt=""
          class="w-full h-full object-cover rounded-xl"
        />
      </figure>
    </div>
  </section>
</template>

<script setup>
import { defineProps } from "vue";
import { useSlide } from "../composables/useSlide";

const props = defineProps({
  pictures: Array,
});

const { imageIndex, slideRight, slideLeft } = useSlide(props.pictures);

const getClass = (index) => {
  if (index === 0) {
    return `md:col-span-2 md:row-span-2 md:rounded-l-xl`;
  }

  if (index === 2) {
    return `md:rounded-tr-xl`;
  }

  if (index === 4) {
    return `md:rounded-br-xl`;
  }
};
</script>

<style scoped></style>
