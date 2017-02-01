package ejb.sessions;

import java.util.List;

import ejb.entites.Batiment;
import ejb.entites.Entreprise;
import ejb.entites.Extincteur;
import ejb.entites.Installation;
import ejb.entites.Intervention;
import ejb.entites.MarqueExtincteur;
import ejb.entites.Organe;
import ejb.entites.Technicien;
import ejb.entites.TypeExtincteur;
import ejb.entites.Verification;

public interface Servicepfeprojet {
	public void ajouterEntreprise(String nom, String adresse,String email, String tel, String interlocuteur);
	public void ajouterTechnicien(String nom, String prenom, String adresse, String tel, String email);
	public void ajouterBatiment(String nomentreprise, String nom, String adresse) throws EntrepriseInconnueException;


	public void InstallationExtincteur(int Annee, String Emp, String Obs, java.sql.Date date, int numtechnicien, int numbatiment,String nomtype,String nommarque) throws TechnicienInconnuException, BatimentInconnuException, EntrepriseInconnueException;
	public void MaintenancePreventiveExtincteur(int numeroextincteur ,String Obs, String Obsraj, int numerotechnicien, java.sql.Date date) throws OrganeInconnuException,TechnicienInconnuException;
	public void Verification(int numero,String Obs, String conclusion, int numerotechnicien, java.sql.Date date) throws OrganeInconnuException,TechnicienInconnuException,BatimentInconnuException;
	public void MaintenanceCorrectiveExtincteur(int numeroExtincteur,String Obs, String Obsraj, int numerotechnicien, java.sql.Date date) throws OrganeInconnuException,TechnicienInconnuException;
	
	public void listeIntervention(List<Intervention> interv,String conclu);
	
	public List<Installation> getlisteInstallation();
	public List<Verification> getVerificationOrgane(Organe o);
	public List<Verification> getVerificationBatiment(int numeroBatiment);
	public List<Entreprise> getlisteEntreprises();
	public List<Technicien> getlisteTechniciens();

	public List<Entreprise> rechercheEntreprise(String Nom) throws EntrepriseInconnueException;
	public Entreprise rechercheEntreprisenum(int Num) throws EntrepriseInconnueException;
	public Entreprise rechercheEntrepriseemail(String email) throws EntrepriseInconnueException;
	
	public List<Technicien> rechercheTechnicien(String Nom) throws TechnicienInconnuException;
	public Technicien rechercheTechniciennum(int Num) throws TechnicienInconnuException;
	public Technicien rechercheTechnicienemail(String email) throws TechnicienInconnuException;
	
	public Batiment recherchebatiment(String nomentreprise, String Nom) throws BatimentInconnuException, EntrepriseInconnueException;
	public Batiment rechercheBatimentnum(int Num) throws BatimentInconnuException;

	public Organe rechercheOrgane(int numero) throws OrganeInconnuException;
	public List<Extincteur> rechercheExtincteurBatiment(int numeroBatiment);
	public List<Organe> rechercheOrganeBatiment(int numeroBatiment);
		
	public void ajouttypeextincteur(String nom);
	public List<TypeExtincteur> touslesTypeExtincteur();
	public TypeExtincteur rechercheTypeExtincteur(String Nom);
	
	public void ajoutmarqueextincteur(String nom);
	public List<MarqueExtincteur> touteslesMarqueExtincteur();
	public MarqueExtincteur rechercheMarqueExtincteur(String Nom);

	public String rechercheObservationVerification(int numeroOrgane);
	public String rechercheConclusionVerification(int numeroOrgane);
	
	public List<Integer> verificationCompte(String login, String pwd) throws CompteInconnuException;
	public void creercompteAdmin( String login, int admin,int statut);
	public void creercompteTechnicien(int numTech) throws TechnicienInconnuException;
	public void creercompteClient(int numclient) throws EntrepriseInconnueException;
	public List<Batiment> getBatimentEntreprise(int numE);
}
