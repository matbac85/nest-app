<template>
  <form class="mb-6" novalidate @submit.prevent="submitForm">
    <div
      class="py-2 px-4 mb-4 rounded-lg rounded-t-lg border border-disabled_200 bg-primary_100"
    >
      <label for="comment" class="sr-only">Your comment</label>
      <textarea
        v-model="form.text"
        id="comment"
        rows="6"
        class="px-0 w-full text-sm text-gray-900 border-0 focus:ring-0 focus:outline-none dark:text-white dark:placeholder-gray-400 dark:bg-gray-800"
        placeholder="Write a comment..."
      ></textarea>
    </div>
    <button
      type="submit"
      class="transition ease-in-out delay-150 block text-base font-semibold text-primary_200 bg-primary_700 py-3 px-4 rounded-lg min-w-fit tracking-wide xl:text-xl hover:bg-primary_500 hover:scale-105 duration-300 ml-auto disabled:bg-disabled_200 disabled:text-disabled_400 mb-4"
      :disabled="!isUserLoggedIn"
    >
      Publier
    </button>
    <button
      v-if="!isUserLoggedIn"
      @click="redirectToLogin"
      class="text-primary_700 mt-2 tracking-wide underline text-end text-sm hover:text-primary_500"
    >
      Connectez-vous pour confirmer votre réservation.
    </button>
  </form>
</template>

<script setup>
import { ref, defineProps, computed } from "vue";
import { useCommentActions } from "../composables/useCommentActions";
import { userStore } from "../stores/userStore";

const props = defineProps({
  cabin: Object,
});

const form = ref({
  text: "",
});

const { publish, redirect } = useCommentActions();

const isUserLoggedIn = computed(() => !!userStore.user);

const submitForm = async () => {
  await publish(props.cabin.id, form.value);
};

const redirectToLogin = () => {
  redirect();
};
</script>

<style lang="scss" scoped></style>
