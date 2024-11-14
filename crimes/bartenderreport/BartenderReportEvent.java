
  package crimes.bartenderreport;

  import victims.Victim;
  import io.reactivex.rxjava3.core.Observable;
  import io.reactivex.rxjava3.schedulers.Schedulers;

  public class BartenderReportEvent {
     public void reportToPolice(Victim victim) {
        Observable<String> reportObservable = Observable.create(emitter -> {
	   emitter.onNext("Bartender reported suspicious activity involving " + victim.getName());
	   emitter.onComplete();

	});

	 reportObservable
		 .subscribeOn(Schedulers.io())
		 .observeOn(Schedulers.single())
		 .subscribe(
		     event -> System.out.println(event),
	             Throwable::printStackTrace,
                     () -> System.out.println("Bartender report completed")		     
		  );	       
		   

     }
  }
