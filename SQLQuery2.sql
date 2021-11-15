CREATE TABLE Kullanicilar (
    KullaniciAdi varchar(30) NOT NULL,
    Sifre varchar(50)  NOT NULL,   
	PRIMARY KEY (KullaniciAdi)
);
CREATE TABLE Iller (
    IlKodu varchar(100) NOT NULL,
    IlAdi varchar(100)  NOT NULL, 
PRIMARY KEY(IlKodu));

CREATE TABLE Ilceler (
    IlKodu varchar(100) NOT NULL,
    IlceKodu varchar(100)  NOT NULL, 
	IlceAdi varchar(100)  NOT NULL, 
PRIMARY KEY(IlceKodu),
FOREIGN KEY(IlKodu) REFERENCES Iller(IlKodu));



CREATE TABLE Birimler (
    BirimKodu varchar(255) NOT NULL,
    BirimAdi varchar(255) NOT NULL,
	UstBirimKodu varchar(255) NOT NULL,
	BulunduguAdres varchar(255) NOT NULL,
	IlKodu varchar(100) NOT NULL,
	IlceKodu varchar(100) NOT NULL,
	PostaKodu varchar(100) NOT NULL,
	BirimMudurKullaniciAdi varchar(30) NOT NULL,
PRIMARY KEY (BirimKodu),
FOREIGN KEY(IlKodu) REFERENCES Iller(IlKodu),
FOREIGN KEY(IlceKodu) REFERENCES Ilceler(IlceKodu));


CREATE TABLE Personel (
    KullaniciAdi varchar(30) NOT NULL,
    Email varchar(255)  NOT NULL, 
	Ad varchar(255)  NOT NULL,
	Soyad varchar(255)  NOT NULL,
	SicilNo varchar(255)  NOT NULL,
	Cep varchar(11)  NOT NULL,
	EvAdresi varchar(255)  NOT NULL,
	IlKodu varchar(100)  NOT NULL,
	IlceKodu varchar(100)  NOT NULL,
	PostaKodu varchar(100)  NOT NULL,
	UstKullaniciAdi varchar(255),
	CalistigiBirimKodu varchar(255)  NOT NULL,  
PRIMARY KEY (SicilNo),
CONSTRAINT UC_Personel UNIQUE (Email,SicilNo),
FOREIGN KEY(IlKodu) REFERENCES Iller(IlKodu),
FOREIGN KEY(KullaniciAdi) REFERENCES Kullanicilar(KullaniciAdi),
FOREIGN KEY(IlceKodu) REFERENCES Ilceler(IlceKodu),
FOREIGN KEY(CalistigiBirimKodu) REFERENCES Birimler(BirimKodu));

CREATE TABLE Problem (
    ProblemTipiId varchar(11) NOT NULL,
    ProblemTanimi varchar(255) NOT NULL,
	ProblemiTanimlayiciAdi varchar(30) NOT NULL,
	ProblemiTanimlayiciSoyadi varchar(30) NOT NULL,
	ProblemiTanimlayanTCNOPasaportno varchar(100) NOT NULL,
	HedeflenenAmacTanimi varchar(100) NOT NULL,
PRIMARY KEY (ProblemTipiId),
);

CREATE TABLE Alanlar(
    AlanID varchar(11) NOT NULL,
	AlanAdi varchar(255) NOT NULL,
	AlanTipi bit NOT NULL,
	PRIMARY KEY (AlanID),
	CONSTRAINT UC_Alanlar UNIQUE (AlanAdi)
);

CREATE TABLE Siniflar(
    SinifID varchar(11) NOT NULL,
	SinifAdi varchar(255) NOT NULL,
	AlanTipi bit NOT NULL,
	PRIMARY KEY (SinifID),
	CONSTRAINT UC_Siniflar UNIQUE (SinifAdi)
);

CREATE TABLE Mudahele(
    AlanID varchar(11) NOT NULL,
	SinifID varchar(11) NOT NULL,
	MudaheleID varchar(11) NOT NULL,
	MudaheleAdi varchar(255) NOT NULL,
	PRIMARY KEY (MudaheleID),
	FOREIGN KEY(AlanID) REFERENCES Alanlar(AlanID),
    FOREIGN KEY(SinifID) REFERENCES Siniflar(SinifID)
);

CREATE TABLE Aktiviteler(
    AktiviteID varchar(11) NOT NULL,
	AktiviteTanimi varchar(255) NOT NULL,
	PRIMARY KEY ( AktiviteID)	
);

CREATE TABLE MudaheleDetay(
    AlanID varchar(11) NOT NULL,
	SinifID varchar(11) NOT NULL,
	MudaheleID varchar(11) NOT NULL,
	AktiviteID varchar(11) NOT NULL,
	Sira int NOT NULL,
	FOREIGN KEY (MudaheleID) REFERENCES Mudahele(MudaheleID),
	FOREIGN KEY (AktiviteID) REFERENCES Aktiviteler(AktiviteID),
	FOREIGN KEY(AlanID) REFERENCES Alanlar(AlanID),
    FOREIGN KEY(SinifID) REFERENCES Siniflar(SinifID)
);

CREATE TABLE Cikti(
    AlanID varchar(11) NOT NULL,
	SinifID varchar(11) NOT NULL,
	CiktiID varchar(11) NOT NULL,
	CiktiAdi varchar(255) NOT NULL,
	PRIMARY KEY (CiktiID),
	FOREIGN KEY(AlanID) REFERENCES Alanlar(AlanID),
    FOREIGN KEY(SinifID) REFERENCES Siniflar(SinifID)
	);
CREATE TABLE Belirtecler(
    BelirtecID varchar(11) NOT NULL,
	BelirtecTanimi varchar(255) NOT NULL,
	PRIMARY KEY ( BelirtecID)	
);

CREATE TABLE CiktiDetay(
    AlanID varchar(11) NOT NULL,
	SinifID varchar(11) NOT NULL,
	CiktiID varchar(11) NOT NULL,
	BelirtecID varchar(11) NOT NULL,
	Sira int NOT NULL,
	FOREIGN KEY (CiktiID) REFERENCES Cikti(CiktiID),
	FOREIGN KEY (BelirtecID) REFERENCES Belirtecler(BelirtecID),
	FOREIGN KEY(AlanID) REFERENCES Alanlar(AlanID),
    FOREIGN KEY(SinifID) REFERENCES Siniflar(SinifID)
);

CREATE TABLE ProblemBirim(
    ProblemID varchar(11) NOT NULL,
	BirimID varchar(11) NOT NULL,
	EslesmeTarihi date NOT NULL,	
);

/*ALTER TABLE Birimler
ADD FOREIGN KEY (BirimMudurKullaniciAdi) REFERENCES Kullanicilar(KullaniciAdi);*/


  

