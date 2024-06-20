<template>
  <div>
    <form
      @submit.prevent="submit"
      novalidate
      class="bg-primary_200 rounded-xl drop-shadow grid grid-cols-1 gap-4 px-6 py-8 min-w-[21.4375rem]"
    >
      <div class="relative">
        <label
          for="email"
          class="block text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >E-mail</label
        ><input
          type="email"
          name=""
          id="email"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500 placeholder:text-primary_400"
          v-model="form.email"
          placeholder="exemple@email.com"
        />
      </div>
      <div class="relative">
        <label
          for="password"
          class="block text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Mot de passe</label
        ><input
          type="password"
          name=""
          id="password"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500 placeholder:text-primary_400"
          v-model="form.password"
          placeholder="MoTdEpAsSeCompliqué!"
        />
        <p
          v-if="globalError"
          class="text-accent text-xs italic font-thin text-end px-2 absolute right-0 pt-1"
        >
          {{ globalError }}
        </p>
      </div>
      <button class="btn-primary">Se connecter</button>
      <routerLink
        class="block text-sm font-semibold text-primary_700 mb-1 ml-1 tracking-wide underline text-center hover:text-primary_500"
        to="/register"
        >Pas de Compte ? Inscrivez vous !</routerLink
      >
    </form>
  </div>
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


  if (response.status === 200) {
    const user = await response.json();
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
