## ANALISI MACCHINE e MOTORI

SOFTWARE USED:
[![MATLAB](https://img.shields.io/badge/MATLAB-FF7F00?style=for-the-badge&logo=mathworks&logoColor=white)](https://www.mathworks.com/products/matlab.html)
[![Simscape](https://img.shields.io/badge/Simscape-0072BD?style=for-the-badge&logo=mathworks&logoColor=white)](https://www.mathworks.com/products/simscape.html)

The ‘Simscape®’ product family provides models and solution technologies for simulating physical systems, rather than signal blocks or programming equations. It models electrical, mechanical, fluid and other physical systems by assembling the components into a schematic. The systems just mentioned are divided into modules.

2.1 Driveline Module
Modelling and simulation of rotational and translational mechanical systems.

2.2 Battery Module
Design and simulation of energy storage systems and batteries.

2.3 Fluids Module
Modelling and simulation of fluid-dynamic systems.

2.4 Multibody Module
Modelling and simulation of mechanical multibody systems.

2.5 Electrical Module
Modelling and simulation of electronic, mechatronic and power supply systems. This module was used to enable the representation of circuit analogies of various machines and motors. The domains used are: Electrical, Mechanical and Conversion.

Si può osservare come il collegamento tra lo schema elettrico ed il meccanico viene effettuato attraverso dei blocchi che consentono la conversione.
- Dominio elettrico
- Dominio meccanico
- Dominio conversione

<div align=‘center’>
<img src=‘https://github.com/user-attachments/assets/7bc2c98b-f33e-48cb-93b4-0fb176a5c855’ alt=‘image2’ width=‘300’>
</div>

2.6 Simscape Results Explorer
Uno degli strumenti maggiormente utilizzato in tali plot è “Simscape Results Explorer”. Tale funzione consente di registrare dati durante le simulazioni e successivamente plottare informazioni su un diagramma, ad esempio per definire le curve coppia-velocità dei motori.

The procedure to follow is to select and run the machine or engine model under consideration. Subsequently, opening the results environment provides a tree structure for analysing all the parameters that discriminate the various components of the representative diagram. In particular, data may be imported from the Matlab workspace to the Simscape environment, vice versa, it may be exported from Simscape and saved in the Matlab environment. Through the ‘Connected’ and ‘Disconnected’ icons, it is possible to maintain the connection of the Matlab environment with Simscape.
In addition, once the graphs have been obtained, it is possible to export the figures, using the appropriate command

2.7 Example: RLC circuit
A classic example of an RLC circuit developed using the ‘Simscape®’ software and considering the Laplace domain is shown.
The ‘PS-Simulink Converter’ block, in particular, acquires as input the value of the current, which is measured via the ‘Current Sensor’ block, and returns as output the graph of the current drop. The simulation time t [s] is 50 [s].

<div align="center">
<img src="https://github.com/user-attachments/assets/fd4808cd-8ec6-43d6-ac76-1fbd38416aed" alt="image3" width="300">
</div>

The result obtained from this circuit representation:
<div align="center">
<img src="https://github.com/user-attachments/assets/d3a0e3b1-8b66-4ffe-8b0c-1e6757f7fb18" alt="image4" width="300">
</div>

The same representation was implemented by considering the time domain, i.e. a different solver (‘Continuous’) than the one used in the Laplace domain. As can be seen from the scopes obtained, regardless of the type of domain considered, the results obtained are the same.
<div align="center">
<img src="https://github.com/user-attachments/assets/5f1b2cbf-c5fb-4761-b095-d3aad6561cb1" alt="image5" width="300">
</div>

The result obtained from this circuit representation:
<div align="center">
<img src="https://github.com/user-attachments/assets/180ec642-8606-440d-a2a5-ba511df6f0d1" alt="image6" width="300">
</div>

## Machine and engine simulations through ‘Simscape®’.
## Synchronous machine: simulation
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

## Asynchronous machine: simulation
<div align="center">
<img src="https://github.com/user-attachments/assets/2258e95c-499c-4edf-9704-8da4e3e424e7" alt="image12" width="300">
</div>

- Application example: Wind Turbine
<div align="center">
<img src="https://github.com/user-attachments/assets/8933cf28-faf8-4e34-8b76-b4f58e0b9ef8" alt="image13" width="300">
</div>

Plots: Power
<div align="center">
<img src="https://github.com/user-attachments/assets/3b292933-5d24-43be-b7b5-23d97a1cc3ca" alt="image14" width="300">
</div>

Features
<div align="center">
<img src="https://github.com/user-attachments/assets/4e60bd37-a16b-48ae-97b4-5bb2eb8fd0cd" alt="image15" width="300">
</div>

## DC: simulation
- DC Motor
<div align="center">
<img src="https://github.com/user-attachments/assets/5d298350-7afa-4631-b0ad-8c29ab73c429" alt="image16" width="300">
</div>

- DC Generator
<div align="center">
<img src="https://github.com/user-attachments/assets/2c0b93ee-78c2-424a-8a41-faac9efd9cf3" alt="image17" width="300">
</div>

## Variable reluctance machines: simulation
<div align="center">
<img src="https://github.com/user-attachments/assets/03918363-b0a4-47e6-bb90-0620d5e575b7" alt="image18" width="300">
</div>

## Stepper motors: simulation
<div align="center">
<img src="https://github.com/user-attachments/assets/7198e62d-1ece-4d7d-b134-b49aa5af59c7" alt="image19" width="300">
</div>

## Brushless Motors: simulation
<div align="center">
<img src="https://github.com/user-attachments/assets/526679a2-7a09-4fc2-a145-a3f204b907d7" alt="image20" width="300">
</div>

## Linear Motors: simulation
<div align="center">
<img src="https://github.com/user-attachments/assets/010f9893-aff7-4e11-8199-65feeb963a0f" alt="image21" width="300">
</div>

## Torque Motors: simulation
- FEM representation
<div align="center">
<img src="https://github.com/user-attachments/assets/5fdd97c7-d7e8-4177-aa33-2b33b15a6169" alt="image22" width="300">
</div>

- Simplified
<div align="center">
<img src="https://github.com/user-attachments/assets/2562ad10-08f0-435a-b8b8-0dfd69ca7bf3" alt="image23" width="300">
</div>

## Conclusions
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


