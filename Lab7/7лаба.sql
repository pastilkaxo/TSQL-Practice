-- 1: 

use UNIVER;

select GROUPS.FACULTY , PROFESSION.PROFESSION_NAME, PROGRESS.SUBJECT , avg(PROGRESS.NOTE) [�������]
from  PROFESSION
inner join GROUPS   on PROFESSION.PROFESSION = GROUPS.PROFESSION and PROFESSION.PROFESSION_NAME like '�%'
inner join STUDENT  on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
group by rollup (GROUPS.FACULTY , PROGRESS.SUBJECT,PROFESSION.PROFESSION_NAME)




-- 2:

use UNIVER;

select GROUPS.FACULTY , PROFESSION.PROFESSION_NAME, PROGRESS.SUBJECT , avg(PROGRESS.NOTE) [�������]
from  PROFESSION
inner join GROUPS   on PROFESSION.PROFESSION = GROUPS.PROFESSION and PROFESSION.PROFESSION_NAME like '�%'
inner join STUDENT  on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
group by cube (GROUPS.FACULTY , PROGRESS.SUBJECT,PROFESSION.PROFESSION_NAME)


-- 3,4:
select GROUPS.FACULTY , PROFESSION.PROFESSION_NAME, PROGRESS.SUBJECT , avg(PROGRESS.NOTE) [�������]
from  PROFESSION
inner join GROUPS   on PROFESSION.PROFESSION = GROUPS.PROFESSION and PROFESSION.PROFESSION_NAME like '��%'
inner join STUDENT  on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
group by GROUPS.FACULTY , PROGRESS.SUBJECT,PROFESSION.PROFESSION_NAME
union
select GROUPS.FACULTY , PROFESSION.PROFESSION_NAME, PROGRESS.SUBJECT , avg(PROGRESS.NOTE) [�������]
from  PROFESSION
inner join GROUPS   on PROFESSION.PROFESSION = GROUPS.PROFESSION and PROFESSION.PROFESSION_NAME like '��%'
inner join STUDENT  on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
group by GROUPS.FACULTY , PROGRESS.SUBJECT,PROFESSION.PROFESSION_NAME
intersect
select GROUPS.FACULTY , PROFESSION.PROFESSION_NAME, PROGRESS.SUBJECT , avg(PROGRESS.NOTE) [�������]
from  PROFESSION
inner join GROUPS   on PROFESSION.PROFESSION = GROUPS.PROFESSION and PROFESSION.PROFESSION_NAME like '��%'
inner join STUDENT  on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
group by GROUPS.FACULTY , PROGRESS.SUBJECT,PROFESSION.PROFESSION_NAME
union all
select GROUPS.FACULTY , PROFESSION.PROFESSION_NAME, PROGRESS.SUBJECT , avg(PROGRESS.NOTE) [�������]
from  PROFESSION
inner join GROUPS   on PROFESSION.PROFESSION = GROUPS.PROFESSION and PROFESSION.PROFESSION_NAME like '��%'
inner join STUDENT  on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
group by  GROUPS.FACULTY , PROGRESS.SUBJECT,PROFESSION.PROFESSION_NAME

-- 5:

select GROUPS.FACULTY , PROFESSION.PROFESSION_NAME, PROGRESS.SUBJECT , avg(PROGRESS.NOTE) [�������]
from  PROFESSION
inner join GROUPS   on PROFESSION.PROFESSION = GROUPS.PROFESSION and PROFESSION.PROFESSION_NAME like '��%'
inner join STUDENT  on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
group by GROUPS.FACULTY , PROGRESS.SUBJECT,PROFESSION.PROFESSION_NAME
union
select GROUPS.FACULTY , PROFESSION.PROFESSION_NAME, PROGRESS.SUBJECT , avg(PROGRESS.NOTE) [�������]
from  PROFESSION
inner join GROUPS   on PROFESSION.PROFESSION = GROUPS.PROFESSION and PROFESSION.PROFESSION_NAME like '��%'
inner join STUDENT  on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
group by GROUPS.FACULTY , PROGRESS.SUBJECT,PROFESSION.PROFESSION_NAME
except
select GROUPS.FACULTY , PROFESSION.PROFESSION_NAME, PROGRESS.SUBJECT , avg(PROGRESS.NOTE) [�������]
from  PROFESSION
inner join GROUPS   on PROFESSION.PROFESSION = GROUPS.PROFESSION and PROFESSION.PROFESSION_NAME like '��%'
inner join STUDENT  on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
group by GROUPS.FACULTY , PROGRESS.SUBJECT,PROFESSION.PROFESSION_NAME
union all
select GROUPS.FACULTY , PROFESSION.PROFESSION_NAME, PROGRESS.SUBJECT , avg(PROGRESS.NOTE) [�������]
from  PROFESSION
inner join GROUPS   on PROFESSION.PROFESSION = GROUPS.PROFESSION and PROFESSION.PROFESSION_NAME like '��%'
inner join STUDENT  on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
group by  GROUPS.FACULTY , PROGRESS.SUBJECT,PROFESSION.PROFESSION_NAME


-- 7 DOP: 

/*���������� ���������� ��������� � ������ ������, �� ������ ���������� � ����� � ������������ ����� ��������. */

select count(distinct IDSTUDENT)[���-��] , GROUPS.IDGROUP , FACULTY.FACULTY 
from STUDENT
inner join GROUPS on GROUPS.IDGROUP = STUDENT.IDGROUP
inner join FACULTY on FACULTY.FACULTY = GROUPS.FACULTY
group by rollup(FACULTY.FACULTY,GROUPS.IDGROUP)

/*���������� ���������� ��������� �� ����� � ��������� ����������� � �������� � ����� ����� ��������.*/

select count(AUDITORIUM.AUDITORIUM)[���������� ���������]  ,AUDITORIUM_TYPE.AUDITORIUM_TYPE, sum(AUDITORIUM.AUDITORIUM_CAPACITY) [��������� �����������] 
from AUDITORIUM_TYPE
full join AUDITORIUM  on AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE 
group by rollup(AUDITORIUM_TYPE.AUDITORIUM_TYPE)



