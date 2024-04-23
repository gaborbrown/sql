Select * FROM Vendeg

CREATE user proba without login
grant select on Vendeg to proba
execute as user = 'proba'
select * From Vendeg
revert
Select *From Vendeg