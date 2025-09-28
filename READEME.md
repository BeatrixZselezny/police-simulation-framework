# police-simulation-framework – Infrastruktúraszimuláció rendvédelmi célokra

Ez a repository egy fejlesztői szintű szimulációs keretrendszert dokumentál, amely Java 21 és PostgreSQL alapokon épül.  
A célja nem szórakoztatás vagy játék, hanem rendvédelmi infrastruktúra modellezése.  
A rendszer eljárási logikát, ügynökviselkedést és fenyegetési szcenáriókat szimulál kontrollált környezetben.

## 🎯 Célkitűzés

- Rendvédelmi munkafolyamatok és eljárási logika modellezése
- Fenyegetési szcenáriók szimulálása infrastruktúra-teszteléshez
- Reprodukálható háttérrendszer biztosítása ügynökalapú szimulációkhoz
- CI/CD validáció támogatása GitHub Actions segítségével
 
Ez egy technikai keretrendszer olyan fejlesztők számára, akik biztonságos szimulációs logikán dolgoznak.


## ⚙️ Technikai jellemzők

- Java 21 moduláris architektúrával
- PostgreSQL relációs adatbázis
- GitHub Actions CI validációhoz
- CLI-alapú szimulációs logika (nincs grafikus felület)

## 🧠 SEL – Social Engineering Library

Ez a modul támadói viselkedést és befolyásolt fenyegetéseket szimulál rendvédelmi szcenáriókhoz.  
A SEL modellezései:

- Drog hatása alatt álló viselkedés
- Késes támadók
- Manipulált vagy instabil ügynökök
- Eszkalációs minták és válaszlogika

A SEL nem nyilvános tréningre vagy vizualizációra készült, hanem infrastruktúraszintű szimulációra.

## 🧠 Valós inspiráció

A szimulációs keretrendszert egy valós eset inspirálta, amelyben két fiatal rendőr került támadás alá:  
egy drogos elkövető megkéselte az egyiküket, miközben macskanyávogást utánozva vonta el a figyelmüket.  
A másik rendőr a támadót lelőtte, és később részletesen beszámolt a pszichológiai manipulációról.

Az ilyen kiszámíthatatlan, befolyásolt viselkedésmodellek pontosan azok, amelyeket a SEL modul biztonságosan, reprodukálhatóan és kockázatmentesen szimulálni kíván.  
A cél a kritikus helyzetekre valófelkészítés.

## 📚 Fejlesztői kontextus

Minden logika dokumentált a reprodukálhatóság és auditálhatóság érdekében.  
Nincsenek assetek, renderelés vagy játékengine integrációk.  
Olyan fejlesztőknek készült, akik biztonságos rendszereket és eljárási logikát modelleznek.

## 📖 Licenc

Kizárólag nem kereskedelmi célú felhasználásra.  
Forkolás és tanulmányozás engedélyezett forrásmegjelöléssel.  
Újracsomagolás vagy terjesztés tilos.

## 🔗 Kapcsolódó projektek

- [Patchy Core](https://github.com/BeatrixZselezny/patchy-core) – DNS-agnosztikus init engine biztonságos Linux szolgáltatásokhoz  
- [SQL Memoirs – Mentor Edition](https://github.com/BeatrixZselezny/sql-memoirs-mentor-edition) – Fejlesztői szintű SQL dokumentáció W3C vizsgaelőkészítéshez
