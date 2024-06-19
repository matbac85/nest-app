const useDateFormat = (dateString) => {
  const formatMonthYear = (dateString) => {
    const date = new Date(dateString);
    const monthNames = [
      "janvier",
      "février",
      "mars",
      "avril",
      "mai",
      "juin",
      "juillet",
      "août",
      "septembre",
      "octobre",
      "novembre",
      "décembre",
    ];
    const month = monthNames[date.getUTCMonth()]; // Utiliser getUTCMonth() pour le mois en UTC
    const year = date.getUTCFullYear(); // Utiliser getUTCFullYear() pour l'année en UTC
    return `${month} ${year}`;
  };

  return formatMonthYear(dateString);
};

export { useDateFormat };
