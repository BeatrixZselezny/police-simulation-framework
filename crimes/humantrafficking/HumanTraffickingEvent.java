 package crimes.humantrafficking;

 import io.reactivex.rxjava3.core.Observable;
 import io.reactivex.rxjava3.schedulers.Schedulers;
 import victims.Victim;
 import victims.Anna;
 import victims.Sarah;
 import victims.Louis;
 import victims.Leslie;
 import locations.Bar;

 public class HumanTraffickingEvent {
    public void startHumanTrafficking(Bar bar) {
       Observable<Victim> victimObservable = Observable.create(emitter -> {
       Victim victim = new Anna();
       emitter.onNext(victim);
       emitter.onComplete();
       });

       victimObservable
	       .subscribeOn(Schedulers.io())
	       .observeOn(Schedulers.single())
	       .subscribe(
	           victim -> {
		      System.out.println("Alice found a victim: " + victim.getName());
		         if (Math.random() < 0.5) {
			    System.out.println(victim.getName() + " accepted the drink.");
			    victim.setTrafficked(true);
			    System.out.println("Alice successfully trafficked " + victim.getName());
			 } else {
			    System.out.println(victim.getName() + "did not accept the drink.");
		 	 }
		      },
		      Throwable::printStackTrace,
		      () -> System.out.println("Human trafficking event completed") 
                    );
               }
        }   		       

  
