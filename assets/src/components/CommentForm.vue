<template>
  <form
    class="mt-10 md:flex md:flex-col md:justify-end md:items-end"
    novalidate
    @submit.prevent="submitForm"
  >
    <div
      class="py-2 px-4 mb-4 w-full rounded-xl border border-disabled_200 bg-primary_200"
    >
      <label for="comment" class="sr-only">Votre commentaire</label>
      <textarea
        v-model="form.text"
        id="comment"
        rows="4"
        class="py-2 w-full border-0 focus:ring-0 focus:outline-none txt-body bg-primary_200"
        placeholder="Ecrivez un commentaire..."
      ></textarea>
    </div>
    <button
      type="submit"
      class="btn-primary text-center ml-auto md:w-fit"
      :disabled="!isUserLoggedIn"
    >
      Publier
    </button>
    <button
      v-if="!isUserLoggedIn"
      @click="redirectToLogin"
      class="txt-body-strong text-primary_700 mt-2 tracking-wide underline hover:text-primary_500"
    >
      Connectez-vous pour écrire un commentaire.
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
  await publish(props.cabin.id, form.value, props.cabin.comments);
};

const redirectToLogin = () => {
  redirect();
};
</script>

<style lang="scss" scoped></style>
