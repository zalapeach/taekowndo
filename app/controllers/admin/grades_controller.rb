class Admin::GradesController < Admin::BaseController
  def index
    @grades = Grade.order(
      "CASE
       WHEN name = '10mo Kup' THEN 1 WHEN name = '9no Kup' THEN 2
       WHEN name = '8vo Kup' THEN 3 WHEN name = '7mo Kup' THEN 4
       WHEN name = '6to Kup' THEN 5 WHEN name = '5to Kup' THEN 6
       WHEN name = '4to Kup' THEN 7 WHEN name = '3er Kup' THEN 8
       WHEN name = '2do Kup' THEN 9 WHEN name = '1er Kup' THEN 10
       WHEN name = '1er Poom' THEN 11 WHEN name = '2do Poom' THEN 12
       WHEN name = '3er Poom' THEN 13 WHEN name = '1er Dan' THEN 14
       WHEN name = '2do Dan' THEN 15 WHEN name = '3er Dan' THEN 16
       WHEN name = '4to Dan' THEN 17 WHEN name = '5to Dan' THEN 18
       WHEN name = '6to Dan' THEN 19 WHEN name = '7mo Dan' THEN 20
       WHEN name = '8vo Dan' THEN 21 WHEN name = '9no Dan' THEN 22
       END")
  end
end
