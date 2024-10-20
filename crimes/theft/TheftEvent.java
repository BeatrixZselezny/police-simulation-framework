
  package crimes.theft;

  import io.reactivex.rxjava3.core.Observable;
  import io.reactivex.rxjava3.schedulers.Schedulers;

  public class TheftEvent {
     public void reportTheft() {
        Observable<String> theftReported = Observable.create(emitter -> {
	   emitter.onNext("Theft reported.");
	   emitter.onComplete();
	});

	theftReported
		.subscribeOn(Schedulers.io())
		.observeOn(Schedulers.single())
		.subscribe(
		   event -> System.out.println("Police notified: " + event),
		   Throwable::printStackTrace,
		   () -> System.out.println("Theft event completed")
		   );
     }
  }
