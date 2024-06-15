<template>
  <div class="rounded-t-xl relative group">
    <img
      :src="src.at(imageIndex)"
      alt=""
      class="block min-w-full rounded-t-xl max-h-[218px] min-h-[218px]"
    />
    <button
      class="absolute top-4 p-1 right-2 rounded-full bg-primary_800 bg-opacity-70 w-8 h-8 hover:scale-110"
      @click.prevent="setFavorite"
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
import { ref, defineProps, computed } from "vue";
import { userStore } from "../stores/userStore";

const imageIndex = ref(0);
const favorite = ref(false);

const props = defineProps({
  src: Array,
  id: Number,
  favorite: Boolean,
});

favorite.value = props.favorite;

const toggleImageSrc = (value) => {
  return value
    ? "/src/assets/favorite-filled.svg"
    : "/src/assets/favorite-border.svg";
};

const setFavorite = async () => {
  const response = await fetch(`/api/cabins/${props.id}/favorites/toggle`, {
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
      authorization: `Bearer ${userStore.user.jwt}`,
    },
    method: "POST",
  });
  if (response.status === 200) {
    const newFavorite = await response.json();
    favorite.value = newFavorite;
    console.log(favorite);
  } else {
    console.log(`réservation ratée, marraine!!`);
  }
};

const slideRight = (src) => {
  imageIndex.value = (imageIndex.value + 1) % src.length;
};

const slideLeft = (src) => {
  imageIndex.value = (imageIndex.value - 1) % src.length;
};
</script>

<style scoped></style>
