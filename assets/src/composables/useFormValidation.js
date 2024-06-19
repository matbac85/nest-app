import { ref } from "vue";

const useFormValidation = () => {
  const errors = {
    email: ref(""),
    password: ref(""),
    lastname: ref(""),
    firstname: ref(""),
    passwordconfirmation: ref(""),
    globalError: ref(""),
  };

  const validateCommonFields = (form) => {
    errors.email.value = form.email
      ? ""
      : "Veuillez entrer votre adresse e-mail.";
    errors.password.value = form.password
      ? ""
      : "Veuillez entrer votre mot de passe.";
    errors.lastname.value = form.lastname
      ? ""
      : "Veuillez entrer votre nom de famille.";
    errors.firstname.value = form.firstname
      ? ""
      : "Veuillez entrer votre prénom.";
    errors.passwordconfirmation.value = form.passwordconfirmation
      ? ""
      : "Veuillez confirmer votre mot de passe.";

    if (form.password !== form.passwordconfirmation) {
      errors.passwordconfirmation.value =
        "Les mots de passe ne correspondent pas.";
    }

    return Object.values(errors).every((error) => !error.value);
  };

  return {
    errors,
    validateCommonFields,
  };
};

export default useFormValidation;
