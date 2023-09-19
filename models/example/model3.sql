

select
  MONTH,
  "1958",
  "1959",
  "1960",
  case when row_number() over (order by MONTH) > 1 then "1958" + "1959" + "1960" else null end as col5
from {{ ref('airtravel') }}