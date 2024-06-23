<template>
  <form
    @submit.prevent="submit"
    novalidate
    class="bg-primary_200 rounded-xl shadow-lg py-10 px-8 grid grid-cols-1 gap-4 min-w-[21.4375rem] md:min-w-[48rem] md:grid-cols-2 mt-10 mb-10 md:m-0 md:gap-y-6"
  >
    <div class="relative">
      <label for="lastname" class="txt-label">Nom</label>
      <input
        id="lastname"
        type="text"
        class="input"
        v-model="form.lastname"
        placeholder="Ex: Dupont"
        aria-describedby="lastnameError"
      />
      <p v-if="lastnameError" id="lastnameError" class="txt-error" role="alert">
        {{ lastnameError }}
      </p>
    </div>
    <div class="relative">
      <label for="firstname" class="txt-label">Prénom</label>
      <input
        id="firstname"
        type="text"
        class="input"
        v-model="form.firstname"
        placeholder="Ex: Marie"
        aria-describedby="firstnameError"
      />
      <p
        v-if="firstnameError"
        id="firstnameError"
        class="txt-error"
        role="alert"
      >
        {{ firstnameError }}
      </p>
    </div>
    <div class="md:col-span-2 relative">
      <label for="email" class="txt-label">E-mail</label>
      <input
        type="email"
        id="email"
        class="input"
        v-model="form.email"
        placeholder="exemple@domaine.com"
        aria-describedby="emailError"
      />
      <p v-if="emailError" id="emailError" class="txt-error" role="alert">
        {{ emailError }}
      </p>
    </div>
    <div class="relative">
      <label for="password" class="txt-label">Mot de passe</label>
      <input
        type="password"
        id="password"
        class="input"
        v-model="form.password"
        placeholder="Entrez un mot de passe sécurisé"
        aria-describedby="passwordError"
      />
      <p v-if="passwordError" id="passwordError" class="txt-error" role="alert">
        {{ passwordError }}
      </p>
    </div>
    <div class="relative">
      <label for="passwordconfirmation" class="txt-label"
        >Confirmer votre mot de passe</label
      >
      <input
        type="password"
        id="passwordconfirmation"
        class="input"
        v-model="form.password_confirmation"
        placeholder="Répétez le mot de passe"
        aria-describedby="passwordconfirmationError"
      />
      <p
        v-if="passwordconfirmationError"
        id="passwordconfirmationError"
        class="txt-error"
        role="alert"
      >
        {{ passwordconfirmationError }}
      </p>
    </div>
    <button
      type="submit"
      class="btn-primary mt-4 min-w-full lg:px-4 md:col-start-2 md:mt-2 md place-self-end md:max-w-fit"
    >
      S'inscrire
    </button>
  </form>
</template>

<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";

const router = useRouter();

const form = ref({
  lastname: "",
  firstname: "",
  email: "",
  password: "",
  passwordconfirmation: "",
});

const lastnameError = ref("");
const firstnameError = ref("");
const emailError = ref("");
const passwordError = ref("");
const passwordconfirmationError = ref("");

const handleBackendErrors = (responseData) => {
  if (responseData.password) {
    passwordError.value = responseData.password[0];
  }
  if (responseData.email) {
    emailError.value = responseData.email[0];
  }
  if (responseData.lastname) {
    lastnameError.value = responseData.lastname[0];
  }
  if (responseData.firstname) {
    firstnameError.value = responseData.firstname[0];
  }
  if (responseData.password_confirmation) {
    passwordconfirmationError.value = responseData.password_confirmation[0];
  }
};

const submit = async () => {
  lastnameError.value = "";
  firstnameError.value = "";
  emailError.value = "";
  passwordError.value = "";
  passwordconfirmationError.value = "";

  const response = await fetch(`/api/users`, {
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
    method: "POST",
    body: JSON.stringify(form.value),
  });

  const responseData = await response.json();

  if (response.status === 200) {
    router.push({ name: "Login", query: form.value });
  } else {
    handleBackendErrors(responseData);
  }
};
</script>

<style scoped></style>
