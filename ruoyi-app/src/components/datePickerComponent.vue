<template>
  <picker mode="multiSelector"
          :range-key="'name'"
          :value="timeIndex"
          :range="activityArray"
          :disabled="disabled"
          @change="bindMultiPickerChange"
          @columnChange="bindMultiPickerColumnChange">
    <slot />
  </picker>
</template>
<script>
export default {
  props: {
    startTime: {
      type: [Object, Date],
      default: new Date(),
    },
    endTime: {
      type: [Object, Date],
      default: new Date(),
    },
    defaultTime: {
      type: [Object, Date],
      default: new Date(),
    },
    disabled: {
      type: Boolean,
      default: false,
    },
  },
  data () {
    return {
      timeIndex: [0, 0, 0, 0, 0],
      activityArray: [],
      year: 0,
      month: 1,
      day: 1,
      hour: 0,
      minute: 0,
      datePicker: "",
      defaultIndex: [0, 0, 0, 0, 0],
      startIndex: [0, 0, 0, 0, 0],
      endIndex: [0, 0, 0, 0, 0],
    };
  },
  computed: {
    timeDate () {
      const { startTime, endTime } = this;
      return { startTime, endTime };
    },
  },
  watch: {
    timeDate () {
      this.initData();
    },
  },
  created () {
    this.initData();
  },
  methods: {
    getDaysInOneMonth (year, month) {
      let _month = parseInt(month, 10);
      let d = new Date(year, _month, 0);
      return d.getDate();
    },
    dateDate (date) {
      let year = date.getFullYear();
      let month = date.getMonth() + 1;
      let day = date.getDate();
      let hours = date.getHours();
      let minutes = date.getMinutes();
      return {
        year,
        month,
        day,
        hours,
        minutes
      };
    },
    dateTimePicker (startyear, endyear) {
      // 获取date time  年份，月份，天数，小时，分钟推后30分
      const years = [];
      const months = [];
      const hours = [];
      const minutes = [];
      for (let i = startyear - 20; i <= endyear + 20; i++) {
        years.push({
          name: i + '年',
          id: i
        });
      }
      //获取月份
      for (let i = 1; i <= 12; i++) {
        if (i < 10) {
          i = '0' + i;
        }
        months.push({
          name: i + '月',
          id: i
        });
      }
      //获取小时
      for (let i = 0; i < 24; i++) {
        if (i < 10) {
          i = '0' + i;
        }
        hours.push({
          name: i + '时',
          id: i
        });
      }
      //获取分钟
      for (let i = 0; i < 60; i++) {
        if (i < 10) {
          i = '0' + i;
        }
        minutes.push({
          name: i + '分',
          id: i
        });
      }
      return function (_year, _month) {
        const days = [];
        _year = parseInt(_year);
        _month = parseInt(_month);
        //获取日期
        for (let i = 1; i <= this.getDaysInOneMonth(_year, _month); i++) {
          if (i < 10) {
            i = '0' + i;
          }
          days.push({
            name: i + '日',
            id: i
          });
        }
        return [years, months, days, hours, minutes];
      };
    },
    initData () {
      let startTime = this.startTime;
      let endTime = this.endTime;
      this.datePicker = this.dateTimePicker(
        startTime.getFullYear(),
        endTime.getFullYear()
      );
      this.setDateData(this.defaultTime);
      this.getKeyIndex(this.startTime, "startIndex");
      // 截止时间索引
      this.getKeyIndex(this.endTime, "endIndex");
      // 默认索引
      this.getKeyIndex(this.defaultTime, "defaultIndex");
      this.timeIndex = this.defaultIndex;
      // 初始时间
      this.initTime();
    },
    getKeyIndex (time, key) {
      let Arr = this.dateDate(time);
      let _index = this.getIndex(Arr);
      this[key] = _index;
    },
    getIndex (arr) {
      let timeIndex = [];
      let indexKey = ["year", "month", "day", "hours", "minutes"];
      this.activityArray.forEach((element, index) => {
        let _index = element.findIndex(
          (item) => parseInt(item.id) === parseInt(arr[indexKey[index]])
        );
        timeIndex[index] = _index >= 0 ? _index : 0;
      });
      return timeIndex;
    },
    initTime () {
      let _index = this.timeIndex;
      this.year = this.activityArray[0][_index[0]].id;
      this.month = this.activityArray[1][_index[1]].id;
      this.day = this.activityArray[2][_index[2]].id;
      this.hour = this.activityArray[3][_index[3]].id;
      this.minute = this.activityArray[4][_index[4]].id;
    },
    setDateData (_date) {
      let _data = this.dateDate(_date);
      this.activityArray = this.datePicker(_data.year, _data.month);
    },
    bindMultiPickerChange (e) {
      console.log("picker发送选择改变，携带值为", e.detail.value);
      let activityArray = JSON.parse(JSON.stringify(this.activityArray)),
        { value } = e.detail,
        _result = [];
      for (let i = 0; i < value.length; i++) {
        _result[i] = activityArray[i][value[i]].id;
      }
      this.$emit("result", _result);
    },
    bindMultiPickerColumnChange (e) {
      console.log("修改的列为", e.detail.column, "，值为", e.detail.value);
      let _data = JSON.parse(JSON.stringify(this.activityArray)),
        timeIndex = JSON.parse(JSON.stringify(this.timeIndex)),
        { startIndex, endIndex } = this,
        { column, value } = e.detail,
        _value = _data[column][value].id,
        _start = this.dateDate(this.startTime),
        _end = this.dateDate(this.endTime);
      switch (e.detail.column) {
        case 0:
          if (_value <= _start.year) {
            timeIndex = startIndex;
            this.year = _start.year;
            this.setDateData(this.startTime);
          } else if (_value >= _end.year) {
            this.year = _end.year;
            timeIndex = [endIndex[0], 0, 0, 0, 0];
            this.setDateData(this.endTime);
          } else {
            this.year = _value;
            timeIndex = [value, 0, 0, 0, 0];
            this.activityArray = this.datePicker(_value, 1);
          }
          timeIndex = this.timeIndex = JSON.parse(JSON.stringify(timeIndex));
          this.timeIndex = timeIndex;
          break;
        case 1:
          if (this.year == _start.year && value <= startIndex[1]) {
            timeIndex = startIndex;
            this.month = _start.month;
            this.setDateData(this.startTime);
          } else if (this.year == _end.year && value >= endIndex[1]) {
            timeIndex = endIndex;
            this.month = _end.month;
            this.setDateData(this.endTime);
          } else {
            this.month = _value;
            _data[2] = this.datePicker(this.year, this.month)[2];
            timeIndex = [timeIndex[0], value, 0, 0, 0];
            this.activityArray = _data;
          }
          this.timeIndex = JSON.parse(JSON.stringify(timeIndex));
          break;
        case 2:
          if (
            this.year == _start.year &&
            this.month == _start.month &&
            value <= startIndex[2]
          ) {
            this.day = _start.day;
            timeIndex = startIndex;
          } else if (
            this.year == _end.year &&
            this.month == _end.month &&
            value >= endIndex[2]
          ) {
            this.day = _end.day;
            timeIndex = endIndex;
          } else {
            this.day = _value;
            timeIndex = [timeIndex[0], timeIndex[1], value, 0, 0];
          }
          this.timeIndex = JSON.parse(JSON.stringify(timeIndex));
          break;
        case 3:
          if (
            this.year == _start.year &&
            this.month == _start.month &&
            this.day == _start.day &&
            value <= startIndex[3]
          ) {
            this.hour = _start.hours;
            timeIndex = startIndex;
          } else if (
            this.year == _end.year &&
            this.month == _end.month &&
            this.day == _end.day &&
            value >= endIndex[3]
          ) {
            this.hour = _end.hours;
            timeIndex = endIndex;
          } else {
            this.hour = _value;
            timeIndex[3] = value;
            timeIndex[4] = 0;
          }
          this.timeIndex = JSON.parse(JSON.stringify(timeIndex));
          break;
        case 4:
          timeIndex[4] = value;
          if (
            this.year == _start.year &&
            this.month == _start.month &&
            this.day == _start.day &&
            this.hour == _start.hours &&
            value <= startIndex[4]
          ) {
            timeIndex = startIndex;
          } else if (
            this.year == _end.year &&
            this.month == _end.month &&
            this.day == _end.day &&
            this.hour == _end.hours &&
            value >= endIndex[4]
          ) {
            timeIndex = endIndex;
          }
          this.timeIndex = JSON.parse(JSON.stringify(timeIndex));
          break;
      }
    },
  },
};
</script>