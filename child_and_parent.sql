
select fk.name as ForeignKeyName,
        object_name(fk.parent_object_id) as child,
        object_name(fk.referenced_object_id) as parent,
        col1.name as parentcolumn,
        col2.name as childcolumn
from sys.foreign_keys fk

inner join
    sys.foreign_key_columns fkc on fk.object_id = fkc.constraint_object_id
inner join 
    sys.columns col1 on fkc.referenced_object_id = col1.object_id
     and fkc.referenced_column_id = col1.column_id
inner join 
    sys.columns col2 on fkc.parent_object_id = col2.object_id
    and fkc.parent_column_id = col2.column_id;
