const useFormatDateRange = (startValue, endValue) => {
  const months = [
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

  const start = new Date(startValue);
  const end = new Date(endValue);

  const startDay = start.getDate();
  const startMonth = start.getMonth();
  const endDay = end.getDate();
  const endMonth = end.getMonth();

  if (startMonth === endMonth) {
    return `du ${startDay} au ${endDay} ${months[startMonth]}`;
  } else {
    return `du ${startDay} ${months[startMonth]} au ${endDay} ${months[endMonth]}`;
  }
};

export { useFormatDateRange };
