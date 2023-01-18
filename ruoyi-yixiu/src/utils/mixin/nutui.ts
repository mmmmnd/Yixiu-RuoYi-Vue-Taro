/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-08-25 08:37:58
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-10 10:07:42
 */
import type { App } from 'vue';
import {
  Button,
  Toast,
  Swiper,
  SwiperItem,
  Grid,
  GridItem,
  Cell,
  Divider,
  Tabbar,
  TabbarItem,
  Icon,
  Navbar,
  Tabs, 
  TabPane,
  Form,
  FormItem,
  CellGroup,
  Input,
  DatePicker,
  Picker,
  Popup,
  OverLay,
  Table,
  Rate,
  Empty,
  FixedNav,
  InputNumber,
  Radio,
  RadioGroup,
  Sticky,
  SearchBar
} from '@nutui/nutui-taro';

const nutuiComponents = [
  Button,
  Toast,
  Swiper,
  SwiperItem,
  Grid,
  GridItem,
  Cell,
  Divider,
  Tabbar,
  TabbarItem,
  Icon,
  Navbar,
  Tabs, 
  TabPane,
  Form,
  FormItem,
  CellGroup,
  Input,
  DatePicker,
  Picker,
  Popup,
  OverLay,
  Table,
  Rate,
  Empty,
  FixedNav,
  InputNumber,
  Radio,
  RadioGroup,
  Sticky,
  SearchBar
];

export function setupNutui(app: App<Element>) {
  nutuiComponents.forEach(item => app.use(item))
}

