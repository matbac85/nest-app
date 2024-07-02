<template>
  <div
    v-if="visible"
    class="fixed inset-0 flex items-center justify-center bg-primary_800 bg-opacity-50 z-50 p-4 md:p-8"
  >
    <div
      class="bg-primary_200 px-6 py-8 rounded-xl text-center flex flex-col items-center justify-center md:max-w-[30rem]"
    >
      <p>
        Cette application a été développée à des fins éducatives. Pour accéder à
        toutes ses fonctionnalités, veuillez utiliser un email et un mot de
        passe fictifs. Aucune politique de confidentialité n'est en place et les
        données saisies ne seront pas utilisées.
      </p>
      <button @click="closeModal" class="btn-primary mt-8">OK</button>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";

const visible = ref(true);

const closeModal = () => {
  visible.value = false;
  localStorage.setItem("modalAccepted", "true");
};

onMounted(() => {
  if (localStorage.getItem("modalAccepted")) {
    visible.value = false;
  }
});
</script>

<style scoped></style>
