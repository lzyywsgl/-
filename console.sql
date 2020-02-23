# 1、查找最晚入职员工的所有信息
select *
from employees
where hire_date =
      (select max(hire_date) from employees);

# 2、查找所有已经分配部门的员工的last_name和first_name
select e.last_name, e.first_name, d.dept_no
from employees as e
         inner join dept_emp as d
where e.emp_no = d.emp_no;

select e.last_name, e.first_name, d.dept_no
from employees as e
         natural join dept_emp as d
where e.emp_no = d.emp_no;

# 3、查找入职员工时间排名倒数第三的员工所有信息
select emp_no, birth_date, first_name, last_name, gender, hire_date
from employees
order by hire_date desc
limit 2,1;

# 4、查找当前薪水详情以及部门编号dept_no
select salaries.emp_no, salaries.salary, salaries.from_date, salaries.to_date, dept_manager.dept_no
from salaries,
     dept_manager
where salaries.emp_no = dept_manager.emp_no
  and salaries.to_date = '9999-01-01'
  and dept_manager.to_date = '9999-01-01';

select employees.emp_no,
       birth_date,
       first_name,
       last_name,
       gender,
       hire_date,
       dept_no,
       dept_manager.emp_no,
       dept_manager.from_date,
       dept_manager.to_date,
       salaries.emp_no,
       salary,
       salaries.from_date,
       salaries.to_date
from employees,
     dept_manager,
     salaries;

# 5、查找所有员工的last_name和first_name以及对应部门编号dept_no
select e.last_name, e.first_name, d.dept_no
from employees as e
         left join dept_emp as d
                   on e.emp_no = d.emp_no;

# 6、查找所有员工入职时候的薪水情况
select e.emp_no, s.salary
from employees as e
         left join salaries as s
                   on e.emp_no = s.emp_no
                       and e.hire_date = s.from_date
order by e.emp_no desc;

# 7、查找薪水涨幅超过15次的员工号emp_no以及其对应的涨幅次数t
select emp_no, count(salary) as t
from salaries
group by emp_no
having t > 15;

# 8、找出所有员工当前薪水salary情况
select salary
from salaries
where to_date = '9999-01-01'
group by salary
order by salary desc;

# 9、获取所有部门当前manager的当前薪水情况，给出dept_no, emp_no以及salary，当前表示to_date='9999-01-01'
select d.dept_no, d.emp_no, s.salary
from dept_manager as d
         inner join
     salaries as s
     on d.emp_no = s.emp_no
         and d.to_date = '9999-01-01'
         and s.to_date = '9999-01-01';

# 10、获取所有非manager的员工emp_no
select e.emp_no
from dept_manager as d
         right join employees as e on d.emp_no = e.emp_no
where d.dept_no is null;

select emp_no
from employees
where emp_no not in (select emp_no from dept_manager);

# 11、获取所有员工当前的manager
select e.emp_no, d.emp_no as manager_no
from dept_emp as e
         inner join dept_manager as d
                    on e.dept_no = d.dept_no
where d.to_date = '9999-01-01'
  and e.emp_no <> d.emp_no;

# 12、获取所有部门中当前员工薪水最高的相关信息
select d.dept_no, d.emp_no, MAX(salary) as salary
from dept_emp as d
         inner join salaries as s
                    on d.emp_no = s.emp_no
                        and d.to_date = '9999-01-01'
group by dept_no;

# 13、从titles表获取按照title进行分组
select title, count(emp_no) as t
from titles
group by title
having t >= 2;

# 14、从titles表获取按照title进行分组，注意对于重复的emp_no进行忽略
select title, count(distinct emp_no) AS T
FROM titles
group by title
having t >= 2;

# 15、查找employees表所有emp_no为奇数，且last_name不为Mary的员工信息，并按照hire_date逆序排列
select emp_no, birth_date, first_name, last_name, gender, hire_date
from employees
where mod(emp_no, 2) = 1
  and last_name != 'Mary'
order by hire_date desc;

# 16、统计出当前各个title类型对应的员工当前薪水对应的平均工资
select title, avg(salary) as avg
from titles
         inner join salaries on titles.emp_no = salaries.emp_no
where titles.to_date = '9999-01-01'
  and salaries.to_date = '9999-01-01'
group by title;

# 17、获取当前薪水第二多的员工的emp_no以及其对应的薪水salary
select emp_no, salary
from salaries
where to_date = '9999-01-01'
order by salary desc
limit 1,1;

# 18、查找当前薪水(to_date='9999-01-01')排名第二多的员工编号emp_no、薪水salary、last_name以及first_name，不准使用order by
select e.emp_no, MAX(salary) as salary, e.last_name, e.first_name
from employees as e
         inner join salaries as s
                    on e.emp_no = s.emp_no
where s.to_date = '9999-01-01'
  and s.salary not in (select MAX(salary) from salaries where s.to_date = '9999-01-01');

# 19、查找所有员工的last_name和first_name以及对应的dept_name
select last_name, first_name, dept_name
from (employees as e
    left join dept_emp as d on e.emp_no = d.emp_no)
         left join departments on d.dept_no = departments.dept_no;

# 20、查找员工编号emp_no为10001其自入职以来的薪水salary涨幅值growth
select (max(salary) - min(salary)) as growth
from salaries
where emp_no = '10001';

# 21、查找所有员工自入职以来的薪水涨幅情况，给出员工编号emp_no以及其对应的薪水涨幅growth，并按照growth进行升序
select e.emp_no, (b.salary - c.salary) as growth
from employees as e
         inner join salaries as b on e.emp_no = b.emp_no and b.to_date = '9999-01-01'
         inner join salaries as c on e.emp_no = c.emp_no and c.from_date = e.hire_date
order by growth;

# 22、统计各个部门对应员工涨幅的次数总和
select de.dept_no, dp.dept_name, count(salary) as sum
from departments as dp
         inner join dept_emp as de on dp.dept_no = de.dept_no
         inner join salaries as sa on de.emp_no = sa.emp_no
group by dp.dept_no;

# 23、对所有员工的当前(to_date='9999-01-01')薪水按照salary进行按照1-N的排名，相同salary并列且按照emp_no升序排列
select s1.emp_no, s1.salary, COUNT(distinct s2.salary) as ranks
from salaries as s1,
     salaries as s2
where s1.to_date = '9999-01-01'
  and s2.to_date = '9999-01-01'
  and s1.salary <= s2.salary
group by s1.emp_no
order by s1.salary
    desc, s1.emp_no;

# 24、获取所有非manager员工当前的薪水情况，给出dept_no、emp_no以及salary ，当前表示to_date='9999-01-01'
select b.dept_no, a.emp_no, d.salary
from employees as a
         left join dept_emp as b on a.emp_no = b.emp_no
         left join dept_manager as c on b.emp_no = c.emp_no
         left join salaries as d on a.emp_no = d.emp_no
where c.dept_no is null
  and d.to_date = '9999-01-01'
  and b.to_date = '9999-01-01';

select d.dept_no, s.emp_no, s.salary
from dept_emp as d
         join salaries as s on d.emp_no = s.emp_no
where s.to_date = '9999-01-01'
  and d.to_date = '9999-01-01'
  and s.emp_no not in (
    select emp_no
    from dept_manager
);

# 25、获取员工其当前的薪水比其manager当前薪水还高的相关信息，当前表示to_date='9999-01-01'
SELECT de.emp_no,
       dm.emp_no  manager_no,
       sa.salary  emp_salary,
       sal.salary manager_salary
FROM dept_emp de,
     salaries sa,
     dept_manager dm,
     salaries sal
WHERE de.emp_no = sa.emp_no
  AND dm.emp_no = sal.emp_no
  AND de.dept_no = dm.dept_no
  AND de.to_date = '9999-01-01'
  AND sa.to_date = '9999-01-01'
  AND dm.to_date = '9999-01-01'
  AND sal.to_date = '9999-01-01'
  AND sa.salary > sal.salary;

SELECT A.emp_no,
       B.emp_no AS manager_no,
       A.salary AS emp_salary,
       B.salary AS manager_salary
FROM (SELECT s.emp_no, s.salary, d.dept_no
      FROM salaries s
               INNER JOIN dept_emp d ON s.emp_no = d.emp_no AND s.to_date = '9999-01-01'
          AND d.to_date = '9999-01-01') A, -- 普通员工薪水表(包含管理者)
     (SELECT s.emp_no, s.salary, de.dept_no
      FROM salaries s
               INNER JOIN dept_manager de ON s.emp_no = de.emp_no AND s.to_date = '9999-01-01'
          AND de.to_date = '9999-01-01') B -- 管理人员薪水表
WHERE A.dept_no = B.dept_no
  AND A.salary > B.salary;

# 26、 汇总各个部门当前员工的title类型的分配数目，结果给出部门编号dept_no、dept_name、其当前员工所有的title以及该类型title对应的数目count
select de.dept_no, dm.dept_name, tl.title, count(tl.title) as count
from dept_emp as de
         inner join titles as tl on de.emp_no = tl.emp_no and de.to_date = '9999-01-01' and tl.to_date = '9999-01-01'
         inner join departments as dm on dm.dept_no = de.dept_no
group by de.dept_no, tl.title;


# 27、给出每个员工每年薪水涨幅超过5000的员工编号emp_no、薪水变更开始日期from_date以及薪水涨幅值salary_growth，并按照salary_growth逆序排列
select s2.emp_no, s2.from_date, (s2.salary - s1.salary) as salary_growth
from salaries as s1,
     salaries as s2
where s2.emp_no = s1.emp_no
    and (s2.salary - s1.salary) > 5000
    and date_format(s2.to_date, '%Y') - date_format(s1.to_date, '%Y') = 1
   or date_format(s2.from_date, '%Y') - date_format(s1.from_date, '%Y') = 1
order by salary_growth desc;


