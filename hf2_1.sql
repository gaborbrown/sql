ALTER table Vendeg
Alter COLUMN szul_dat
ADD masked WITH (function = 'datetime("YM")')