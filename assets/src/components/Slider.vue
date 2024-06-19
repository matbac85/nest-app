<template>
  <div class="rounded-t-xl relative group">
    <img
      :src="src.at(imageIndex)"
      alt=""
      class="block min-w-full rounded-t-xl max-h-[218px] min-h-[218px]"
    />
    <button
      class="absolute top-4 p-1 right-2 rounded-full bg-primary_800 bg-opacity-70 w-8 h-8 hover:scale-110"
      @click.prevent="toggleFavorite"
      v-if="userStore.user"
    >
      <img
        :src="toggleImageSrc(favorite)"
        alt=""
        class="min-w-full min-h-full"
      />
    </button>
    <button
      class="absolute p-1 rounded-full bg-primary_200 items-center justify-center top-1/2 transform -translate-y-1/2 right-2 opacity-0 transition ease-in-out delay-150 hover:scale-110 hover:drop-shadow hover:bg-white group-hover:opacity-80 duration-300"
      @click.prevent="slideRight(src)"
    >
      <img src="../assets/arrow-right.svg" alt="" />
    </button>
    <button
      v-if="imageIndex != 0"
      class="absolute p-1 rounded-full bg-primary_200 items-center justify-center top-1/2 transform -translate-y-1/2 left-2 opacity-0 transition ease-in-out delay-150 hover:scale-110 hover:drop-shadow hover:bg-white group-hover:opacity-80 duration-300"
      @click.prevent="slideLeft(src)"
    >
      <img src="../assets/arrow-left.svg" alt="" />
    </button>
  </div>
</template>

<script setup>
import { defineProps } from "vue";
import useFavorite from "../composables/useFavorite";
import { useSlide } from "../composables/useSlide";
import { userStore } from "../stores/userStore";

const props = defineProps({
  id: Number,
  src: Array,
  favorite: Boolean,
});

const { imageIndex, slideRight, slideLeft } = useSlide(props.src);
const { favorite, toggleImageSrc, setFavorite } = useFavorite(props.favorite);

const toggleFavorite = () => {
  setFavorite(props.id);
};
</script>

<style scoped></style>
