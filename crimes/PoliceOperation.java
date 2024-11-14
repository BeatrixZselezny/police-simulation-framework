
  package crimes;

  import io.reactivex.rxjava3.core.Observable;
  import io.reactivex.rxjava3.schedulers.Schedulers;

  public class PoliceOperation {
     public static void main(String[] args) {
        System.out.println("Police operation preparation...");
	
	// Bevetési terület körülzárása
	Observable<String> operationSetup = Observable.create(emitter -> {
	   System.out.println("Rendőrök körülveszik a területet...");
	   try {
	      Thread.sleep(2000); // szimuláljuk az előkészületeket
	   } catch (InterruptedException e) {
	      e.printStackTrace();
	   }
	   System.out.println("Terület körülzárva.");
	   emitter.onNext("Terület körülzárva");
	   emitter.onComplete();
	});

	operationSetup
		.subscribeOn(Schedulers.io())
		.observeOn(Schedulers.single())
		.subscribe(
			status -> System.out.println("Status: " + status),
		        Throwable::printStackTrace,
		        () -> System.out.println("Police operation setup completes.")	
		);
	System.out.println("PoliceOperation execution finished.");
     }
  }
