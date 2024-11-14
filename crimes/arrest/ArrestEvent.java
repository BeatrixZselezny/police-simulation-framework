  package crimes.arrest;

  import io.reactivex.rxjava3.core.Observable;
  import io.reactivex.rxjava3.schedulers.Schedulers;

  public class ArrestEvent {
     public void arrestHumanTrafficker(String traffickerName) {
        Observable<String> arrestObservable = Observable.create(emitter -> {
	   emitter.onNext("Police are arresting " + traffickerName + " for human trafficking.");
	   emitter.onComplete();
	   
       });
          
           arrestObservable
		   .subscribeOn(Schedulers.io())
		   .observeOn(Schedulers.single())
		   .subscribe(
                       event -> System.out.println(event),				   
		       Throwable::printStackTrace,
		       () -> System.out.println("Arrest operation completed")
	            );

     }

}
