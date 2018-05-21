drop database if exists trgovina;
create database trgovina default character set utf8;
use trgovina;


create table kupac(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
broj_racuna varchar(50)
);

create table proizvod(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
cijena decimal(18,2) not null,
rok_trajanja datetime,
stanje varchar(50)

);

create table djelatnik(
sifra int not null auto_increment primary key,
ime varchar(50) not null,
prezime varchar(50) not null,
oib char(11) not null
);

create table kosarica(
sifra int not null primary key auto_increment,
ukupan_iznos decimal(18,2),
djelatnik_prodao int not null,
kupac int not null
);

create table kosarica_proizvod(
kosarica int not null,
proizvod int not null,
kolicina int not null
);




alter table kosarica add foreign key (kupac) references kupac(sifra);
alter table kosarica add foreign key (djelatnik_prodao) references djelatnik(sifra);
alter table kosarica_proizvod add foreign key (kosarica) references kosarica(sifra);
alter table kosarica_proizvod add foreign key (proizvod) references proizvod(sifra);


insert into kupac(sifra,ime,prezime,broj_racuna)
values		(null,'Ivan','Ivic','hr12345'),
			(null,'Marko','Markic','hr67899');
			
insert into proizvod(sifra,naziv,cijena)
values		(null,'Sladoled King','10,99'),
			(null,'Keksi Jadro','12,49');
			
insert into djelatnik(sifra,ime,prezime,oib)
values		(null,'Tomo','Tomic','12345678901'),
			(null,'Marina','Maric','09876542314');

		
insert into kosarica(sifra,djelatnik_prodao,kupac)
values		(null,1,1),
			(null,1,2);
			
insert into kosarica_proizvod(kosarica,proizvod,kolicina)
values		(1,1,'3'),
			(1,2,'1');
			
			select * from djelatnik;

alter table djelatnik add column lozinka char(50);



select now(),lozinka,rtrim(lozinka) from djelatnik;

select * from djelatnik
where sifra is not null;

select * from djelatnik where concat('ime','prezime') like '%';
select concat('>>',lozinka, '<<') from djelatnik;
update djelatnik set lozinka=md5('12345') where sifra is not null;