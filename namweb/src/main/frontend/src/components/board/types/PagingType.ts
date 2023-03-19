export type PagingType = {
  currentPageNo: number;
  startPageOfPageGroup : number;
  endPageOfPageGroup: number;
  nowPageGroupNo: number;
  totalPage: number;
  totalPageGroup: number;
  nextPageGroup: boolean;
  previousPageGroup: boolean;
};
