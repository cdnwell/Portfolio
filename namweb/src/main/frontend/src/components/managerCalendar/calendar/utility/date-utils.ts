import CalendarStatusType from "../../type/CalendarStatusType";

/**
 * 
 * @param item : CalendarStatusType[]
 * @param cell : Date
 * @param when : string (morning, afternoon, extra 중 하나)
 * @returns boolean 값
 */
export const isWhenChecker = (
  item: CalendarStatusType[],
  cell: Date,
  when: string
) => {
  const isWhen = item.find(
    (item) =>
      item.date.getMonth() === cell.getMonth() &&
      item.date.getDate() === cell.getDate()
  );

  let isWhenProp;
  switch (when) {
    case "morning":
      isWhenProp = isWhen?.morning;
      break;
    case "afternoon":
      isWhenProp = isWhen?.afternoon;
      break;
    case "extra":
      isWhenProp = isWhen?.extra;
      break;
  }

  if (isWhen && isWhenProp) {
    return true;
  }
  return false;
};

/**
 * 일반 요일은 검정 색,
 * 휴일은 붉은 색,
 * 같은 달이 아니라면 흐리게 처리
 */
export const isNormalDayChecker = (
  date: Date,
  selectedDate: Date,
  classes: CSSModuleClasses,
  when: string
) => {
  const cmpDate = new Date(date);

  if (cmpDate.getMonth() === selectedDate.getMonth() && when === "holiday") {
    return classes.holiday;
  } else if (when === "holiday") {
    return classes.dimHoliday;
  }

  if (cmpDate.getMonth() !== selectedDate.getMonth() && when === "day")
    return classes.dimDay;
};
