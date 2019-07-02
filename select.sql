# 1.查询同时存在1课程和2课程的情况
select studentId from student_course
  where courseId=1 and
    studentId in(select studentId from student_course
                   where courseId=2);
# 2.查询同时存在1课程和2课程的情况
select studentId from student_course
  where courseId=1 and
    studentId in(select studentId from student_course
                   where courseId=2);
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select id,name,cast(avg(score)as decimal(18,1)) avgscore
      from student,student_course sc
           where student.id=sc.studentId
                group by id,name
                      having avgscore>=60;
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select id,name,
     from student left join student_course sc
          where student.id=sc.studentId
                group by id,name
                    having ifnull(cast(avg(score)as decimal(18,1)),0)=0.0;                     
# 5.查询所有有成绩的SQL
select id,name,
     from student left join student_course sc
          where student.id=sc.studentId
                group by id,name
                    having ifnull(cast(avg(score)as decimal(18,1)),0)>0.0; 
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select *
     from student,student_course sc1,student_course sc2
         where  student.id=sc1.studentId and
              sc1.courseId='1' and
                sc2.courseId='2';
# 7.检索1课程分数小于60，按分数降序排列的学生信息
 select *
     from student,student_course sc1
        courseId='1' and  score<60 
            order by score desc;                          
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select id,name,cast(avg(score)as decimal(18,1)) avgscore
        from course,student_course sc 
             where course.id=sc.courseId
                   group by id,name
                      order by avgscore desc,id asc;
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select stu.name,score
   from student stu,course cou,student_course sc
       where  stu.id=sc.studentId and   
              sc.courseId=cou.id  and
              cou.name='数学' and
              score<60;                           
