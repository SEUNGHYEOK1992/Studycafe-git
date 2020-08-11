<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="uft-8" >
        <title> 예약 </title>
        <style>

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
            html, body{
                font-family: 'Noto Sans KR', sans-serif;
            margin: 0px;
            box-sizing: border-box;
            padding: 0;
            height: 1300px;
            }

            #header{
            width: 100%;   
            height: 150px;
            background-color: #333;
         }
         #top_navi {   
            list-style-type: none;
            position: absolute;
            top: 70px;
            left: 550px;
         }
         #top_navi li{
            float: left;
            margin-right: 50px;
         }
         #top_navi li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 25px;
         }
         #top_navi li a:hover {
            color: rgb(248, 248, 90);
         }
         #log{
            float: right;
            font-size: 20px;
            margin-top: 80px;
            margin-right: 30px;
         }
         #log a{
            color: white;   
            text-decoration: none;
         }


            #roomImg{
                margin-left: 100px;
                margin-top: 100px;
                height: 400px;
                width: 700px;
                background-color: rgb(185, 185, 185);
            }

            /* ------------------------ Calendar  --------------------------------------------- */


            *, *:before, *:after {
            box-sizing: inherit;
            }
            .clearfix:after {
            content: '';
            display: block;
            clear: both;
            float: left;
            }

            /* ======== Calendar ======== */
            .my-calendar {
            width: 600px;
            height: 300px;
            margin: 30px;
            padding: 20px 20px 10px;
            text-align: center;
            font-weight: 800;
            border: 1px solid #ddd;
            cursor: default;
            }
            .my-calendar .clicked-date {
            border-radius: 25px;
            margin-top: 40px;
            float: left;
            width: 30%;
            height: 200px;
            padding: 46px 0 26px;
            background: #ddd;
            }
            .my-calendar .calendar-box {
            float: right;
            width: 68%;
            padding-left: 30px;
            }

            .clicked-date .cal-day {
            font-size: 24px;
            }
            .clicked-date .cal-date {
            font-size: 60px;
            }

            .ctr-box {
            padding: 0 16px;
            margin-bottom: 20px;
            font-size: 20px;
            }
            .ctr-box .btn-cal {
            position: relative;
            float: left;
            width: 25px;
            height: 25px;
            margin-top: 5px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            background: none;
            }
            .ctr-box .btn-cal:after {
            content: '<';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            line-height: 25px;
            font-weight: bold;
            font-size: 20px;
            }
            .ctr-box .btn-cal.next {
            float: right;
            }
            .ctr-box .btn-cal.next:after {
            content: '>';
            }

            .cal-table {
            width: 100%;
            }
            .cal-table th {
            width: 14.2857%;
            padding-bottom: 5px;
            font-size: 16px;
            font-weight: 900;
            }
            .cal-table td {
            padding: 3px 0;
            height: 30px;
            font-size: 15px;
            vertical-align: middle;
            }
            .cal-table td.day {
            
            text-align: center;
            position: relative;
            cursor: pointer;
            }
            .cal-table td.today {
            background: #ffd255;
            color: #fff;
            }
            .cal-table td.day-active {
            background: #ff8585;
            color: #fff;
            }
            .cal-table td.has-event:after {
            content: '';
            display: block;
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 4px;
            background: #FFC107;
            }

            /* ------------------- scroll  -------------------- */

            .box{max-width:560px; width:100%; height:100px; border:1px solid #ccc; margin-left: 1100px; position: absolute; margin-top: -200px;}

            #tab{
                margin-top: 0px;
            }

            #tab ul{white-space:nowrap; overflow-x: auto; text-align:center; margin-top: 40px; margin-right: 20px;}

            #tab ul li{display:inline-block; background: #ccc; margin-bottom: 5px;}
        </style>
        
    </head>



    <body>

        <div id="header">
            <div id="top_logo">
               <img src=""/>
            </div>
            <div>
            <ul id="top_navi">
               <li><a href="#">스터디룸 소개</a></li>
               <li><a href="#">예약하기</a></li>
               <li><a href="#">자유게시판</a></li>
               <li><a href="./rvlist">후기게시판</a></li>
               <li><a href="./ask">고객센터</a></li>
            </ul>
            </div>
            <div id="log"><a href="#">로그인/회원가입</a></div>  
         </div>
      

        <div id="roomImg">

        </div>


        <div style="margin-left: 1200px; margin-top: -300px;">
            <input type="button" id="set1" onclick="change1()" value="강의실 (4인) 2500(원)" style="background-color: white; border: 5px solid white; font-size: 18px;"> <br><br>
            <input type="button" id="set2" onclick="change2()" value="강의실 (8인) 2500(원)" style="background-color: white; border: 5px solid white; font-size: 18px;"> <br><br>
            <input type="button" id="set3" onclick="change3()" value="강의실 (10인) 2500(원)" style="background-color: white; border: 5px solid white; font-size: 18px;"> <br><br>
            <input type="button" id="set4" onclick="change4()" value="강의실 (20인) 2500(원)" style="background-color: white; border: 5px solid white; font-size: 18px;"> 
            
        </div>
        

        <div class="reserv">


        </div>


        <div class="container" style="margin-top: 200px; margin-left: 70px;">
            <div class="my-calendar clearfix">
              <div class="clicked-date">
                <div class="cal-day"></div>
                <div class="cal-date"></div>
              </div>
              <div class="calendar-box">
                <div class="ctr-box clearfix">
                  <button type="button" title="prev" class="btn-cal prev">
                  </button>
                  <span class="cal-month"></span>
                  <span class="cal-year"></span>
                  <button type="button" title="next" class="btn-cal next">
                  </button>
                </div>
                <table class="cal-table">
                  <thead>
                    <tr>
                      <th>S</th>
                      <th>M</th>
                      <th>T</th>
                      <th>W</th>
                      <th>T</th>
                      <th>F</th>
                      <th>S</th>
                    </tr>
                  </thead>
                  <tbody class="cal-body"></tbody>
                </table>
              </div>
            </div>
            <!-- // .my-calendar -->
          </div>

          <div class="box">
            <div id="tab">
              <ul>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
                <li class="timeSet" style="margin-right: -5px; background-color: gray; list-style: none; height: 30px; width: 50px;  border-right: 1px solid white; "> </li>
          
              </ul>
            </div>
          </div>

          <div style="margin-left: 1200px;"> 

            <input type="button" value="취소" style="width: 50px; height: 30px; cursor: pointer; background-color: white; border: 1px solid black;">
            <input type="button" value="예약" style="width: 50px; height: 30px; cursor: pointer; background-color: white; border: 1px solid black;">
            <input type="button" value="예약내역 확인" style="width: 100px; height: 30px; cursor: pointer; background-color: white; border: 1px solid black;">

          </div>


        
    </body>

    <script>

        /* ---------------- img change ------------------ */

        function change1() {
            document.getElementById('roomImg').style.backgroundColor="black";
        };

        function change2() {
            document.getElementById('roomImg').style.backgroundColor="white";
        };

        function change3() {
            document.getElementById('roomImg').style.backgroundColor="red";
        };

        function change4() {
            document.getElementById('roomImg').style.backgroundColor="blue";
        };





         const init = {
            monList: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
            dayList: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
            today: new Date(),
            monForChange: new Date().getMonth(),
            activeDate: new Date(),
            getFirstDay: (yy, mm) => new Date(yy, mm, 1),
            getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
            nextMonth: function () {
                let d = new Date();
                d.setDate(1);
                d.setMonth(++this.monForChange);
                this.activeDate = d;
                return d;
            },
            prevMonth: function () {
                let d = new Date();
                d.setDate(1);
                d.setMonth(--this.monForChange);
                this.activeDate = d;
                return d;
            },
            addZero: (num) => (num < 10) ? '0' + num : num,
            activeDTag: null,
            getIndex: function (node) {
                let index = 0;
                while (node = node.previousElementSibling) {
                index++;
                }
                return index;
            }
            };

            const $calBody = document.querySelector('.cal-body');
            const $btnNext = document.querySelector('.btn-cal.next');
            const $btnPrev = document.querySelector('.btn-cal.prev');

            /**
            * @param {number} date
            * @param {number} dayIn
            */
            function loadDate (date, dayIn) {
            document.querySelector('.cal-date').textContent = date;
            document.querySelector('.cal-day').textContent = init.dayList[dayIn];
            }

            /**
            * @param {date} fullDate
            */
            function loadYYMM (fullDate) {
            let yy = fullDate.getFullYear();
            let mm = fullDate.getMonth();
            let firstDay = init.getFirstDay(yy, mm);
            let lastDay = init.getLastDay(yy, mm);
            let markToday;  // for marking today date
            
            if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
                markToday = init.today.getDate();
            }

            document.querySelector('.cal-month').textContent = init.monList[mm];
            document.querySelector('.cal-year').textContent = yy;

            let trtd = '';
            let startCount;
            let countDay = 0;
            for (let i = 0; i < 6; i++) {
                trtd += '<tr>';
                for (let j = 0; j < 7; j++) {
                if (i === 0 && !startCount && j === firstDay.getDay()) {
                    startCount = 1;
                }
                if (!startCount) {
                    trtd += '<td>'
                } else {
                    let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
                    trtd += '<td class="day';
                    trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
                    trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
                }
                trtd += (startCount) ? ++countDay : '';
                if (countDay === lastDay.getDate()) { 
                    startCount = 0; 
                }
                trtd += '</td>';
                }
                trtd += '</tr>';
            }
            $calBody.innerHTML = trtd;
            }

            /**
            * @param {string} val
            */
        function createNewList (val) {
        let id = new Date().getTime() + '';
        let yy = init.activeDate.getFullYear();
        let mm = init.activeDate.getMonth() + 1;
        let dd = init.activeDate.getDate();
        const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);

        let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);

        let eventData = {};
        eventData['date'] = date;
        eventData['memo'] = val;
        eventData['complete'] = false;
        eventData['id'] = id;
        init.event.push(eventData);
        $todoList.appendChild(createLi(id, val, date));
        }

        loadYYMM(init.today);
        loadDate(init.today.getDate(), init.today.getDay());

        $btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
        $btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));

        $calBody.addEventListener('click', (e) => {
        if (e.target.classList.contains('day')) {
            if (init.activeDTag) {
            init.activeDTag.classList.remove('day-active');
            }
            let day = Number(e.target.textContent);
            loadDate(day, e.target.cellIndex);
            e.target.classList.add('day-active');
            init.activeDTag = e.target;
            init.activeDate.setDate(day);
            reloadTodo();
        }
        });
    </script>

</html>