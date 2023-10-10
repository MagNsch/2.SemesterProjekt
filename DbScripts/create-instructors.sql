use [DMA-CSD-V221_10434668]

-- k�r customer f�r denne

-- adresse
insert into Address values('Hobrovej 132', 9000)
insert into Address values('Damstr�de 39C', 9220)
insert into Address values('Hobrovej 23', 9500)

select * from Person
-- person
insert into person values('Ole', 'Olesen', '21212121','ole.olesen@mail.dk','Instrukt�r',4)
insert into Person values('Lene', 'Jensen', '3131313131','lene.jensen@mail.dk','Instrukt�r',5)
insert into Person values('louse', 'Jensen', '3131313131','louse.jensen@mail.dk','Instrukt�r',6)

-- customer
insert into instructor values(4,1)
insert into instructor values(5,1)
insert into instructor values(6,1)

select i.instructor_id, p.fName, p.lName, p.phone, p.email, a.address, a.postalCode_Id, pc.city from instructor i, person p, address a, PostalCode pc where i.instructor_id = p.personId and p.address_id = a.address_Id and a.postalCode_Id = pc.postalCode