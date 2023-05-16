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
 * 
 * @param date 
 * @param selectedDate 
 * @param classes 
 * @param when 
 * @returns 
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

/**
 *
 * @param date
 * @returns
 */
export const isSelectedChecker = (
  date: Date,
  isOneDay: boolean,
  selectedDate: Date,
  selectedDateArray: Date[],
  classes: CSSModuleClasses
) => {
  if (
    isOneDay &&
    date.getDate() === selectedDate.getDate() &&
    date.getMonth() === selectedDate.getMonth()
  ) {
    return classes.selectedDate;
  }
  if (!isOneDay) {
    for (let tmp of selectedDateArray) {
      if (
        date.getDate() === tmp.getDate() &&
        date.getMonth() === tmp.getMonth()
      ) {
        return classes.selectedDate;
      }
    }
  }
  return "";
};

/**
 *
 * @param num
 * @param isOneDay
 * @param selectedDate
 * @param selectedDateArray
 * @returns
 */
export const plusOrMinusMonth = (
  num: number,
  isOneDay: boolean,
  selectedDate: Date,
  selectedDateArray: Date[],
  setSelectedDate: (value: React.SetStateAction<Date>) => void,
  setSelectedDateArray: (value: React.SetStateAction<Date[]>) => void,
  setDayPick: (value: React.SetStateAction<string>) => void
) => {
  if (isOneDay) {
    let selectedFirstDate = new Date(selectedDate);
    selectedFirstDate.setMonth(selectedFirstDate.getMonth() + num);
    selectedFirstDate.setDate(1);
    setSelectedDate(selectedFirstDate);
  } else {
    let selectedFirstDate = new Date(selectedDateArray[0]);
    selectedFirstDate.setMonth(selectedFirstDate.getMonth() + num);
    selectedFirstDate.setDate(1);
    const tmpArray = [selectedFirstDate];
    setSelectedDateArray(tmpArray);
    setDayPick("one");
  }
};
