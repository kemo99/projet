package ejb.sessions;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Random;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import ejb.entites.*;
import java.lang.*;
import java.lang.String;

@Stateless
public class ServicepfeprojetBean implements ServicepfeprojetLocal, ServicepfeprojetRemote {
	@PersistenceContext(unitName = "pfeprojet")
	protected EntityManager em;
	public ServicepfeprojetBean(){

	}
	// Recherche d'informations

		// Recherche d'une entreprise par nom
		public List<Entreprise> rechercheEntreprise(String Nom) throws EntrepriseInconnueException {
			@SuppressWarnings("unchecked")
			List<Entreprise> E = em.createQuery("from Entreprise e where nom like '%' || :name ||'%'")
					.setParameter("name", Nom).getResultList();
			if (E == null)
				throw new EntrepriseInconnueException();
			else
				return E;
		}

		// Recherche d'une entreprise par numero
		public Entreprise rechercheEntreprisenum(int Num) throws EntrepriseInconnueException {
			Entreprise E = em.find(Entreprise.class, Num);
			if (E == null)
				throw new EntrepriseInconnueException();
			else
				return E;
		}
		// Recherche d'une entreprise par email
		public Entreprise rechercheEntrepriseemail(String email) throws EntrepriseInconnueException {
			Entreprise E = (Entreprise) em.createQuery("from Entreprise e where e.adressemail like :name").setParameter("name", email).getSingleResult();
			if(E==null)
				throw new EntrepriseInconnueException();
			else
				return E;
		}

		// Recherche d'un batiment par nom et par entreprise
		public Batiment recherchebatiment(String nomentreprise, String Nom)
				throws BatimentInconnuException, EntrepriseInconnueException {
			Batiment B = null;
			Entreprise E = rechercheEntreprise(nomentreprise).get(0);
			for (int i = 0; i < E.getBatiments().size(); i++)
				if (E.getBatiments().get(i).getNom().compareTo(Nom) == 0)
					B = E.getBatiments().get(i);
			if (B == null)
				throw new BatimentInconnuException();
			else
				return B;
		}

		// Recherche d'un batiment par numero
		public Batiment rechercheBatimentnum(int Num) throws BatimentInconnuException {
			Batiment B = em.find(Batiment.class, Num);
			if (B == null)
				throw new BatimentInconnuException();
			else
				return B;
		}
		// Recherche d'un technicien par nom
		public List<Technicien> rechercheTechnicien(String Nom) throws TechnicienInconnuException {
			@SuppressWarnings("unchecked")
			List<Technicien> T = em.createQuery("from Technicien t where nom like :name").setParameter("name", Nom)
					.getResultList();
			if (T == null)
				throw new TechnicienInconnuException();
			else
				return T;
		}
		
		public Technicien rechercheTechnicienemail(String email) throws TechnicienInconnuException {
			Technicien T = (Technicien) em.createQuery("from Technicien t where t.adressemail like :name").setParameter("name", email).getSingleResult();
			if(T==null)
				throw new TechnicienInconnuException();
			else
				return T;
		}
		
		// Recherche d'un technicien par numero
		public Technicien rechercheTechniciennum(int Num) throws TechnicienInconnuException {
			Technicien T = em.find(Technicien.class, Num);
			if (T == null)
				throw new TechnicienInconnuException();
			else
				return T;
		}
		// recherche d'un organe par numero
		public Organe rechercheOrgane(int numero) throws OrganeInconnuException {
			Organe O = em.find(Organe.class, numero);
			if (O == null) {
				throw new OrganeInconnuException();
			}
			return O;
		}
		// Recherche du type
		public TypeExtincteur rechercheTypeExtincteur(String Num) {
			int Numero = Integer.parseInt(Num);
			TypeExtincteur T = em.find(TypeExtincteur.class, Numero);
			return T;
		}
		// recherche de la marque
		public MarqueExtincteur rechercheMarqueExtincteur(String Num) {
			int Numero = Integer.parseInt(Num);
			MarqueExtincteur M = em.find(MarqueExtincteur.class, Numero);
			return M;
		}
		// recherche des organes d'un batiment 
		@SuppressWarnings("unchecked")
		public List<Organe> rechercheOrganeBatiment(int numeroBatiment){
			return em.createQuery("from Organe o WHERE o.batiment.numero = "+numeroBatiment).getResultList();
		}
		
		public List<Extincteur> rechercheExtincteurBatiment(int numeroBatiment){
			return em.createQuery("from Extincteur e WHERE e.batiment.numero = "+numeroBatiment).getResultList();
		}
		
		
		// Fonctions d'ajouts

		// Ajout d'une entreprise
		public void ajouterEntreprise(String nom, String adresse,String email, String tel, String interlocuteur) {
			Entreprise E = new Entreprise();
			E.setNom(nom);
			E.setAdresse(adresse);
			E.setAdressemail(email);
			E.setTel(tel);
			E.setNominterlocuteur(interlocuteur);
			em.persist(E);
		}

		// Ajout d'un technicien
		public void ajouterTechnicien(String nom, String prenom, String adresse, String tel, String email) {
			Technicien T = new Technicien();
			T.setNom(nom);
			T.setPrenom(prenom);
			T.setAdresse(adresse);
			T.setTel(tel);
			T.setAdressemail(email);
			em.persist(T);
		}

		// Ajout d'un batiment
		public void ajouterBatiment(String nomentreprise, String nom, String adresse) throws EntrepriseInconnueException {
			Entreprise E = rechercheEntreprise(nomentreprise).get(0);
			if (E == null) {
				System.out.print("entreprise introuvable");
				throw new EntrepriseInconnueException();
			} else {
				Batiment B = new Batiment();
				B.setNom(nom);
				B.setAdresse(adresse);
				B.setEntreprise(E);
				E.addBatiments(B);
				em.persist(B);
				em.merge(E);
			}
		}
		// Ajout pieces
		public List<Piece> AjoutPiece(List<Piece> Pieces, String nom) {
			Piece P = new Piece();
			P.setNom(nom);
			Pieces.add(P);
			return Pieces;
		}
		// Ajout Type Extincteur
		public void ajouttypeextincteur(String nom) {
			TypeExtincteur T = new TypeExtincteur();
			T.setNom(nom);
			em.persist(T);
		}
		// Ajout Marque Extincteur
		public void ajoutmarqueextincteur(String nom) {
			MarqueExtincteur M = new MarqueExtincteur();
			M.setNom(nom);
			em.persist(M);
		}

		
		// Interventions sur les extincteurs
		// Intervention : Installation
		public void InstallationExtincteur(int Annee, String Emp, String Obs, java.sql.Date date, int numtechnicien,
				int numbatiment, String nomtype, String nommarque)
				throws TechnicienInconnuException, BatimentInconnuException, EntrepriseInconnueException {
			Technicien T = rechercheTechniciennum(numtechnicien);
			Batiment B = rechercheBatimentnum(numbatiment);
			Extincteur E = new Extincteur();
			E.setAnnee(Annee);
			E.setEmplacement(Emp);
			E.setObservation(Obs);
			E.setBatiment(B);
			MarqueExtincteur M = rechercheMarqueExtincteur(nommarque);
			E.setMarque(M);
			TypeExtincteur Tp = rechercheTypeExtincteur(nomtype);
			E.setType(Tp);
			Installation Inst = new Installation();
			Inst.setDate(date);
			Inst.setObservation(Obs);
			Inst.setOrgane(E);
			Inst.setTechnicien(T);
			if (E.getInterventions() == null) {
				List<Intervention> interv = new ArrayList<Intervention>();
				E.setInterventions(interv);
			}
			E.addInterventions(Inst);
			B.addOrganes(E);
			em.persist(E);
			em.persist(Inst);
			em.merge(B);
		}
		// Intervention : Verification
		public void Verification(int numero, String Obs, String conclusion, int numerotechnicien, java.sql.Date date)
				throws OrganeInconnuException, TechnicienInconnuException, BatimentInconnuException {
			Organe O = rechercheOrgane(numero);
			Technicien T = em.find(Technicien.class, numerotechnicien);
			if (T == null) {
				throw new TechnicienInconnuException();
			}
			O.setObservation(Obs);
			O.setConclusion(conclusion);
			Verification V = new Verification();
			V.setDate(date);
			V.setObservation(Obs);
			V.setConclusion(conclusion);
			V.setTechnicien(T);
			V.setOrgane(O);
			if (O.getInterventions() == null) {
				List<Intervention> interv = new ArrayList<Intervention>();
				O.setInterventions(interv);
			}
			O.addInterventions(V);
			em.persist(V);
			em.merge(O);
		}
		// Recherche : Verifications effectuees sur un organe
		@SuppressWarnings("unchecked")
		public List<Verification> getVerificationOrgane(Organe O) {
			return em.createQuery("from Verification v WHERE v.organe.numero = " +O.getNumero()).getResultList();
		}
		// Recherche : Verifications effectuees sur tous les organes d'un batiment
		public List<Verification> getVerificationBatiment(int numeroBatiment){
			List<Verification> result = new ArrayList<Verification>();
			List<Extincteur> extincteurs = rechercheExtincteurBatiment(numeroBatiment);
			for(int i=0;i<extincteurs.size();i++){
				result.add((Verification) getVerificationOrgane(extincteurs.get(i)));
			}
			return result;
		}
		// Intervention : Maintenance
		// Maintenance : Corrective
		public void MaintenanceCorrectiveExtincteur(int numeroExtincteur, String Obs, String Obsraj, int numerotechnicien,
				java.sql.Date date) throws OrganeInconnuException, TechnicienInconnuException {
			Extincteur E = (Extincteur) rechercheOrgane(numeroExtincteur);
			Technicien T = em.find(Technicien.class, numerotechnicien);
			if (T == null) {
				throw new TechnicienInconnuException();
			}
			Corrective MC = new Corrective();
			MC.setDate(date);
			MC.setObservation(Obs);
			MC.setConclusion(Obsraj);
			MC.setTechnicien(T);
			MC.setOrgane(E);
			if (E.getInterventions() == null) {
				List<Intervention> interv = new ArrayList<Intervention>();
				E.setInterventions(interv);
			}
			E.addInterventions(MC);
			em.persist(MC);
			em.merge(E);
		}
		// Maintenance : Preventive
		public void MaintenancePreventiveExtincteur(int numeroextincteur, String Obs, String Obsraj, int numerotechnicien,
				java.sql.Date date) throws OrganeInconnuException, TechnicienInconnuException {
			Extincteur E = em.find(Extincteur.class, numeroextincteur);
			if (E == null) {
				throw new OrganeInconnuException();
			}
			Technicien T = em.find(Technicien.class, numerotechnicien);
			if (T == null) {
				throw new TechnicienInconnuException();
			}
			Preventive MP = new Preventive();
			MP.setDate(date);
			MP.setObservation(Obs);
			MP.setConclusion(Obsraj);
			MP.setTechnicien(T);
			MP.setOrgane(E);
			if (E.getInterventions() == null) {
				List<Intervention> interv = new ArrayList<Intervention>();
				E.setInterventions(interv);
			}
			E.addInterventions(MP);
			em.persist(MP);
			em.persist(E);
		}
		// Ajout d'une conclusion pour : Installation // Maintenance Corrective
		public void listeIntervention(List<Intervention> interv, String conclu) {
			for (int i = 0; i < interv.size(); i++) {
				interv.get(i).setConclusion(conclu);
				em.merge(interv.get(i));
				interv.get(i).getOrgane().setConclusion(conclu);
				em.merge(interv.get(i).getOrgane());
			}
		}
		
		// Listes : A partir de la base de donnees
		
		// Liste des installations
		@SuppressWarnings("unchecked")
		public List<Installation> getlisteInstallation() {
			return em.createQuery("from Installation I ").getResultList();
		}
		// Liste des entreprises
		@SuppressWarnings("unchecked")
		public List<Entreprise> getlisteEntreprises() {
			return em.createQuery("from Entreprise e ").getResultList();
		}
		// Liste des techniciens
		@SuppressWarnings("unchecked")
		public List<Technicien> getlisteTechniciens() {
			return em.createQuery("from Technicien t ").getResultList();
		}
		// liste de tous les types d'extincteurs
		@SuppressWarnings("unchecked")
		public List<TypeExtincteur> touslesTypeExtincteur() {
			List<TypeExtincteur> T = em.createQuery("from TypeExtincteur t").getResultList();
			return T;
		}
		// liste de toutes les marques d'extincteurs
		@SuppressWarnings("unchecked")
		public List<MarqueExtincteur> touteslesMarqueExtincteur() {
			List<MarqueExtincteur> M = em.createQuery("from MarqueExtincteur m").getResultList();
			return M;
		}

		// derniere observation
		public String rechercheObservationVerification(int numeroOrgane) {
			@SuppressWarnings("unchecked")
			List<Verification> verifications = em.createQuery("FROM Verification v where v.organe.numero = "+numeroOrgane).getResultList();
			String observation="--";
			if(verifications.size()!=0)
				observation=verifications.get(verifications.size()-1).getObservation();
			return observation;
		}

		// derniere conclusion
		public String rechercheConclusionVerification(int numeroOrgane) {
			@SuppressWarnings("unchecked")
			List<Verification> verifications = em.createQuery("FROM Verification v where v.organe.numero = "+numeroOrgane).getResultList();
			String conclusion="--";
			if(verifications.size()!=0)
				conclusion=verifications.get(verifications.size()-1).getConclusion();
			return conclusion;
		}

		// Creation des comptes et generations des mots de passe
		// creation d'un compte client
		public void creercompteClient(int numclient) throws EntrepriseInconnueException {
			Compte session = new Compte();
			Entreprise E = rechercheEntreprisenum(numclient);
			session.setLogin(E.getAdressemail());
			session.setNumAdmin(numclient);
			session.setStatut(2);
			//session.setPassword(passeword());
			session.setPassword("pass");
			em.persist(session);
		}
		// creation d'un compte technicien
		public void creercompteTechnicien(int numTech) throws TechnicienInconnuException{
			Compte session = new Compte();
			Technicien T = rechercheTechniciennum(numTech);
			session.setLogin(T.getAdressemail());
			session.setNumAdmin(numTech);
			session.setStatut(1);
			//session.setPassword(passeword());
			session.setPassword("pass");
			em.persist(session);
		}

		public void creercompteAdmin(String login, int admin, int statut) {
			Compte session = new Compte();
			session.setLogin(login);
			session.setNumAdmin(admin);
			session.setStatut(0);
			//session.setPassword(this.passeword());
			session.setPassword("pass");
			em.persist(session);
		}

		public String passeword() {
			Random rand = new Random();
			String Xsi = "abcdefghijklmnopqrstuvwxyz";
			String Gamm = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			String Iot = "1234567890";
			String Zeta = "&#-_)('/?.";
			String demo = new String();
			// randomisation des caractères selon leur nombre par type définis
			// ,entre six et dix caratères
			while ((demo.length() != 6) && (demo.length() != 7) && (demo.length() != 8) && (demo.length() != 9)
					&& (demo.length() != 10)) {
				// selection aleatoire du type de caractère puis selection parmis
				// les differents modèles de caractères
			
				int rPick = rand.nextInt(4);
				if (rPick == 0) {
					int erzat = rand.nextInt(25);
					demo += Xsi.charAt(erzat);
				} else if (rPick == 1) {
					int erzat = rand.nextInt(9);
					demo += Iot.charAt(erzat);
				} else if (rPick == 2) {
					int erzat = rand.nextInt(25);
					demo += Gamm.charAt(erzat);
				} else if (rPick == 3) {
					int erzat = rand.nextInt(15);
					demo += Zeta.charAt(erzat);
				}
			}
			return demo;
		}
		// verification des comptes admin
		public List<Integer> verificationCompte(String login, String pwd) throws CompteInconnuException {
			@SuppressWarnings("unchecked")
			List<Compte> session = (List<Compte>) em.createQuery("from Compte c").getResultList();
			List<Integer> liste = new ArrayList<Integer>();
			boolean trouver = false;
			int i = 0;
			while (i < session.size() && !trouver) {

				if (session.get(i).getLogin().compareTo(login) == 0 && session.get(i).getPassword().compareTo(pwd) == 0) {
					trouver = true;
					liste.add(session.get(i).getNumAdmin());
					liste.add(session.get(i).getStatut());
				} else
					i++;
			}
			if (!trouver)
				throw new CompteInconnuException();

			return liste;
		}

	
	public List<Batiment> getBatimentEntreprise(int numE){
		List<Batiment> bat=(List <Batiment>) em.createQuery("from Batiment b where b.entreprise.numero="+numE).getResultList();
		return bat;
	}
	
}

