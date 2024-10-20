
  package crimes.drugdealing;

  import io.reactivex.rxjava3.core.Observable;
  import io.reactivex.rxjava3.schedulers.Schedulers;

  public class DrugDealingEvent {
     public void reportDrugDealing() {
        Observable<String> drugDealingReported = Observable.create(emitter -> {
			emitter.onNext("Drug dealing reported");
			emitter.onComplete();
            	    });

	drugDealingReported
		.subscribeOn(Schedulers.io())
		.observeOn(Schedulers.single())
		.subscribe(
		   event -> System.out.println("Police notified: " + event),
                   Throwable::printStackTrace,
                   () -> System.out.println("Drug dealing event completed")	
	           );
     }
  }
