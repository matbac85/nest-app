<template>
  <div>
    <form
      @submit.prevent="submit"
      novalidate
      class="bg-primary_200 rounded-xl drop-shadow grid grid-cols-1 gap-4 px-6 py-8 min-w-[21.4375rem]"
    >
      <div>
        <label
          for="email"
          class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >E-mail</label
        ><input
          type="email"
          name=""
          id="email"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500"
          v-model="form.email"
        />
      </div>
      <div>
        <label
          for="password"
          class="block font-ubuntu text-base font-medium text-primary_700 mb-1 ml-1 tracking-wide"
          >Mot de passe</label
        ><input
          type="password"
          name=""
          id="password"
          class="py-3 px-4 rounded-lg min-w-full focus:outline-none border border-primary_700 focus:border-primary_500"
          v-model="form.password"
        />
      </div>
      <button
        class="transition ease-in-out delay-150 block font-ubuntu text-base font-semibold text-primary_200 bg-primary_700 py-3 rounded-lg min-w-full tracking-wide hover:bg-primary_500 mt-2 hover:scale-105 duration-300 lg:px-4"
      >
        Se connecter
      </button>
      <routerLink
        class="block font-ubuntu text-sm font-semibold text-primary_700 mb-1 ml-1 tracking-wide underline text-center hover:text-primary_500"
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

const router = useRouter();

const form = ref({
  email: "",
  password: "",
});

const submit = async () => {
  const response = await fetch(`/api/sessions`, {
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
    method: "POST",
    body: JSON.stringify(form.value),
  });
  console.log(response.status);
  if (response.status === 200) {
    const user = await response.json();
    userStore.setUser(user);
    localStorage.setItem("user", JSON.stringify(user));
    router.push({ name: "Home" });
  } else {
    console.log(await response.json());
  }
};
</script>

<style lang="scss" scoped></style>
