--DCL (Data Control Language)
alter user hr identified by hr;
alter user hr account unlock;

create user hr2 identified by hr2;
grant connect, resource to hr2;
