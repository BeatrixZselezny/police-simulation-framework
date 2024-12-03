
  package crimes.drugdealing;

  import io.reactivex.rxjava3.core.Observable;
  import io.reactivex.rxjava3.schedulers.Schedulers;

  public class DrugDealingEvent {
     // Method to simulate reporting a drug dealing event
     public void reportDrugDealing() {
     // Creating an Observable to simulate the drug dealing report
        Observable<String> drugDealingReported = Observable.create(emitter -> {
			emitter.onNext("Drug dealing reported"); // Marking the Observable as complete
			emitter.onComplete();
            	    });

        // Subscribing to the Observable to perform actions on different threads
	drugDealingReported
		.subscribeOn(Schedulers.io()) // Emitting events on IO thread
		.observeOn(Schedulers.single()) // Observing events on single thread
		.subscribe(
		   event -> System.out.println("Police notified: " + event), // Handling emitted event
                   Throwable::printStackTrace,
                   () -> System.out.println("Drug dealing event completed") // Completion action
	           );
     }
  }
