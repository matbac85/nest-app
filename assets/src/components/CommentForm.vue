<template>
  <form class="mb-6" novalidate>
    <div
      class="py-2 px-4 mb-4 rounded-lg rounded-t-lg border border-disabled_200 bg-primary_100"
    >
      <label for="comment" class="sr-only">Your comment</label>
      <textarea
        v-model="form.comment"
        id="comment"
        rows="6"
        class="px-0 w-full text-sm text-gray-900 border-0 focus:ring-0 focus:outline-none dark:text-white dark:placeholder-gray-400 dark:bg-gray-800"
        placeholder="Write a comment..."
      ></textarea>
    </div>
    <button
      @click.prevent="publish"
      class="transition ease-in-out delay-150 block text-base font-semibold text-primary_200 bg-primary_700 py-3 px-4 rounded-lg min-w-fit tracking-wide xl:text-xl hover:bg-primary_500 hover:scale-105 duration-300 ml-auto disabled:bg-disabled_200 disabled:text-disabled_400 mb-4"
      :disabled="!isUserLoggedIn"
    >
      Publier
    </button>
    <button
      v-if="!isUserLoggedIn"
      @click="redirect"
      class="text-primary_700 mt-2 tracking-wide underline text-end text-sm hover:text-primary_500"
    >
      Connectez-vous pour confirmer votre réservation.
    </button>
  </form>
</template>

<script setup>
import { computed, ref } from "vue";
import { userStore } from "../stores/userStore";
import { redirectStore } from "../stores/redirectStore";

const props = defineProps({
  id: Number,
});

const form = ref({
  comment: "",
});

const isUserLoggedIn = computed(() => !!userStore.user);

const publish = async () => {
  const response = await fetch(`/api/cabins/${cabin}/`, {
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
      authorization: `Bearer ${userStore.user.jwt}`,
    },
    method: "POST",
    body: JSON.stringify(form),
  });
  if (response.status === 200) {
    console.log("merci pour ton commentaire, marraine!");
  } else {
    console.log(`réservation ratée, marraine!!${form.comment}`);
  }
};

const redirect = () => {
  redirectStore.setUrl(router.currentRoute.value);
  router.push({
    name: "Login",
  });
};
</script>

<style lang="scss" scoped></style>
