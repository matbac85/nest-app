const useBackendErrors = () => {
  const handleBackendErrors = (responseData, errors) => {
    if (responseData.password) {
      errors.password.value = responseData.password[0];
    }
    if (responseData.email) {
      errors.email.value = responseData.email[0];
    }
    if (responseData.lastname) {
      errors.lastname.value = responseData.lastname[0];
    }
    if (responseData.firstname) {
      errors.firstname.value = responseData.firstname[0];
    }
    if (responseData.passwordconfirmation) {
      errors.passwordconfirmation.value = responseData.passwordconfirmation[0];
    }
    if (responseData.error) {
      errors.globalError.value = responseData.error;
    }
  };

  return {
    handleBackendErrors,
  };
};

export default useBackendErrors;
