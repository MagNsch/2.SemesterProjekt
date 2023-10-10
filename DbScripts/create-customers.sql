use [DMA-CSD-V221_10434668]

-- post nr by
insert into PostalCode values(9000,'Aalborg')
insert into PostalCode values(9220,'Aalborg Øst')
insert into PostalCode values(9500,'Hobro')

-- adresse
insert into Address values('Ølgodvej 1', 9000)
insert into Address values('Damstræde 37D', 9220)
insert into Address values('hegedalsvej 64', 9500)

-- person
insert into Person values('Hans', 'Hansen', '22222222','hans.hansen@mail.dk','Kunde',1)
insert into Person values('Jens', 'Jensen', '33333333','jens.jensen@mail.dk','Kunde',2)
insert into Person values('Ida', 'Olesen', '44444444','ida.olesen@mail.dk','Kunde',3)

-- customer
insert into customer values(1)
insert into customer values(2)
insert into customer values(3)
insert into customer values(8)

select c.customer_id, p.fName, p.lName, p.phone, p.email, a.address, a.postalCode_Id, pc.city from customer c, person p, address a, PostalCode pc where c.customer_id = p.personId and p.address_id = a.address_Id and a.postalCode_Id = pc.postalCode
