
  package crimes;

  import io.reactivex.rxjava3.core.Observable;
  import io.reactivex.rxjava3.schedulers.Schedulers;

  public class OperationConclusion {
     public static void main(String[] args) {
        System.out.println("Operation conclusion...");

	Observable<String> rescueAndInterrogation = Observable.create(emitter -> {
	   System.out.println("Áldozatok megmentése és biztonságba helyezése...");	
	   try {
	      Thread.sleep(2000);
	   } catch (InterruptedException e) {
	      e.printStackTrace();
	   }
	   System.out.println("Alice kihallgatása.");
	   emitter.onNext("Alice kihallgatva.");
	   emitter.onComplete();
	});	

	rescueAndInterrogation
		.subscribeOn(Schedulers.io())
		.observeOn(Schedulers.single())
		.subscribe(
		   status -> System.out.println("Status" + status),		
		   Throwable::printStackTrace,
		   () -> System.out.println("Operation conclusion completed.")
		);
	   System.out.println("OperationConclusion execution finished.");
     }
  }
