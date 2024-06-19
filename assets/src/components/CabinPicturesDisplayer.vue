<template>
  <div>
    <!-- mobile -->
    <div
      class="relative min-w-screen h-60 overflow-hidden rounded-xl md:hidden"
    >
      <img
        v-if="pictures"
        :src="pictures.at(imageIndex)"
        alt=""
        class="min-w-full min-h-full object-cover"
      />
      <button
        class="absolute p-1 rounded-full bg-primary_200 flex items-center justify-center top-1/2 transform -translate-y-1/2 right-2 opacity-80 transition ease-in-out delay-150 hover:scale-110 hover:drop-shadow hover:bg-white hover:opacity-100 duration-300"
        @click.prevent="slideRight(pictures)"
      >
        <img src="../assets/arrow-right.svg" alt="" />
      </button>
      <button
        class="absolute p-1 rounded-full bg-primary_200 flex items-center justify-center top-1/2 transform -translate-y-1/2 left-2 opacity-80 transition ease-in-out delay-150 hover:scale-110 hover:drop-shadow hover:bg-white hover:opacity-100 duration-300"
        @click.prevent="slideLeft(pictures)"
      >
        <img src="../assets/arrow-left.svg" alt="" />
      </button>
    </div>

    <!-- desktop -->

    <div
      class="hidden md:rouded-xl md:grid md:grid-cols-4 md:grid-rows-2 md:gap-2 md:max-h-[400px]"
    >
      <img
        v-for="(picture, index) in pictures"
        :key="index"
        :src="picture"
        alt=""
        :class="getClass(index, pictures)"
        class="w-full h-full object-cover"
      />
    </div>
  </div>
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
