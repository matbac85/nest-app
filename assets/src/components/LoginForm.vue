<template>
  <form
    @submit.prevent="submit"
    novalidate
    class="bg-primary_200 rounded-xl w-full shadow-lg py-10 px-8 max-w-[22rem]"
  >
    <div class="mb-4 relative">
      <label for="email" class="txt-label">E-mail</label>
      <input
        id="email"
        type="email"
        v-model="form.email"
        placeholder="exemple@domaine.com"
        class="input"
        required
      />
    </div>
    <div class="mb-8 relative">
      <label for="password" class="txt-label">Mot de passe</label>
      <input
        id="password"
        type="password"
        v-model="form.password"
        placeholder="Entrez votre mot de passe"
        class="input"
        required
      />
      <p v-if="globalError" class="txt-error">
        {{ globalError }}
      </p>
    </div>
    <button type="submit" class="btn-primary">Se connecter</button>
    <router-link
      to="/register"
      class="txt-body-strong block text-center mx-auto text-primary_700 mt-3 tracking-wide underline hover:text-primary_500"
    >
      Pas de compte ? Inscrivez-vous !
    </router-link>
  </form>
</template>

<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";
import { userStore } from "../stores/userStore";
import { redirectStore } from "../stores/redirectStore";

const router = useRouter();

const form = ref({
  email: "",
  password: "",
});

const globalError = ref("");

const handleBackendErrors = (responseData) => {
  if (responseData.error) {
    globalError.value = responseData.error;
  }
};

const submit = async () => {
  globalError.value = "";

  const response = await fetch(`/api/sessions`, {
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
    method: "POST",
    body: JSON.stringify(form.value),
  });

  const responseData = await response.json();

  if (response.status === 200) {
    const user = responseData;
    userStore.setUser(user);
    localStorage.setItem("user", JSON.stringify(user));
    if (redirectStore.url !== null) {
      router.push(redirectStore.url);
    } else {
      router.push({ name: "Home" });
    }
  } else {
    handleBackendErrors(responseData);
  }
};
</script>

<style lang="scss" scoped></style>
