## SIMSCAPE

<div align="center">
 <img src="https://github.com/user-attachments/assets/16489e5b-6b1b-49de-9429-0b8ecda59ad6" alt="image1" width="300">
 </div>

Il software impiegato per la realizzazione del progetto è MATLAB/Simulink con applicativo “Simscape®”.
Quest’ultimo è un ambiente di modellazione sviluppato da “MathWorks®” che permette di simulare sistemi fisici.
La famiglia di prodotti “Simscape®” fornisce modelli e tecnologie di soluzione per la simulazione di sistemi fisici, anziché blocchi di segnale o equazioni di programmazione. Modella sistemi elettrici, meccanici, fluidi e altri sistemi fisici assemblando i componenti in uno schema. I sistemi appena citati si articolano in moduli.

2.1 Modulo Driveline
Modellazione e simulazione di sistemi meccanici rotazionali e traslazionali.

2.2 Modulo Battery
Progettazione e simulazione di sistemi di accumulo dell’energia e di batterie.

2.3 Modulo Fluids
Modellazione e simulazione di sistemi fluidodinamici.

2.4 Modulo Multibody
Modellazione e simulazione di sistemi meccanici multibody.

2.5 Modulo Electrical
Modellazione e simulazione di sistemi elettronici, meccatronici e di alimentazione elettrica. Tale modulo è stato utilizzato per consentire la rappresentazione delle analogie circuitali delle varie macchine e motori. I domini utilizzati sono: Elettrico, Meccanico e di Conversione.

Si può osservare come il collegamento tra lo schema elettrico ed il meccanico viene effettuato attraverso dei blocchi che consentono la conversione.
 Dominio elettrico
 Dominio meccanico
 Dominio conversione

<div align="center">
<img src="https://github.com/user-attachments/assets/7bc2c98b-f33e-48cb-93b4-0fb176a5c855" alt="image2" width="300">
</div>

2.6 Simscape Results Explorer
Uno degli strumenti maggiormente utilizzato in tali plot è “Simscape Results Explorer”. Tale funzione consente di registrare dati durante le simulazioni e successivamente plottare informazioni su un diagramma, ad esempio per definire le curve coppia-velocità dei motori.

Il procedimento da seguire consiste nel selezionare ed eseguire il run del modello di macchina o motore preso in esame. Successivamente aprendo l’ambiente dei risultati si ottiene una struttura ad albero che permette di analizzare tutti parametri che vanno a discriminare i vari componenti dello schema rappresentativo. In particolare, i dati possono essere importati dallo spazio di lavoro Matlab all’ambiente Simscape, viceversa, potrebbero essere esportati da Simscape e salvati nell’ambiente Matlab. Attraverso le icone “Collegato” e “Scollegato” è possibile mantenere il collegamento dell’ambiente Matlab con Simscape.
Inoltre, una volta ottenuti i grafici vi è la possibilità di esportare le figure, attraverso l’apposito comando

2.7 Esempio: circuito RLC
Si rappresenta un classico esempio di circuito RLC sviluppato attraverso l’utilizzo del software “Simscape®” e considerando il dominio di Laplace.
Il blocco “PS-Simulink Converter”, in particolare, consente di acquisire in input il valore della corrente che viene misurato attraverso il blocco “Current Sensor” e restituisce, quindi, in output il grafico della caduta di corrente. Il tempo di simulazione t [s] è pari a 50 [s].

<div align="center">
<img src="https://github.com/user-attachments/assets/fd4808cd-8ec6-43d6-ac76-1fbd38416aed" alt="image3" width="300">
</div>

Il risultato ottenuto da tale rappresentazione circuitale:
<div align="center">
<img src="https://github.com/user-attachments/assets/d3a0e3b1-8b66-4ffe-8b0c-1e6757f7fb18" alt="image4" width="300">
</div>

La medesima rappresentazione è stata implementata considerando il dominio del tempo, quindi un solutore differente (“Continuous”) rispetto a quello impiegato nel dominio di Laplace. Come si può notare dagli scope ottenuti, indipendentemente dalla tipologia di dominio considerata, i risultati ottenuti risultano essere i medesimi.
<div align="center">
<img src="https://github.com/user-attachments/assets/5f1b2cbf-c5fb-4761-b095-d3aad6561cb1" alt="image5" width="300">
</div>

Il risultato ottenuto da tale rappresentazione circuitale:
<div align="center">
<img src="https://github.com/user-attachments/assets/180ec642-8606-440d-a2a5-ba511df6f0d1" alt="image6" width="300">
</div>

## Simulazioni di macchine e motori attraverso “Simscape®”
## Macchina Sincrona: simulazione
- Wye three-phase synchronous machine
<div align="center">
<img src="https://github.com/user-attachments/assets/a40581c9-b10f-4334-936f-f3f46d3474b6" alt="image7" width="300">
</div>

- Control synchronous machine
<div align="center">
<img src="https://github.com/user-attachments/assets/3a34422d-187d-475c-a411-ad40d2a59771" alt="image8" width="300">
</div>

- Drive synchronous machine
<div align="center">
<img src="https://github.com/user-attachments/assets/14fe9326-6114-4099-beb7-d13125da729e" alt="image9" width="300">
</div>

<div align="center">
<img src="https://github.com/user-attachments/assets/f0de5f5d-2418-4a37-9506-aead01faa679" alt="image10" width="300">
</div>

<div align="center">
<img src="https://github.com/user-attachments/assets/9d57bb31-4718-4c4c-a97b-122677b52988" alt="image11" width="300">
</div>

## Macchina Asincrona: simulazione
<div align="center">
<img src="https://github.com/user-attachments/assets/2258e95c-499c-4edf-9704-8da4e3e424e7" alt="image12" width="300">
</div>

- Esempio applicativo: Turbina Eolica
<div align="center">
<img src="https://github.com/user-attachments/assets/8933cf28-faf8-4e34-8b76-b4f58e0b9ef8" alt="image13" width="300">
</div>

Curva di potenza
<div align="center">
<img src="https://github.com/user-attachments/assets/3b292933-5d24-43be-b7b5-23d97a1cc3ca" alt="image14" width="300">
</div>

Caratteristiche:
<div align="center">
<img src="https://github.com/user-attachments/assets/4e60bd37-a16b-48ae-97b4-5bb2eb8fd0cd" alt="image15" width="300">
</div>

## Macchina DC: simulazione
- Motore DC
<div align="center">
<img src="https://github.com/user-attachments/assets/5d298350-7afa-4631-b0ad-8c29ab73c429" alt="image16" width="300">
</div>

- Generatore DC
<div align="center">
<img src="https://github.com/user-attachments/assets/2c0b93ee-78c2-424a-8a41-faac9efd9cf3" alt="image17" width="300">
</div>

## Macchine a Riluttanza Variabile: simulazione
<div align="center">
<img src="https://github.com/user-attachments/assets/03918363-b0a4-47e6-bb90-0620d5e575b7" alt="image18" width="300">
</div>

## Motori Passo-Passo (Stepper): simulazione
<div align="center">
<img src="https://github.com/user-attachments/assets/7198e62d-1ece-4d7d-b134-b49aa5af59c7" alt="image19" width="300">
</div>

## Motori Brushless: simulazione
<div align="center">
<img src="https://github.com/user-attachments/assets/526679a2-7a09-4fc2-a145-a3f204b907d7" alt="image20" width="300">
</div>

## Motori Lineari: simulazione
<div align="center">
<img src="https://github.com/user-attachments/assets/010f9893-aff7-4e11-8199-65feeb963a0f" alt="image21" width="300">
</div>

## Motori Coppia: simulazione
- FEM representation
<div align="center">
<img src="https://github.com/user-attachments/assets/5fdd97c7-d7e8-4177-aa33-2b33b15a6169" alt="image22" width="300">
</div>

- Simplified
<div align="center">
<img src="https://github.com/user-attachments/assets/2562ad10-08f0-435a-b8b8-0dfd69ca7bf3" alt="image23" width="300">
</div>

## Conclusioni
Il software “Simscape®” offre una vasta gamma di applicativi per effettuare
simulazioni di macchine e motori, variando parametri di progetto legati sia
a grandezze di tipo elettrico come tensione, resistenze di avvolgimenti e
correnti, sia modificando elementi di tipo meccanico e dinamico come ad
esempio carichi applicati, rappresentati da valori di coppia.

Nelle simulazioni si è tenuto conto dell’effettiva applicazione in casi reali,
analizzando gli effetti elettrici e meccanici che si verificherebbero in base al
motore più appropriato ed in base al tipo di alimentazione. In particolare,
ponendo l’attenzione sulla tensione e sulla frequenza, sono state effettuate
valutazioni sia con valori europei (220 [V] e 50 [Hz]) sia americani (120 [V]
60 [Hz]).

In conclusione, il progetto sviluppato ha tenuto conto sia di un approccio di
tipo teorico delle macchine e dei motori impiegati, sia pratico industriale.

Partendo dai risultati teorici si è cercato,
attraverso la modifica di parametri di tipo elettrico e meccanico più
significativi, di evidenziare le relazioni che sussistono tra le grandezze
elettriche (ad esempio funzioni tra tensione e corrente) e tra parametri di tipo
meccanico e dinamico (ad esempio le curve coppia-velocità), a meno di
eventuali approssimazioni. Inizialmente, sono stati analizzati i parametri
caratteristici delle macchine e dei motori ponendo l’attenzione su un
andamento di tipo temporale e successivamente, esportando le informazioni
più significative, si è cercato di ottenere delle correlazioni che potessero
rappresentare simulazioni reali cercando di avvicinarsi quanto più possibile
ad un approccio di tipo industriale analizzando le grandezze da cataloghi
reali

## Member
Davide Sasso


