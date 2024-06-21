import { ref } from "vue";
import { userStore } from "../stores/userStore";
import { redirectStore } from "../stores/redirectStore";

const useCommentActions = () => {
  const publish = async (cabinId, form, comments) => {
    try {
      const response = await fetch(`/api/cabins/${cabinId}/comments`, {
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
          authorization: `Bearer ${userStore.user.jwt}`,
        },
        method: "POST",
        body: JSON.stringify(form),
      });

      if (response.status === 200) {
        form.text = "";
        const comment = await response.json();
        // Peut-être à adapter selon comment vous utilisez props.cabin.comments
        comments.unshift(comment);
        console.log("Merci pour votre commentaire !");
      } else {
        console.error("Erreur lors de la publication du commentaire");
      }
    } catch (error) {
      console.error("Erreur lors de la publication du commentaire :", error);
    }
  };

  const redirect = () => {
    redirectStore.setUrl(router.currentRoute.value);
    router.push({ name: "Login" });
  };

  return {
    publish,
    redirect,
  };
};

export { useCommentActions };
