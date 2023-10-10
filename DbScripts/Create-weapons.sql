use [DMA-CSD-V221_10434668]

-- våbentyper
insert into weapontype values('Haglgevær')
insert into weapontype values('Riffel')
insert into weapontype values('Håndvåben')
insert into weapontype values('Salonriffel')

-- ammunitiontyper
insert into AmmunitionType values('12/76-71cm')
insert into AmmunitionType values('30.06')
insert into AmmunitionType values('30.06 56cm')
insert into AmmunitionType values('9mm')

-- våben
insert into weapon values(12549558,'Beretta A300 Outlander', 1, 1,1)
insert into weapon values(84689297,'Browning B525', 1, 1,1)
insert into weapon values(49867544,'Remington 783 Bolt Action', 2, 2,1)
insert into weapon values(97812387,'Sauer 100 Classic', 3, 2,1)
insert into weapon values(34897456,'Heckler & Koch USP', 3, 4,1)

select w.weaponid, w.weaponname, wt.weapontype, a.ammunitiontype, status from weapon w, weapontype wt, ammunitiontype a where w.weaponType_Id = wt.weaponTypeId and w.ammunitionType_Id = a.AmmunitionTypeId
