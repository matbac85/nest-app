// tailwind.config.js
module.exports = {
  purge: ["./index.html", "./src/**/*.{vue,js,ts,jsx,tsx}"],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [require("tailwind-hamburgers")],
  theme: {
    colors: {
      primary_100: "#FFF",
      primary_200: "#F3F9F8",
      primary_300: "#DBECEA",
      primary_400: "#afbdbb",
      primary_500: "#87C1B9",
      primary_700: "#51746F",
      primary_800: "#0D1312",
      accent: "#eb6176",
      disabled_200: "#cfd0d0",
      disabled_400: "#868989",
    },
    fontFamily: {
      ubuntu: ["Ubuntu", "sans-serif"],
      dosis: ["Dosis", "sans-serif"],
    },
    screens: {
      md: "768px",
      lg: "1024px",
      xl: "1700px",
    },
  },
};
