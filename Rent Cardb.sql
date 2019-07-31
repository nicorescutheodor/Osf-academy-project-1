CREATE DATABASE [RentCdb];
GO

USE [RentCdb];
GO



-- tables
-- Table: Cars
CREATE TABLE [Cars] (
    [CarID] int  NOT NULL IDENTITY(1, 1),
    [Plate] varchar(10)  NOT NULL,
    [Manufacturer] varchar(30)  NOT NULL,
    [Model] varchar(50)  NOT NULL,
    [PricePerDay] money  NOT NULL,
    CONSTRAINT Cars_pk PRIMARY KEY  (CarID)
);
GO

-- Table: Coupons
CREATE TABLE [Coupons] (
    [CouponCode] varchar(10)  NOT NULL,
    [Description] ntext  NOT NULL,
    [Discount] decimal(4,2)  NOT NULL,
    CONSTRAINT [Coupons_pk] PRIMARY KEY  (CouponCode)
);
GO
-- Table: Customers
CREATE TABLE [Customers] (
    [CostumerID] int  NOT NULL IDENTITY(1, 1),
    [Name] varchar(50)  NOT NULL,
    [BirthDate] date  NOT NULL,
    [Location] varchar(50)  NOT NULL,
    CONSTRAINT [Customers_pk] PRIMARY KEY  (CostumerID)
);
GO
-- Table: Permissions
CREATE TABLE [Permissions] (
    [PermissionID] int  NOT NULL IDENTITY(1, 1),
    [Name] varchar(10)  NOT NULL,
    [Description] varchar(100)  NOT NULL,
    CONSTRAINT [Permissions_pk] PRIMARY KEY  (PermissionID)
);
GO
-- Table: ReservationStatuses
CREATE TABLE [ReservationStatuses] (
    [ReservStatsID] tinyint  NOT NULL IDENTITY(1, 1),
    [Name] varchar(20)  NOT NULL,
    [Description] varchar(100)  NOT NULL,
    CONSTRAINT [ReservationStatuses_pk] PRIMARY KEY  (ReservStatsID)
);
GO
-- Table: Reservations
CREATE TABLE [Reservations] (
    [CarID] int  NOT NULL,
    [CostumerID] int  NOT NULL,
    [ReservStatsID] tinyint  NOT NULL,
    [StartDate] date  NOT NULL,
    [EndDate] date  NOT NULL,
    [Location] varchar(50)  NOT NULL,
    [CouponCode] varchar(10)  NULL,
    CONSTRAINT [Reservations_pk] PRIMARY KEY  (CarID,CostumerID)
);
GO
-- Table: Roles
CREATE TABLE [Roles] (
    [RoleID] int  NOT NULL IDENTITY(1, 1),
    [Name] varchar(50)  NOT NULL,
    [Description] varchar(200)  NOT NULL,
    CONSTRAINT [Roles_pk] PRIMARY KEY  (RoleID)
);
GO
-- Table: RolesPermissions
CREATE TABLE [RolesPermissions] (
    [RoleID] int  NOT NULL,
    [PermissionID] int  NOT NULL,
    CONSTRAINT [RolesPermissions_pk] PRIMARY KEY  (RoleID,PermissionID)
);
GO
-- Table: Users
CREATE TABLE [Users] (
    [UserID] int  NOT NULL IDENTITY(1, 1),
    [Password] varchar(100)  NOT NULL,
    [Enabled] bit  NOT NULL,
    [RoleID] int  NOT NULL,
    CONSTRAINT [Users_pk] PRIMARY KEY  (UserID)
);
GO
INSERT INTO Roles (Name, Description) VALUES ('Administrator','Role with full access to all features in the system.')
INSERT INTO Roles (Name, Description) VALUES ('Manager','Role with full access to all features in the system, except manage users and permissions')
INSERT INTO Roles (Name, Description) VALUES ('Salesperson','Role with limited access to the system. Cannot manage cars,coupons cancel a reservation or manage users and permissions')

INSERT INTO Users ( Password, Enabled, RoleID) VALUES ('pass123',1,1)
INSERT INTO Users ( Password, Enabled, RoleID) VALUES ('123pass',1,2)
INSERT INTO Users ( Password, Enabled, RoleID) VALUES ('qwert',1,3)


INSERT INTO [Permissions] ( Name,Description ) VALUES ('CUST_001','CUSTOMERS REGISTRATION')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('CUST_002','CUSTOMERS LIST')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('CUST_003','CUSTOMERS EDIT')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('CUST_003','CUSTOMERS REMOVAL')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('RESERV_001','RESERVATION REGISTRATION')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('RESERV_002','RESERVATION LIST')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('RESERV_003','RESERVATION EDIT')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('RESERV_004','RESERVATION CHANGE STATUS')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('CARS_001','CARS REGISTRATION')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('CARS_002','CARS LIST')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('CARS_003','CARS EDIT')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('CARS_004','CARS REMOVAL')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('CARS_001','CARS REGISTRATION')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('COUPON_001','COUPON REGISTRATION')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('COUPON_001','COUPON EDIT')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('COUPON_001','COUPON LIST')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('COUPON_001','COUPON REMOVAL')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('USER_001','USERS REGISTRATION')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('USER_002','USERS LIST')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('USER_003','USERS EDIT')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('USER_003','USERS REMOVAL')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('PERMS_001','PERMISSION REGISTRATION')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('PERMS_002','PERMISSION LIST')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('PERMS_003','PERMISSION EDIT')
INSERT INTO [Permissions] ( Name,Description ) VALUES ('PERMS_003','PERMISSION REMOVAL')

INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,1)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,2)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,3)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,4)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,5)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,6)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,7)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,8)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,9)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,10)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,11)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,12)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,13)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,14)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,15)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,16)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,17)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,18)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,19)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,20)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,21)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,22)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,23)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,24)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (1,25)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,1)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,2)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,3)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,4)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,5)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,6)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,7)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,8)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,9)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,10)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,11)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,12)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,13)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,14)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,15)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,16)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (2,17)

INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (3,5)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (3,6)
INSERT INTO RolesPermissions (RoleID, PermissionID) VALUES (3,7)


INSERT INTO ReservationStatuses (NAME,Description) VALUES ('OPEN','RESERVATION IS OPEN')
INSERT INTO ReservationStatuses (NAME,Description) VALUES ('CLOSED','RESERVATION WAS FINALIZED WITH SUCCESS')
INSERT INTO ReservationStatuses (NAME,Description) VALUES ('CANCELED','A PROBLEM HAPPENED AND THE RESERVATION NEEDED TO BE CANCELED')

insert into Coupons (CouponCode, Description, Discount) values ('3B3O18D', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 85.95);
insert into Coupons (CouponCode, Description, Discount) values ('8D2K06S', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 41.57);
insert into Coupons (CouponCode, Description, Discount) values ('2Q6X40C', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1.49);
insert into Coupons (CouponCode, Description, Discount) values ('2F8B39K', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 74.33);
insert into Coupons (CouponCode, Description, Discount) values ('2Z7H30G', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 88.17);
insert into Coupons (CouponCode, Description, Discount) values ('5G0G50D', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 19.21);
insert into Coupons (CouponCode, Description, Discount) values ('8B0D02W', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 10.46);
insert into Coupons (CouponCode, Description, Discount) values ('3H8V03E', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 53.41);
insert into Coupons (CouponCode, Description, Discount) values ('1D2P44D', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 34.83);
insert into Coupons (CouponCode, Description, Discount) values ('0I0J93K', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 22.74);
insert into Coupons (CouponCode, Description, Discount) values ('6F5V84O', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 18.62);
insert into Coupons (CouponCode, Description, Discount) values ('7M1T92U', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 16.65);
insert into Coupons (CouponCode, Description, Discount) values ('9L4P02Z', 'Fusce consequat. Nulla nisl. Nunc nisl.', 61.36);
insert into Coupons (CouponCode, Description, Discount) values ('5M8Y28F', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 14.99);
insert into Coupons (CouponCode, Description, Discount) values ('9S4B91E', 'Fusce consequat. Nulla nisl. Nunc nisl.', 17.44);
insert into Coupons (CouponCode, Description, Discount) values ('4X5B86G', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 76.79);
insert into Coupons (CouponCode, Description, Discount) values ('7D8G62H', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 66.19);
insert into Coupons (CouponCode, Description, Discount) values ('3Y7H09U', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 69.37);
insert into Coupons (CouponCode, Description, Discount) values ('3A6K17H', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 71.91);
insert into Coupons (CouponCode, Description, Discount) values ('9N9I71O', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 42.52);
insert into Coupons (CouponCode, Description, Discount) values ('8S3J67A', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 43.36);
insert into Coupons (CouponCode, Description, Discount) values ('7M8Y56R', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 29.13);
insert into Coupons (CouponCode, Description, Discount) values ('3X5L91B', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 67.67);
insert into Coupons (CouponCode, Description, Discount) values ('3N5Z48X', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 48.94);
insert into Coupons (CouponCode, Description, Discount) values ('2K7F29X', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 42.03);
insert into Coupons (CouponCode, Description, Discount) values ('1P9V10X', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 16.63);
insert into Coupons (CouponCode, Description, Discount) values ('7O5O45D', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 51.55);
insert into Coupons (CouponCode, Description, Discount) values ('2K7K94Y', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 69.04);
insert into Coupons (CouponCode, Description, Discount) values ('5G9F86G', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 68.52);
insert into Coupons (CouponCode, Description, Discount) values ('5O7I49P', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 12.6);
insert into Coupons (CouponCode, Description, Discount) values ('0R2B94U', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 78.17);
insert into Coupons (CouponCode, Description, Discount) values ('9B9A25V', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 2.61);
insert into Coupons (CouponCode, Description, Discount) values ('4U3C86Y', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 30.24);
insert into Coupons (CouponCode, Description, Discount) values ('0I3X57G', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 8.5);
insert into Coupons (CouponCode, Description, Discount) values ('1R2A49Q', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 62.59);
insert into Coupons (CouponCode, Description, Discount) values ('8Q2I73G', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 48.68);
insert into Coupons (CouponCode, Description, Discount) values ('1S5K87Z', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 23.25);
insert into Coupons (CouponCode, Description, Discount) values ('3Y2R09W', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 60.47);
insert into Coupons (CouponCode, Description, Discount) values ('9Z3Z26L', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 64.69);
insert into Coupons (CouponCode, Description, Discount) values ('5F9E12V', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 65.47);
insert into Coupons (CouponCode, Description, Discount) values ('7S3Y89A', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 67.51);
insert into Coupons (CouponCode, Description, Discount) values ('8H4C05G', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 65.19);
insert into Coupons (CouponCode, Description, Discount) values ('0Q9Q95B', 'In congue. Etiam justo. Etiam pretium iaculis justo.', 67.06);
insert into Coupons (CouponCode, Description, Discount) values ('0P0V71T', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 23.45);
insert into Coupons (CouponCode, Description, Discount) values ('1C7I77J', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 43.31);
insert into Coupons (CouponCode, Description, Discount) values ('1T8Y85U', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 78.1);
insert into Coupons (CouponCode, Description, Discount) values ('0Z0A27J', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 5.59);
insert into Coupons (CouponCode, Description, Discount) values ('6T2Z73T', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 64.86);
insert into Coupons (CouponCode, Description, Discount) values ('6M3M61K', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 19.64);
insert into Coupons (CouponCode, Description, Discount) values ('1U6I84V', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 52.34);

insert into Customers (Name, BirthDate, Location) values ('Felike Piddletown', '1997-12-24', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Malcolm Horribine', '1956-03-19', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Barrie Tease', '1952-04-12', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Bevvy Truggian', '1974-08-18', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Antony Grebbin', '1982-05-12', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Ulrica Beere', '1959-07-22', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Ernesto Patman', '1976-12-26', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Stevy Brandacci', '1992-06-29', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Gavin Stinson', '1958-09-03', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Braden Rives', '1982-01-19', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Prue Farreil', '1979-05-04', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Eimile McAllester', '1995-11-27', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Flinn Borrows', '1944-01-23', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Wolfgang Howen', '1979-09-07', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Sumner Evers', '1953-06-24', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Luigi Simper', '1949-01-22', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Kati Formilli', '1959-07-20', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Jolyn Pykett', '1988-10-30', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Ashla Dockreay', '2000-03-16', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Leif Maun', '1992-07-22', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Marco Pikett', '1945-04-18', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Darb Dart', '1993-10-31', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Quentin Jacquemy', '1965-01-03', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Worthington Jozef', '1976-02-08', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Kimble Eadmeads', '1984-09-21', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Shane Vallentin', '1982-07-08', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Garret Clutten', '1991-08-11', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Paige Godbert', '1944-09-02', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Berthe Somerbell', '1941-07-17', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Bobbee Lissandre', '1953-08-17', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Shannon Larham', '1991-04-20', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Torre Windibank', '1942-10-10', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Meris Errington', '1984-09-24', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Nan Boundey', '1954-01-10', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Blythe Shillaker', '1985-08-20', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Kinnie Petrelluzzi', '1986-05-15', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Cyrille Verrills', '1977-01-30', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Jeanna Ferrar', '1997-03-08', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Fanchon Shead', '1997-07-26', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Marinna Dews', '1959-06-24', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Blondie Clementson', '1967-06-19', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Arny Pipkin', '1990-07-13', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Bogey Goodbarr', '1996-02-10', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Tiffie Bienvenu', '1984-04-25', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Berkley Olivas', '1974-08-29', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Katee Wais', '1941-10-02', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Tamqrah Walhedd', '1949-07-20', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Antonetta Doxey', '1988-04-23', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Jay Kern', '1983-08-28', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('West Casely', '1997-05-30', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Charley Brodeau', '1979-07-30', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Martino Ower', '1983-11-25', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Querida Vockins', '1943-09-23', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Clarey Older', '1949-12-09', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Nichol Rosbotham', '1952-07-29', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Ingmar Rodgerson', '1991-02-13', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Rosemarie Borg', '1956-03-13', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Amalia Lydiard', '1980-02-24', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Daryl Hamil', '1953-12-11', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Izabel Camamile', '1963-09-15', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Dorothee Hurkett', '1960-08-08', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Augie Simmings', '1969-03-01', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Ameline White', '1966-12-26', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Zane Bortoletti', '1947-07-15', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Karina Johanning', '1968-04-23', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Pyotr Cherry', '1940-12-07', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Reagen Borrow', '1960-03-31', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Sheri Heijnen', '1977-01-19', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Abie Tremmil', '1975-09-28', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Fernanda Timson', '1984-12-29', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Bellina Chitter', '1994-01-30', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Anna-diana MacGahy', '1968-10-19', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Krisha Vequaud', '1993-10-24', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Lorrie Barnby', '1975-02-15', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Scarlet Charteris', '1946-04-22', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Symon Goggins', '1996-06-24', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Bent Troker', '1982-12-05', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Fee Gallyhaock', '1985-07-28', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Prissie Shipp', '1952-02-14', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Nolana Tarling', '1946-06-25', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Ches Merrydew', '1980-05-04', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Eldridge Swaine', '1958-10-18', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Morissa Shelp', '1987-10-10', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Foster Wassung', '1957-01-21', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Nollie Reolfo', '1989-04-27', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Winifred Skellon', '1941-11-24', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Adella Whitehurst', '1960-11-08', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Othelia Mersey', '1963-10-11', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Anissa Stanyforth', '1950-02-13', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Kelcey Bilfoot', '1971-07-26', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Travis Conneau', '1966-04-28', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Christina Heintsch', '1987-09-09', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Gavrielle Gummow', '1983-07-26', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Aube Simmig', '1954-04-30', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Sande Laver', '1999-03-08', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Regina Dobrowolski', '1970-12-08', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Maryrose Milne', '1978-08-22', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Stillmann Randell', '1988-01-18', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Wiley Heliet', '1988-09-14', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Matthew Kubes', '1985-08-24', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Wakefield Stolze', '1964-12-20', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Gisele Cassells', '1973-10-21', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Truman Bonallack', '1981-11-02', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Freddy Smoughton', '1952-03-12', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Davita Rogge', '1962-03-24', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Yvon Klas', '1946-06-30', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Gareth Bruhnke', '1980-08-18', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Ali Manilove', '1952-08-14', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Lily Gawne', '1986-12-26', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Reg Crocumbe', '1952-06-04', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Korie Elham', '1984-03-23', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Calla Florentine', '1952-01-31', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Pall Hayhoe', '1987-12-04', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Beauregard Dungate', '1971-12-29', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Odell Mico', '1977-03-06', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Dyanna Knight', '1944-10-30', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Ambrosi Kelwaybamber', '1958-08-23', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Corrinne Passion', '1963-05-07', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Joachim Delamaine', '1985-03-01', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Mireielle McDonand', '1943-05-04', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Mirabella Trodden', '1997-12-25', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Fara Van Der Straaten', '1950-08-08', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Nelia Instrell', '1966-03-02', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Haily Adolf', '1973-07-23', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Virge Raffeorty', '1965-04-23', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Case Meaddowcroft', '1973-01-01', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Bailie Roblou', '1955-11-16', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Stace Chumley', '1972-02-25', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Yoshiko Kynnd', '1948-07-01', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Abbott Pabst', '1952-11-09', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Bea Cerro', '1976-10-24', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Quintin Crawford', '1980-02-14', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Dimitri Szubert', '1977-07-31', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Timothy Meryett', '1954-04-01', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Filippo MacMichael', '1984-02-06', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Rosina Sifflett', '1988-04-03', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Jenny Mussared', '1945-10-21', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Dyann Chattell', '1974-05-23', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Lia Pilcher', '1950-10-27', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Rhett Moreno', '1997-12-10', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Alanson Emerton', '1995-05-15', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Claus Bourchier', '1944-07-28', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Mavra ducarme', '1953-05-19', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Marisa Watting', '1965-10-27', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Darbee Pratley', '1961-11-22', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Fidela Elven', '1947-12-03', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Grace Pilling', '1975-09-26', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Bel Harcus', '1943-11-29', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Land Mingardi', '1941-09-26', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Lenette Klas', '1980-09-15', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Grantley Leary', '1974-01-23', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Amandie Guilloton', '1961-02-13', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Cally Northcliffe', '1957-06-24', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Bayard Redshaw', '1991-06-11', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Robinet McLoughlin', '1948-09-02', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Aurora Richardet', '1953-11-02', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Gloria Griffen', '1989-01-24', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Ramsay Barstowk', '1995-09-07', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Britta Roggieri', '1950-05-03', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Vannie Lengthorn', '1947-04-09', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Garrek McCullogh', '1963-03-19', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Daniela Engledow', '1963-05-30', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Christine Drinkhall', '1947-04-18', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Brittne Ugoletti', '1977-08-29', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Minnaminnie Lavallie', '1992-01-12', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Fletch Lander', '1946-07-08', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Stella Andreini', '1990-12-26', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Errol Wille', '1971-03-28', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Liuka Bodicum', '1965-06-09', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Catherine Grain', '1998-02-04', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Dari Aldis', '1957-05-18', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Tildie Jaram', '1949-12-23', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Farley Delort', '1993-06-15', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Gina Maycock', '1975-01-11', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Blithe Youthed', '1974-08-22', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Lorilyn Arpur', '1980-12-27', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Stevie Nurcombe', '1976-06-07', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Kassia Scrine', '1977-04-30', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Francis Chasney', '1958-03-23', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Sutherland Benterman', '1973-05-20', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Hi Valentinuzzi', '1944-08-24', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Kristofer Stading', '1959-07-24', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Aurelie Dahlberg', '1968-10-24', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Sheela Zamora', '1960-07-20', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Paloma Mandres', '1956-01-11', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Tedd Caen', '1972-09-16', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Roger Mendel', '1990-10-19', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Kaitlynn Mattack', '1975-08-29', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Siward Lebrun', '1947-03-04', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Colet Lodeke', '1996-01-25', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Ag Putnam', '1980-08-03', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Siouxie Jerram', '1991-03-02', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Marylee Cooksley', '1947-10-17', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Faydra Roydon', '1965-07-21', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Gallagher Kerr', '1974-02-25', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Mead Norvel', '1981-01-16', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Aldis Elion', '1945-05-24', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Delcine Sedgefield', '1944-05-16', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Steffi Gerbi', '1949-02-01', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Francis Tarn', '1965-11-29', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Kelley Barnfather', '1947-12-15', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Denni Saenz', '1996-09-28', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Lucho Oen', '1985-07-22', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Gaylene Gask', '1963-08-10', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Ricki Iacomini', '1970-11-12', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Leupold Ditchfield', '1979-12-05', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Madelon Warde', '1997-06-28', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Ashlan Overstone', '1998-10-28', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Geri Craythorn', '1997-10-09', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Kippie Paye', '1967-10-10', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Ronny Harbin', '1945-04-08', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Rory Nolin', '1996-05-18', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Annemarie Trasler', '1947-07-26', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Gareth Giuron', '1954-05-28', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Gilberta Yurocjkin', '1952-01-21', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Bobbi Danielsohn', '1993-06-03', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Cullan Ghiroldi', '1988-03-16', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Brigit O''Growgane', '1964-12-14', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Gabby Ziehms', '1995-04-28', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Claudette Berford', '1999-06-13', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Anetta Draysey', '1953-03-07', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Xylia Dannell', '1948-08-17', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Rocky Ridger', '1992-01-27', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Mattias Staddon', '1996-01-26', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Caryl Cowey', '2000-02-28', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Justino Rumin', '1982-03-21', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Devi Yezafovich', '1974-01-02', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Norbert Purser', '1982-05-26', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Sonni Olney', '1978-01-17', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Ole Fitzer', '1949-10-01', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Randie Houchin', '1991-06-08', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Lisbeth Barabisch', '1994-07-11', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Rodger Strickett', '1965-03-03', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Sharai Markovic', '1985-10-23', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Corella Cleghorn', '1986-09-08', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Kimberlyn Moughtin', '1960-04-07', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Sheelah Measures', '1955-10-22', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Lanae Dugget', '1947-09-29', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Katy Falconer', '1971-03-25', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Ethelbert Tempest', '1965-09-12', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Sutton Paumier', '1944-05-28', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Brenna Catlow', '1950-12-22', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Jules Blackford', '1954-10-04', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Jeffrey Bowra', '1985-03-24', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Emelen Hallibone', '1954-09-15', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Sigfrid Rudram', '1988-10-18', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Conrade Cockaday', '1959-03-24', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Gardy Kliement', '1962-06-20', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Tony Spykings', '1942-07-22', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Grenville Iddons', '1946-10-07', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Bonnee McKew', '1971-07-22', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Nickolaus Trevear', '1976-06-10', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Anselma Paramore', '1970-09-10', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Georgie Meekings', '1966-09-05', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Townsend MacCart', '1997-01-17', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Cad Getch', '1944-04-19', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Phil Burner', '1942-11-26', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Marcellus Gayle', '1962-05-15', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Roosevelt Beadle', '1954-06-13', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Dolorita Petrelli', '1959-09-17', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Raddy McTeer', '1983-10-26', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Kaleena Maylin', '1950-11-14', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Ingrid Dunstone', '1951-05-25', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Dorothee Warbeys', '1941-04-28', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Rodolfo Quinby', '1945-01-24', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Mickie Tomley', '1943-06-27', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Josey Benwell', '1952-01-17', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Steffane Teml', '1951-01-10', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Ania Beavington', '1989-12-22', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Orelia Klimus', '1952-10-16', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Terrence Banbrigge', '1965-09-25', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Barbra Reimer', '1941-09-17', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Shay Dot', '1945-06-01', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Mae Dawton', '1943-04-30', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Stephana Lemmertz', '1976-09-24', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Abbe Southernwood', '1983-05-11', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Jacobo Pardi', '1941-10-05', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Carolan Helsby', '1983-01-17', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Toma Monery', '1981-06-13', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Margo Lambal', '1952-10-03', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Pierce O''Concannon', '1989-02-19', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Trip Cockrill', '1959-06-12', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Mack Waud', '1964-08-15', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Rex Castiello', '1983-02-10', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Jon Mooreed', '1984-06-11', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Gaynor Brookes', '1946-01-21', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Earl Eslemont', '1992-04-23', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Vina Braxton', '1941-08-09', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Mae Bullon', '1965-02-11', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Langston Vannet', '1958-08-31', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Theo Osmund', '1964-07-13', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Murray Ianittello', '1958-12-27', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Henderson Sturges', '1978-02-16', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Lovell Hurley', '1952-10-30', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Valenka Pomroy', '1969-10-07', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Wheeler Cheesworth', '1957-10-19', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Tatiania McCarron', '1953-09-07', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Vinnie Deighan', '1957-06-22', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Farlee Poll', '1974-03-20', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Margit Rummin', '1967-08-05', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Niels Braizier', '1956-05-25', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Sonia Wilsee', '1992-12-23', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Zane Sauven', '1985-01-24', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Jaquenette MacNeice', '1980-06-09', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Rodrigo Keirl', '1947-07-17', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Basia Stones', '1997-12-10', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Lishe Zuker', '1951-06-13', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Flor Crewes', '1953-05-22', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Demetre Hise', '1996-12-30', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Katleen Sofe', '1968-05-12', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Barbee Woodroffe', '1957-07-27', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Dominik Starkie', '1992-01-01', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Daryl Gaylor', '1965-03-14', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Doris Dubble', '1982-01-20', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Dasie Kochel', '1942-05-16', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Hunter Norheny', '1961-09-20', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Ravi Deathridge', '1942-12-21', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Shelbi Shoubridge', '1994-02-13', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Shannon Cassey', '1986-07-17', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Fleur Staunton', '1989-05-08', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Emlyn Runciman', '1968-09-14', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Stillman Baniard', '1957-06-03', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Abba Franzke', '1978-02-17', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Roger Nourse', '1991-01-26', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Renato Harrow', '1947-09-04', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Clair Insko', '1965-11-03', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Olivette Kennefick', '1957-07-02', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Dulcie Hiscoe', '1952-06-07', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Adriano Dubique', '1971-10-02', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Averell Nelane', '1978-07-19', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Nicholle Clews', '1977-05-12', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Phaidra Greest', '1985-10-06', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Brand Fawthorpe', '1952-03-12', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Alfy Struthers', '1989-01-30', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Carola Roslen', '1972-05-09', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Olin Willmore', '1943-05-06', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Sheree Clemot', '1960-05-18', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Nelle Goodfellow', '1997-12-07', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Miltie Yanukhin', '1971-10-17', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Selena Balhatchet', '1950-10-26', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Stewart Herkess', '1973-10-24', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Kristofer Alyutin', '1999-12-29', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Nev Torricella', '1963-01-24', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Percival Groveham', '1986-06-30', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Joey Exeter', '1999-07-20', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Valery Trueman', '1956-06-30', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Kerri Clemonts', '1949-06-27', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Johnnie Tschirschky', '1974-11-27', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Waring Ferrini', '1984-11-18', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Jenilee Dorling', '1999-04-12', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Eleonore Dowrey', '1970-07-29', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Toinette Parmley', '1985-04-20', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Winthrop Louiset', '1945-12-19', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Kyle Paffot', '1990-10-21', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Cthrine Huriche', '1944-01-14', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Bernhard McQuaid', '1963-01-22', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Feodora Steer', '1959-01-29', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Lora Sparrowe', '1968-03-01', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Murdock Attwool', '1968-12-22', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Page Agastina', '1967-10-28', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Stinky MacGaffey', '1959-09-09', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Stevy Kernocke', '1941-11-11', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Bridgette Flacknell', '1941-05-21', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Fanny Slocombe', '1982-04-24', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Pru Frankum', '1962-07-05', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Susannah Arpin', '1991-10-12', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Ginelle Boothby', '2000-03-20', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Valentia Darragon', '1967-04-13', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Stillman Wolfer', '1959-05-05', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Leena Crockatt', '1997-12-10', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Felix Alpe', '1974-09-11', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Agnesse Penwright', '1973-11-25', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Heida Simmen', '1990-11-28', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Calypso Begley', '1991-04-22', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Noella Dobney', '1944-04-14', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Rycca Groven', '1988-12-26', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Jere Sandilands', '1969-01-26', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Merrick Juleff', '1944-02-26', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Rickert Wyson', '1997-07-04', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Kriste Baldini', '1963-04-11', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Dominik Piatkow', '1976-05-22', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Skip Aireton', '1943-01-11', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Chanda Tossell', '1998-07-24', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Tori Water', '1993-04-14', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Barr Tebbitt', '1990-10-26', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Korey Bousquet', '1940-05-20', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Cinda Clines', '1945-10-18', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Garrard De Robertis', '1988-08-10', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Lise McKimm', '1973-11-02', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Tabbie Wheelband', '1952-05-13', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Rosalinde Fowle', '1992-06-10', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Debby Windmill', '1977-05-07', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Hedy Pryor', '1980-11-29', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Darline Braben', '1956-08-20', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Kimball Greedier', '1950-02-18', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Estrella Ferreras', '1954-03-06', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Peyton Tschierasche', '1967-06-12', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Ethe Hacket', '1959-01-24', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Teresita Kuzma', '1996-02-29', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Carla Bryns', '1943-05-01', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Farly Lenden', '1956-11-26', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Joann Athersmith', '1967-03-13', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Briney Wallage', '1975-12-24', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Hendrika Penketh', '1957-10-29', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Mureil Larcher', '1959-11-15', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Elsa Ferrillio', '1974-06-22', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Brian Baistow', '1946-11-22', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Lora Wennam', '1971-07-31', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Allin Purcell', '1962-03-10', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Jourdan Benkin', '1986-03-25', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Augusto Petru', '1984-03-06', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Earlie Ramlot', '1963-04-18', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Andi Riepel', '1942-02-25', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Katherina Devinn', '1992-07-17', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Melisent Epple', '1993-11-15', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Emmalyn Camplin', '1963-01-26', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Bone Phebey', '1961-01-28', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Carolee Britee', '1984-05-23', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Kev Ryam', '1982-08-13', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Roxane Dragge', '1988-11-14', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Lanny Dozdill', '1990-02-23', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Shamus Padberry', '1976-08-10', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Anni Coniam', '1991-11-30', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('James Dalmon', '1981-05-22', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Rosemonde Armor', '1964-04-03', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Elli Brodhead', '1957-01-30', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Terrel Bonafant', '1989-01-08', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Elli Arnholtz', '1996-12-17', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Marlena Halshaw', '1982-10-25', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Genia Toll', '1955-01-13', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Bernelle Pyser', '1971-11-08', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Domeniga Kuhl', '1982-08-17', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Guillaume Lomas', '1971-07-11', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Vasily Dyment', '1941-11-09', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Annamarie Eteen', '1946-07-06', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Henrietta Cosgrave', '1963-09-24', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Dannye Grennan', '1958-11-16', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Chad Vagges', '1951-10-06', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Kiah Polgreen', '1965-06-23', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Joni Abramcik', '1963-05-15', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Ardyth Ezzell', '1963-12-17', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Maximo Tumelty', '1978-05-05', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Damara Bradley', '1984-10-21', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Lucio Roloff', '1974-03-31', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Ambrosio Pordal', '1981-11-15', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Audi Melmar', '1942-03-01', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Scarlett Petran', '1955-09-23', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Raphael Werrilow', '1943-10-14', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Aldridge Cardinale', '1991-07-26', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Katinka Cortes', '1959-04-01', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Nancee Bleesing', '1975-12-18', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Garik Kohrs', '1979-10-26', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Dall Hatfield', '1975-02-24', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Constantia Davydoch', '1952-10-29', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Anne-marie Everitt', '1957-09-03', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Kit Enterlein', '1999-05-24', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Barnaby Schimpke', '1953-12-09', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Ikey Redd', '1941-01-18', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Hermina Burd', '1997-09-23', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Elvina Kettlestringes', '1974-07-02', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Abagail Farrier', '1950-07-12', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Sophie Jerrand', '1971-03-14', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Madonna McIan', '1987-11-03', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Shep Mattei', '1988-09-12', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Jacquenette Germann', '1951-09-28', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Ladonna Syplus', '1953-01-08', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Berget Lillford', '1973-06-23', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Brittany Brackley', '1995-02-20', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Kendrick Menego', '1953-04-14', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Finlay Moodie', '1987-11-09', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Libbi Kaiser', '1964-12-02', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Blaire Keppe', '1970-02-06', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Kimmie O''Currine', '1940-06-06', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Putnem Beardsdale', '1972-11-20', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Chryste Lorek', '1966-10-16', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Aimil Van Velden', '1978-12-05', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Isacco Stiffell', '1986-01-24', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Christoffer Fourcade', '1969-07-01', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Fleurette Theobald', '1948-06-05', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Stanfield Davidovitz', '1968-09-09', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Rebecca Helstrip', '1996-04-14', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Eberhard Sifflett', '1989-03-13', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Lilla Rigglesford', '1966-03-17', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Elliott Gringley', '1969-10-26', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Davita Kall', '1985-03-02', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Annabelle Simonson', '1965-05-23', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Janot Beniesh', '1949-04-29', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Kaile Caneo', '1990-07-18', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Essie Sweetsur', '1967-04-20', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Orelle Ruslen', '1990-12-19', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Carolyne Fattorini', '1989-01-02', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Norbert Nesfield', '1954-02-19', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Rodge Coffin', '1989-09-01', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Genvieve Pahl', '1957-09-30', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Welbie Matchett', '1972-07-25', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Berte Kinlock', '1978-09-12', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Bernete Walesby', '1999-06-23', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Sheffield Lies', '1960-05-01', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Gertrude Philippault', '1993-02-25', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Ines Drake', '1984-07-17', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Ernestine McGeorge', '1952-10-03', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Lisa Coursor', '1975-04-25', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Farlay Bisco', '1984-05-23', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Gilbertine Brychan', '1964-03-26', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Sonnie Udell', '1968-11-05', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Corey Crawshaw', '1983-01-25', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Cornie Waggitt', '1945-04-17', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Virgie Labroue', '1959-05-18', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Julia Rotte', '1955-02-02', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Sauncho McTrustrie', '1941-07-03', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Florina Prisley', '1977-05-22', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Amil Simanek', '1970-05-08', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Jessey Berggren', '1952-02-08', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Shandy Phlipon', '1990-11-29', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Elihu Maestro', '1994-04-02', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Faith Jasiak', '1991-06-02', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Lyndsie Holley', '1960-06-29', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Barbette Burney', '1998-10-21', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Rafaelita Chilles', '1976-01-26', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Trenna Boyet', '1970-04-16', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Leonerd Stolberg', '1977-10-15', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Tiebold Henke', '1962-03-02', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Feliza Weatherhead', '1957-01-21', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Maitilde Powder', '1941-03-06', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Judye Diviny', '1977-08-30', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Ortensia Skotcher', '1995-08-27', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Michal Davenell', '1967-04-13', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Dolorita Poel', '1992-06-29', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Terence Pepineaux', '1966-12-21', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Barbabas Delaney', '1960-03-03', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Ketty Capeloff', '1990-01-10', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Vladimir Birchill', '1949-08-06', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Lamond Curzon', '1954-03-04', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Wilma Allen', '1991-07-17', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Jeniffer Catt', '1986-06-16', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Anallise Cayette', '1985-03-15', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Godfree Bern', '1943-04-22', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Roberta Randalston', '1959-11-26', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Liane Henke', '1989-09-17', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Pavla Vanyushin', '1983-06-24', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Euphemia Brion', '1946-03-24', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Lissi Axworthy', '1998-04-15', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Rudolf Rogger', '1986-07-12', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Bordy Vinecombe', '1956-05-31', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Claudius Adshad', '1940-07-30', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Domingo Stratten', '1947-01-29', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Chris Stelljes', '1947-04-27', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Ferne McGifford', '1985-01-08', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Alleen Hyrons', '1959-08-29', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Harriot Drewe', '1951-12-27', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Helen Caruth', '1962-01-15', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Lonni Heinzler', '1996-06-01', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Karoly Nevitt', '1998-06-29', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Rich Woodus', '1981-07-22', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Yasmeen Barby', '1950-06-16', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Sophronia Blabey', '1980-05-27', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Selina Mickleborough', '1975-06-23', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Travers Sheaber', '1998-09-12', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Dillie Limming', '1996-06-16', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Mick Wimpeney', '1997-01-28', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Cherice Kinchlea', '1994-10-14', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Barbie Dering', '1980-10-17', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Bernhard Cinavas', '1962-11-13', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Clementine Churm', '1983-05-09', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Nahum Peaseman', '1949-05-21', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Milo Hetterich', '1951-04-13', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Luz Bussey', '1991-01-24', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Freddi Gepson', '1987-03-06', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Bartholomeus Norsworthy', '1954-12-19', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Peggie Alldridge', '1966-07-04', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Tanner Winstone', '1987-04-05', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Celisse Helks', '1957-04-03', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Ottilie Rogier', '1999-03-28', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Ofella Durran', '1940-11-02', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Lefty Sproat', '1960-03-20', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Mathias Lavin', '1953-11-27', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Celestia Huzzey', '1983-04-16', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Corry Pinkstone', '1954-07-29', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Dorey Campos', '1977-06-29', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Kenyon Garvie', '1945-01-30', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Celle Donaway', '1961-09-08', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Lila Blowing', '1948-06-23', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Lindsey Hovenden', '1972-03-31', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Vallie MacFadzan', '1972-05-31', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Lev Davidou', '1941-02-21', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Dennison Peacher', '1983-03-19', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Gabriele Borland', '1984-12-28', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Sarena Haton', '1999-06-26', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Cariotta Ovett', '1992-02-18', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Idaline Fowley', '1982-11-18', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Clarinda O''Donohue', '1981-09-25', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Pet Oldknow', '1976-10-13', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Onfre Havvock', '1996-10-21', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Vince Curnnok', '1998-06-03', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Freddi Whitney', '1942-03-18', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Karlotte Paty', '1946-10-07', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Edgardo Jepson', '1953-03-13', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Bailie Polack', '1994-12-22', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Mano Giacovelli', '1987-07-04', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Austen Sunock', '1960-07-06', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Grantley Sline', '1969-04-16', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Panchito Maccaig', '1989-03-05', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Venus Jenik', '1992-01-27', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Nate Inchboard', '1954-04-12', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Darlene Sirr', '1961-05-17', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Cassandre Deevey', '1996-01-21', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Morley Hyatt', '1974-11-22', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Catherine Blackbourn', '1948-09-25', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Boyce Shortcliffe', '1940-12-16', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Abbie Singh', '1954-03-04', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Emmott Mocher', '1984-10-08', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Pernell Gyford', '1992-04-08', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Ethelyn Girhard', '1967-10-27', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Timoteo Jery', '1970-01-15', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Kin Filpi', '1961-04-02', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Darell Chree', '1957-01-22', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Tobit Cuncliffe', '1951-06-01', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Saw Falla', '1977-07-23', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Cathy Bickerstaffe', '1954-03-14', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Nikolas Addinall', '1993-12-06', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Daryn Aidler', '1950-11-11', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Parnell Taverner', '1996-11-30', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Alasdair Ivanenkov', '1945-01-04', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Shelby Vankeev', '1952-10-12', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Fernando Paulitschke', '1968-05-22', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Samantha Crumby', '1994-11-08', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Lovell Lockery', '1956-03-02', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Cozmo Kliement', '1980-01-27', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Arlene Sylvester', '1962-03-25', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Tam Meiklejohn', '1999-06-10', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Erv Pol', '1957-01-26', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Schuyler Mibourne', '1949-11-03', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Jaimie Pelos', '1944-09-25', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Joli Castelyn', '1958-07-04', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Leese Gligoraci', '1980-08-12', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Lou Crichmer', '1981-04-21', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Moyra Donahue', '1945-07-10', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Rey Cutmere', '1968-10-29', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Fredericka Gallemore', '1984-04-21', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Wald Mongin', '1960-04-07', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Dell Cowdroy', '1965-01-12', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Chandler Michin', '1965-08-21', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Vitoria Mayho', '1963-02-20', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Kinsley Leete', '1973-08-02', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Blane MacDavitt', '1982-01-22', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Christoper Grim', '1980-11-15', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Rahel Alp', '1961-11-03', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Sephira Bolstridge', '1966-01-30', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Neil O''Cassidy', '1974-03-08', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Braden Gobel', '1972-07-12', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Dyana Tiffney', '1990-06-12', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Meagan Jaksic', '1990-11-28', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Weylin Thrift', '1983-05-22', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Griffie Atwool', '1976-09-10', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Cissiee Wendover', '1962-12-13', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Brig Drife', '1982-07-19', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Lyndsie Calyton', '1952-04-13', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Verine Benedick', '1975-04-01', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Mendie Highway', '1996-02-28', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Gar Foulser', '1998-07-04', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Elliott Partleton', '1959-06-02', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Gill Barradell', '1969-09-11', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Hillier Eagleston', '1994-07-16', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Karina Huard', '1992-05-02', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Timmie Masden', '1977-11-23', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Pollyanna Beecroft', '1994-10-13', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Fiorenze Bog', '1944-11-04', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Elva Boyd', '1988-11-04', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Alfonso Attack', '1991-12-13', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Alberta Peverell', '1981-08-01', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Garnet Corrin', '1953-01-02', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Charles Pottinger', '1944-07-24', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Gerry Dodds', '1953-02-26', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Louis Grivori', '1947-12-27', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Meryl Leppard', '1992-02-21', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Candy Fitt', '1977-04-08', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Deeann Serginson', '1947-07-12', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Delmor Vossing', '1998-02-23', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Nicholle Allward', '1968-01-17', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Wilie Beames', '1961-03-11', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Luciano Bringloe', '1950-12-21', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Collete Janowski', '1991-10-05', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Cozmo Skillington', '1956-02-15', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Rice Riden', '1967-01-26', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Tiphany Muscroft', '1963-04-27', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Edyth Whorton', '1976-03-17', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Nixie Grocock', '1978-12-26', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Honoria Petworth', '1952-12-24', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Sammy Lancett', '1962-04-08', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Sammy Kedge', '1997-05-03', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Dean de Najera', '1961-06-23', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Tommy Eronie', '1988-05-12', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Sherman Strode', '1942-04-21', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Chelsea Bentote', '1991-08-20', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Carmita Wennington', '1952-08-20', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Kevin Venmore', '1949-09-23', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Tatiania Potkins', '1954-12-30', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Garland Harston', '1965-05-23', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Dieter Convery', '1996-10-29', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Barnard Larway', '1996-02-21', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Zonnya Verni', '1955-12-15', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Daisi Klauer', '1975-03-16', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Heath Coweuppe', '1975-10-25', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Haskel Gaskell', '1961-07-10', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Britney Westman', '1947-07-16', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Mikaela Eltringham', '1995-02-16', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Larissa Klawi', '1964-02-23', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Arlina Rustidge', '1963-06-10', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Chrystel Crooke', '1999-11-01', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Rivalee Zucker', '1942-09-28', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Melicent Stitle', '1942-08-04', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Ernaline Jankowski', '1948-01-28', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Coop Fishpoole', '1940-06-03', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Tessa Heyfield', '1956-01-11', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Dev Schottli', '1956-01-10', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Cristabel O''Lunny', '1992-06-01', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Bird Bernadzki', '1977-07-29', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Cash Jeays', '1992-07-23', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Ase Oiller', '1996-03-03', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Lorry Barks', '1980-08-07', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Alberto Padula', '1987-04-18', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Kristoffer Bateson', '1982-01-25', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Megan Challiner', '1985-01-11', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Alida Moryson', '1994-03-17', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Cherida Lawranson', '1955-11-06', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Edy Lampen', '1951-03-05', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Vasily Phinnessy', '1998-02-21', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Sheryl Heddy', '1986-05-19', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Trumaine Fairleigh', '1963-01-30', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Cad Fishburn', '1998-09-07', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Rickie Lines', '1991-05-25', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Amos Haddacks', '1957-10-22', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Brina Coate', '1985-08-08', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Lukas McGriele', '1999-06-26', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Marmaduke McMorland', '1983-06-25', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Milissent Hosburn', '1967-01-08', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Constantine Hincks', '1990-03-03', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Michell Weatherall', '1982-10-05', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Gunner Mothersole', '1958-09-07', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Benny Pool', '1982-02-10', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Ines Hearthfield', '1965-11-20', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Dela Benitti', '1977-05-27', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Gusella Goldthorp', '1954-11-07', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Maybelle Kavanagh', '1959-10-19', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Cecilia McVane', '1953-06-05', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Blair Langlais', '1953-10-31', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Tabatha Dochon', '1954-12-22', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Roseanne Aylward', '1953-03-23', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Ronica Ealden', '1945-11-25', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Aeriel Guilloud', '1984-11-09', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Rodger Hailston', '1941-07-02', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Skelly Iczokvitz', '1946-03-01', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Creighton Stucksbury', '1988-09-26', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Stephannie Milmore', '1941-03-11', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Wainwright Vallender', '1987-07-14', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Cate McAndrew', '1980-08-28', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Juana Marriot', '1999-01-02', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Ellis Bringloe', '1954-11-22', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Wolfgang Condliffe', '1967-05-29', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Leland Blunkett', '1979-12-16', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Abrahan Fradson', '1947-12-24', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Ursola Tapley', '1991-09-27', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Mendy Loudon', '1977-03-07', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Margaret Merkle', '1988-12-24', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Richy Touhig', '1953-12-23', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Sissy Dolligon', '1969-02-24', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Ardath Kirkbride', '1973-10-10', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Raddie Fransinelli', '1955-02-06', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Elane Yude', '1977-03-20', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Jessamine Najara', '1984-01-25', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Giffard Jacobovitz', '1976-03-07', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Nicolai Titchmarsh', '1993-07-13', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Jo Jiracek', '1955-06-13', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Mickie Duxbury', '1977-05-26', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Nicko Pattullo', '1943-09-04', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Russ Pitherick', '2000-01-18', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Leena Bertomeu', '1962-11-27', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Brianne Troth', '1966-04-07', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Thaddeus Bignell', '1990-09-24', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Dorolice Drinkall', '1993-03-12', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Adolf Beldum', '1986-11-05', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Isidor Charpin', '1958-02-10', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Hilliard Deekes', '1960-10-07', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Alane Tumelty', '1949-06-10', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Pavla MacCourt', '1985-09-18', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Claudius Booty', '1991-11-15', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Meghann Carlsen', '1985-05-07', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Naomi Gray', '1946-11-25', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Kahaleel Allinson', '1942-03-05', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Elspeth Maillard', '1944-07-06', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Sibel Elsom', '1988-05-19', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Koral Fluger', '1949-02-27', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Mellie Blaymires', '1983-12-30', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Gretna Gettone', '1970-02-15', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Marietta Blencowe', '1958-12-17', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Major Januszewski', '1968-10-22', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Orbadiah Wrist', '1956-03-07', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Ellyn Wardrope', '1968-05-25', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Corny De Bruyne', '1960-10-06', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Cash Gloucester', '1995-10-27', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Arlette Cone', '1973-09-30', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Steffane Hanney', '1999-01-23', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Anjanette Game', '1956-07-19', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Philip Bentjens', '1961-05-09', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Audy Mawdsley', '1965-07-27', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Constantino Kinge', '1997-10-31', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Inger Thomason', '1973-08-13', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Rolando Cansdill', '1959-01-26', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Kingston Fawks', '1952-12-14', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Eliza Bocken', '1995-12-08', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Jeanine Stenhouse', '1940-08-02', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Tandy Ritson', '1940-10-14', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Evy Lucio', '1959-05-28', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Bertha Palphramand', '1992-11-20', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Damara Maddrah', '1953-12-12', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Harlin Simmance', '1982-06-11', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Peadar Wehnerr', '1961-02-02', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Forbes Baudrey', '1999-07-31', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Dana Eustes', '1945-02-01', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Nydia Haselden', '1967-01-08', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Madelin Windrass', '1997-04-08', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Gene Jarad', '1972-12-15', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Brittni Fanton', '1956-04-04', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Cherry Giannazzi', '1969-02-20', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Albertine Male', '1950-02-05', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Nita Popping', '1967-08-22', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Angelika Stirrip', '1943-12-28', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Lora Quarton', '1959-10-10', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Sergeant Weiser', '1999-07-20', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Annora Schettini', '1989-03-06', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Delores Maving', '1993-07-26', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Maitilde Persence', '1961-06-25', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Debora Palfrie', '1958-11-29', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Timmy Kilban', '1971-08-12', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Darin Macartney', '1978-10-13', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Findley Rendle', '1967-07-22', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Alasteir Bazoge', '1956-01-21', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Hetty Dominiak', '1966-08-23', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Dyann McAvey', '1946-07-07', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Raddie Dory', '1967-12-11', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Ania Orange', '1975-01-11', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Alina Minter', '1960-06-02', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Aldwin McEllen', '1998-08-17', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Coreen Chimes', '1990-04-20', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Devonna Faulds', '1974-07-17', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Ernaline Emanson', '1966-11-03', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Rasia Rickardsson', '1994-11-22', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Winslow Ferandez', '1973-09-08', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Fred Girdlestone', '1987-03-20', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Vinnie Gors', '1966-11-04', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Paule Hatliffe', '1988-11-06', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Corene Christie', '1986-01-22', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Lynn Nuss', '1971-06-04', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Zia Worshall', '1973-03-17', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Simonette Woolpert', '1944-01-29', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Axe Fentem', '1959-01-19', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Hatti Cathee', '1943-09-25', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Staffard Guitonneau', '1949-01-11', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Daniela Jaulmes', '1959-04-04', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Robinet Orwell', '1958-09-06', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Jillene Tootal', '1944-07-30', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Mignonne Caswill', '1993-12-26', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Franky Glawsop', '1986-08-11', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Hatty Munks', '1962-03-12', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Jerrylee Sollom', '1962-08-30', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Alberta Kubis', '1993-06-28', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Mechelle Belsher', '1965-02-28', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Horten Eckh', '1995-08-27', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Kakalina Sisson', '1954-12-10', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Ivor Attwool', '1992-08-20', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Freedman Troppmann', '1979-11-14', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Rosabella Hinken', '1985-01-11', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Erny Santo', '1956-02-06', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Neda Biggans', '1957-03-29', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Willy Simson', '1954-11-23', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Isaac Dabel', '1996-03-25', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Feodor Thexton', '1994-11-24', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Natividad Putt', '1987-10-06', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Nat Shuttleworth', '1946-07-16', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Brandy Fasham', '1979-06-08', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Karlee Trinbey', '1981-02-07', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Averill Stack', '1977-05-31', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Jon Goodge', '1975-08-22', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Anny Grundle', '1948-06-14', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Burch Lude', '1973-10-05', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Bar McLaggan', '1950-02-19', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Booth Binnall', '1981-05-10', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Meredith Whissell', '1944-03-10', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Mohandis Gennerich', '1990-11-07', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Atlante Sherebrooke', '1952-08-17', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Kare Cayle', '1955-12-02', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Bird Gooddie', '1951-10-08', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Mildred Burtonshaw', '1942-09-14', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Meryl Minshaw', '1950-10-09', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Benetta Lidell', '1943-03-22', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Ronda Bycraft', '1982-03-07', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Joel Razoux', '1966-03-22', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Tedie Vogt', '1991-01-16', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Francoise McGebenay', '1957-03-15', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Karlan Kindall', '1973-08-07', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Alphonso Wavell', '1953-07-12', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Carlota Shemmans', '1994-07-26', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Estevan Madison', '1973-04-03', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Kiel McGreil', '1984-01-03', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Jaimie Waitland', '1975-11-14', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Leonardo Trusler', '1944-09-03', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Suzi Sinnock', '1973-03-20', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Johna Rizzardo', '1957-04-20', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Laughton Handmore', '1970-05-29', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Artemis Jeffreys', '1973-03-20', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Antoni Tunbridge', '1983-08-19', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Rozelle Flanagan', '1962-09-23', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Seumas Joice', '1992-12-26', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Spike Eastop', '1950-01-09', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Shalna Crebbin', '1970-02-21', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Deena Stirgess', '1967-08-04', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Davidson Varfolomeev', '1940-07-08', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Elysha Guyton', '1986-08-13', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Konstantine Froggatt', '1947-06-26', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Sebastiano Nizard', '1954-02-14', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Milly Yude', '1957-11-13', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Anett Vockins', '1996-08-18', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Westbrooke Gages', '1975-05-15', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Hunt Sanderson', '1979-07-08', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Karlen Liepina', '1968-10-06', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Kaitlyn Ebi', '1941-03-31', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Ebony Lodo', '1946-04-13', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Colline Swynley', '1951-10-06', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Tab Debrick', '1989-02-04', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Farlay Arpur', '1955-11-23', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Berny Pakeman', '1952-10-19', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Slade Beausang', '1999-01-31', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Geneva Kightly', '1960-09-12', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Denni Wellan', '1985-12-21', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Kain Cosin', '1983-06-02', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Titos Shotter', '1940-12-24', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Paulo Wevell', '1954-08-01', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Kingston Ledward', '1972-09-21', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Ardine Scritch', '1964-11-06', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Shani Messager', '1984-07-07', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Pauline Taffee', '1969-06-17', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Olav Aspy', '1965-08-11', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Ab Connachan', '1966-01-27', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Philippe Woodham', '1971-10-12', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Celinka Couth', '1998-10-13', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Loise Pitceathly', '1973-02-06', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Emlyn Muddiman', '1953-10-29', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Talbot St. Paul', '1984-09-03', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Lev Jennings', '1962-11-07', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Jaymie Colquyte', '1967-06-20', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Isis Sitford', '1973-12-26', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Chris Wombwell', '1989-03-13', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Kayle Danby', '1977-11-28', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Astra Frickey', '1987-10-27', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Beverie Jopling', '1992-10-29', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Tann Darleston', '1969-01-30', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Kyle Blackney', '1987-07-01', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Natalina Rowden', '1964-10-18', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Madelin Puig', '1976-06-17', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Peg Beardwell', '1950-01-17', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Boot Capes', '1995-04-22', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Christel Conner', '1956-10-23', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Clemence Appleyard', '1952-12-08', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Tuck Tunna', '1962-06-20', 'Bucharest');
insert into Customers (Name, BirthDate, Location) values ('Perceval Itzhayek', '1991-05-01', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Port Jacson', '1968-08-01', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Romeo Brimfield', '1952-06-13', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Shelby Kealy', '1978-08-04', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Carey Silverthorn', '1953-05-23', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Abbi Strettle', '1990-10-28', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Elva Kennally', '1945-12-18', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Jarrad Harpham', '1993-10-08', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Meggi Coombes', '1974-10-15', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Germain Maynell', '1945-05-07', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Kissiah Wolford', '1946-10-05', 'Brasov');
insert into Customers (Name, BirthDate, Location) values ('Michale Normanell', '1968-07-24', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Carrissa Korn', '1997-07-06', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Edouard Bridgens', '1960-03-08', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Chrissie Lartice', '1967-07-23', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Jasun Godsell', '1999-02-19', 'Craiova');
insert into Customers (Name, BirthDate, Location) values ('Vivyan Sailor', '1946-04-14', 'Chernivtsi');
insert into Customers (Name, BirthDate, Location) values ('Gordon Teesdale', '1958-11-28', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Brockie Lawford', '1996-10-31', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Arlette Dyers', '1988-05-12', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Camel Simond', '1983-05-02', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Dalia Shippard', '1986-03-07', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Marna Bitcheno', '1965-06-15', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Baird Conkling', '1975-11-05', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Lazarus Redgate', '1979-12-21', 'Ivano-Frankivsk');
insert into Customers (Name, BirthDate, Location) values ('Carly Maty', '1983-01-22', 'Cluj-Napoja');
insert into Customers (Name, BirthDate, Location) values ('Elwyn Ortes', '1999-09-08', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Annabell Thrustle', '1991-09-30', 'Suceava');
insert into Customers (Name, BirthDate, Location) values ('Eachelle Finnan', '1960-10-25', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Granny Upstone', '1981-03-23', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Daffy Robic', '1989-02-14', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Kanya McLemon', '1963-01-10', 'Florianopolis');
insert into Customers (Name, BirthDate, Location) values ('Rube Battams', '1967-12-06', 'Rio de Janeiro');
insert into Customers (Name, BirthDate, Location) values ('Aguste Klosterman', '1988-01-14', 'Porto Alegre');
insert into Customers (Name, BirthDate, Location) values ('Hewe Ronchetti', '1952-01-30', 'İzmir');
insert into Customers (Name, BirthDate, Location) values ('Jeremiah Satteford', '1992-07-14', 'Brasov');

insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('BP 59 GCM', 'Econoline E350', 'Ford', 408.04);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('JA 97 ZFS', '929', 'Mazda', 329.58);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('VL 91 GVQ', 'Galant', 'Mitsubishi', 84.91);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('EY 09 VKW', '4Runner', 'Toyota', 195.93);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('UQ 06 RBI', 'CL', 'Acura', 448.4);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('UP 92 HGE', 'Laser', 'Ford', 90.84);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('SB 29 LRL', 'Fiero', 'Pontiac', 447.89);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('QL 92 VYC', 'Express 3500', 'Chevrolet', 280.23);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('TB 64 ODA', 'Esprit', 'Lotus', 311.85);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('MF 10 SLY', 'G-Series 2500', 'Chevrolet', 323.6);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('PG 82 UGB', 'Optima', 'Kia', 371.87);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('BL 98 TAX', 'Bonneville', 'Pontiac', 440.79);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('OU 12 ZDS', 'RX-7', 'Mazda', 452.06);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('HO 61 FRO', 'Expo', 'Mitsubishi', 308.68);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('CV 12 KCP', 'MR2', 'Toyota', 62.75);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('GL 17 LLI', 'Sonata', 'Hyundai', 50.41);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('DA 98 LFG', 'Cayenne', 'Porsche', 65.12);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('SS 41 ZNC', 'Leaf', 'Nissan', 98.9);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('CW 25 VSR', 'Aurora', 'Oldsmobile', 171.95);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('ZS 72 BXO', 'Suburban 2500', 'GMC', 393.63);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('HB 38 DRC', 'MDX', 'Acura', 75.48);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('HD 68 LRU', 'GX', 'Lexus', 122.34);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('TK 18 BXD', '2500 Club Coupe', 'GMC', 284.47);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('NE 27 MWD', 'Thunderbird', 'Ford', 162.61);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('NY 89 MGP', '9-7X', 'Saab', 465.53);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('MN 92 VKG', 'Accord', 'Honda', 143.72);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('RV 95 OAN', 'Montana', 'Pontiac', 393.55);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('NW 24 UEA', 'Titan', 'Nissan', 476.08);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('ZV 70 ITU', 'G6', 'Pontiac', 120.68);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('GL 20 MNW', 'Z4 M', 'BMW', 298.67);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('XN 24 SOA', 'Dakota', 'Dodge', 455.21);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('GT 73 SPT', 'Hombre', 'Isuzu', 438.1);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('RM 24 YLI', 'Altima', 'Nissan', 110.51);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('KB 14 RAR', 'Escape', 'Ford', 194.15);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('XE 71 LWZ', 'A8', 'Audi', 447.04);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('ZA 07 IXI', 'G25', 'Infiniti', 146.68);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('UM 71 CJM', '350Z', 'Nissan', 478.5);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('RF 62 URZ', 'X5', 'BMW', 418.98);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('IP 14 ZJW', 'Windstar', 'Ford', 107.06);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('VQ 94 XHK', 'Voyager', 'Plymouth', 186.61);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('PD 06 MYJ', 'G-Class', 'Mercedes-Benz', 432.17);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('WW 83 EJZ', 'SSR', 'Chevrolet', 296.21);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('OQ 97 WOY', 'S-Class', 'Mercedes-Benz', 199.62);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('TU 23 KBG', 'IS', 'Lexus', 495.39);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('NX 99 EMF', 'Voyager', 'Chrysler', 485.0);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('CG 18 HOE', 'Caprice', 'Chevrolet', 63.45);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('CS 06 ZVM', 'Yukon XL 1500', 'GMC', 307.59);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('HS 76 LFE', 'tC', 'Scion', 360.79);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('FU 51 SRN', 'Ram 1500', 'Dodge', 326.32);
insert into Cars (Plate, Model, Manufacturer, PricePerDay) values ('BR 91 YZE', 'Eclipse', 'Mitsubishi', 414.75);
GO

-- End of file.

