# Git cheat sheet (Bea-féle “gyors, de nem öngól”)

## Mentális modell (1 mondatban)
A `main` a stabil törzs; a branchek ugyanabból a történetből “leágazó” vonalak, amiket később vissza lehet mergelni a `main`-be.

---

## A 3 alap fogalom (miért kell stage/commit)
- **Working tree**: amit szerkesztesz (még nincs Git-ben “becsomagolva”).
- **Staging area (index)**: a “következő commit csomagja”.
- **Commit**: egy rögzített pillanatkép (hash-sel), amit push-olni tudsz.

---

## Gyors rutinok (válassz helyzet szerint)

---

### A) “Minden mehet” (egy téma, tiszta változás)
```bash
git status
git diff --stat
git add .
git commit -m "..."
git push
```

## “Csak a már követett fájlok” (új fájlok NE kerüljenek be)
```bash
git status
git diff --stat
git add -u
git commit -m "..."
git push
```

## Vegyes: tracked változások + 1-2 új fájl
```bash
git status
git diff --stat
git add -u
git add path/to/newfile1 path/to/newfile2
git commit -m "..."
git push
```

## “Status alapján döntök” – gyors kiválogatás
```bash
git add -p
```

# Tippek:

- y = felveszi a részt
- n = kihagyja
- s = split (darabol)
- q = kilép


## “Majdnem mindent, kivéve ezt a párat”
```bash
git add .
git restore --staged path/to/notwanted1 path/to/notwanted2
```

## Ellenőrzés commit előtt (2 gyors parancs)

Mit fogsz commitolni? (staged)
```bash
git diff --cached --stat
```

Mi marad kint? (unstaged)
```bash
git diff --stat
```

## Push: branch vs main (reflexek)
Ha a branch már trackingel (nálad igen a snake_case_sql_refactor)
```bash
git push
 ```

Ha main-en vagy
```bash
 git push origin main
```

Első push új branch-re (tracking beállítással)
```bash
git push -u origin BRANCH_NEVE
```
---

## Branch műveletek (gyakori)
Branch létrehozás + átváltás
```bash
git switch -c uj_branch
```
Átváltás meglévő branch-re
```bash
git switch letezo_branch
```
Pull (frissítés a távoli ágból)
```bash
git pull
```
Merge (branch -> main) alap lépésrend
```bash
git switch main
git pull
git merge snake_case_sql_refactor
git push origin main
```
---

## “Ha baj van” (mentés / vissza)
Kiveszek mindent a stage-ből (nem törli a munkát)
```bash
git restore --staged .
```

## Elvetem a working tree módosításokat egy fájlban (VIGYÁZZ)
```bash
git restore path/to/file
```

## “Visszavonom” a legutóbbi commitot, de a módosítás marad stage-ben
```bash
git reset --soft HEAD~1
```

## “Visszavonom” a commitot, és a módosítás visszamegy working tree-be (unstaged)
```bash
git reset --mixed HEAD~1
```

## Kényelmi aliasok (egyszer beállítod)
```bash
git config --global alias.st "status -sb"
git config --global alias.cstat "diff --cached --stat"
git config --global alias.wstat "diff --stat"
```
Használat:
```bash
git st
git wstat
git cstat
```
---

## Bea-féle default ajánlás (ha nem akarsz gondolkodni)

- Vegyes munkanapokon: git add -u (biztonságos)

- Új fájl(oka)t kézzel add hozzá: git add path/to/file

- Commit előtt mindig: git diff --cached --stat

---

