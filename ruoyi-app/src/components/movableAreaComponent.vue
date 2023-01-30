<!--
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-03-09 16:40:11
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-10-11 17:23:22
-->
<template>
  <movable-area class="movableArea">
    <movable-view class="movableView"
                  :position="position"
                  :x="x"
                  :y="y"
                  :direction="direction"
                  :damping="damping"
                  @change="onChange"
                  @touchend="onTouchend">
      <slot />
    </movable-view>
  </movable-area>
</template>
<script>
import Taro from "@tarojs/taro";
export default {
  data () {
    return {
      x: 0,
      y: 0,
      x1: 0,
      x2: 0,
      y1: 0,
      y2: 0,
      move: {
        x: 0,
        y: 0
      }
    };
  },
  props: {
    damping: {
      type: Number,
      default: 10
    },
    direction: {
      type: String,
      default: "vertical"
    },
    position: {
      type: Number,
      default: 4
    },
    src: {
      type: String,
      default: ""
    },
  },
  mounted () {
    Taro.getSystemInfo({
      success: (res) => {
        this.x1 = 0;
        this.x2 = parseInt(res.windowWidth) - 50;
        this.y1 = 0;
        this.y2 = parseInt(res.windowHeight) - 20;

        this.x = res.windowWidth
        this.y = res.windowHeight - 50
      }
    })
  },
  methods: {
    onChange (e) {
      if (e.detail.source === "touch") {
        this.move.x = e.detail.x;
        this.move.y = e.detail.y;
      }
    },
    onTouchend () {
      // this.x = this.move.x;
      // this.y = this.move.y;

      setTimeout(() => {
        this.x = this.move.x < this.x2 / 2 ? this.x1 : this.x2
      }, 100)
    },
  }
}
</script>
<style lang="scss">
.movableArea {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none; //设置area元素不可点击，则事件便会下移至页面下层元素
  z-index: 100;

  .movableView {
    pointer-events: auto; //可以点击
    width: 120rpx;
    height: 120rpx;
    padding: 10rpx;
    border-radius: 100%;
    .iconImage {
      display: block;
      width: 120rpx;
      height: 120rpx;
      // animation: iconImage 5s linear infinite;
    }
    @keyframes iconImage {
      0% {
        -webkit-transform: rotate(0deg);
      }
      25% {
        -webkit-transform: rotate(90deg);
      }
      50% {
        -webkit-transform: rotate(180deg);
      }
      75% {
        -webkit-transform: rotate(270deg);
      }
      100% {
        -webkit-transform: rotate(360deg);
      }
    }

    // 客服
    .contact {
      width: 50px;
      height: 50px;
      overflow: hidden;
      position: absolute;
      left: 0px;
      top: 0px;
      border-radius: 100%;
      opacity: 0;
    }
  }
}
</style>