package com.fastcampus.ch4.domain;

public class PageHandler {
     private int totalCnt; // 총 게시물의 갯수
     private int pageSize; // 한 페이지의 크기
     private int naviSize = 10; // 페이지 내비게이션의 크기
     private int totalPage; // 전체 페이지의 갯수
     private int page;      // 현재 페이지
     private int beginPage; // 내비게이션의 첫번째 페이지
     private int endPage;   // 내비게이션의 마지막 페이지
     private boolean showPrev; // 이전페이지로 이동하는 링크를 보여줄것인지 여부
     private boolean  showNext; // 다음 페이지로 이동하는 링크를 보여줄것인지 여부
     private boolean  showLast; // 마지막 페이지 이동
     private boolean  showFirst; // 마지막 페이지 이동

    public PageHandler(int totalCnt,int page){
        this(totalCnt,page,10);
    }

    public PageHandler(int totalCnt , int page , int pageSize){
        this.totalCnt = totalCnt;
        this.page = page;
        this.pageSize = pageSize;

        totalPage = (int)Math.ceil(totalCnt / (double) pageSize);
        // 왜 (double)했어 ?
        // 255/10 하게되면 25가 나옴 올림 해봤자 25
        // 255 / 10.0 = 25.5 반올림 하면 26
        beginPage = (page-1) / naviSize * naviSize +1;
        // page / naviSize * naviSize +1 하게되면
        // page가 10일때 (page)10/(naviSize)10 * (naviSize)10 +1 = beginPage 가 11이 나옴
        // page-1 하게되면 (page)(10-1)/(navi)10*(navi)10 +1 = beginPage 1 나옴

        endPage = Math.min(beginPage + naviSize -1, totalPage);
        // 삼항연산자 endPage = beginPage + navSize - 1 > totalPage ? totalPage : beginPage + navSize - 1;
        showPrev = beginPage != 1;
        showNext = endPage != totalPage;
        showLast = endPage != totalPage;
        showFirst = beginPage > 1;

    }

    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getNaviSize() {
        return naviSize;
    }

    public void setNaviSize(int naviSize) {
        this.naviSize = naviSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(int beginPage) {
        this.beginPage = beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isShowPrev() {
        return showPrev;
    }

    public void setShowPrev(boolean showPrev) {
        this.showPrev = showPrev;
    }

    public boolean isShowNext() {

        return showNext;
    }

    public void setShowNext(boolean showNext) {

        this.showNext = showNext;
    }

    public boolean isShowLast() {
        return showLast;
    }

    public void setShowLast(boolean showLast) {
        this.showLast = showLast;
    }

    public boolean isShowFirst() {
        return showFirst;
    }

    public void setShowFirst(boolean showFirst) {
        this.showFirst = showFirst;
    }

    void print(){
        System.out.println("page = " + page);

        System.out.print(showFirst ? "[First] " : "");
        System.out.print(showPrev ?"[prev] " : "");

        for (int i = beginPage; i <= endPage; i++){
            System.out.print(i+" ");
        }
        System.out.println(showNext ? "[Next]" : "" );
        System.out.print(showLast ? "[Last] " : "");
    }

    @Override
    public String toString() {
        return "PageHandler{" +
                "totalCnt=" + totalCnt +
                ", pageSize=" + pageSize +
                ", naviSize=" + naviSize +
                ", totalPage=" + totalPage +
                ", page=" + page +
                ", beginPage=" + beginPage +
                ", endPage=" + endPage +
                ", showPrev=" + showPrev +
                ", showNext=" + showNext +
                ", showFirst=" + showFirst +
                ", showLast=" + showLast +
                '}';
    }
}
