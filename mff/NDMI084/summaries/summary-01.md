ÚVOD
====

- Df: Optimalizační problém 			`(𝓘, 𝓕, f, g)`
											1. `I`: množina vstupů
											2. `F: ∀ I ∈ 𝓘: F(I)` je množina přípustných řešení
											3. `f: ∀ I ∈ 𝓘, S ∈ F(I): f(I, S) -> ℝ` účelová funkce 
											4. `g`: min/max
											
- Df: NP optimalizační problém
										1. délka řešení v `F(I)` je polynomiální v `|I|`
										2. jazyk `{(I, S): I ∈ 𝓘, S ∈ F(I)}` je v P
										3. `f` je spočitatelná v polynomiálním čase

- Df: R-aproximační algoritmus			pro nějaký optimalizační problém pokud:
											1. v polynomiálním čase na vstupu `I` spočítá `S ∈ F(I)`
											2. `∀ I ∈ 𝓘: f(I, S) ≤ R * OPT(I)` pro `g =` min (a `1/R` naopak)
											
- Df: Optimum
										1. `OPT(I)`
											1. optimální řešení
											2. `f(OPT(I))` 		hodnota účelové funkce v optimu
										2. `A(I)`
											1. výstup `A` na vstupu `I`
											2. `f(A(I))`		hodnota účelové funkce na vstupu `I`
										
PROBLÉM OBCHODNÍHO CESTUJÍCÍHO
==============================										

- Df: TSP
										- Vstup: 					`V = [n], d:V x V -> ℝ_0^+`
										- Výstup: 					permutace na `V: σ(1), ..., σ(n)`
										- Účelová funkce / cíl: 	minimalizujeme `Σ{i ∈ [n]} d(σ(i), σ(i+1 mod n))`
										
- Pz: NP-těžkost TSP


- Df: Metrický TSP 						navíc máme `d` je metrika
											1. `d(u,v) = 0   <=>   u = v`
											2. `∀ u,v: d(u,v) = d(v,u)`
											3. `∀ u,v,w: d(u,v) + d(v,w) ≥ d(u,w)`
											
- NP-těžkost metrického TSP


- Alg: Kostrový algoritmus pro MOC
										1. najdeme `T` 		minimální kostru
										2. `E = T ⨄ T` 		(disjunktní sjednocení, každá hrana dvakrát)
										3. Výstup `Z(E)` 	(zkrácení)
										

- Alg: Z
										- Vstup: Eulerovský graf  	(souvislý, `∀` stupně sudé) (multigraf, protože máme zdvojené hrany)
										- Výstup: Vrcholy v pořadí eulerovského tahu

										1. `C` Eulerovský tah 								
										2. Vydáme vrcholy v pořadí prvního výskytu v `C`


- Df: Značení 							`d(F) = Σ{u,v ∈ F} d(u,v)`


- Lm:									`d(Z(E)) ≤ d(E)`

- Lm: 									`d(T) ≤ OPT`

- Vt: Kostrový algoritmus 				Kostroý algoritmus pro MOC je 2-aproximační

- Alg: Christofidesův algoritmus
										1. najdeme `T` minimální kostru
										2. `W` vrcholy lichého stupně v `T`
										3. najdeme `M` perfektní párování minimální ceny na `W`
										4. vrátíme `Z(T ⨄ M)`

- Lm: 									`d(M) ≤ 1/2 OPT`

- Lm: 									Christofidesův algoritmus je `3/2`-proximační

- Pz: 									
										1. Asymetrický TSP
										2. euklidovská metrika
										3. rovinný graf

PRAVDĚPODOBNOSTNÍ ALGORITMY
===========================

- Df: výpočetní model
										1. Turingův stroj s páskou náhodných bitů navíc
										2. Instrukce na hození mincí

- Pz: Třídy složitosti
										1. RP: vždy běží v polynomiálním čase
										2. BPP: vždy běží v polynomiálním čase
										3. ZPP: vždy odpoví správně


KONFLIKTY V DISTRIBUOVANÝCH SYSTÉMECH
=====================================


- Df: Model
										+ `n` procesů, `n` je zmáné
										+ procesy mají synchronizovaný čas
										+ v každém cyklu proces může:
											1. požádat o přístup
											2. získat přístup, je-li jediný žádající
										+ nelze udělat deterministicky
										+ všechny pravděpodobnosti jsou **nezávislé** - procesy čtou náhodné bity na vstupu

- Alg:									počty u zkoušky
											1. Alg: Dokud neuspěje: s pravděpodobností `p` požádá o přístup
												- `k`: počet aktivních procesů těžké spočítat, proto zvolíme pesimistický algoritmus
											2. Alg: Bude o přístup žádat i po neúspěchu
											
- Vt:			 						Algoritmus s `p = 1/n` uspěje v čase `t = 2en * ln(n)` uspěje s pravděpodobností `≥ 1 - 1/n`



MINIMÁLNÍ (GLOBÁLNÍ) ŘEZ V GRAFU
================================

- Pb: Minimální globální řez 			globální: nemáme zdroj a stok
											1. Vstup: Neorientovaný multigraf `G = (V,E)` bez smyček
											2. Výstup: `C ∈ E: (V, E\\C)` je nesouvislý
											3. Cíl: Minimalizovat `|C|
	
- Alg: Kontraktní
										1. Pokud `|V| = 2`: Vrátíme `C = E`
										2. Jinak dokud `|V| ≠ 2`:
										3. 		Kontrahujeme náhodnou hranu `e = {uv}`:
										4.   		Z `E` vynecháme všechny kopie hrany `u, v` (paralelní hrany?)
										5.      Pro zbývající hrany:
										6.      	Nahradíme `v` za `u`
										7.       	`V = V \ {v}`
										8. Musíme vrátit hrany v původním grafu, ne v kontrahoveném
										

- Lm: 									Graf s `n` vrcholy minimálním řezem velikosti `k` má `≥ kn/2` hran

- Vt:  									Algoritmus uspěje, pokud v žádném kroku nevybere hranu z `C`

- Pz: Poznatky z důkazu



ROZVRHOVÁNÍ
===========

- Pb: Rozvrhování
										+ stroje (procesory) `∈ [m]`
										+ úlohy
											* délky `p_1, ..., p_n`
											* začátek (starting time) `S_j`
											* konec (completion time) `C_j`
										+ 1 stroj vždy zpracovává 1 úlohu


- Pb: Rozvrhování na identických strojích
										1. Vstup: `m, p1, ..., pn ∈ ℝ^+`
										2. Výstup:
											* rozvrh
											* `∀j: i_{¶číslo stroje¶} S_j, C_j`
												- `C_j = S_j + p_j`
												- `(S_j, C_j)` disjunktní pro `j` na stejném stroji??
										3. Cíl: minimalizovat maximální `C_j`

- Pb: Alternativně:
										2. Výstup:
											* `I_1, ..., I_m`: rozklad `[m] = I_1 ∪ ... ∪ I_m`
										3. Cíl: Minimalizovat `max{i ∈ [m]} Σ{j ∈ I_i} p_j  =  Cmax`


- Alg:
										1. Začneme s libovolným rozvrhem ale "bez děr"
										2. Pro stroj `i` s maximální délkou rozvrhu:
										3. 		Vezmi poslední úlohu `j`:
										4.      Pokud přesun sníží `C_j`:
										5.      	Přesuň `j` na konec rozvrhu na stroji s minimální délkou rozvrhu
										6. 			Zpátky na 2
										7. Jinak konec

- Pz: Alg
										+ zlepší `C_j` vždy
											* ledaže by nový stroj měl stejný konec před úlohou
											* to ale není povolené
										+ `Cmin = min{i} max{j ∈ I_i} C_j`
										

- Lm:
										1. `Cmin` se nikdy nezmění
										2. `∀` úlohu přesuneme nejvýš jednou

- Vt:
										1. Algoritmus je 2-aproximační pro m součásti vstupu
										2. Algoritmus je `(2-1/m)`-aproximační pro `m` strojů

- Df: Online algoritmy 					postupňě dostávají vstup a postupně podle něho mění výstup


- Alg: Hladový (online) algoritmus
										1. `I1, ..., Im = ∅`
										2. `∀j ∈ [n]:`
										3. 		Rozvrhni `j` na nejmíň zatíženém stroji

- Pz: Hladový (online) algoritmus		Stále bude splňovat
											1. `∀j: Sj ≤ OPT, p_j ≤ OPT`
											2. `Sj + p_j ≤ (2 - 1/m) OPT`

- Alg: LPT algoritmus (longest processing time first)
										1. Seřadíme úlohy: `p1 ≥ ... ≥ pn`
										2. Pustíme hladový algoritmus
										

- Vt:
										1. LPT je `4/3`-aproximační
										2. LPT je `(4/3 - 1/3m)`-aproximační pro pevné `m`

- Pb: Bin packing
										1. Vstup: `a1, ..., an ∈ (0,1]`
										2. Výstup: `I1, ..., Im: I1 ∪ ... ∪ Im = [m]`
											+ `∀i: Σ{j ∈ Ii} aj ≤ 1`
										3. Cíl: minimalizovat `m`

- Df: Any-fit algoritmy 				alternativy
											1. first-fit
											2. best-fit
											+ obě mají 1.7-aproximaci


- Alg:
										1. `m = 0`
										2. `∀j ∈ [n]`
										3. 		Dáme `j` do nějakého `Ii`, kam se vejde
										4.   	Pokud `i` neexistuje:
										5.    		Přidáme `I{m+1}`
										6.      	`I{m+1} = {j}`


- Vt: 									každý polynomiální any-fit je 2-aproximační aloritmus

- Pz: Zlepšení
										+ je np-těžké rozhodnout, zda je 2 optimum
										+ z algoritmu není lepší řešení než `2/3` aproximace ?
										+ `∃` Alg `≤ (1+ε) OPT + 1`



DISJUNKTNÍ CESTY V GRAFECH
==========================

- Pb: Disjunkntní cesty v grafech
										+ Vstup:
											* Graf (orientovaný nebo neorientovaný)
											* `(s1, t1),  ..., (sk, tk)`   dvojice vrcholů
											* `c` 	společná kapacita všech hran
										+ Výstup:
											* `I ⊆ [k]`
											* `{Pi: i ∈ I}: Pi` je cesta z `si` do `ti`
											* `∀ e ∈ E` je v `c` cestách `Pi`
										+ Cíl: Maximalizovat `|I|`

+ Alg: Hladový
										1. `I = ∅`
										2. Najdi nejkratší Pi si-ti cestu přes všechna `i ∉ I`
										3. Pokud `∃`:
										4. 		`I = I ∪ {i}`
										5.   	`E = E \ Pi`
										6.   	Zpět na 2.
										7. Jinak vydáme `I, {Pi: i ∈ P}`

- Vt: Bez kapacit  						Hladový algoritmus pro `c = 1` je `O(√n)`-apx


- Alg: Hladový s kapacitami:
										1. `I = ∅`
										2. `d(e) = 1`
										3. `β = ⌈ m^(1/c+1) ⌉`
										4. Najdi nejkratší `Pi` `si-ti` cestu vzhledem k `d` přes všechna `i ∉ I`
										5. Pokud `∃` a `d(Pi) < β^c`:
										6. 		`I = I ∪ {i}`
										7.   	`∀ e ∈ Pi: d(e) = β * d(e)`
										8.   	Zpět na 2.
										9. Jinak vydáme `I, {Pi: i ∈ P}`


- Vt: S kapacitami 						hladový algoritmus s kapacitami `c = O(+)` je `O((c+1)√m)-apx`




VRCHOLOVÉ POKRYTÍ
=================

- Pb: Vrcholové pokrytí
										+ Vstup: Graf
										+ Výstup: `W ⊆ V: ∀e ∈ E: e ∩ W ≠ ∅`
										+ Cíl: Minimalizovat `|W|` (nebo `w(W)` pro variantu s váhami pro `w:V -> ℝ0+`)

- Df: LP
										+ `x_v ∈ {0,1}`
											* `≥ 0` pro LP
											* `≤ 1` není potřeba
										+ `min Σ{v ∈ V} w(v) x_v`
										+ `∀ uv ∈ E: x_n + x_v ≥ 1`

- Alg:
										1. Najdeme `x^*` optimum LP
										2. Vydáme `W = {u: x_u^* ≥ 1/2}`


- Vt: 									Alg je 2-apx






- Pb: Množinové pokrytí (set cover)
										1. Vstup:
											1. `S1, ..., Sm ⊆ [n]`
											2. `c1, ..., cm ≥ 0`
											+ pokud množiny nepokrývají nějaký prvek, instance nemá řešení
										2. Výstup: `I ⊆ [m]: ∪{j ∈ I} Sj = [n]`
										3. Cíl: Minimalizovat `Σ{j ∈ I} cj`
										4. Parametry:
											1. `f = max{i ∈ [n]} |{j: i ∈ Sj}|`
											2. `g = max{j ∈ [n]} |Sj|`


- Pz: Vrcholové pokrytí
										+ speciální případ
										+ hrany jsou vrcholy `[n]`
										+ množiny `Sj` jsou hrany sdílející vrchol


- Pb: LP verze
										1. `P` primární
											1. `x1, ..., xn ≥ 0`   nebo   `x1, ..., xn ∈ {0,1}`
											2. `min Σ{j ∈ [m]} cj xj`
											3. `∀ i ∈ [n]: Σ{j: i ∈ Sj} xj ≥ 1`
										2. `D` duální
											1. `y1, ..., ym ≥ 0`
											2. `max Σ{i ∈ [n]} yi`
											3. `∀j ∈ [m]: Σ{i ∈ Sj} yi ≤ cj`
											+ `yi` cena vrcholu `i`
											+ snaží se maximalizovat ceny, aby vycházely na ceny množin
											

- Pz: LP verze
										1. z **duality** `Σxi ci ≥ Σyj`
										2. z **podmínek komplementarity** `x,y` jsou optimální  `<=>`
											+ `∀ i ∈ [n]: Σ{j: i ∈ Sj} xj = 1  ∨  yi = 0`
											+ `∀ j ∈ [m]: Σ{i ∈ Sj} yi = cj   ∨   xj = 0`


- Alg: Hladový
										1. `I = ∅  (I ⊆ [n])`
										2. `E = ∅  (E ⊆ [m])`
										3. `q = 0`
										4. Dokud `E ≠ [n]:`
										5. 		`pj = cj / (Sj \ E)` 
										6.   	`j0: pj ej` definované a minimální
										7.    	`I = I ∪ {j0}`
										8.     	`E = E ∪ {S{j0}}`
										9.      `qi = p{j0}: ∀ i ∈ S{j0}`
										10. Vrátíme `I`



- Lm: 									`∀j ∈ [m]: Σ{i ∈ Sj} q'i ≤ cj`

- Ds: 									`q' = 1/Hg * q` je duální přípustné řešení


- Vt: 									Hladový algoritmus je `Hg`-aproximační	`(Hg ≤ Hn ≤ O(log n))`

- Alg: LP 
										1. `x*` optimum LP `P`
										2. Vydáme `{j: xj* ≥ 1/f} = I`

- Vt: 									LP algoritmus je `f`-aproximační


- Alg: PD (komplementární)
										1. `y = 0`
										2. `I = ∅`
										3. `E = ∅`
										4. Dokud `∃ i: i ∉ E:`
										5. 		Nastav `yi` co nejvyšší, aby bylo v duálu stále přípustné:
										6.   		`δ = min_j (cj - Σ{i ∈ Sj} xi)`
										7.    		`yi = yi + δ`
										8.      Do `I` přidáme `∀j: Σ{i ∈ Sj} yi = cj`
										9.      `E = E ∪ Sj`

- Pz: PD (komplementární)				`∀ yi` zvýšíme nejvýš jednou


- Vt: 									PD algoritmus je `f`-aproximační



SPLNITELNOST
============

- Pb: MAX-SAT
										1. Vstup:
											1. klauzule `C1, ..., Ck`
											2. s proměnnými `x1, ..., xn`
											3. a váhami `w1, ..., wk`
										2. Výstup: ohodnocení proměnných
										3. Cíl: Maximalizovat součet vah splněných klauzulí
										
- Df: Literál 
										1. proměnná `x` a její negace `{x}`
										2. **positivní** proměnná `x`
										3. **negativní** negace proměnné `{x}`


- Předpoklady (BÚNO):
										1. `∀` klauzule neobsahuje proměnnou i její negaci
										2. `∀` klauzuli `∀` proměnná vyskytuje nejvýš jednou


- Alg: RAND-SAT
										1. `∀i`: nezávisle náhodně s nastavíme `xi = \{`
											+ 1 	pravděpodobnost `1/2`
											+ 0 	pravděpodobnost `1/2`


- Df: Indikátory klauzulí 				`∀` klauzuli `Cj` zavedeme indikátor `Yj = \{`
											+ 1 	`C` je splněna náhodným přiřazením
											+ 0 	jinak
	

- Vt: RAND-SAT je 2-Aproximační 		RAND-SAT je 2-aproximační


- Lm: 									pro náhodné proměnné `X,Y: 𝔼[X] = Σ_{y ∈ Im(Y)} P[Y = y] * 𝔼[X | Y = y]`



- Pz: Aplikace lemmatu 					`𝔼[W] ≤ max{𝔼[W | X1 = 1], 𝔼[W | X1 = 0]}`


- Pz:
										1. v polynomiálním čase umíme přesně spočítat `𝔼[W | X1 = 1], 𝔼[W | X1 = 0]`
										2. nastavíme `X1 = b1: 𝔼[W | X1 = b1] ≥ 𝔼[W | X1 = {b1}]`
										3. `𝔼[W | X1 = b1] ≥ 𝔼[W] ≥ OPT/2`
											+ tedy nejhorší výsledek bude stený jako v RAND-SAT
											
										4. Předpokládejme, že jsme nastavili `X1 = b1, ..., Xi = bi: 𝔼[W | X1 = b1, ..., Xi = bi] ≥ 𝔼[W]`
										5. Zpozorujeme, že `𝔼[W | X1 = b1, ..., Xi = bi] = 1/2 * 𝔼[W | X1 = b1, ..., Xi = bi, X{i+1} = 1] + 1/2 * 𝔼[W | X1 = b1, ..., Xi = bi, X{i+1} = 0]`

- Alg: Derandomizovaný RAND-SAT 
										1. `∀i ∈ [n]:`
										2. 		Pokud `𝔼[W | X1 = b1, ... , X{i-1} = b{i-1}, Xi = 1] ≥ 𝔼[W | X1 = b1, ... , X{i-1} = b{i-1}, Xi = 0]:`
										3.   		`bi = 1`
										4.     	Jinak:
										5.      	`bi = 0`
										6. Vrátíme `b1, ..., bn`

- Pz: 
										+ 3-SAT - `7/8 OPT`
										+ `∀ε > 0: 7/8 + ε` aproximace je np-těžká


- Předpoklad (BÚNO): 					`∀i: Σ{j: Cj = xi} wj ≥ Σ{j: Cj = {xi}} wj`
											* BÚNO protože můžeme přehodit čemu říkáme `xi` a čemu `{xi}`


- Alg: Biased-SAT
										1. `∀ i ∈ [n]` nezávisle náhodně nastav `xi = \{`
												+ 1 	s pravděpodobností `p > 1/2`
												+ 0 	s pravděpodobností `1 - p`
												
- Pz: Biased-SAT
										+ pro klauzuli `Cj` dva možné případy:
											1. `|Cj| = 1`, literál `Cj` je positivní
												+ `P[Yj = 1] = p`
											2. `|Cj| ≥ 2`
												+ `a =` # positivních literálů v `Cj`
												+ `b =` # negativních literálů v `Cj`
												+ `P[Yj = 1] = 1 - (p^b * (1 - p)^a) ≥ 1 - p^{a + b} ≥ 1 - p^2`
												* tedy zvolíme `p = 1 - p^2`, aby odhady vyšly stejně
												

- Pz: 									`U =` množina klauzulí bez těch jednotkových negativních `=> OPT ≤ Σ{j ∈ U} wj`

- Vt: 									Biased SAT je `(√5 - 1)/2`-aproximační

- Df: LP relaxace a pravděpodobnostní zaokrouhlování
										1. celočíselný program
											1. proměnné:
												+ pro booleovskou proměnnou `xi` zavedeme celočíselnou proměnnou `yi = \{`
													- 0 	`xi = 0`
													- 1 	`xi = 1`
												+ pro klauzuli `Cj` zavedeme binární proměnnou `zj = \{`
													- 0 	`Yj = 0`
													- 1 	`Yj = 1`
											2. účelová funkce:
												+ `Σ{j ∈ [k]} wj * zj` = součet vah splněných klauzulí
											3. podmínky:
												+ `∀j ∈ [k]: Σ{i: xi ∈ Cj} yi + Σ{i: {xi} ∈ Cj} (1 - yi) ≥ zj`
										2. relaxace
											1. proměnné:
												+ `∀i: 0 ≤ yi ≤ 1`
												+ `∀j: 0 ≤ zj ≤ 1`
											2. účelová funkce: `max Σ{j ∈ [k]} wj * zj`
											3. podmínky:
												+ `∀j ∈ [k]: Σ{i: xi ∈ Cj} yi + Σ{i: {xi} ∈ Cj} (1 - yi) ≥ zj`


- Alg: LP-SAT
										1. vyřeš LP-relaxaci
										2. `∀i ∈ [n]:`
										3. 		`xi = \{`
													+ 1 	s pravděpodobností `yi`
													+ 0 	s pravděpodobností `1 - yi`
										
- Fakt: 								`∀ a1, ..., an ≥ 0: (π ai)^{1/n} ≤ 1/n * Σai`

- Fakt:
										1. `f` konkávní funkce na `[0,1]`
										2. `f(0) = a, f(1) = a + b`
										+ `=> ∀x ∈ [0,1]: f(x) ≥ a + b * x`

- Fakt: 								`(1 - 1/n)^n  ≤  1/e`

- Df: Značení 							`y*, z*` optimální řešení LP


- Pz:
										1. `P[H(Cj) = 0] ≤ (1 - zj* / lj)^{lj}`
										2. `P[H(Cj) = 1] ≥ (1 - 1/e) * zj*`
										3. `𝔼[Σ{j ∈ [m]} wj * Yj]  ≥  (1 - 1/e) * OPT`

- Vt: 									LP-SAT je `(1 - 1/e)` - aproximační

- Pz: 									algoritmus funguje dobře pro krátké klauzule


- Alg: BEST-SAT 						s pravděpodobností `1/2` spusť RAND-SAT a s pravděpodobností `1/2` spusť LP-SAT

- Vt: 									BEST-SAT je `(3/4)` - aproximační





PARALELNÍ ALGORITMY
===================


- Df: PRAM model
										+ více procesorů
											* mají přístup ke společné paměťi
											* pracují synchronně
											* znají svůj čas
											* mají stejné operace
										+ měříme:
											* čas - chceme logaritmický, reálně očekáváme polynomiální
											* počet procesorů - chceme polynomiální
										1. procesory mají čísla - sečíst je umíme v log čísle
										2. nebo mají prefix sum


- Df: Dělící model
										+ implemetace simultálních čtení / zápisů
										+ simultální zápis nebo čtení více procesorů do stejné buňky paměti
											+ nezáleží na implementaci



- Pb: Maximální nezávislá množina
										+ sekvenčně jednoduché: vybereme vrchol, vyškrtáme sousedy, pokračujeme..
										+ graf může reprezentovat konflikty mezi procesy apod.
										+ nelze jednoduše aproximovat, špatný aproximační poměr

- Alg: Paralelizace
										1. vybereme nezávislou množinu
										2. sousedy vyškrtáme
										3. chceme graf rychle zmenšovat v každém kroku (ideálně třeba na polovinu)
										

- Df: Značení 							`dv :=` aktuální stupeň vrcholu `v`


- Alg: Maximální nezávislá množina
										- Vstup: `G = (V, E)`
										
										1. `I := ∅`
										3. `∀v ∈ V` paralelně:
										4. 		Pokud `dv = 0`
										5.   		`I = I ∪ {v}`
										6.     		`V = V \ {v}`
										2. Opakujeme dokud graf není prázdný:
										7. 		`∀v ∈ V` paralelně:
										8. 			Nezávisle s pravděpodobností `pv = 1 / 2dv` označíme vrchol v
										9. 		`∀ {uv} ∈ E`:
										10. 		Pokud `u` i `v` jsou označené:
										12.  			Smažeme značku vrcholu nižšího stupně
										13. 	`S :=` označené vrcholy
										14. 	`N(S) :=` sousedi označených vrcholů
										15. 	`E = {{uv} ∈ E: {uv} ∉ S ∧ {uv} ∉ N(S)}`
										16. 	`V = V \ (S ∪ N(S))`
										17. 	`I = I ∪ S`
										18. Vrátíme `I`



- Pz:
										1. potřebujeme polynomiálně procesorů
										2. potřebujeme poly-logaritmický čas na cyklus
										3. výsledek je maximální nezávislá množina


- Pz: Volba parametru `pv`
										1. `Kn`
											+ chceme vybrat právě jeden, nebo nejvýš dva vrcholy
											+ `1/n`
										2. Párování
											+ `1/2` nebo nějakou konstantu
										+ proto `1 / 2dv`

- Pz: 									`v` označený `=> P[v ∈ S po kroku 12] ≥ 1/2`

- Df: Dobrý a špatný vrchol 			vrchol `v` je "dobrý", pokud má `≥ dv/3` sousedů stupně `≤ dv`

- Df: Dobrá a špatná hrana 				hrana `{uv}` je dobrá, pokud je `u` nebo `v` dobrý

- Pz:									`v` je dobrý  `=>  p = P[`v 8 označím aspoň jednoho souseda`] ≥ β > 0.15`

- Pz: 									hvězda má málo dobrých vrcholů - dobrý je jen prostřední

- Lm:  									`|\{e ∈ E: ¶e je dobrá¶\}| ≥ |E|/2`

- Vt: Složitost 						`𝔼[`# cyklů`] ≤ O(log m)`

- Alg: Alternativa
										+ vrcholy označíme s pravděpodobností `pv` ale ne nezávisle, jen po dvou nezávisle
										+ pozorování stále platí i pro dvou-nezávislost, kromě posledního dokázaného, musíme dokázat znova
										

- Pz: 									`v` je dobrý  `=>  p = P[`v 8 označím aspoň jednoho souseda`] ≥ β > 0.15`




DERANZOMIZACE MAXIMÁLNÍ NEZÁVISLÉ MNOŽINY 
=========================================

- Nt: Po dvou nezávislost
										+ pravděpodobnostní prostor jsou vrcholy [n]
										+ velikost `2^n`
										+ pro po dvou nezávislost stačí `n^2`
										+ pro po dvou nezávislost chceme, aby se v každých dvou sloupcích vyskytovaly možnosti `{00, 01, 10, 11}` stejně často

- Df: Sylvestrova matice
										+ řádky indexované binárními řetězci `u` délky `d`
										+ řádky indexované binárními řetězci `v` délky `t`
										+ pozice `u,v = ⟨u,v⟩ = (Σ{^t} ui vi) mod 2`
										
- Pb: Násobení matic  					matice `A,B,C ∈ R^{n x n}`
											1. `AB` spočítáme v `n^ω` 
												* `ω` název pro nejlepší čas násobení matic
												* momentálně `ω ~ 2.31`
											
											2. `AB = C` otestujeme v `O(n^2)`
												* `L = {(A,B,C): AB = C} ∈ P`
												* algoritmus testuje, zda je slovo v jazyku

- Alg: Test násobení matic `AB =?= C`
										+ `x ∈ {0, 1}^n` náhodně
										+ otestujeme, zda `ABx = Cx` 		
											+ `O(n^2)`
											+ `ABx = A(Bx) = Cx`

- Tv:									pro `A,B,C ∉ L: P[`algoritmus odpoví ne`] ≥ 1/2`

- Pb: Matice a polynomy
										+ polynom `p(x1, ..., xn)` nad tělesem `K`
										+ `p ≡?≡ 0`
											+ může znamenat dvě věci
												1. `∀x1, ..., xn ∈ K: p(x1, ..., xn) = 0`
													+ `x^2 - x` nad `GF(2)` je vždy `0`
													+ testování negace splnitelnost
													+ umíme do polynomu splnitelnost zakódovat
													+ nenulové hodnoty odpovídají tomu, že existuje splňující ohodnocení
												2. po roznásobení mají všechny monomy koeficient = 0
													+ `x^2 - x` není algebraicky nulový polynom
													+ tohle nás zajímá
													+ existuje rychlý pravděpodobnostní algoritmus ale neexistuje deterministický
										+ **Vstup**: formule (nebo obvod)

- Pb: Kolik má polynom kořenů? 			1 proměnná, stupeň `d  =>`  nejvíc `d` kořenů nebo nulový všude


- Df: Celkový stupeň
										+ `p(x1, ..., xn)` polynom nad `K`
										+ nejvýš `d: ∀` monom má celkový stupeň `≤ d`
										+ `x1^d1 * x2^d2 ...   =>   d = d1 + d2 + ...`


- Lm: Schwartzovo lemma
										1. `S ⊆ K` konečná
										2. `|S| ≥ d`
										3. `p(x1, ..., xn)` nenulový polynom celkového stupně `≤ d`
												`=> P{a1, ..., sn ∈ S}[p(a1, ..., an) = 0] ≤ d/|S|`

- Pb: Perfektní párování 				`G = (U,V)` bipartitní graf na `n + n` vrcholech

- Df: Edmondsova matice 				`B` matice `n x n: b_{u,v} = \{`
											+ `x_{i,j}`		`\{i,j\} ∈ E`
											+ `0`			`\{i,j\} ∉ E`


- Vt: Vlastnosti Edmondsovy matice
										1. `G` má perfektní párování  `<=>   det(B) ≠ 0` tj není nulový polynom
										2. `rank(B) = |`největší párování`|`

- Alg: Perfektní párování 
										+ matici otestujeme indukcí z Schwartzova lemmatu
										+ chceme ho ale najít, ne jen testovat



- Pb: Nalezení perfektního párování
										+ stále bipartitní grafy
										
										+ otestujeme, jestli je hrana v perfektním párování
										+ škrtneme její řádek a sloupec a zkoušíme nenulovost determinantu zbylé matice
										+ sekvenčí, můžeme spočítat paralelně, ale nemusí být stejné párování pro všechny hrany
										+ chceme hledat perfektní párování minimální váhy
										
										+ `w(e) ∈ [2m]` váhy `m` hran zvolíme uniformně nezávisle
										+ `C: c{i, j} = 2^w({i, j})`
										+ `π` permutace `-> +/- 2^w(M_π) = 10...0` <- `1 x 1` a `0 x w(M_π)`
											* `+/-` znaménko permutace
	

- Df: Značení
										1. `w(S) = Σ{ai ∈ S} w(ai)`
										2. `w{min} = min{w(S1), ..., w(SN)}`
											

- Lm: Izolující lemma
										1. `S1, ..., SN ⊆ {a1, ..., am}` systém množin 		(pro nás podmnožiny hran)
										2. `R ⊆ ℝ: |R| = r`									(pro nás `r = 2m`)
										3. Zvolme `w(a1), ..., w(am) ∈ R` uniformně nezávisle
											`=>  P[∃i,j ≤ N: i ≠ j: w(Si) = w(Sj) = w{min}]  ≤  m/r`

- Pb: Obecné grafy 
										+ musíme upravit matice
										+ nechceme přiřadit jedné hraně dvě různé váhy (hrany jsou v matici dvakrát)


- Df: Tutteho matice
										+ `b{uv} = \{`
											+ `0` 			`uv ∉ E`
											+ `x{u,v}` 		`uv ∈ E, u < v`
											+ `-x{u,v}`		`uv ∈ E, u > v` 	(nemáme smyčky, proto není potřeba rovnost)
										* na diagonále nuly
										* pod diagonálou záporné hodnoty, nad diagonálou kladné hodnoty
										* matice je antisymetrická


- Pz: Tutteho matice
										1. v matici párování budou ty samé hodnoty kladné i záporné verze
										2. `M` párování `-> +/- π{e ∈ M} x_e^2`

- Lm: Vlastnosti Tutteho matice
										1. `B` je regulární  `<=>  G` má perfektní párování
										2. `rank(B) = 2 *` velikost maximálního párování

- Df: Značení
										- `q` monom v proměnných `x_e`
										- např `q = x_e^2 * x_f  =>  F(q)` multigraf obsahující dvě kopie hrany `e` a jednu kopii hrany `f`


- Lm: 2 									`q` monom s nenulovými koeficienty v `det(B)`
											`=>  F(q)` je sjednocení sudých cyklů, kde `∀` vrchol má stupeň `2`

- Alg:
										1. `M = ∅`
										2. Náhodně zvolíme `w(e) ∈ [2m]` uniformně nezávisle 					(paralelně)
										3. `C` modifikovaná Tutteho matice po dosazení `x{u,v} = 2^w{u, v}`		(čísla budou mít `2m` bitů - lze zapsat v polynomiálním čase)
										4. Spočítáme `det(C)`
										5. Spočítáme `max{W: 2^W | det(C)}` 									(paralelně, `log^2(n)` čas, `n^{7/2} * m` procesorů (`m` za počet bitů v determinantu))
										6. `∀ {u,v} ∈ E:` spočítáme `det(C^{u,v})` pro `C^{u,v}` matici `C` bez řádků a sloupců `u,v`
										7. 		Pokud `det(C^{u,v}) * 2^{2 * w(u,v)} / 2^W` je liché celé číslo:
										8.   		`M = M ∪ {u,v}`
										9. Zkontrolujeme, že `M` je párování 	