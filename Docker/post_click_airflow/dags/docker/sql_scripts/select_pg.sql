select id, attribute1, COALESCE(valid_from_dttm, '2100-01-01'), COALESCE(valid_to_dttm, '2100-01-01')
from s1;