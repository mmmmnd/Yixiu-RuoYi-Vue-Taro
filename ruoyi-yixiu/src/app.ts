/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-08-24 11:38:11
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-10-10 08:42:48
 */
import { createApp } from 'vue';
import { createPinia } from 'pinia';
import { checkUpdateVersion } from '@/utils/util';
import { setupNutui } from '@/utils/mixin';
import share from '@/utils/mixin/share';

import './app.scss';
import '@/assets/scss/style.scss';

const App = createApp({
  mixins: [share],
  onLaunch() {
    checkUpdateVersion();
  },
  onShow(options) {}
});

/** 注册常用nutui组件 */
setupNutui(App);

App.use(createPinia());

export default App;
