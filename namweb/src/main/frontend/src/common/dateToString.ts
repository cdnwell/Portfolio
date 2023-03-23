const dateToString = (dateArg: string) => {
  const dateTmp = new Date(dateArg);
  const today = new Date();
  let dateResult = "";

  if (
    today.getFullYear() === dateTmp.getFullYear() &&
    today.getMonth() === dateTmp.getMonth() &&
    today.getDate() === dateTmp.getDate()
  ) {
    dateResult = dateTmp.getHours() + " : " + dateTmp.getMinutes();
    return dateResult;
  }

  dateResult =
    dateTmp.getFullYear() + "-" + dateTmp.getMonth() + "-" + dateTmp.getDate();
  return dateResult;
};

export default dateToString;