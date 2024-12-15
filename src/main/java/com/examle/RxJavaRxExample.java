import io.reactivex.Observable;


   public class RxJavaRxExample {
      public static void main(String[] args) {
      Observable<Integer> observable = Observable.just(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);


      observable
         .map(number -> number * 2)
         .filter(number -> number > 10)
         .subscribe(System.out::println);
     }
}
