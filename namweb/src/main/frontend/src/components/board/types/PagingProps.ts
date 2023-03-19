import { PagingType } from "./PagingType";

export default interface PagingProps {
  paging: PagingType;
  onPageNoClick: (pageNo: number) => void;
}
